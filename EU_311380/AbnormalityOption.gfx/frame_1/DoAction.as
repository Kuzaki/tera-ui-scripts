function ToGame_AbnormalityOption_Init()
{
    fscommand("ToGame_AbnormalityOption_Init");
}
function ToGame_AbnormalityOption_Close()
{
    fscommand("ToGame_AbnormalityOption_Close");
    lib.Debuger.trace("ToGame_AbnormalityOption_Close");
}
function ToGame_AbnormalityOption_RequestSetOption()
{
    var _loc3_ = "";
    var _loc1_ = 0;
    while(_loc1_ < 6)
    {
        var _loc2_ = Number(container_mc["mc_" + _loc1_].checked);
        lib.Debuger.trace("index : " + _loc1_ + ", flag : " + _loc2_);
        _loc3_ = _loc3_ + String(_loc2_) + "\t";
        _loc1_ = _loc1_ + 1;
    }
    lib.Debuger.trace("ToGame_AbnormalityOption_RequestSetOption : " + _loc3_);
    getURL("FSCommand:ToGame_AbnormalityOption_RequestSetOption",_loc3_);
}
function init()
{
    var _loc1_ = 0;
    while(_loc1_ < 6)
    {
        var _loc2_ = container_mc["mc_" + _loc1_];
        setChangedEvent(_loc2_);
        _loc1_ = _loc1_ + 1;
    }
}
function checkedChangeEvent()
{
    var _loc1_ = 0;
    while(_loc1_ < 6)
    {
        var _loc2_ = container_mc["mc_" + _loc1_];
        lib.Debuger.trace("checkedArray[i] : " + checkedArray[_loc1_] + ", mc.checked : " + _loc2_.checked);
        if(checkedArray[_loc1_] != _loc2_.checked)
        {
            confirmBtn.setEnabled(true);
            return undefined;
        }
        _loc1_ = _loc1_ + 1;
    }
    confirmBtn.setEnabled(false);
}
var UI = this;
UI._visible = false;
var UIname = "AbnormalityOption";
container_mc.UIDrager.setData(UIName,UI);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var bWidgetOpen = false;
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_AbnormalityOption_Close);
var confirmBtn = container_mc.btn_0.txtBtn;
confirmBtn.setRelease(ToGame_AbnormalityOption_RequestSetOption);
confirmBtn.setEnabled(false);
var cancelBtn = container_mc.btn_1.txtBtn;
cancelBtn.setRelease(ToGame_AbnormalityOption_Close);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
myListener.OnGame_AbnormalityOption_SetOption = function(optionData)
{
    checkedArray = [];
    var _loc3_ = lib.util.ExtString.split(optionData,"\t");
    var _loc4_ = _loc3_.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc4_)
    {
        var _loc2_ = Boolean(Number(_loc3_[_loc1_]));
        container_mc["mc_" + _loc1_].checked = _loc2_;
        checkedArray[_loc1_] = _loc2_;
        _loc1_ = _loc1_ + 1;
    }
};
container_mc.mc_0.onChanged = container_mc.mc_1.onChanged = container_mc.mc_2.onChanged = container_mc.mc_3.onChanged = container_mc.mc_4.onChanged = container_mc.mc_5.onChanged = container_mc.mc_6.onChanged = function()
{
    checkedChangeEvent();
};
var checkedArray = [false,false,false,false,false,false];
ToGame_AbnormalityOption_Init();
