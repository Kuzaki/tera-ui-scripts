if(!_global.mx)
{
    _global.mx = new Object();
}
§§pop();
if(!_global.mx.skins)
{
    _global.mx.skins = new Object();
}
§§pop();
if(!mx.skins.RectBorder)
{
    mx.skins.RectBorder.prototype = new mx.skins.Border().__get__width = function()
    {
        return this.__width;
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().__get__height = function()
    {
        return this.__height;
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().init = function(Void)
    {
        super.init();
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().draw = function(Void)
    {
        this.size();
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().getBorderMetrics = function(Void)
    {
        var _loc2_ = this.offset;
        if(this.__borderMetrics == undefined)
        {
            this.__borderMetrics = {left:_loc2_,top:_loc2_,right:_loc2_,bottom:_loc2_};
        }
        else
        {
            this.__borderMetrics.left = _loc2_;
            this.__borderMetrics.top = _loc2_;
            this.__borderMetrics.right = _loc2_;
            this.__borderMetrics.bottom = _loc2_;
        }
        return this.__borderMetrics;
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().__get__borderMetrics = function()
    {
        return this.getBorderMetrics();
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().drawBorder = function(Void)
    {
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().size = function(Void)
    {
        this.drawBorder();
    };
    mx.skins.RectBorder.prototype = new mx.skins.Border().setColor = function(Void)
    {
        this.drawBorder();
    };
    mx.skins.RectBorder = function()
    {
        super();
    }.symbolName = "RectBorder";
    mx.skins.RectBorder = function()
    {
        super();
    }.symbolOwner = mx.skins.RectBorder;
    mx.skins.RectBorder = function()
    {
        super();
    }.version = "2.0.2.127";
    mx.skins.RectBorder.prototype = new mx.skins.Border().className = "RectBorder";
    mx.skins.RectBorder.prototype = new mx.skins.Border().borderStyleName = "borderStyle";
    mx.skins.RectBorder.prototype = new mx.skins.Border().borderColorName = "borderColor";
    mx.skins.RectBorder.prototype = new mx.skins.Border().shadowColorName = "shadowColor";
    mx.skins.RectBorder.prototype = new mx.skins.Border().highlightColorName = "highlightColor";
    mx.skins.RectBorder.prototype = new mx.skins.Border().buttonColorName = "buttonColor";
    mx.skins.RectBorder.prototype = new mx.skins.Border().backgroundColorName = "backgroundColor";
    §§push((mx.skins.RectBorder.prototype = new mx.skins.Border()).addProperty("borderMetrics",mx.skins.RectBorder.prototype = new mx.skins.Border().__get__borderMetrics,function()
    {
    }
    ));
    §§push((mx.skins.RectBorder.prototype = new mx.skins.Border()).addProperty("height",mx.skins.RectBorder.prototype = new mx.skins.Border().__get__height,function()
    {
    }
    ));
    §§push((mx.skins.RectBorder.prototype = new mx.skins.Border()).addProperty("width",mx.skins.RectBorder.prototype = new mx.skins.Border().__get__width,function()
    {
    }
    ));
    §§push(ASSetPropFlags(mx.skins.RectBorder.prototype,null,1));
}
§§pop();
