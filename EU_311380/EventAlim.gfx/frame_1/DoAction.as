function ToGame_EventAlim_Click()
{
    fscommand("ToGame_EventAlim_Click");
}
function ToGame_EventAlim_Init()
{
    fscommand("ToGame_EventAlim_Init");
}
function folderOn()
{
    alimMode = 1;
    container_mc.gotoAndStop(1);
    changeMode();
}
function folderOff()
{
    alimMode = 0;
    container_mc.gotoAndStop(2);
    changeMode();
}
function changeMode()
{
    if(alimMode == 0)
    {
        setDrag(container_mc.btn,folderOn);
    }
    else
    {
        container_mc.titleTxt.text = title_txt;
        container_mc.timeTxt.text = time_txt;
        var _loc1_ = new lib.util.TxtBtn(container_mc.folderBtn);
        _loc1_.setRelease(folderOff);
        setDrag(container_mc.openBtn,ToGame_EventAlim_Click);
    }
}
function setDrag(mc, func)
{
    mc.onRollOver = function()
    {
        UI.stopDrag();
        this.gotoAndStop(2);
    };
    mc.onRollOut = mc.onReleaseOutside = function()
    {
        UI.stopDrag();
        this.gotoAndStop(1);
    };
    mc.onPress = function()
    {
        clickX = UI._x;
        clickY = UI._y;
        var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
        var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
        UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
        this.gotoAndStop(1);
    };
    mc.onRelease = function()
    {
        UI.stopDrag();
        if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
        {
            lib.info.AlignInfo.savePos(UI,true);
        }
        else
        {
            func();
        }
        this.gotoAndStop(1);
    };
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "EventAlim";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var title_txt = "";
var time_txt = "";
var alimMode = 1;
container_mc.bg._visible = false;
container_mc._visible = false;
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
        container_mc.bg._visible = false;
    }
    else
    {
        container_mc.bg._visible = true;
    }
};
myListener.OnGame_EventAlim_SetTitle = function(titleStr)
{
    title_txt = titleStr;
    if(alimMode == 1)
    {
        container_mc.titleTxt.text = title_txt;
    }
    container_mc.onEnterFrame = function()
    {
        delete this.onEnterFrame;
        this._visible = true;
    };
};
myListener.OnGame_EventAlim_SetTime = function(timeStr)
{
    time_txt = timeStr;
    if(alimMode == 1)
    {
        container_mc.timeTxt.text = time_txt;
    }
};
var clickX = 0;
var clickY = 0;
changeMode();
ToGame_EventAlim_Init();
