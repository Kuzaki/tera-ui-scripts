function gageMotion(mc, sc)
{
    delete mc.onEnterFrame;
    if(sc < mc.maksMc._xscale)
    {
        mc.maksMc._xscale = 1;
        mc.fireMc._x = barTX;
    }
    mc.onEnterFrame = function()
    {
        this.maksMc._xscale = this.maksMc._xscale + rspeed * (sc - this.maksMc._xscale);
        this.fireMc._x = this.maksMc._x + this.maksMc._width - 1;
        if(Math.abs(this.maksMc._xscale - sc) <= 0.1)
        {
            this.maksMc._xscale = sc;
            this.fireMc._x = this.maksMc._x + this.maksMc._width - 1;
            delete this.onEnterFrame;
        }
    };
}
function gageCancel()
{
    var c = 0;
    Hp_Bar.barMc.fireMc._visible = false;
    delete Hp_Bar.barMc.onEnterFrame;
    Hp_Bar.barMc.onEnterFrame = function()
    {
        if(c++ > 9)
        {
            Hp_Bar._alpha = Hp_Bar._alpha + 0.4 * (- Hp_Bar._alpha);
            if(Hp_Bar._alpha < 5)
            {
                Hp_Bar._visible = false;
                Hp_Bar._alpha = 100;
                Hp_Bar.barMc.maksMc._xscale = 0;
                delete Hp_Bar.barMc.onEnterFrame;
            }
        }
    };
}
function chrageMotion(mc, time)
{
    delete mc.onEnterFrame;
    gs.TweenLite.killTweensOf(mc,false);
    gs.TweenLite.killTweensOf(Hp_Bar.barMc.fireMc,false);
    mc._xscale = 1;
    var _loc3_ = Hp_Bar.barMc["c" + chL];
    _loc3_.setMask(mc);
    if(chLevel == 1)
    {
        if(totalLevelCount + 1 == 1)
        {
            gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100,onComplete:chargeFinish});
        }
        else
        {
            gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100});
        }
    }
    else
    {
        chargeFinish();
        gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100});
    }
    Hp_Bar.barMc.fireMc._x = barTX;
    gs.TweenLite.to(Hp_Bar.barMc.fireMc,time - EXPSPACE,{_x:BARWIDTH});
}
function chargeFinish()
{
    var _loc1_ = Hp_Bar.barMc["ce" + (chL - 1)];
    var _loc2_ = Hp_Bar.barMc["c" + (chL - 1)];
    _loc2_.setMask(null);
    _loc1_._visible = true;
    _loc1_.gotoAndPlay(2);
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "GageBar";
var bWidgetOpen = true;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var EXPSPACE = 0.2;
var BARWIDTH = 300;
var MAXLEVELSKINS = 7;
var MAXFULL = 28;
var relaxMode = false;
var chargeMode = false;
var rlaxLevle;
var chLevel;
var chL;
var totalLevel;
var chargeSc = 0;
var maskWidth = Hp_Bar.barMc.maksMc._width;
var rspeed = 0.45;
var condY = conMc._y;
var barTX = -1;
var axis = new lib.util.AxisResetter();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
        var _loc1_ = new lib.controls.CustomScaleEvent();
        _loc1_.CustomScaleEventCheck(UI,UIname);
        bWidgetOpen = bShow;
        if(bWidgetOpen)
        {
            UI._visible = true;
        }
        else
        {
            UI._visible = false;
        }
    }
};
myListener.OnGame_Gage_SetCollection = function(gageValue, _show)
{
    if(chargeMode)
    {
        return undefined;
    }
    gs.TweenLite.killTweensOf(mc,false);
    gs.TweenLite.killTweensOf(Hp_Bar.barMc.fireMc,false);
    Hp_Bar.barMc.colMc.setMask(Hp_Bar.barMc.maksMc);
    Hp_Bar.barMc.colMc._visible = true;
    var _loc1_ = 1;
    while(_loc1_ <= MAXLEVELSKINS)
    {
        Hp_Bar.barMc["ce" + _loc1_]._visible = false;
        Hp_Bar.barMc["c" + _loc1_]._visible = false;
        _loc1_ = _loc1_ + 1;
    }
    Hp_Bar._visible = Number(_show);
    if(Number(_show))
    {
        Hp_Bar.barMc.fireMc._visible = true;
        relaxMode = false;
        gageMotion(Hp_Bar.barMc,Number(gageValue));
    }
    else
    {
        Hp_Bar.barMc.colMc._visible = false;
        Hp_Bar.barMc.fireMc._visible = false;
        delete Hp_Bar.barMc.onEnterFrame;
    }
};
myListener.OnGame_Gage_SetCharge = function(chargeLevel, total, time)
{
    chargeMode = true;
    Hp_Bar._alpha = 100;
    delete Hp_Bar.barMc.onEnterFrame;
    Hp_Bar.barMc.fireMc._visible = true;
    Hp_Bar.barMc.fireMc._x = BARWIDTH;
    Hp_Bar.barMc.failMc.gotoAndStop(1);
    Hp_Bar.barMc.colMce.gotoAndStop(1);
    chLevel = Number(chargeLevel);
    totalLevelCount = Number(total) - 1;
    startLevel = MAXLEVELSKINS - totalLevelCount + 1;
    chL = startLevel + chLevel - 1;
    Hp_Bar._visible = true;
    Hp_Bar.barMc.colMc._visible = false;
    var _loc1_ = 1;
    while(_loc1_ <= MAXLEVELSKINS)
    {
        Hp_Bar.barMc["ce" + _loc1_]._visible = false;
        Hp_Bar.barMc["ce" + _loc1_].gotoAndStop(1);
        Hp_Bar.barMc["c" + _loc1_]._visible = _loc1_ == chL - 1 && chLevel != 1 || _loc1_ == chL;
        _loc1_ = _loc1_ + 1;
    }
    if(chL <= MAXLEVELSKINS)
    {
        chrageMotion(Hp_Bar.barMc.maksMc,Number(time));
    }
    else
    {
        Hp_Bar.barMc["ce" + MAXLEVELSKINS]._visible = true;
        Hp_Bar.barMc["ce" + MAXLEVELSKINS].gotoAndPlay(2);
    }
};
myListener.OnGame_Gage_CancelCharge = function()
{
    gs.TweenLite.killTweensOf(mc,false);
    gs.TweenLite.killTweensOf(Hp_Bar.barMc.fireMc,false);
    Hp_Bar._visible = false;
    chargeMode = false;
    var _loc1_ = 1;
    while(_loc1_ <= MAXLEVELSKINS)
    {
        Hp_Bar.barMc["ce" + _loc1_]._visible = false;
        Hp_Bar.barMc["ce" + _loc1_].gotoAndStop(1);
        _loc1_ = _loc1_ + 1;
    }
};
Hp_Bar.barMc.maksMc._xscale = 0;
Hp_Bar._visible = false;
