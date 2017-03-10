function effectEnd()
{
    container_mc.expBar._width = curWidth;
}
function effectEnd2()
{
    gs.TweenLite.to(container_mc.epMc.effectBar,2,{_alpha:0,ease:Strong.easeIn});
}
function SetEpButton()
{
    var _loc2_ = container_mc.epMc.aniMc.markMc;
    var transBtn = new flash.geom.Transform(_loc2_);
    _loc2_.onRollOver = function()
    {
        this._y = -8;
        transBtn.colorTransform = new flash.geom.ColorTransform(1.5,1.5,1.5,1,0,0,0,0);
    };
    _loc2_.onRelease = function()
    {
        this._y = -7;
        transBtn.colorTransform = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
    };
    _loc2_.onPress = function()
    {
        this._y = -5;
        transBtn.colorTransform = new flash.geom.ColorTransform(0.8,0.8,0.8,1,0,0,0,0);
        ToGame_Message_EpClick();
    };
    _loc2_.onReleaseOutside = _loc2_.onRollOut = function()
    {
        this._y = -7;
        transBtn.colorTransform = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
    };
}
function ToGame_Message_EpClick()
{
    fscommand("ToGame_Message_EpClick");
}
function pointUp(point, tgMc)
{
    if(point == 0)
    {
        return undefined;
    }
    gs.TweenLite.killTweensOf(tgMc.addpointTxt);
    if(point > 0)
    {
        tgMc.addpointTxt.textColor = 65535;
        tgMc.addpointTxt.text = "+" + point;
    }
    else
    {
        tgMc.addpointTxt.textColor = 13382400;
        tgMc.addpointTxt.text = point;
    }
    tgMc.addpointTxt._visible = true;
    tgMc.addpointTxt._width = tgMc.addpointTxt.textWidth + 6;
    tgMc.waninigMc._visible = true;
    tgMc.waninigMc.gotoAndPlay(2);
    tgMc.addpointTxt._alpha = 100;
    tgMc.addpointTxt._x = 25.5;
    tgMc.addpointTxt._y = 2;
    tgMc.addpointTxt._alpha = 100;
    gs.TweenLite.to(tgMc.addpointTxt,0.5,{_y:-20,ease:gs.easing.Strong.easeOut,onComplete:onFinishTween,onCompleteParams:[tgMc.addpointTxt]});
}
function onFinishTween(tg)
{
    gs.TweenLite.to(tg,2,{_x:40,_alpha:0,ease:gs.easing.Strong.easeOut});
}
var UI = this;
UI._visible = false;
var UIname = "ExpBar";
var bWindowOpen = true;
var expStr = lib.util.UIString.getUIString("$024002") + " : ";
var attainStr = lib.util.UIString.getUIString("$024003") + " : ";
var addRestExpBonusStr = lib.util.UIString.getUIString("$024005") + " : ";
var addItemDropBonusStr = lib.util.UIString.getUIString("$024006") + " : ";
var addRestExpStr = lib.util.UIString.getUIString("$024007") + " : ";
var xpStr = lib.util.UIString.getUIString("$005008");
attain_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.blet._visible = 0;
container_mc.blet._x = 0;
container_mc.expBar._width = 0;
container_mc.expBarAdd._width = 0;
var totalWidth = 1914;
var curWidth = 0;
var hasAddExp = false;
var bletPos = 0;
var prevRatio = 0;
var EFFECT_RATIO = 5;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = bShow;
        UI._visible = bShow;
    }
};
var ADD_STR = "";
myListener.OnGame_ExpBar_AddTooltip = function(str)
{
    if(str)
    {
        ADD_STR = str;
    }
    else
    {
        ADD_STR = "";
    }
    if(epTooltip != "")
    {
        epTooltip = epTooltip + str;
    }
};
myListener.OnGame_CharacterWindow_UpdateExp = function(curExp, totalExp, curAddRestExp, totalAddRestExp, addRestExpPercent, addItemDropPercent, expRatio, addExpRatio, expPeraddExpRatio)
{
    expRatio = Number(expRatio);
    addExpRatio = Number(addExpRatio);
    expPeraddExpRatio = Number(expPeraddExpRatio);
    hasAddExp = curAddRestExp != "0" && curAddRestExp != "" && curAddRestExp != undefined;
    if(isNaN(addItemDropPercent))
    {
        addItemDropPercent = 0;
    }
    if(0.01 > expRatio)
    {
        expRatio = 0.01;
    }
    else
    {
        expRatio = lib.util.ExtString.decimal(expRatio,2);
    }
    if(0.01 > addExpRatio)
    {
        addExpRatio = 0.01;
    }
    else
    {
        addExpRatio = lib.util.ExtString.decimal(addExpRatio,2);
    }
    if(totalExp <= 0)
    {
        curWidth = 0;
        prevWidth = 0;
    }
    else
    {
        curWidth = expRatio / 100 * totalWidth;
    }
    var _loc8_ = "<font color=\'#" + lib.info.TextColor.GENERAL_CONTENTS.toString(16) + "\'>" + expStr + curExp + " / " + totalExp + " (" + expRatio + "%)" + "</font>" + ADD_STR;
    if(hasAddExp)
    {
        container_mc.expBar.gotoAndStop(2);
        bletPos = curWidth + expPeraddExpRatio / 100 * totalWidth;
        container_mc.blet._x = bletPos;
        container_mc.blet._visible = bletPos <= totalWidth;
        container_mc.expBarAdd._width = bletPos > totalWidth?totalWidth:bletPos;
        container_mc.tooltip = "";
        container_mc.tooltip = container_mc.tooltip + ("<font color=\'#00c0ff\'>" + addRestExpBonusStr + addRestExpPercent + "%" + "\n");
        if(addItemDropPercent)
        {
            container_mc.tooltip = container_mc.tooltip + (addItemDropBonusStr + addItemDropPercent + "%" + "\n");
        }
        container_mc.tooltip = container_mc.tooltip + (addRestExpStr + curAddRestExp + " / " + totalAddRestExp + " (" + addExpRatio + "%)" + "\n");
        container_mc.tooltip = container_mc.tooltip + (_loc8_ + "</font>");
    }
    else
    {
        container_mc.expBar.gotoAndStop(1);
        container_mc.blet._visible = false;
        container_mc.expBarAdd._width = 0;
        container_mc.tooltip = _loc8_;
    }
    var _loc4_ = expRatio - prevRatio;
    if(container_mc.effectBar)
    {
        gs.TweenLite.killTweensOf(container_mc.effectBar,false);
        container_mc.effectBar.removeMovieClip();
    }
    if(_loc4_ > EFFECT_RATIO)
    {
        var _loc7_ = container_mc.attachMovie("effectBar","effectBar",container_mc.getNextHighestDepth());
        var _loc3_ = container_mc.expBar._width;
        _loc7_._x = _loc3_;
        gs.TweenLite.to(_loc7_,0.3,{_width:curWidth - _loc3_,ease:Strong.easeOut,onComplete:effectEnd});
    }
    else if(_loc4_ < 0)
    {
        _loc7_ = container_mc.attachMovie("effectBar","effectBar",container_mc.getNextHighestDepth());
        _loc7_._x = _loc3_;
        gs.TweenLite.to(_loc7_,0.3,{_width:curWidth,ease:Strong.easeOut,onComplete:effectEnd});
    }
    else
    {
        container_mc.expBar._width = curWidth;
    }
    prevRatio = expRatio;
};
container_mc.blet.onRollOver = function()
{
    this.gotoAndStop(2);
};
container_mc.blet.onRollOut = container_mc.blet.onReleaseOutside = function()
{
    this.gotoAndStop(1);
};
container_mc.hit.onRollOver = function()
{
    if(epTooltip != "" && container_mc.epMc._currentframe == 1)
    {
        lib.manager.ToolTip.show(this,1,epTooltip);
    }
    else
    {
        lib.manager.ToolTip.show(this,1,container_mc.tooltip);
    }
    var _loc2_ = {x:this._x,y:this._y - this._height};
    this._parent.localToGlobal(_loc2_);
    var _loc3_ = 25;
    if(hasAddExp)
    {
        _loc3_ = 70;
    }
    lib.manager.ToolTip.move(_loc2_.x,_loc2_.y - _loc3_);
};
container_mc.hit.onRollOut = container_mc.hit.onReleaseOutside = function()
{
    lib.manager.ToolTip.hide();
};
myListener.OnGame_ExpBar_SetSectionAttain = function(sectionName, attainRatio)
{
    if(Number(attainRatio) != 100 && Number(attainRatio) != 0)
    {
        attainRatio = lib.util.ExtString.decimal(Number(attainRatio),2);
    }
    attain_mc.mask._xscale = attainRatio;
    attain_mc.attainRatio_txt.text = attainRatio;
    attain_mc.section_txt.text = sectionName;
    attain_mc.tooltip = attainStr + attainRatio + "%";
};
attain_mc.onRollOver = function()
{
    lib.manager.ToolTip.show(this,1,this.tooltip);
    var _loc2_ = {x:this._x + this._width,y:this._y - this._height};
    this._parent.localToGlobal(_loc2_);
    lib.manager.ToolTip.move(_loc2_.x - 180,_loc2_.y + 7);
};
attain_mc.onRollOut = attain_mc.onReleaseOutside = function()
{
    lib.manager.ToolTip.hide();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
};
myListener.OnGame_ExpBar_ShowSectionAttain = function(bTrue)
{
    bTrue = Number(bTrue);
    if(bTrue)
    {
        attain_mc._visible = true;
    }
    else
    {
        attain_mc._visible = false;
    }
};
apMc._visible = false;
var apX = apMc._x;
var apW = apX;
myListener.OnGame_AP_SetPoint = function(point, toolTip)
{
    if(point == undefined || point == "")
    {
        return undefined;
    }
    apMc._visible = true;
    var _loc4_ = Number(point) - Number(apMc.pointTxt.text);
    apMc.pointTxt.text = point;
    var _loc2_ = Math.max(36,apMc.pointTxt.textWidth + 4);
    var _loc1_ = Math.max(68,_loc2_ + 32);
    apMc.pointTxt._width = _loc2_;
    apMc.bg._width = _loc1_;
    apMc.waninigMc._width = _loc1_;
    apW = apX + _loc1_ + 2;
    bpMc._x = apW;
    lib.manager.ToolTip.add(apMc,toolTip,1);
    pointUp(_loc4_,apMc);
};
bpMc._visible = false;
var bpMaskTw = bpMc.maskMc._width;
myListener.OnGame_BP_SetPoint = function(point, tprocess, toolTip)
{
    if(point == undefined || point == "")
    {
        return undefined;
    }
    bpMc._visible = true;
    var _loc6_ = Number(point) - Number(bpMc.pointTxt.text);
    bpMc.pointTxt.text = point;
    var _loc2_ = Math.max(36,bpMc.pointTxt.textWidth + 4);
    var _loc4_ = Math.max(68,_loc2_ + 32);
    var _loc1_ = Math.max(64,_loc2_ + 28);
    bpMc.pointTxt._width = _loc2_;
    bpMc.bg._width = _loc4_;
    bpMc.waninigMc._width = _loc4_;
    bpMc.gageMc._width = _loc1_;
    bpMc.fullMc._width = _loc1_;
    bpMaskTw = _loc1_;
    bpMc._x = apW;
    var _loc3_ = Number(tprocess);
    var _loc7_ = _loc3_ * bpMaskTw / 100;
    bpMc.fullMc._visible = _loc3_ >= 100;
    bpMc.maskMc._width = _loc7_;
    lib.manager.ToolTip.add(bpMc,toolTip,1);
    pointUp(_loc6_,bpMc);
};
container_mc.epMc._visible = false;
var prevEp = 0;
var epFoint = 0;
var epFointStr = 0;
var epMode = 0;
var epTooltip = "";
myListener.OnGame_ExpBar_SetEp = function(prevEp, totalEp, type, visibleMode, tooltip)
{
    if(visibleMode == "-1")
    {
        container_mc.epMc._visible = false;
        return undefined;
    }
    if(visibleMode == "0")
    {
        container_mc.epMc._visible = true;
        container_mc.epMc.gotoAndStop(2);
    }
    else
    {
        container_mc.epMc._visible = true;
        container_mc.epMc.gotoAndStop(1);
        if(epMode != visibleMode)
        {
            container_mc.epMc.aniMc.gotoAndPlay(2);
        }
    }
    epMode = visibleMode;
    var _loc1_ = prevEp / 100 * (totalWidth - 68);
    var _loc3_ = totalEp / 100 * (totalWidth - 68);
    container_mc.epMc.epBarT._width = _loc3_;
    container_mc.epMc.bg._width = totalWidth;
    container_mc.epMc.pointMc._x = container_mc.epMc.epBarT._width + 60;
    if(prevEp >= totalEp)
    {
        container_mc.epMc.pointMc._alpha = 0;
    }
    else
    {
        container_mc.epMc.pointMc._alpha = 100;
    }
    gs.TweenLite.killTweensOf(container_mc.epMc.epBarP,false);
    container_mc.epMc.epBarP.gotoAndPlay(2);
    container_mc.epMc.effectBar._alpha = 0;
    container_mc.epMc.effectBar.motionMc.gotoAndPlay(2);
    gs.TweenLite.to(container_mc.epMc.effectBar,0.5,{_alpha:100,_x:_loc1_ + 60,ease:Strong.easeOut,onComplete:effectEnd2});
    gs.TweenLite.to(container_mc.epMc.epBarP,0.5,{_width:_loc1_,ease:Strong.easeOut});
    if(tooltip)
    {
        epTooltip = tooltip + ADD_STR;
    }
    else
    {
        epTooltip = EP_STR + prevEp + "/" + totalEp + ADD_STR;
    }
    if(epFoint == 0)
    {
        container_mc.epMc.countTxt.text = "";
        container_mc.epMc.aniMc.ballMc._visible = false;
    }
    else
    {
        if(epFoint > 99)
        {
            epFointStr = "99+";
        }
        else
        {
            epFointStr = epFoint;
        }
        container_mc.epMc.countTxt.text = epFointStr;
        container_mc.epMc.aniMc.ballMc._visible = true;
    }
    SetEpButton();
};
var EP_STR = lib.util.UIString.getUIString("$670001");
var PrevLevel = 0;
var PrevCount = 0;
myListener.OnGame_ExpBar_EpEffect = function(modeType)
{
    if(modeType == 0)
    {
        container_mc.epMc.aniMc.markMc.gotoAndStop(1);
    }
    else
    {
        container_mc.epMc.aniMc.markMc.gotoAndPlay(2);
    }
};
myListener.OnGame_ExpBar_EpAlim = function(modeType, level, count, grade, effect)
{
    if(modeType == "0")
    {
        container_mc.epMc.btn._visible = false;
    }
    else
    {
        container_mc.epMc.btn._visible = true;
    }
    if(PrevLevel != level)
    {
        PrevLevel = level;
        container_mc.epMc.levelMc.gotoAndStop(Number(level % 10));
    }
    if(PrevCount != count)
    {
        PrevCount = count;
    }
    if(effect == "1")
    {
        container_mc.epMc.aniMc.gotoAndPlay(25);
    }
    else
    {
        container_mc.epMc.aniMc.gotoAndStop(24);
    }
    container_mc.epMc.aniMc.markMc.mc.gotoAndStop(Number(grade) + 1);
    epFoint = count;
    if(count > 0)
    {
        if(epFoint > 99)
        {
            epFointStr = "99+";
        }
        else
        {
            epFointStr = epFoint;
        }
        container_mc.epMc.aniMc.ballMc._visible = true;
        container_mc.epMc.countTxt.text = epFointStr;
    }
    else
    {
        container_mc.epMc.countTxt.text = "";
        container_mc.epMc.aniMc.ballMc._visible = false;
    }
};
myListener.OnGame_CharacterWindow_UpdateExp(0,0,0,0,0,0);
myListener.OnGame_ExpBar_SetSectionAttain("$024004",0);
myListener.OnGame_ChangeStageSize(Stage.width,Stage.height);
