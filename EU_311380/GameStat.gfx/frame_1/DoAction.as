function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN)
    {
        clockVisibleHandler(event.value);
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN)
    {
        fpsVisibleHandler(event.value);
    }
}
function clockVisibleHandler(value)
{
    container_mc.timeFd._visible = Number(value);
    skinDraw();
}
function fpsVisibleHandler(value)
{
    container_mc.fpsFd._visible = Number(value);
    skinDraw();
    getURL("FSCommand:ToGame_GameStat_SetToggle",value);
}
function skinDraw()
{
    container_mc.bgMovieclip._height = 46;
    container_mc.bgMovieclip._y = 1;
    container_mc.fpsFd._y = 2;
    var _loc1_ = 0;
    var _loc2_ = 0;
    if(container_mc.fpsFd._visible && !container_mc.timeFd._visible)
    {
        container_mc.bgMovieclip._height = 25;
        container_mc.bgMovieclip._y = timeFdY;
        container_mc.fpsFd._y = timeFdY;
        _loc1_ = -23;
        _loc2_ = -23;
    }
    else if(container_mc.timeFd._visible && !container_mc.fpsFd._visible)
    {
        container_mc.bgMovieclip._height = 25;
        container_mc.bgMovieclip._y = timeFdY;
        _loc1_ = -23;
        _loc2_ = -23;
    }
    container_mc.UIDrager._y = container_mc.bgMovieclip._y;
    container_mc.UIDrager._width = container_mc.bgMovieclip._width;
    container_mc.UIDrager._height = container_mc.bgMovieclip._height;
    container_mc.UIDrager.adjustDragLimit(0,0,_loc1_,_loc2_);
    container_mc.UIDrager.setData(UIName,UI);
}
function timerInit()
{
    var _now;
    var _hours;
    var _minutes;
    var _timeTxt = " ";
    countDelay = 0;
    container_mc.onEnterFrame = function()
    {
        countDelay++;
        if(countDelay >= 24)
        {
            countDelay = 0;
            _now = new Date();
            _hours = _now.getHours();
            _minutes = _now.getMinutes();
            if(_hours > 11)
            {
                if(_hours > 12)
                {
                    _hours = _hours - 12;
                }
                if(_hours < 10)
                {
                    _timeTxt = "PM 0" + _hours + ":";
                }
                else
                {
                    _timeTxt = "PM " + _hours + ":";
                }
            }
            else
            {
                if(_hours == 0)
                {
                    _hours = 12;
                }
                if(_hours < 10)
                {
                    _timeTxt = "AM 0" + _hours + ":";
                }
                else
                {
                    _timeTxt = "AM " + _hours + ":";
                }
            }
            if(_minutes < 10)
            {
                _timeTxt = _timeTxt + ("0" + String(_minutes));
            }
            else
            {
                _timeTxt = _timeTxt + String(_minutes);
            }
            container_mc.timeFd.text = _timeTxt;
        }
        return undefined;
    };
}
function ToGame_GameStat_Init()
{
    fscommand("ToGame_GameStat_Init");
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "GameStat";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.bgMovieclip._visible = false;
var timeFdY = container_mc.timeFd._y;
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN,this,"clockVisibleHandler");
customizeData.addEventListener(lib.gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN,this,"fpsVisibleHandler");
customizeData.addEventListener(lib.gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
container_mc.fpsFd.hitTestDisable = true;
container_mc.timeFd.hitTestDisable = true;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = bShow;
        if(bWindowOpen)
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
    if(!_global.gbUIMode)
    {
        container_mc.bgMovieclip._visible = false;
    }
};
var rolloverFlag = false;
myListener.OnGame_MouseMove = function(tg)
{
    if(_global.gbUIMode)
    {
        if(container_mc.timeFd._visible || container_mc.fpsFd._visible)
        {
            if(tg._parent == container_mc || tg._parent == container_mc.UIDrager)
            {
                if(!rolloverFlag)
                {
                    rolloverFlag = true;
                    container_mc.bgMovieclip._visible = true;
                    lib.manager.ToolTip.add(container_mc.UIDrager,0,6);
                    fscommand("ToGame_ToolTip_RequestGameStat");
                }
            }
            else if(rolloverFlag)
            {
                rolloverFlag = false;
                container_mc.bgMovieclip._visible = false;
                lib.manager.ToolTip.remove(container_mc.UIDrager);
                fscommand("ToGame_ToolTip_RemoveGameStat");
            }
        }
    }
};
myListener.OnGame_GameStat_setStat = function(fps)
{
    container_mc.fpsFd.text = "FPS " + fps;
};
var settime;
var countDelay;
timerInit();
ToGame_GameStat_Init();
