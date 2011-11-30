class ProdutosController < ApplicationController

  def store
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    produtos = Produto.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "nome"
    )
    total = Produto.count(:conditions => conditions)
    render(:json => {:success => true, :root => produtos, :totalCount => total})
  end

  # GET /produtos
  # GET /produtos.xml
  def index
    @produtos = Produto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produtos }
    end
  end

  # GET /produtos/1
  # GET /produtos/1.xml
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.xml
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
    @produto.detalhes = txt(@produto.detalhes)
  end

  # POST /produtos
  # POST /produtos.xml
  def create
    @produto = Produto.new(params[:produto])
    respond_to do |format|
      if @produto.save
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @produto, :status => :created, :location => @produto }
      else
        format.html { render :json => ( (@produto.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @produto.errors.empty?
      end
    end
  end

  # PUT /produtos/1
  # PUT /produtos/1.xml
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @produto, :status => :created, :location => @produto }
      else
        format.html { render :json => ( (@produto.errors.full_messages.join(".<br />").to_s + ".").to_json ) } unless @produto.errors.empty?
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.xml
  def destroy
    @produto = Produto.find(params[:id])
    respond_to do |format|
      if @produto.destroy
        format.html { render :json => {:success => true} }
        format.xml  { render :xml => @produto, :status => :created, :location => @produto }
      else
      return render :json => { :success => false, :msg => (@produto.errors.full_messages.join(".<br />")).to_s + "." }.to_json
      end
    end
  end
end
