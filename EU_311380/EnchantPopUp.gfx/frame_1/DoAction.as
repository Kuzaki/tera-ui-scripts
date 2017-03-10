function setSlot(mc, slotData)
{
    if(mc.itemSlot)
    {
        mc.itemSlot.removeMovieClip();
    }
    mc.onEnterFrame = function()
    {
        delete this.onEnterFrame;
        var _loc2_ = this.attachMovie("Slot_link","itemSlot",this.getNextHighestDepth());
        _loc2_.index = slotData[0];
        _loc2_.draw(slotData[1]);
        _loc2_.SLOT.enabled = false;
        _loc2_.display = true;
        if(_loc2_.num > 0)
        {
            _loc2_.num = slotData[2];
        }
        _loc2_.grade = slotData[3];
        lib.manager.ToolTip.add(_loc2_.SLOT,slotData[0],6);
    };
}
function setAlign()
{
    var _loc1_ = 60 + container_mc.subTxt.textHeight + 20;
    if(container_mc.slotBox._visible)
    {
        container_mc.subBg._height = _loc1_;
        container_mc.slotBox._y = _loc1_;
        _loc1_ = _loc1_ + 80;
    }
    if(container_mc.guideBox._visible)
    {
        _loc1_ = _loc1_ + 10;
        container_mc.guideBox._y = _loc1_;
        _loc1_ = _loc1_ + (container_mc.guideBox._height + 10);
    }
    else
    {
        _loc1_ = _loc1_ + 10;
    }
    if(container_mc.recommendBox._visible)
    {
        _loc1_ = _loc1_ + 30;
        container_mc.recommendBox._y = _loc1_;
        _loc1_ = _loc1_ + 120;
    }
    container_mc.buyTxt._y = _loc1_;
    _loc1_ = _loc1_ + (container_mc.buyTxt.textHeight + 50);
    container_mc.btmBg._y = _loc1_ + 10;
    container_mc.btn0._y = container_mc.btn1._y = _loc1_;
    container_mc.bgMc._height = _loc1_ + 60;
}
function ToGame_EnchantPopUp_Init()
{
    fscommand("ToGame_EnchantPopUp_Init");
}
function ToGame_EnchantPopUp_CloseUI()
{
    fscommand("ToGame_EnchantPopUp_CloseUI");
}
function ToGame_EnchantPopUp_Click()
{
    fscommand("ToGame_EnchantPopUp_Click");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "EnchantPopUp";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var popUpMode = 0;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_EnchantPopUp_CloseUI);
var enter_btn = container_mc.btn0.txtBtn;
enter_btn.setRelease(ToGame_EnchantPopUp_Click);
container_mc.slotBox._visible = false;
container_mc.guideBox._visible = false;
container_mc.recommendBox._visible = false;
container_mc.btmBg._visible = false;
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
myListener.OnGameEventChangeUIMode = function(bShow)
{
    if(_global.gbUIMode && bWidgetOpen)
    {
        UI._visible = true;
    }
    else
    {
        UI._visible = false;
    }
};
myListener.OnGame_EnchantPopUp_SetTitle = function(titleStr, subStr, buyStr)
{
    container_mc.titleTxt.htmlText = titleStr;
    container_mc.subTxt.htmlText = subStr;
    container_mc.buyTxt.htmlText = buyStr;
};
myListener.OnGame_EnchantPopUp_SlotTxt = function(listStr, resultStr)
{
    container_mc.slotBox.listTxt.htmlText = listStr;
    container_mc.slotBox.resultTxt.setText(resultStr);
    container_mc.slotBox._visible = true;
    setAlign();
};
myListener.OnGame_EnchantPopUp_SetRecommend = function(dataList)
{
    container_mc.recommendBox._visible = true;
    container_mc.btmBg._visible = true;
    var _loc1_ = container_mc.recommendBox.slotMc;
    var _loc2_ = lib.util.ExtString.split(dataList,"\t");
    _loc1_.id = _loc2_[0];
    _loc1_.draw(_loc2_[1]);
    _loc1_.grade = _loc2_[3];
    _loc1_.masterpiece = _loc2_[2];
    _loc1_.drag = false;
    _loc1_.effect = false;
    _loc1_.upText = _loc2_[4];
    lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
    setAlign();
};
myListener.OnGame_EnchantPopUp_SetGuideSlot = function(dataList)
{
    if(!dataList)
    {
        return undefined;
    }
    container_mc.guideBox._visible = true;
    var _loc6_ = lib.util.ExtString.split(dataList,"\n");
    var _loc5_ = _loc6_.length;
    container_mc.guideBox.gotoAndStop(_loc5_);
    var _loc1_ = 0;
    while(_loc1_ < _loc5_)
    {
        var _loc3_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
        var _loc4_ = container_mc.guideBox["slot" + _loc1_];
        setSlot(_loc4_,_loc3_);
        var _loc2_ = container_mc.guideBox["listTxt" + _loc1_];
        _loc2_.verticalAlign = "center";
        _loc2_.htmlText = _loc3_[4];
        _loc1_ = _loc1_ + 1;
    }
    setAlign();
};
myListener.OnGame_EnchantPopUp_SetRightSlot = function(dataList)
{
    var _loc1_ = lib.util.ExtString.split(dataList,"\t");
    var _loc2_ = container_mc.slotBox.slotR;
    setSlot(_loc2_,_loc1_);
};
myListener.OnGame_EnchantPopUp_SetLeftSlot = function(dataList)
{
    var _loc5_ = lib.util.ExtString.split(String(dataList),"\n");
    var _loc4_ = _loc5_.length;
    container_mc.slotBox.gotoAndStop(_loc4_);
    var _loc1_ = 0;
    while(_loc1_ < _loc4_)
    {
        var _loc2_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
        var _loc3_ = container_mc.slotBox["slot" + _loc1_];
        setSlot(_loc3_,_loc2_);
        _loc1_ = _loc1_ + 1;
    }
};
ToGame_EnchantPopUp_Init();
