function fadeCritical()
{
    if(container_mc.successSlot)
    {
        gs.TweenLite.to(container_mc.successSlot,0.3,{delay:1,_alpha:0,ease:easing.Strong.easeOut,onComplete:fadeEnd});
    }
    gs.TweenLite.to(container_mc.resultTxt,0.3,{delay:1,_alpha:0});
}
function fadeEnd()
{
    clearSlot(container_mc.successSlot);
}
function ToGame_ProductionCreatePopUp_Init()
{
    fscommand("ToGame_ProductionCreatePopUp_Init");
}
function ToGame_ProductionCreatePopUp_Cancel()
{
    fscommand("ToGame_ProductionCreatePopUp_Cancel");
}
function clearSlot(_tgMc)
{
    lib.manager.ToolTip.remove(_tgMc);
    _tgMc.removeMovieClip();
}
function setDecimal(num)
{
    var _loc2_ = int(num);
    var _loc1_ = num * 10 % 10;
    if(_loc1_ != 0)
    {
        _loc2_ = _loc2_ + _loc1_ * 0.1;
    }
    return _loc2_;
}
function clearBox(_tgMc)
{
    for(str in _tgMc)
    {
        var _loc1_ = _tgMc[str];
        lib.manager.ToolTip.remove(_loc1_);
        _loc1_.removeMovieClip();
    }
}
function drawSlot(_tgMc, _id, _img, _grade, _num)
{
    lib.manager.ToolTip.add(_tgMc,_id,6);
    lib.display.DrawBitmapData.draw(_tgMc,_img,0,0,0,0,36,36,0.56);
    if(_grade > 0)
    {
        lib.display.DrawBitmapData.draw(_tgMc,UI["gradeBm" + _grade],0,0,0,0,14,14);
    }
    if(_num > 0)
    {
        lib.display.TextBuilder.draw(_tgMc,"numTxt",25,25,36,16,amountTextFormat);
        container_mc.itemDraw.numTxt.text = _num;
    }
}
function gageSize()
{
    container_mc.gageMc0._x = -178;
    container_mc.gageMc1._x = -178;
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "ProductionCreatePopUp";
container_mc.UIDrager.setData(UIName,UI);
container_mc.titleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var cancel_btn = new lib.util.TxtBtn(container_mc.cancelBtn.btn,container_mc.cancelBtn.txt);
cancel_btn.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
cancel_btn.setRelease(ToGame_ProductionCreatePopUp_Cancel);
var gageY = 240;
var gradeTextColor = ["0xFFFFFF","0x4ecd30","0x00aeef","0xffcc00"];
var GRADE_STR = lib.util.UIString.getUIString("$153027");
var SUCCESS_STR_NOR = lib.util.UIString.getUIString("$153018");
var SUCCESS_STR_CRI = lib.util.UIString.getUIString("$153025");
var SUCCESS_STR_PER = lib.util.UIString.getUIString("$153061") + " " + lib.util.UIString.getUIString("$153062");
var amountTextFormat = new TextFormat("$NormalFont",14,14145495,false,false,false,null,null,"right",0,0,0,0);
var gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
        bWidgetOpen = bShow;
        if(_global.gbUIMode && bWidgetOpen)
        {
            UI._visible = true;
        }
        else
        {
            UI._visible = false;
        }
    }
};
myListener.OnGame_ProductionCreatePopUp_SetTitle = function(_str)
{
    container_mc.titleTxt.htmlText = _str;
};
myListener.OnGame_ProductionCreatePopUp_SetTargetItem = function(_num, _data)
{
    clearSlot(container_mc.targetSlot);
    var _loc1_ = lib.util.ExtString.split(_data,"\t");
    var _loc2_ = container_mc.attachMovie("slotDraw","targetSlot",container_mc.getNextHighestDepth());
    _loc2_._x = 143;
    _loc2_._y = 42;
    drawSlot(_loc2_,_loc1_[0],_loc1_[2],_loc1_[3],_loc1_[4]);
    container_mc.titleTxt.textColor = gradeTextColor[Number(_loc1_[3])];
    var _loc4_ = lib.util.ExtString.split(_num,"\t");
    var _loc3_ = setDecimal(_loc4_[0]);
    if(_loc3_ > 0)
    {
        container_mc.gradeTxt.htmlText = GRADE_STR + " <font color=\'#80E71C\'>+" + _loc3_ + "</font>";
    }
    else
    {
        container_mc.gradeTxt.htmlText = GRADE_STR + " <font color=\'#BB0000\'>+" + _loc3_ + "</font>";
    }
    var _loc5_ = setDecimal(_loc4_[1]);
    if(_loc5_ > 0)
    {
        container_mc.gradeTxt2.htmlText = "<font color=\'#80e71c\'>" + SUCCESS_STR_CRI + " " + SUCCESS_STR_PER + "</font>";
    }
    else
    {
        container_mc.gradeTxt2.htmlText = "";
    }
};
var bigSuccess = false;
myListener.OnGame_ProductionCreatePopUp_SetResult = function(_type, _success)
{
    ontainer_mc.resultTxt.alpha = 0;
    if(_type == "1")
    {
        bigSuccess = true;
        var _loc2_ = lib.util.ExtString.split(_success,"\t");
        var _loc1_ = container_mc.attachMovie("slotDraw","successSlot",container_mc.getNextHighestDepth());
        _loc1_._x = 250;
        _loc1_._y = 48;
        _loc1_._alpha = 0;
        _loc1_._xscale = 80;
        _loc1_._yscale = 80;
        gs.TweenLite.to(_loc1_,0.3,{_alpha:100,ease:easing.Strong.easeOut});
        drawSlot(_loc1_,_loc2_[0],_loc2_[2],"",_loc2_[4]);
        container_mc.gageMc0.gotoAndPlay(2);
        container_mc.effect.gotoAndPlay(2);
        container_mc.effect._visible = true;
        return undefined;
    }
    if(bigSuccess == false)
    {
        container_mc.resultTxt.text = SUCCESS_STR_NOR;
    }
    else
    {
        container_mc.resultTxt.text = SUCCESS_STR_CRI;
    }
    bigSuccess = false;
    container_mc.resultTxt._alpha = 0;
    gs.TweenLite.to(container_mc.resultTxt,0.5,{_alpha:100,onComplete:fadeCritical});
};
var maxY = 62;
var prevGage = 0;
myListener.OnGame_ProductionCreatePopUp_UpdateProgress = function(_percent)
{
    container_mc.gageMc0.gotoAndStop(1);
    var _loc1_ = _percent / 100 * gageY - 178;
    if(_loc1_ < prevGage)
    {
        container_mc.gageMc0._x = -178;
    }
    prevGage = _loc1_;
    gs.TweenLite.killTweensOf(container_mc.gageMc0,false);
    gs.TweenLite.to(container_mc.gageMc0,0.3,{_x:_loc1_,ease:easing.Strong.easeOut});
};
myListener.OnGame_ProductionCreatePopUp_UpdateTotalProgress = function(_curNum, _totalNum)
{
    container_mc.totalTxt.text = _curNum + "/" + _totalNum;
    var _loc1_ = _curNum / _totalNum * gageY - 178;
    gs.TweenLite.killTweensOf(container_mc.gageMc1,false);
    gs.TweenLite.to(container_mc.gageMc1,0.3,{_x:_loc1_,ease:easing.Strong.easeOut});
};
gageSize();
ToGame_ProductionCreatePopUp_Init();
