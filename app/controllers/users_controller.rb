class UsersController < ApplicationController

  #layout nil

  def index
    session[:new_perms] = nil
    session[:user_being_edited] = nil
    @all_users = User.find(:all)
    render(:layout => false)
  end

  def store
      list = []
      conditions = ""
      conditions =
      [
        "login LIKE ? OR name LIKE ? OR email LIKE ? ",
        "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"
      ] if params[:query]

      users = User.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "name"
      )
      total = User.count(:conditions => conditions)
      render(:json => {:success => true, :root => users, :totalCount => total})
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end

  end

  def create
    @user = User.new(params[:user])
    if request.post? and @user.save
      @user = User.new
      render :json => {:success => true}.to_json
    else
      render :json => {:success => false}.to_json
    end
  end

  def add_users_team
     @team = Team.find(params[:id])
  end

   def edit
      @user = User.find(params[:id])
      @user.notes = '' if @user.notes.nil?
      @user.notes = @user.notes
   end

  def update
    @user = User.find(params[:id])
    session[:user_being_edited] = @user.id
    if request.post?
      if not params[:change_password]
        params[:user][:password] = nil
        params[:user][:password_confirmation] = nil
      end
      if @user.update_attributes(params[:user])
        session[:new_perms] = nil
        session[:user_being_edited] = nil
        render :json => {:success => true}.to_json
      else
        render :json => {:success => false}.to_json
      end
    end
  end

  def remove_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render(:json => {:success => true})
    else
      render :json => {:success => false}.to_json
    end
  end

  def permissions
    @regions = Region.find(:all)
    @user = User.find(params[:id])
    @user.notes = '' if @user.notes.nil?
    @user.notes = txt(@user.notes)
    session[:user_being_edited] = @user.id
    @permissions = @user.permissions
    @usradm = !@permissions.select{|x| x.profile_id == 4}.empty?
    if request.post?
      if @user.update_attributes(params[:user])
        session[:new_perms] = nil
        session[:user_being_edited] = nil
        render :json => {:success => true}.to_json
      else
        render :json => {:success => false}.to_json
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        return render :json => { :success => false, :msg => (@user.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end

  def list_users_json
    @users = User.find(:all)
    @blank = params[:blank]
  end

  def user_report
        list = []
        select = "     users.id
                      ,users.login
                      ,users.email
                      ,users.name
                      , users.partner_id
                      , c.name             partner_name,
                        t.name             team_name"
        from = " users  JOIN partners c  ON (partner_id = c.id) LEFT JOIN teams t  ON (team_id = t.id)"
        conditions = ""
        conditions =  ["users.partner_id = ? AND users.team_id = ? ", "#{params[:partner_id]}","#{params[:team_id]}"] if params[:partner_id] if params[:team_id]
        users = User.all( :select => select,
                          :from => from,
                          :conditions => conditions,
                          :limit => params[:limit],
                          :offset => params[:start],
                          :order => "c.name, team_name,users.name"
                        )
        total = User.count(:from => from,:conditions => conditions)

    end

  def remove_add_permission
    render :partial => 'add_permission', :locals => {:region => params[:region_id], :user => params[:user_id], :which_one => "add_link"}
  end

  def update_usradm_chkbox
    if params[:usradm_chkbox]
      unless perm = Permission.find(:first, :conditions => "user_id = #{params[:user_id]} and profile_id = 4")
        Permission.create(:user_id => params[:user_id], :profile_id => 4, :region_id => 1)
        return render(:text => '<script type="text/javascript">document.getElementById(\'usradm_chkbox_response'+params[:user_id]+'\').style.display = \'inline\';</script>Updated! <a href="#" onclick="document.getElementById(\'usradm_chkbox_response'+params[:user_id]+'\').style.display = \'none\'">ok</a>')
      end
    else
      if perm = Permission.find(:first, :conditions => "user_id = #{params[:user_id]} and profile_id = 4")
        perm.destroy
        return render(:text => '<script type="text/javascript">document.getElementById(\'usradm_chkbox_response'+params[:user_id]+'\').style.display = \'inline\';</script>Updated! <a href="#" onclick="document.getElementById(\'usradm_chkbox_response'+params[:user_id]+'\').style.display = \'none\'">ok</a>')
      end
    end
  end

  def clear_filters_configurations
      cookies.delete(:alarms_region, :path => "/reports/alarms")
      cookies.delete(:alarms_severity, :path => "/reports/alarms")
      cookies.delete(:alarms_time, :path => "/reports/alarms")
      cookies.delete(:alarms_ack, :path => "/reports/alarms")
      cookies.delete(:alarms_work, :path => "/reports/alarms")
      cookies.delete(:alarms_closed, :path => "/reports/alarms")
      cookies.delete(:alarms_start_date, :path => "/reports/alarms")
      cookies.delete(:alarms_end_date, :path => "/reports/alarms")
      cookies.delete(:alarms_mtr, :path => "/reports/alarms")
      cookies.delete(:alarms_mtbf, :path => "/reports/alarms")

      cookies.delete(:fiber_test_history_start_date, :path => "/reports/fiber_test_history")
      cookies.delete(:fiber_test_history_end_date, :path => "/reports/fiber_test_history")
      cookies.delete(:fiber_test_history_region, :path => "/reports/fiber_test_history")
      cookies.delete(:fiber_test_history_rtu, :path => "/reports/fiber_test_history")
      cookies.delete(:fiber_test_history_fiber, :path => "/reports/fiber_test_history")

      cookies.delete(:fiber_availability_region, :path => "/reports/fiber_availability")
      cookies.delete(:fiber_availability_rtu, :path => "/reports/fiber_availability")

      cookies.delete(:fiber_degradation_start_date, :path => "/reports/fiber_degradation")
      cookies.delete(:fiber_degradation_end_date, :path => "/reports/fiber_degradation")

      cookies.delete(:histogram_start_date, :path => "/reports/alarms_histogram")
      cookies.delete(:histogram_end_date, :path => "/reports/alarms_histogram")
      cookies.delete(:histogram_region, :path => "/reports/alarms_histogram")
      cookies.delete(:histogram_fiber, :path => "/reports/alarms_histogram")
      cookies.delete(:histogram_rtu, :path => "/reports/alarms_histogram")

      resp = '<script type="text/javascript">document.getElementById(\'clear_response\').style.display = \'inline\';</script>Clean! <a href="#" onclick="document.getElementById(\'clear_response\').style.display = \'none\'">ok</a>';
      return render(:text => resp)
  end

end
