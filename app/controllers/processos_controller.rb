class ProcessosController < ApplicationController
  def store
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    processos = Processo.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "nome"
    )
    total = Processo.count(:conditions => conditions)
    render(:json => {:success => true, :root => processos, :totalCount => total})
  end

  # GET /processos
  # GET /processos.xml
  def index
    @processos = Processo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @processos }
    end
  end

  # GET /processos/1
  # GET /processos/1.xml
  def show
    @processo = Processo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @processo }
    end
  end

  # GET /processos/new
  # GET /processos/new.xml
  def new
    @processo = Processo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @processo }
    end
  end

  # GET /processos/1/edit
  def edit
    @processo = Processo.find(params[:id])
  end

  # POST /processos
  # POST /processos.xml
  def create
    @processo = Processo.new(params[:processo])
    respond_to do |format|
      if @processo.save
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @processo, :status => :created, :location => @processo }
      else
        format.html { render :json => ( (@processo.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @processo.errors.empty?
      end
    end
  end

  # PUT /processos/1
  # PUT /processos/1.xml
  def update
    @processo = Processo.find(params[:id])

    respond_to do |format|
      if @processo.update_attributes(params[:processo])
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @processo, :status => :created, :location => @processo }
      else
        format.html { render :json => ( (@processo.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @processo.errors.empty?
      end
    end
  end

  # DELETE /processos/1
  # DELETE /processos/1.xml
  def destroy
    @processo = Processo.find(params[:id])
    respond_to do |format|
      if @processo.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @processo, :status => :created, :location => @processo }
      else
      return render :json => { :success => false, :msg => (@processo.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end
end
