class ProdutoProcessosController < ApplicationController
  def store
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    produto_processos = ProdutoProcesso.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "id DESC"
    )
    total = ProdutoProcesso.count(:conditions => conditions)
    render(:json => {:success => true, :root => produto_processos, :totalCount => total})
  end

  # GET /produto_processos
  # GET /produto_processos.xml
  def index
    @produto_processos = ProdutoProcesso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produto_processos }
    end
  end

  # GET /produto_processos/1
  # GET /produto_processos/1.xml
  def show
    @produto_processo = ProdutoProcesso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produto_processo }
    end
  end

  # GET /produto_processos/new
  # GET /produto_processos/new.xml
  def new
    @produto_processo = ProdutoProcesso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produto_processo }
    end
  end

  # GET /produto_processos/1/edit
  def edit
    @produto_processo = ProdutoProcesso.find(params[:id])
  end

  # POST /produto_processos
  # POST /produto_processos.xml
  def create
    @produto_processo = ProdutoProcesso.new(params[:produto_processo])

    respond_to do |format|
      if @produto_processo.save
        format.html { redirect_to(@produto_processo, :notice => 'ProdutoProcesso was successfully created.') }
        format.xml  { render :xml => @produto_processo, :status => :created, :location => @produto_processo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produto_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /produto_processos/1
  # PUT /produto_processos/1.xml
  def update
    @produto_processo = ProdutoProcesso.find(params[:id])

    respond_to do |format|
      if @produto_processo.update_attributes(params[:produto_processo])
        format.html { redirect_to(@produto_processo, :notice => 'ProdutoProcesso was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produto_processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /produto_processos/1
  # DELETE /produto_processos/1.xml
  def destroy
    @produto_processo = ProdutoProcesso.find(params[:id])
    @produto_processo.destroy

    respond_to do |format|
      format.html { redirect_to(produto_processos_url) }
      format.xml  { head :ok }
    end
  end
end
