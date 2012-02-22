class OrdemsController < ApplicationController

  def planejamento
    @ordems = Ordem.all(:order => "data_prevista ASC")
    @equipamentos = Equipamento.all(:order => "nome ASC")
  end

  def store
    list = []
    conditions = ""
    conditions =["nome LIKE ? OR titulo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    ordems = Ordem.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "data_prevista"
    )
    ordems.each do |o|
      list <<
      {
        :id => o.id,
        :titulo => o.titulo,
        :cliente_nome => o.cliente.nome,
        :produto_nome => o.produto.nome,
        :qtde => o.qtde,
        :data => o.created_at,
        :data_prevista => o.data_prevista
      }
    end
    total = Ordem.count(:conditions => conditions)
    render(:json => {:success => true, :root => list, :totalCount => total})
  end

  # GET /ordems
  # GET /ordems.xml
  def index
    @ordems = Ordem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordems }
    end
  end

  # GET /ordems/1
  # GET /ordems/1.xml
  def show
    @ordem = Ordem.find(params[:id])
    equipamentos = Equipamento.all
    @equipamentos_disp = equipamentos.size
    @equipamentos_horas = 0
    equipamentos.each do |e|
      @equipamentos_horas = @equipamentos_horas + e.horas_dia
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ordem }
    end
  end

  # GET /ordems/new
  # GET /ordems/new.xml
  def new
    @ordem = Ordem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ordem }
    end
  end

  # GET /ordems/1/edit
  def edit
    @ordem = Ordem.find(params[:id])
  end

  # POST /ordems
  # POST /ordems.xml
  def create
    @ordem = Ordem.new(params[:ordem])
    respond_to do |format|
      if @ordem.save
        format.html { render :json => {:success => true, :id => @ordem.id, :titulo => @ordem.titulo} }
        format.xml  { render :xml => @ordem, :status => :created, :location => @ordem }
      else
        format.html { render :json => ( (@ordem.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @ordem.errors.empty?
      end
    end
  end

  # PUT /ordems/1
  # PUT /ordems/1.xml
  def update
    @ordem = Ordem.find(params[:id])

    respond_to do |format|
      if @ordem.update_attributes(params[:ordem])
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @ordem, :status => :created, :location => @ordem }
      else
        format.html { render :json => ( (@ordem.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @ordem.errors.empty?
      end
    end
  end

  # DELETE /ordems/1
  # DELETE /ordems/1.xml
  def destroy
    @ordem = Ordem.find(params[:id])
    respond_to do |format|
      if @ordem.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @ordem, :status => :created, :location => @ordem }
      else
      return render :json => { :success => false, :msg => (@ordem.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end

end
