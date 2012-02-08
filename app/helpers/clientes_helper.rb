module ClientesHelper

  def include_buttons_clientes
    ret = "
        function createClientesBtns(){
            var txt_search = new Ext.form.TextField({name: 'search'});
            var retArray =
            [
                      new Ext.Button ({ text: 'Novo...',
                                        id: 'btnNew',
                                        iconCls: 'addNewIcon',
                                        tooltip: 'Add new Cliente',
                                        handler: function(){ newCliente();}
                                     }),
                          new Ext.Spacer({width: 20}),
                          new Ext.form.Label({text: 'Pesquisar: ', id: 'lblSearch' }),
                          txt_search,
                          new Ext.Button ({
                                            text: 'OK',
                                            iconCls: 'searchButton',
                                            id: 'btnSearch',
                                            handler: function(){
                                            filtroColuna = cbPesquisa.getValue();
                                            args_txt = txt_search.getValue();
                                            store_Clientes.baseParams.findby = filtroColuna;
                                            store_Clientes.baseParams.query = args_txt;
                                            store_Clientes.load({params: {start:0 , limit:10}});

                                        }
                                       })
                    ]
              return retArray;
          }
    "
    return ret
  end

end
