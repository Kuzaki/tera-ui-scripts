function tweenEnd()
{
    gs.TweenLite.to(container_mc.effectBar,0.3,{_alpha:0,ease:Regular.easeOut});
}
function modeChange(target, num)
{
    if(target._alpha == num)
    {
        return undefined;
    }
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,0.3,{_alpha:num,ease:Regular.easeOut});
}
var UI = this;
UI._visible = false;
var UIname = "DungeonEventGage";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var wid = 372;
container_mc.effectBar._alpha = 0;
container_mc.maskMc._width = 3;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = Number(bShow);
        UI._visible = bShow;
        if(_global.gbUIMode)
        {
            container_mc.bg_mc._visible = true;
        }
        else
        {
            container_mc.bg_mc._visible = false;
        }
    }
};
myListener.OnGameEventChangeUIMode = function()
{
    if(_global.gbUIMode)
    {
        container_mc.bg_mc._visible = true;
    }
    else
    {
        container_mc.bg_mc._visible = false;
    }
};
myListener.OnGame_DungeonEventGage_Name = function(nameStr)
{
    container_mc.nameTxt.htmlText = nameStr;
};
myListener.OnGame_DungeonEventGage_Type = function(typeNum)
{
    if(container_mc.bar.gage)
    {
        container_mc.bar.gage.removeMovieClip();
    }
    var _loc1_ = Number(typeNum) + 1;
    container_mc.skinMc.gotoAndStop(_loc1_);
    container_mc.effectBar.gotoAndStop(_loc1_);
    container_mc.bar.attachMovie("gage" + typeNum,"gage",0);
};
myListener.OnGame_DungeonEventGage_Type();
myListener.OnGame_DungeonEventGage_Bar = function(current, total)
{
    container_mc.txt.text = current + " / " + total;
    var _loc1_ = current / total;
    var _loc2_ = _loc1_ * wid + 3;
    container_mc.effectBar._x = container_mc.maskMc._width;
    container_mc.effectBar._alpha = 0;
    if(_loc1_ > 0.6)
    {
        modeChange(container_mc.bar.gage.mc0,0);
        modeChange(container_mc.bar.gage.mc1,0);
    }
    else if(_loc1_ > 0.3)
    {
        modeChange(container_mc.bar.gage.mc0,0);
        modeChange(container_mc.bar.gage.mc1,100);
    }
    else
    {
        modeChange(container_mc.bar.gage.mc0,100);
        modeChange(container_mc.bar.gage.mc1,100);
    }
    gs.TweenLite.killTweensOf(container_mc.effectBar,false);
    gs.TweenLite.to(container_mc.effectBar,0.3,{_x:_loc2_,_alpha:100,ease:Regular.easeOut,onComplete:tweenEnd});
    gs.TweenLite.killTweensOf(container_mc.maskMc,false);
    gs.TweenLite.to(container_mc.maskMc,0.3,{_width:_loc2_,ease:Regular.easeOut});
};
fscommand("ToGame_DungeonEventGage_Init");
