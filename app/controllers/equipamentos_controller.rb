class EquipamentosController < ApplicationController

  def store
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    equipamentos = Equipamento.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "modelo"
    )
    total = Equipamento.count(:conditions => conditions)
    render(:json => {:success => true, :root => equipamentos, :totalCount => total})
  end

  # GET /equipamentos
  # GET /equipamentos.xml
  def index
    @equipamentos = Equipamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipamentos }
    end
  end

  # GET /equipamentos/1
  # GET /equipamentos/1.xml
  def show
    @equipamento = Equipamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipamento }
    end
  end

  # GET /equipamentos/new
  # GET /equipamentos/new.xml
  def new
    @equipamento = Equipamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipamento }
    end
  end

  # GET /equipamentos/1/edit
  def edit
    @equipamento = Equipamento.find(params[:id])
  end

  # POST /equipamentos
  # POST /equipamentos.xml
  def create
    @equipamento = Equipamento.new(params[:equipamento])
    respond_to do |format|
      if @equipamento.save
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @equipamento, :status => :created, :location => @equipamento }
      else
        format.html { render :json => ( (@equipamento.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @equipamento.errors.empty?
      end
    end
  end

  # PUT /equipamentos/1
  # PUT /equipamentos/1.xml
  def update
    @equipamento = Equipamento.find(params[:id])

    respond_to do |format|
      if @equipamento.update_attributes(params[:equipamento])
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @equipamento, :status => :created, :location => @equipamento }
      else
        format.html { render :json => ( (@equipamento.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @equipamento.errors.empty?
      end
    end
  end

  # DELETE /equipamentos/1
  # DELETE /equipamentos/1.xml
  def destroy
    @equipamento = Equipamento.find(params[:id])
    respond_to do |format|
      if @equipamento.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @equipamento, :status => :created, :location => @equipamento }
      else
      return render :json => { :success => false, :msg => (@equipamento.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end

end
