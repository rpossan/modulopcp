class FileClassification
  def self.obj_IMAGES
    return self::IMAGES
  end
  module IMAGES
    def self.config
      {:classification => "IMAGES", :max_size => 512000, :path_to_save => ICONS_LOCAL }
    end
    def self.valid_types
      ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    end
  end
end

module TempfileExtension
  attr_accessor :classification
  attr_accessor :file_name
  attr_accessor :config
  attr_accessor :max_size
  attr_accessor :path_to_save
  attr_accessor :errors

  def set_max_size
    self.path_to_save = self.config[:path_to_save]
  end

  def set_path_to_save
    self.max_size = self.config[:max_size]
  end

  def set_file_name
    self.file_name = (self.config[:file_name].nil? or self.config[:file_name].blank?) ? self.original_filename : self.config[:file_name].to_s
  end

  def save
    if self.is_valid?
      FileUtils.copy(self.local_path, self.path_to_save + self.file_name)
      true
    else
      false
    end
  end

  def configure(conf = nil)
    self.config = conf
    self.config.each do |c|
      self.send("set_#{c[0].to_s.downcase}") unless c[0].to_s.downcase == 'classification'
    end
  end

  def is_valid?
    unless self.config.nil?
      all_errors = []
      has_error = false
      if not FileClassification::send("obj_"+self.config[:classification]).valid_types.include?(self.content_type.to_s.downcase)
        all_errors << "#{self.classification} file format invalid! Valid formats: #{FileClassification::send("obj_"+self.classification).valid_types.join(', ')}"
        has_error = true
      end
      if not self.max_size.nil? and self.size.to_i >= self.config[:max_size]
        all_errors << "Max file size is #{self.size} bytes!"
        has_error = true
      end
      if has_error
        self.errors = all_errors
        return false
      else
        return true
      end
    else
      raise "File not Configured! Use Tempfile.configure method to set file validations"
      false
    end
  end

end

Tempfile.send :include, TempfileExtension