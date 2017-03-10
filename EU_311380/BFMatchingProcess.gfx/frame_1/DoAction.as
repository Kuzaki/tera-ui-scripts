function clearBFList()
{
    var _loc1_ = 0;
    while(_loc1_ < listTotal)
    {
        var _loc2_ = container_mc.listMc["lineMc" + _loc1_];
        _loc2_.removeMovieClip();
        _loc1_ = _loc1_ + 1;
    }
    listTotal = 0;
    container_mc.scrollbar.pageSize = container_mc.listMc._height;
}
function resizeList()
{
    if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == true)
    {
        container_mc.partyContainerMc._y = 257;
        container_mc.partyMasterMc._y = 314;
        container_mc.timeContainerMc._y = 345;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 112;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 115;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 151;
    }
    else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == true)
    {
        container_mc.partyMasterMc._y = 314;
        container_mc.timeContainerMc._y = 345;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 169;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 172;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 208;
    }
    else if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == true)
    {
        container_mc.partyContainerMc._y = 289;
        container_mc.timeContainerMc._y = 345;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 144;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 147;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 183;
    }
    else if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == false)
    {
        container_mc.partyContainerMc._y = 319;
        container_mc.partyMasterMc._y = 376;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 174;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 177;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 213;
    }
    else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == true)
    {
        container_mc.timeContainerMc._y = 345;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 200;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 203;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 239;
    }
    else if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == false)
    {
        container_mc.partyContainerMc._y = 350;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 205;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 208;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 244;
    }
    else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == false)
    {
        container_mc.partyMasterMc._y = 376;
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 231;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 234;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 270;
    }
    else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == false)
    {
        container_mc.scrollbar.pageSize = container_mc.listMc._height;
        container_mc.maskMc._height = 262;
        container_mc.scrollbar.displaySize = container_mc.maskMc._height;
        container_mc.scrollbar._height = 265;
        container_mc.scrollbar.resize();
        container_mc.listBgMc._height = 302;
    }
}
function ToGame_BFMatchingProcess_Init()
{
    fscommand("ToGame_BFMatchingProcess_Init");
}
function ToGame_BFMatchingProcess_Close()
{
    fscommand("ToGame_BFMatchingProcess_Close");
}
function ToGame_BFMatchingProcess_BtnEvent(btnId)
{
    getURL("FSCommand:ToGame_BFMatchingProcess_BtnEvent",btnId);
}
var UI = this;
UI._visible = false;
var UIname = "BFMatchingProcess";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var listTotal;
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
var listContainerY = container_mc.listMc._y;
var defaultMaskH = container_mc.maskMc._height;
var defaultScrollH = container_mc.scrollbar._height;
var defaultListBgH = container_mc.listBgMc._height;
var defaultPartyY = container_mc.partyContainerMc._y;
var resizeMaskH = 199;
var resizeScrollH = 200;
var resizeListBgH = 239;
var resizePartyY = 348;
var defaultBtnMc0X;
var defaultBtnTxt0X;
var partyH = container_mc.partyContainerMc._height;
container_mc.partyContainerMc._visible = false;
container_mc.partyMasterMc._visible = false;
container_mc.timeContainerMc._visible = false;
myListener.OnGame_BFMatchingProcess_SetDisplay = function(_title, btn0_Id, btn0_Name, btn1_Id, btn1_Name)
{
    container_mc.text_name2.text = _title;
    var _loc2_ = btn0_Name != "" && btn0_Name != undefined;
    var _loc1_ = btn1_Name != "" && btn1_Name != undefined;
    btn0.setVisible(_loc2_);
    btn1.setVisible(_loc1_);
    btn0.setText(btn0_Name);
    btn1.setText(btn1_Name);
    btn0.setRelease(function()
    {
        ToGame_BFMatchingProcess_BtnEvent(btn0_Id);
    }
    );
    btn1.setRelease(function()
    {
        ToGame_BFMatchingProcess_BtnEvent(btn1_Id);
    }
    );
    if(!_loc1_)
    {
        btn0.btn._x = 184;
        btn0.txt._x = 191;
    }
    else
    {
        btn0.btn._x = defaultBtnMc0X;
        btn0.txt._x = defaultBtnTxt0X;
    }
};
myListener.OnGame_BFMatchingProcess_BFList = function(BFData)
{
    clearBFList();
    var _loc6_ = lib.util.ExtString.split(BFData,"\n");
    var _loc7_ = _loc6_.length;
    if(BFData == "" || BFData == undefined)
    {
        return undefined;
    }
    listTotal = _loc7_;
    var _loc1_ = 0;
    while(_loc1_ < _loc7_)
    {
        var _loc3_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
        var _loc4_ = _loc3_[0];
        var _loc5_ = _loc3_[1];
        var _loc2_ = container_mc.listMc.attachMovie("lineMc","lineMc" + _loc1_,_loc1_);
        _loc2_._y = _loc2_._height * _loc1_;
        _loc2_.txt.setText(_loc5_);
        _loc2_.levelMc.txt.text = _loc4_;
        _loc1_ = _loc1_ + 1;
    }
    container_mc.scrollbar.pageSize = container_mc.listMc._height;
};
myListener.OnGame_BFMatchingProcess_PartyMember = function(members)
{
    if(members == "" || members == undefined)
    {
        container_mc.partyContainerMc._visible = false;
        resizeList(true);
    }
    else
    {
        container_mc.partyContainerMc._visible = true;
        var _loc2_ = lib.util.ExtString.split(members,"\t");
        var _loc1_ = _loc2_.join(", ");
        container_mc.partyContainerMc.txt.setText(_loc1_);
    }
    resizeList();
    var delaynum = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delaynum++;
        if(delaynum > 0)
        {
            UI.onEnterFrame = null;
            delaynum = 0;
            resizeList();
        }
    };
};
var prevHeight_0 = false;
var prevHeight_1 = false;
var prevHeight_2 = false;
myListener.OnGame_BFMatchingProcess_SetProcessTime = function(remaintime, progresstime)
{
    container_mc.timeContainerMc._visible = !(remaintime == undefined && remaintime == undefined);
    container_mc.timeContainerMc.waitingTimeFd.htmlText = remaintime != undefined?remaintime:"";
    container_mc.timeContainerMc.processTimeFd.htmlText = progresstime != undefined?progresstime:"";
    if(container_mc.partyContainerMc._visible == prevHeight_0 && container_mc.partyMasterMc._visible == prevHeight_1 && container_mc.timeContainerMc._visible == prevHeight_2)
    {
        return undefined;
    }
    prevHeight_0 = container_mc.partyContainerMc._visible;
    prevHeight_1 = container_mc.partyMasterMc._visible;
    prevHeight_2 = container_mc.timeContainerMc._visible;
    resizeList();
};
myListener.OnGame_BFMatchingProcess_PartyMasterAgree = function(_data)
{
    if(_data == "" || _data == undefined)
    {
        container_mc.partyMasterMc._visible = false;
    }
    else
    {
        container_mc.partyMasterMc._visible = true;
        container_mc.partyMasterMc.txt.htmlText = _data;
    }
    resizeList();
};
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
var btn0 = new lib.util.TxtBtn(container_mc.btn_mc0,container_mc.btn_txt0);
var btn1 = new lib.util.TxtBtn(container_mc.btn_mc1,container_mc.btn_txt1);
defaultBtnMc0X = btn0.btn._x;
defaultBtnTxt0X = btn0.txt._x;
btn0.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn1.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
x_btn.setRelease(ToGame_BFMatchingProcess_Close);
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.rowHeight = 300;
container_mc.listMc.onScroll = function()
{
    this._y = listContainerY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.listMc);
container_mc.scrollbar.addListener(container_mc.listMc);
resizeList(true);
ToGame_BFMatchingProcess_Init();
