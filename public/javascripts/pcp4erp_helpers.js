function loadingMsgBox(){
	var pbar = new Ext.ProgressBar({width:400 });
    var win = new Ext.Window({
	    layout:'fit',
	    closable: false,
	    plain: true,
	    title:"Saving changes",
	    shim :false,
	    modal:true,
	    autoDestroy :true,
	    resizable:false,
		items: [pbar]
    });
	win.height = 50;
	win.width = 400;
	win.show();
	pbar.wait({interval:10, duration:120000, increment:300});
	return win;
}

function setMouseOver(div, id){
	div.style.backgroundColor='#efefef';
	div.style.color='#E0417B';
	div.style.textDecoration='underline';
	document.getElementById(id).style.color='#E0417B';
	return false
}

function setMouseOut(div, id){
	div.style.backgroundColor='';
	div.style.textDecoration='none';
	document.getElementById(id).style.color='#0070B7';
	return false
}

//Function to confirm logout
function confirmLogout(){
	Ext.Msg.confirm('Logout',
					'Do you want to logout?',
					function(btn) {
						if (btn == 'yes'){
							location.assign("login/logout");
							treeState.clearState();
						}
					}
					);
}


Ext.layout.BorderLayout.Region.prototype.getCollapsedEl = Ext.layout.BorderLayout.Region.prototype.getCollapsedEl.createSequence(function() {
    if ((this.position == 'north' || this.position == 'south') && !this.collapsedEl.titleEl) {
            this.collapsedEl.titleEl = this.collapsedEl.createChild({style: 'color:#333333;font:11px/15px tahoma,arial,verdana,sans-serif;padding:2px 5px;', cn: this.panel.title});
    }
});

Ext.override(Ext.layout.ColumnLayout,
{
    onLayout : function(ct, target){
        var cs = ct.items.items, len = cs.length, c, i;
        if(!this.innerCt){
            target.addClass('x-column-layout-ct');
            this.innerCt = target.createChild({cls:'x-column-inner'});
            this.renderAll(ct, this.innerCt);
            this.innerCt.createChild({cls:'x-clear'});
        }
        var size = target.getViewSize();
        if(size.width < 1 && size.height < 1){
            return;
        }
        var w = size.width - target.getPadding('lr') - this.scrollOffset,
            h = size.height - target.getPadding('tb'),
            pw = w;
        this.innerCt.setWidth(w);
        for(i = 0; i < len; i++){
            c = cs[i];
            if(!c.columnWidth){
                pw -= (c.getSize().width + c.getEl().getMargins('lr'));
            }
        }
        pw = pw < 0 ? 0 : pw;
        for(i = 0; i < len; i++){
            c = cs[i];
            if(c.columnWidth){
                c.setWidth(Math.floor(c.columnWidth*pw) - c.getEl().getMargins('lr'));
            }
            c.setHeight(size.height);
        }
    }
});

function loadingFailedMessage(el, success, response, options){
   if (!success) {
        Ext.Msg.alert('Error','Sorry, but the page couldn\'t be displayed.');
   }
}

function loadingFailed(el, success, response, options) {
    if (!success) {
        el.getUpdater().update({url: options.url, callback: loadingFailedMessage, scripts:true});
    }
}

function addTab(tabId,title, url, icon) {
    if ( icon === undefined ) {
        icon = "tabs";
    }
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem(tabId);
    if(tab){
        tab.show();
    } else {
        tab = tabPanel.add({
                   title: title,
                   id: tabId,
                   iconCls: icon,
                   autoLoad: {url: url, callback: loadingFailed, scope: this, scripts: true},
                   closable:true,
                   autoScroll:true,
                   bodyStyle:{overflow:'auto'}
                   }).show();
         tabPanel.setActiveTab(tab);
    }
}

function addNewTab(tabId, title, subtitle, url, icon){
	if ( icon === undefined ) {
	        icon = "tabIndexIcon";
    }
	var tabPanel = Ext.getCmp('pcp4erp-tabs');
	var tab = tabPanel.getItem(tabId);
	if(tab){
		if(tabId == 'tab_reference_points'){ updateSubTab(tabId, 'sub_'+tabId, title, url);}
		tab.show();
	}else{
        tab = tabPanel.add({
                   title: title,
                   id: tabId,
                   iconCls: icon,
                   closable:true,
                   autoScroll:true,
                   bodyStyle:{overflow:'auto'},
                   xtype: 'tabpanel',
                   activeTab: 0,
                   items: [{id: 'sub_'+tabId,
                   			title: subtitle,
                   			iconCls: 'tabIndexIcon',
                   			autoLoad: {url: url, callback: loadingFailed, scope: this, scripts: true},
                   			closable: false,
                   			autoScroll:true
                   			}]
                   });
         tab.show();
        // tabPanel.setActiveTab(tab);
	}
};

function updateTab(tabId,title, url) {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem(tabId);
    if(tab){
        tab.getUpdater().update({url: url, callback: loadingFailed});
        tab.setTitle(title);
        tab.show();
    }
}

function closeTab(tabId) {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem(tabId);
    if(tab){
        tabPanel.remove(tab);
    }
}

function addUserTab(title, url) {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem('tab_users');
    if(tab){
        tab.show();
    } else {
         tab = tabPanel.add({
               title: 'My user',
               id: 'userManager',
               iconCls: 'users-icon',
               cls: 'pcp4erp-subtab',
               closable:true,
               autoScroll:true,
               enableTabScroll:true,
               bodyStyle:{overflow:'auto'},
               xtype: 'tabpanel',
               activeTab: 0,
               items:[{
                    autoLoad: {url: url, callback: loadingFailed, scope: this, scripts: true},
                    title: title,
                    id: 'users',
                    closable: false,
                    autoScroll:true
               }]
         });
         tab.show();
         tabPanel.setActiveTab(tab);
    }
}

function closeUserTab() {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem('tab_users');
    if(tab){
        tabPanel.remove(tab);
    }
}

function addSubTab(tabId, subTabId, title, url, icon) {
    if ( icon === undefined ) {
        icon = "tabs";
    }
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem(tabId);
    var subtab = tab.getItem(subTabId);
    if(subtab){
        subtab.show();
    } else {
         subtab = tab.add({
               title: title,
               id: subTabId,
               iconCls: icon,
               closable:true,
               autoScroll:true,
               bodyStyle:{overflow:'auto'},
               activeTab: 0,
               autoLoad: {url: url, callback: loadingFailed, scope: this, scripts: true}
         });
         subtab.show();
         tab.setActiveTab(subtab);
    }
}

function updateSubTab(tabId, subTabId, title, url) {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem(tabId);
    var subtab = tab.getItem(subTabId);
    if(subtab){
        subtab.getUpdater().update({url: url, callback: loadingFailed});
        subtab.setTitle(title);
        subtab.show();
    }
}

function updateUserTab(tabId,title, url) {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem('userManager');
    if(tab){
        tab.getUpdater().update({url: url, callback: loadingFailed});
        tab.setTitle(title);
        tab.show();
    }
}

function closeSubTab(tabId, subTabId) {
    var tabPanel = Ext.getCmp('pcp4erp-tabs');
    var tab = tabPanel.getItem(tabId);
    var subtab = tab.getItem(subTabId);
    if(subtab){
        tab.remove(subtab);
    }
}

function permissionError(){
   Ext.Msg.alert('Error','You already have at least this permission for this region<br />(maybe thru a parent region)');
}

Ext.apply(Ext.form.VTypes, {
  password: function(value, field) {
    var pwd = Ext.getCmp(field.initialPasswordField);
    this.passwordText = 'Passwords don\'t match!';
    return (value == pwd.getValue());
  }
});

function deleteUser(username, id) {
  Ext.Msg.confirm('Delete user', 'Do you want to delete user ' + username + '?', function(btn) {
    if (btn == 'yes') {
      updateSubTab('userManager','users','Users','users/destroy/'+id);
    }
  });
}

function createStore(url, fields, mapping){
	var ret =
	new Ext.data.Store({
		autoload: false,
		fields: fields,
		proxy:  new Ext.data.HttpProxy({
			method: 'GET',
			url: url
		}),
		reader: new Ext.data.JsonReader({
			fields: mapping,
			id: 'id',
			root: 'root',
			totalProperty: 'totalCount'
		})
	});
	return ret;
}

function createPBar(store, name){
	ret = "";
	ret = new Ext.PagingToolbar(
		{
			pageSize: 10,
			store: store,
			displayInfo: true,
			displayMsg: 'Listing ' + name + ' {0} - {1} of {2}',
			emptyMsg: "No registers to show"
			/*items: [new Ext.Button ({ text: 'Search',
						  							handler: function(){alert('oi');}
						  							}
						  						)]*/
		}
	)
	return ret;
}

function createCmdBar(btns){
	var ret = new Ext.Toolbar(
		{
			items: btns,
			width: 200,
			autoWidth: false
		}
	)
	return ret;
}

function createGrid(store, title, tbar, bbar, cols, h){
	var ret = "";
	ret =
	new Ext.grid.GridPanel({
			autoHeight: true,
			autoWidth: true,
			title: title,
			store: store,
      		//trackMouseOver: false,
      		//disableSelection: true,
      		//enableColumnMove: false,
      		loadMask: true,
      		columns: cols,
      		bbar: bbar,
      		tbar: tbar,
			stripeRows: true,
      		listeners: 	{
      						cellclick: function(grid, linha, coluna){
								/*if(cols[coluna].id == 'delete'){
									id = store.getAt(linha).get('id');
									alert('deletar');
									//excluirRegistro(id);
								}
								if(cols[coluna].id == 'edit'){
									id = store.getAt(linha).get('id');
									alert('editar');
									//excluirRegistro(id);
								}*/
      						}
						}
		});

	if(h){ ret.autoHeight = false; }
	return ret;
}