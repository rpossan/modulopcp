class ClientesController < ApplicationController

  def store
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    clientes = Cliente.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "nome"
    )
    total = Cliente.count(:conditions => conditions)
    render(:json => {:success => true, :root => clientes, :totalCount => total})
  end

  # GET /clientes
  # GET /clientes.xml
  def index
    @clientes = Cliente.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clientes }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.xml
  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cliente }
    end
  end

  # GET /clientes/new
  # GET /clientes/new.xml
  def new
    @cliente = Cliente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.xml
  def create
    @cliente = Cliente.new(params[:cliente])
    respond_to do |format|
      if @cliente.save
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @cliente, :status => :created, :location => @cliente }
      else
        format.html { render :json => ( (@cliente.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @cliente.errors.empty?
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.xml
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @cliente, :status => :created, :location => @cliente }
      else
        format.html { render :json => ( (@cliente.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @cliente.errors.empty?
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.xml
  def destroy
    @cliente = Cliente.find(params[:id])
    respond_to do |format|
      if @cliente.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @cliente, :status => :created, :location => @cliente }
      else
      return render :json => { :success => false, :msg => (@cliente.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end

end
