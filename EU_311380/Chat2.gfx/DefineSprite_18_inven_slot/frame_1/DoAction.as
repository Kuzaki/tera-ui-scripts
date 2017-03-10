this.tootip = "이것은 툴팁텍스트";
hit.onPress = function()
{
    var _loc4_ = {x:_xmouse,y:_ymouse};
    this.localToGlobal(_loc4_);
    _global.StartIconDrag(_name,Icon.resourcID,_loc4_.x,_loc4_.y,_xmouse,_ymouse);
    trace("StartIconDrag:" + _name);
    _parent._parent._parent.isDraging(true);
};
hit.onRollOver = function()
{
    var _loc2_ = {x:this._x,y:this._y};
    localToGlobal(_loc2_);
};
hit.onRollOut = function()
{
};
hit.onReleaseOutside = function()
{
    _parent._parent._parent.isDraging(false);
};
hit.onRelease = function()
{
    if(this._parent._parent.ctrl)
    {
        this._parent._parent.chatInputingText.htmlText = "<a href=\"asfunction:debug,track" + random(100) + ".mp3\"><font color=\'#ff0000\'>[헤일의돌][테스트]</font></a>";
    }
};
hit.GetName = function()
{
    return _name;
};
text_name.GetName = function()
{
    return _name;
};
text_price.GetName = function()
{
    return _name;
};
stop();
