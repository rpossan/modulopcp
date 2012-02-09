class FuncionariosController < ApplicationController

  def store
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    funcionarios = Funcionario.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "nome"
    )
    total = Funcionario.count(:conditions => conditions)
    render(:json => {:success => true, :root => funcionarios, :totalCount => total})
  end

  # GET /funcionarios
  # GET /funcionarios.xml
  def index
    @funcionarios = Funcionario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @funcionarios }
    end
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.xml
  def show
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @funcionario }
    end
  end

  # GET /funcionarios/new
  # GET /funcionarios/new.xml
  def new
    @funcionario = Funcionario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @funcionario }
    end
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  # POST /funcionarios
  # POST /funcionarios.xml
  def create
    @funcionario = Funcionario.new(params[:funcionario])
    file = params[:foto]
    if file
      file.configure(FileClassification::IMAGES::config)
      if file.is_valid?
        if @funcionario.save
          file.file_name = "#{@funcionario.id.to_s}_#{file.original_filename}"
          params[:funcionario]['foto'] = file.file_name
          if file.save
            @funcionario.update_attribute(:foto, file.file_name)
            respond_to {|format| format.html { render :json => {:success => true} } }
          else
            @funcionario.destroy
            respond_to {|format| format.html { render :json => {:success => false, :errors => file.errors.join('<br />')} } }
          end
        end
      else
        respond_to {|format| format.html { render :json => {:success => false, :errors => file.errors.join('<br />')} } }
      end
    else
      respond_to do |format|
        if @funcionario.save
          format.html { render :json => {:success => true} }
          format.xml  { render :xml => @funcionario, :status => :created, :location => @funcionario }
        else
          format.html { render :json => ( (@funcionario.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @funcionario.errors.empty?
        end
      end
    end
  end

  # PUT /funcionarios/1
  # PUT /funcionarios/1.xml
  def update
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      if @funcionario.update_attributes(params[:funcionario])
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @funcionario, :status => :created, :location => @funcionario }
      else
        format.html { render :json => ( (@funcionario.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @funcionario.errors.empty?
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.xml
  def destroy
    @funcionario = Funcionario.find(params[:id])
    respond_to do |format|
      if @funcionario.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @funcionario, :status => :created, :location => @funcionario }
      else
      return render :json => { :success => false, :msg => (@funcionario.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end

end
