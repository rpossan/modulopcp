class ProdutoProcessosController < ApplicationController
  def store
    lista = []
    count = 0
    conditions = ""
    conditions =["nome LIKE ? OR codigo LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"] if params[:query].present?
    produtos = Produto.all(
        :conditions => conditions,
        :limit => params[:limit],
        :offset => params[:start],
        :order => "nome"
    )
    produtos.each do |p|
      if p.produto_processos.size > 0
        count += 1
        lista <<
        {
          :id => p.id,
          :produto => p.nome,
          :processos => p.produto_processos.size,
          :atualizado => ProdutoProcesso.last(:conditions => ["produto_id = ?", p.id], :order => "created_at ASC").created_at.strftime("%d/%m/%Y - %H:%M:%S")
        }
      end
    end
    render(:json => {:success => true, :root => lista, :totalCount => count})
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
    processos = ActiveSupport::JSON.decode(params[:produto_processos]) if params[:produto_processos]
    respond_to do |format|
      if processos
        produto = Produto.find(params[:produto_processo]["produto_id"]) if params[:produto_processo]
        processos.each do |p|
          processo = ProdutoProcesso.create(:produto_id => produto.id, :processo_id => p["id"], :tempo_padrao => p["tempo_padrao"], :producao_hora => p["producao_hora"])
        end
        format.html { render :json => {:success => true} }
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
