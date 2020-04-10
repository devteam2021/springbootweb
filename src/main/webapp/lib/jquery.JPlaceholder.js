/*
 * jQuery placeholder, fix for IE6,7,8,9
* hovertree.com
 */
var JPlaceHolder = {
    //检测
    _check : function(){
        return 'placeholder' in document.createElement('input');
    },
    //初始化
    init : function(){
        if(!this._check()){
            this.fix();
        }
    },
    //修复 何问起
    fix : function(){
        jQuery(':input[placeholder]').each(function(index, element) {
            var self = $(this), txt = self.attr('placeholder');
            self.wrap($('<div></div>').css({position:'relative', zoom:'1', border:'none', background:'none', padding:'none', margin:'none'}));
            var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left'),fontsize=self.css('font-size'), paddingtop = self.css('padding-top');
           
            var holder = $('<span></span>').text(txt).css({position:'absolute', left:pos.left, top:paddingtop, height:h, lienHeight:h, paddingLeft:paddingleft,'font-size':fontsize,color:'#aaa'}).appendTo(self.parent());
            self.focusin(function(e) {
                holder.hide();
            }).focusout(function(e) {
                if(!self.val()){
                    holder.show();
                }
            });
            holder.click(function(e) {
                holder.hide();
                self.focus();
            });
        });
    }
};
//执行 
jQuery(function(){
    JPlaceHolder.init();    
});