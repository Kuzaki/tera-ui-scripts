function ToGame_BFScoreBoard_CloseUI()
{
    fscommand("ToGame_BFScoreBoard_CloseUI");
}
function ToGame_BFInfoBoard_RequestReward()
{
    fscommand("ToGame_BFInfoBoard_RequestReward");
}
function ToGame_BFInfoBoard_RequestGiveUp()
{
    fscommand("ToGame_BFInfoBoard_RequestGiveUp");
}
function createTeamData(teamList)
{
    teamList = lib.util.ExtString.split(teamList,"\n");
    var _loc7_ = teamList.length;
    if(lineMax < _loc7_)
    {
        lineMax = _loc7_;
    }
    var _loc6_ = [];
    var _loc2_ = 0;
    while(_loc2_ < _loc7_)
    {
        _loc6_[_loc2_] = [];
        var _loc4_ = lib.util.ExtString.split(teamList[_loc2_],"\t");
        var _loc5_ = _loc4_.length;
        var _loc1_ = 0;
        while(_loc1_ < _loc5_)
        {
            var _loc3_ = _loc4_[_loc1_];
            _loc6_[_loc2_].push(_loc3_);
            _loc1_ = _loc1_ + 1;
        }
        _loc2_ = _loc2_ + 1;
    }
    return _loc6_;
}
function buildList(teamIndex, sortIndex)
{
    listReset(teamIndex);
    var _loc12_ = undefined;
    var _loc20_ = undefined;
    var _loc10_ = undefined;
    var _loc11_ = undefined;
    var _loc18_ = undefined;
    var _loc15_ = false;
    if(teamIndex == 0)
    {
        _loc12_ = myTeamListData;
        _loc10_ = container_mc.listMc0;
        _loc11_ = myColumsEdit;
        _loc15_ = sortIndex == mySortFieldIndex;
        _loc18_ = sortIndex;
        mySortFieldIndex = sortIndex;
    }
    else
    {
        _loc12_ = otherTeamListData;
        _loc10_ = container_mc.listMc1;
        _loc11_ = otherColumsEdit;
        _loc15_ = sortIndex == otherSortFieldIndex;
        _loc18_ = sortIndex;
        otherSortFieldIndex = sortIndex;
    }
    var _loc13_ = _loc12_.length;
    var _loc4_ = 0;
    while(_loc4_ < _loc13_)
    {
        var _loc3_ = _loc12_[_loc4_];
        var _loc9_ = _loc3_.length - 2;
        var _loc6_ = 0;
        var _loc8_ = _loc10_.attachMovie("line","line_" + _loc4_,_loc10_.getNextHighestDepth());
        _loc8_._y = lineH * _loc4_;
        var _loc1_ = 0;
        while(_loc1_ < _loc9_)
        {
            var _loc7_ = _loc3_[_loc1_ + 2];
            var _loc2_ = _loc11_[_loc1_];
            var _loc5_ = createText(_loc8_,"Txt_" + _loc1_,_loc7_,_loc6_,0,_loc2_,30);
            _loc5_.textColor = TEXT_COLOR[_loc3_[0]];
            _loc6_ = _loc6_ + _loc2_;
            _loc1_ = _loc1_ + 1;
        }
        _loc4_ = _loc4_ + 1;
    }
    container_mc.listBgMc._height = lineMax * 30 + 33;
    container_mc.blueTotal.txt_0.text = myTeamScoreData[0];
    container_mc.blueTotal.txt_1.text = myTeamScoreData[1];
    var _loc17_ = BFTYPE != 4?myTeamScoreData[2]:"-";
    container_mc.blueTotal.txt_2.text = _loc17_;
    container_mc.redTotal.txt_0.text = otherTeamScoreData[0];
    container_mc.redTotal.txt_1.text = otherTeamScoreData[1];
    var _loc16_ = BFTYPE != 4?otherTeamScoreData[2]:"-";
    container_mc.redTotal.txt_2.text = _loc16_;
}
function listReset(teamIndex)
{
    var _loc1_ = undefined;
    if(teamIndex == 0)
    {
        _loc1_ = container_mc.listMc0;
    }
    else
    {
        _loc1_ = container_mc.listMc1;
    }
    for(var _loc2_ in _loc1_)
    {
        if(typeof _loc1_[_loc2_] == "movieclip")
        {
            _loc1_[_loc2_].removeMovieClip();
        }
    }
}
function setEndTimeText(endTime)
{
    var _loc3_ = Number(endTime);
    if(_loc3_ == -1)
    {
        return undefined;
    }
    var _loc2_ = int(_loc3_ / 60);
    var _loc1_ = _loc3_ % 60;
    if(_loc2_ < 10)
    {
        _loc2_ = "0" + _loc2_;
    }
    if(_loc1_ < 10)
    {
        _loc1_ = "0" + _loc1_;
    }
    if(ENDTIMEALERT_TIME > _loc3_)
    {
        curRewardMc.exitTimeFd.textColor = ENDTIMEALERT_COLOR;
    }
    else
    {
        curRewardMc.exitTimeFd.textColor = DEFAULT_COLOR;
    }
    curRewardMc.exitTimeFd.text = _loc2_ + ":" + _loc1_;
}
function changeState(flag)
{
    delete container_mc.listBgMc.onEnterFrame;
    if(flag == "listopen")
    {
        if(!listOpend)
        {
            container_mc.listBgMc._alpha = 0;
            container_mc.listBgMc._y = 0;
            container_mc.listBgMc._y = openStartY;
            container_mc.listBgMc.onEnterFrame = function()
            {
                this._y = this._y + 0.5 * (openTargetY - this._y);
                this._alpha = this._alpha + 0.5 * (100 - this._alpha);
                if(Math.abs(this._y - openTargetY) < 0.5)
                {
                    delete this.onEnterFrame;
                    onEndedAni("listopen");
                }
            };
        }
        else
        {
            onEndedAni("listopen");
        }
        container_mc._visible = true;
        hit._visible = true;
        listOpend = true;
    }
    else if(flag == "listclose")
    {
        listOpend = false;
        container_mc._visible = false;
        hit._visible = false;
        onEndedAni();
    }
}
function onEndedAni(flag)
{
    container_mc.listBgMc._alpha = 100;
    container_mc.listBgMc._y = openTargetY;
    container_mc.bosangMc._y = container_mc.listBgMc._y + container_mc.listBgMc._height;
    container_mc.sortBtn0._visible = flag == "listopen";
    container_mc.sortBtn1._visible = flag == "listopen";
    container_mc.listMc0._visible = flag == "listopen";
    container_mc.listMc1._visible = flag == "listopen";
    if(Number(battleEnded) > 0 && flag == "listopen")
    {
        container_mc.resultMc._visible = true;
        container_mc.resultMc.gotoAndStop(Number(myBattleResult) + 1);
        container_mc.resultMc._y = container_mc.listBgMc._height / 2 + openTargetY - 135;
        if(!container_mc.bosangMc._visible)
        {
            container_mc.bosangMc._visible = true;
            curRewardMc.gotoAndPlay(2);
        }
    }
    else
    {
        container_mc.resultMc._visible = false;
        container_mc.bosangMc._visible = false;
        curRewardMc.gotoAndStop(1);
    }
}
function createText(_targetMc, _targetName, _txt, _posX, _posY, _w, _h)
{
    var _loc1_ = (TextField)_targetMc[_targetName];
    if(!_loc1_)
    {
        _loc1_ = _targetMc.createTextField(_targetName,_targetMc.getNextHighestDepth(),_posX,_posY,_w,_h);
    }
    if(_txt == undefined)
    {
        _txt = "";
    }
    _loc1_.wordWrap = false;
    _loc1_.multiline = false;
    _loc1_.selectable = false;
    _loc1_.html = true;
    _loc1_.verticalAlign = "center";
    _loc1_.setNewTextFormat(textFormat);
    _loc1_.textAutoSize = "shrink";
    _loc1_.htmlText = _txt;
    return _loc1_;
}
function setLineType(_myLNum, _myCNum, _otherLNum, _otherCNum)
{
    container_mc.sortBtn0.clear();
    container_mc.sortBtn1.clear();
    myColumsEdit = [];
    otherColumsEdit = [];
    if(_myCNum != undefined && _myCNum != "")
    {
        myColumsEdit = _myCNum;
        container_mc.sortBtn0.colums = _myCNum;
        if(_otherCNum != undefined && _otherCNum != "")
        {
            otherColumsEdit = _otherCNum;
            container_mc.sortBtn1.colums = _otherCNum;
        }
        else
        {
            otherColumsEdit = myColumsEdit;
            container_mc.sortBtn1.colums = otherColumsEdit;
        }
    }
    else
    {
        myColumsEdit = otherColumsEdit = COLUMS_DEFAULT[BFTYPE];
        container_mc.sortBtn0.colums = myColumsEdit;
        container_mc.sortBtn1.colums = otherColumsEdit;
    }
    if(_myLNum != undefined && _myLNum != "")
    {
        container_mc.sortBtn0.labels = _myLNum;
        if(_otherLNum != undefined && _otherLNum != "")
        {
            container_mc.sortBtn1.labels = _otherLNum;
        }
        else
        {
            container_mc.sortBtn1.labels = _myLNum;
        }
    }
    else
    {
        container_mc.sortBtn0.labels = LABELS_DEFAULT[BFTYPE];
        container_mc.sortBtn1.labels = LABELS_DEFAULT[BFTYPE];
    }
}
var UI = this;
var UIname = "BFScoreInfo";
container_mc.UIDrager.setData(UIName);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var battleEnded = false;
var listOpend = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
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
var SEC = 1000;
var DEFAULT_COLOR = 16777215;
var ENDTIMEALERT_COLOR = lib.info.TextColor.GENERAL_CRITICAL;
var ENDTIMEALERT_TIME = 30;
var BFTYPE = 0;
var openStartY = container_mc.listBgMc._y;
var openTargetY = openStartY + 10;
var myBattleResult;
var TOTALLISTLINES = 20;
var MINUTE_STR = lib.util.UIString.getUIString("$101067");
var SEC_STR = lib.util.UIString.getUIString("$101068");
var ENDTIMEALERT_TIME = 30;
var ENDTIMEALERT_COLOR = lib.info.TextColor.GENERAL_CRITICAL;
var SEC = 1000;
var selectedTeamLine;
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var myTeamListData = [];
var otherTeamListData = [];
var teamStrScoreData = [];
var mySortFieldIndex = 0;
var otherSortFieldIndex = 0;
var lineMax = 5;
var LABELS_DEFAULT = [];
LABELS_DEFAULT[0] = ["$271004","$271005","$271006","$271014","$271015","$271026"];
LABELS_DEFAULT[1] = ["$271005","$271019","$271020","$271006","$271021","$271017"];
LABELS_DEFAULT[2] = ["$271004","$271005","$271006","$271014","$271025","$271026"];
LABELS_DEFAULT[3] = ["$271005","$271019","$271020","$271006","$271027"];
LABELS_DEFAULT[4] = ["$271004","$271005","$271006","$271021","$271026"];
var COLUMS_DEFAULT = [];
COLUMS_DEFAULT[0] = [38,142,79,137,79,100];
COLUMS_DEFAULT[1] = [136,75,119,79,89,86];
COLUMS_DEFAULT[2] = [38,142,79,137,79,100];
COLUMS_DEFAULT[3] = [147,103,142,84,100];
COLUMS_DEFAULT[4] = [46,153,142,120,115];
var bLabel = true;
var myColumsEdit = [];
var otherColumsEdit = [];
var TEXT_COLOR = ["0xFFFFFF","0xC00005","0x707070"];
var PrevFocus = -1;
var PrevFocus0 = -1;
var PrevFocus1 = -1;
var myTeamScoreData = [0,0,0];
var otherTeamScoreData = [0,0,0];
container_mc.bosangMc.rewardMc.textMc.rewardIcon._visible = false;
myListener.OnGame_BFInfoBoard_SetData = function(bfMode, myTeamList, otherTeamList, battleTime, teamStrScore, outRemainTime, battleResult)
{
    BFTYPE = Number(bfMode);
    lineMax = 5;
    if(BFTYPE == 3)
    {
        container_mc.blueTotal._visible = false;
        container_mc.redTotal._visible = false;
    }
    else
    {
        container_mc.blueTotal._visible = true;
        container_mc.redTotal._visible = true;
    }
    if(bLabel)
    {
        setLineType();
    }
    if(battleResult > 0)
    {
        battleEnded = true;
    }
    else
    {
        battleEnded = false;
    }
    myBattleResult = battleResult;
    changeState("listopen");
    myTeamListData = [];
    otherTeamListData = [];
    mySortFieldIndex = -1;
    otherSortFieldIndex = -1;
    myTeamListData = createTeamData(myTeamList);
    otherTeamListData = createTeamData(otherTeamList);
    teamStrScoreData = lib.util.ExtString.split(teamStrScore,"\n");
    myTeamScoreData = lib.util.ExtString.split(teamStrScoreData[0],"\t");
    otherTeamScoreData = lib.util.ExtString.split(teamStrScoreData[1],"\t");
    buildList(0,0);
    buildList(1,0);
    var _loc1_ = "";
    var _loc2_ = int(Number(battleTime) / 60);
    var _loc3_ = Number(battleTime) % 60;
    if(_loc2_ > 0)
    {
        _loc1_ = _loc1_ + (_loc2_ + MINUTE_STR);
    }
    if(_loc3_ > 0)
    {
        _loc1_ = _loc1_ + (" " + _loc3_ + SEC_STR);
    }
    curRewardMc.battleTimeFd.text = _loc1_;
    setEndTimeText(outRemainTime);
};
myListener.OnGame_BFInfoBoard_SetEndTimer = function(outRemainTime)
{
    setEndTimeText(outRemainTime);
};
myListener.OnGame_BFScoreBoard_SetBattleState = function(_state)
{
    _state = Number(_state);
    if(_state > 0)
    {
        battleEnded = true;
    }
    else
    {
        battleEnded = false;
    }
    myBattleResult = _state;
};
myListener.OnGame_BFInfoBoard_Close = function()
{
    changeState("listclose");
};
var CpPoint = -1;
myListener.OnGame_BFReward_SetData = function(winRew, contributionRew, guildRew, winRew2, contributionRew2, guildRew2)
{
    var _loc2_ = "";
    _loc2_ = _loc2_ + (lib.util.UIString.getUIString("$272008") + ": " + winRew + "\n");
    _loc2_ = _loc2_ + (lib.util.UIString.getUIString("$272009") + ": " + contributionRew + "\n");
    _loc2_ = _loc2_ + (lib.util.UIString.getUIString("$272010") + ": " + guildRew);
    lib.manager.ToolTip.add(container_mc.bosangMc.rewardMc.textMc.hit,_loc2_,1);
    if(!winRew2)
    {
        return undefined;
    }
    var _loc1_ = "";
    _loc1_ = _loc1_ + (lib.util.UIString.getUIString("$272008") + ": " + winRew2 + "\n");
    _loc1_ = _loc1_ + (lib.util.UIString.getUIString("$272009") + ": " + contributionRew2 + "\n");
    _loc1_ = _loc1_ + (lib.util.UIString.getUIString("$272010") + ": " + guildRew2);
    lib.manager.ToolTip.add(container_mc.bosangMc.rewardMc.textMc.hit1,_loc1_,1);
};
var bfTypeN3_text = lib.util.UIString.getUIString("$271017");
var bfType3_text = lib.util.UIString.getUIString("$271028");
myListener.OnGame_BFReputReward_SetData = function(iReputRew, cReputRew, gradeRew, bfType)
{
    if(bfType != "" && bfType != undefined && bfType != "undefined" && bfType != null)
    {
        BFTYPE = Number(bfType);
    }
    if(BFTYPE != 3)
    {
        container_mc.bosangMc.rewardMc.textMc.rewardIcon._visible = false;
        container_mc.bosangMc.rewardMc.textMc.txt3.text = bfTypeN3_text;
        container_mc.bosangMc.rewardMc.textMc.txt2._width = 127;
    }
    else
    {
        container_mc.bosangMc.rewardMc.textMc.rewardIcon._visible = true;
        container_mc.bosangMc.rewardMc.textMc.txt3.text = bfType3_text;
        container_mc.bosangMc.rewardMc.textMc.txt2._width = 106;
    }
    container_mc.bosangMc.rewardMc.textMc.txt0.text = iReputRew;
    container_mc.bosangMc.rewardMc.textMc.txt1.text = cReputRew;
    container_mc.bosangMc.rewardMc.textMc.txt2.text = gradeRew;
};
var curRewardMc = container_mc.bosangMc.rewardMc;
myListener.OnGame_BFReward_SetRewardVisible = function(bFlag)
{
    bReward = Number(bFlag);
    var _loc1_ = !bReward?container_mc.bosangMc.noRewardMc:container_mc.bosangMc.rewardMc;
    if(_loc1_ != curRewardMc)
    {
        curRewardMc._visible = false;
        curRewardMc = _loc1_;
        _loc1_._visible = true;
    }
};
myListener.OnGame_BFInfoBoard_SetSortChange = function(_myData, _otherData)
{
    bLabel = false;
    var _loc8_ = lib.util.ExtString.split(_myData,"\n");
    var _loc10_ = _loc8_.length;
    var _loc7_ = [];
    var _loc6_ = [];
    var _loc4_ = undefined;
    var _loc5_ = undefined;
    var _loc3_ = 0;
    while(_loc3_ < _loc10_)
    {
        var _loc2_ = lib.util.ExtString.split(_loc8_[_loc3_],"\t");
        _loc7_.push(_loc2_[0]);
        _loc2_[1] = Number(_loc2_[1]);
        if(_loc2_[1] > 0)
        {
            _loc6_.push(_loc2_[1]);
        }
        _loc3_ = _loc3_ + 1;
    }
    if(_otherData != undefined && _otherData != "" && _otherData != "undefined")
    {
        var _loc9_ = lib.util.ExtString.split(_otherData,"\n");
        var _loc11_ = _loc9_.length;
        _loc4_ = [];
        _loc5_ = [];
        _loc3_ = 0;
        while(_loc3_ < _loc11_)
        {
            var _loc1_ = lib.util.ExtString.split(_loc9_[_loc3_],"\t");
            _loc4_.push(_loc1_[0]);
            _loc1_[1] = Number(_loc1_[1]);
            if(_loc1_[1] > 0)
            {
                _loc5_.push(_loc1_[1]);
            }
            _loc3_ = _loc3_ + 1;
        }
    }
    setLineType(_loc7_,_loc6_,_loc4_,_loc5_);
};
myListener.OnGame_BFInfoBoard_SetUser = function(_num)
{
    var _loc1_ = container_mc.listMc0["line_" + _num];
    var _loc2_ = container_mc.teamListMc["line_" + PrevFocus];
    _loc1_.gotoAndStop(2);
    lib.Debuger.trace("_Mc : " + _loc1_);
    if(_loc2_ && PrevFocus != _num)
    {
        _loc2_.gotoAndStop(1);
    }
    PrevFocus = _num;
};
myListener.OnGame_BFInfoBoard_SetResultTip = function(tip)
{
    container_mc.bosangMc.rewardMc.resultTip.htmlText = tip;
};
var textFormat = new TextFormat("$NormalFont",16,16777215,false,false,false,null,null,"center",5,5,0,0);
var close_btn_0 = container_mc.bosangMc.rewardMc.btn.txtBtn;
close_btn_0.setRelease(ToGame_BFScoreBoard_CloseUI);
var close_btn_1 = container_mc.bosangMc.noRewardMc.btn.txtBtn;
close_btn_1.setRelease(ToGame_BFScoreBoard_CloseUI);
container_mc.sortBtn0.onSelected = function(index)
{
    buildList(0,index);
};
container_mc.sortBtn1.onSelected = function(index)
{
    buildList(1,index);
};
container_mc.bosangMc._visible = false;
container_mc.resultMc._visible = false;
container_mc._visible = false;
hit._visible = false;
onEndedAni();
