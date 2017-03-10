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
if(!mx.skins.Border)
{
    mx.skins.Border.prototype = new mx.core.UIObject().init = function(Void)
    {
        super.init();
    };
    mx.skins.Border = function()
    {
        super();
    }.symbolName = "Border";
    mx.skins.Border = function()
    {
        super();
    }.symbolOwner = mx.skins.Border;
    mx.skins.Border.prototype = new mx.core.UIObject().className = "Border";
    mx.skins.Border.prototype = new mx.core.UIObject().tagBorder = 0;
    mx.skins.Border.prototype = new mx.core.UIObject().idNames = new Array("border_mc");
    §§push(ASSetPropFlags(mx.skins.Border.prototype,null,1));
}
§§pop();
