module EquipamentosHelper

  def include_buttons_equipamentos
    ret = "
        function createEquipamentosBtns(){
            var txt_search = new Ext.form.TextField({name: 'search'});
            var retArray =
            [
                      new Ext.Button ({ text: 'Novo...',
                                        id: 'btnNew',
                                        iconCls: 'addNewIcon',
                                        tooltip: 'Add new Equipamento',
                                        handler: function(){ newEquipamento();}
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
                                            store_Equipamentos.baseParams.findby = filtroColuna;
                                            store_Equipamentos.baseParams.query = args_txt;
                                            store_Equipamentos.load({params: {start:0 , limit:10}});

                                        }
                                       })
                    ]
              return retArray;
          }
    "
    return ret
  end

end
