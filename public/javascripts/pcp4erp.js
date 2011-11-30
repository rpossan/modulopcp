Ext.onReady(function(){

	Ext.ux.ClickToolTip = Ext.extend(Ext.ToolTip,{
		initTarget : function(target){
			var t;
			if((t = Ext.get(target))){
				if(this.target){
					var tg = Ext.get(this.target);
					this.mun(tg, 'click', this.onTargetOver, this);
					//this.mun(tg, 'mouseover', this.onTargetOver, this);
					this.mun(tg, 'mouseout', this.onTargetOut, this);
					this.mun(tg, 'mousemove', this.onMouseMove, this);
				}
					this.mon(t, {
					//mouseover: this.onTargetOver,
					click: this.onTargetOver,
					mouseout: this.onTargetOut,
					mousemove: this.onMouseMove,
					scope: this
				});
				this.target = t;
			}
			if(this.anchor){
			this.anchorTarget = this.target;
		}
		}
	});
	Ext.reg('ux.ClickToolTip', Ext.ux.ClickToolTip);

	//Put side field validation as global
	Ext.form.Field.prototype.msgTarget = 'side';

	// Required if showing validation messages
	Ext.QuickTips.init();

	// Save panels state
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

	//to show incon
	function printIcon(value, cell, rec, rowIndex, colIndex, ds) {
	  if(value){
	    return '<img width="13px" height="13px" src="images/' + value + '"></img>';
	  }
	};

	Ext.override(
		Ext.form.Field,
	    {
			afterRender : Ext.form.Field.prototype.afterRender.createSequence(
				function(){
		            var qt = this.helpMsg;
		            if (qt){
						Ext.QuickTips.register({
			                target:  this,
			                title: '',
			                text: '<div class="extHelpMsg">'+qt+'</div>',
			                enabled: true,
			                showDelay: 0
		                });
		            }
	        	}
			)
	    }
	);
	   var otabs = new Ext.TabPanel({
		 region:'center',
		 id: 'pcp4erp-tabs',
		 resizeTabs:true,
		 minTabWidth: 115,
		 tabWidth:135,
		 defaults: {autoScroll:true},
		 enableTabScroll:true,
		 deferredRender:false,
		 margins:{top:0, right:10, bottom:5, left:0},
		 activeTab:0,
		 items:[
			{
			  contentEl:'center1',
			  title: 'Welcome',
			  closable:true,
			  autoScroll:true
			}
	 ]
	   });

	   // Build layout
	   	viewport = new Ext.Viewport({
	    layout:'border',
	    items:[
			{
	            region:'west',
	            id:'west-panel',
	            split:true,
	            width: 200,
	            el:'west',
	            minSize: 175,
	            maxSize: 370,
	            collapsible: true,
	            margins:'0 0 0 5',
	            layout:'accordion',
				layoutConfig:{animate:true, sequence:true, fill:false},
	            items:[
					{
	                  title:'Cadastros',
	                  contentEl: 'cadastros',
	                  border: false
	                },
	                {
	                  title: 'Engenharia',
	                  contentEl: 'engenharia',
	                  border: false
	                },
					{
	                  title:'PCP',
	                  contentEl: 'pcp',
	                  border: false
	                },
	                {
	                  title: 'Sistema',
	                  contentEl: 'logout',
	                  border: false
	                }
	            ]}, otabs
	//
	     ]
});


});