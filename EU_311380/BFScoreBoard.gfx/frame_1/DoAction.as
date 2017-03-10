function pointListReset()
{
    var _loc1_ = container_mc.imgContainer;
    for(var _loc2_ in _loc1_)
    {
        if(typeof _loc1_[_loc2_] == "movieclip")
        {
            _loc1_[_loc2_].removeMovieClip();
        }
    }
}
function addBuff(_teamType, _id, _type, _img, _stackCount, _remain, _total)
{
    var _loc2_ = container_mc.buffContainer["slot" + _teamType + _id + _type];
    var _loc9_ = _teamType != 0?otherBuffData:myBuffData;
    var _loc8_ = _loc2_.arrayIndex;
    if(_loc2_ != undefined && _loc8_ != undefined)
    {
        var _loc1_ = _loc9_[_loc8_];
        if(_stackCount != _loc1_.stackCount)
        {
            updateStackCount(_teamType,_id,_type,_stackCount);
        }
        if(_remain != _loc1_.remain || _total != _loc1_.total)
        {
            updateCoolTime(_teamType,_id,_type,_remain,_total);
        }
        _loc1_.stackCount = _stackCount;
        _loc1_.remain = _remain;
        _loc1_.total = _total;
        return undefined;
    }
    if(_loc2_ == undefined)
    {
        _loc2_ = createSlot(_teamType,_id,_type);
    }
    var _loc16_ = flash.display.BitmapData.loadBitmap(img);
    var _loc11_ = {teamType:_teamType,id:_id,type:_type,img:_img,imgBm:_loc16_,stackCount:_stackCount,remain:_remain,total:_total};
    var _loc12_ = _loc9_.push(_loc11_) - 1;
    _loc2_.arrayIndex = _loc12_;
    drawSlot();
}
function createSlot(_teamType, _id, _type)
{
    var _loc2_ = container_mc.buffContainer.attachMovie("buffSlot","slot" + _teamType + _id + _type,container_mc.buffContainer.getNextHighestDepth());
    _loc2_._alpha = 0;
    var _loc1_ = container_mc.buffContainer.createTextField("textFd" + _teamType + _id + _type,container_mc.buffContainer.getNextHighestDepth(),0,0,40,23);
    _loc1_.hitTestDisable = true;
    _loc1_.border = false;
    _loc1_.background = false;
    _loc1_.selectable = false;
    _loc1_.wordWrap = false;
    _loc1_.type = "dynamic";
    _loc1_.multiline = false;
    _loc1_.html = true;
    _loc1_.antiAliasType = "normal";
    _loc1_.setNewTextFormat(amountTextFormat);
    _loc1_.shadowColor = 0;
    _loc1_.shadowBlurX = 1.7;
    _loc1_.shadowBlurY = 1.7;
    _loc1_.shadowStrength = 5;
    _loc1_.shadowDistance = 0;
    _loc1_.shadowAngle = 90;
    return _loc2_;
}
function updateStackCount(_teamType, _id, _type, _stackCount)
{
    var _loc1_ = container_mc.buffContainer["textFd" + _teamType + _id + _type];
    _loc1_.text = _stackCount;
}
function updateCoolTime(_teamType, _id, _type, _remain, _total)
{
    var _loc2_ = container_mc.buffContainer["coolMc" + _teamType + _id + _type];
    if(_loc2_ == undefined)
    {
        _loc2_ = container_mc.buffContainer.attachMovie("coolTime_ani","coolMc" + _teamType + _id + _type,container_mc.buffContainer.getNextHighestDepth());
        coolAniMc = container_mc.attachMovie("coolTime_ani","coolTime_ani" + type + "_" + id,container_mc.getNextHighestDepth());
        _loc2_.id = _id;
        _loc2_.type = _type;
        _loc2_.hitTestDisable = true;
        _loc2_.CoolTimeTxt.textAutoSize = "fit";
        _loc2_.onTick = function()
        {
            if(this.coolTime < 5)
            {
                var _loc2_ = this.attachMovie("coolTimeWarning","coolTimeWarning",1);
                _loc2_.hitTestDisable = true;
            }
        };
    }
    var _loc5_ = container_mc.buffContainer["slot" + _teamType + _id + _type];
    _loc2_._x = _loc5_._x + 2;
    _loc2_._y = _loc5_._y + 2;
    _loc2_.coolTimeWarning.removeMovieClip();
    _loc2_.setCoolTime(_remain,_total);
    coolTimeManager.addCoolTimeInstance(_loc2_);
}
function drawSlot()
{
    container_mc.buffContainer.clear();
    var _loc16_ = myBuffData.length;
    var _loc7_ = [];
    var _loc10_ = [];
    var _loc2_ = 43;
    var _loc1_ = 0;
    while(_loc1_ < _loc16_)
    {
        var _loc3_ = myBuffData[_loc1_];
        var _loc5_ = _loc3_.type;
        if(_loc5_ < 2)
        {
            _loc7_.push(_loc3_);
        }
        else
        {
            _loc10_.push(_loc3_);
        }
        _loc1_ = _loc1_ + 1;
    }
    var _loc13_ = _loc7_.length;
    var _loc12_ = _loc10_.length;
    var _loc18_ = _loc13_ - MAX_SLOT;
    _loc18_ = Math.max(_loc18_,_loc12_ - MAX_SLOT);
    lib.Debuger.trace("myGap : " + _loc18_);
    var _loc8_ = _loc18_ <= 0?0:-1 * _loc2_ * _loc18_;
    lib.Debuger.trace("myStartX : " + _loc8_);
    _loc1_ = 0;
    while(_loc1_ < _loc13_)
    {
        _loc3_ = _loc7_[_loc1_];
        var _loc4_ = _loc8_ + _loc1_ * _loc2_;
        drawBuff(_loc3_,_loc4_,0);
        _loc1_ = _loc1_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < _loc12_)
    {
        _loc3_ = _loc10_[_loc1_];
        _loc4_ = _loc8_ + _loc1_ * _loc2_;
        drawBuff(_loc3_,_loc4_,56);
        _loc1_ = _loc1_ + 1;
    }
    var _loc17_ = otherBuffData.length;
    var _loc9_ = [];
    var _loc11_ = [];
    _loc1_ = 0;
    while(_loc1_ < _loc17_)
    {
        _loc3_ = otherBuffData[_loc1_];
        _loc5_ = _loc3_.type;
        if(_loc5_ < 2)
        {
            _loc9_.push(_loc3_);
        }
        else
        {
            _loc11_.push(_loc3_);
        }
        _loc1_ = _loc1_ + 1;
    }
    var _loc14_ = _loc9_.length;
    var _loc15_ = _loc11_.length;
    var _loc19_ = _loc14_ - MAX_SLOT;
    _loc19_ = Math.max(_loc19_,_loc15_ - MAX_SLOT);
    var _loc6_ = _loc19_ <= 0?840:840 + _loc2_ * _loc19_;
    lib.Debuger.trace("otherStartX : " + _loc6_);
    _loc1_ = 0;
    while(_loc1_ < _loc14_)
    {
        _loc3_ = _loc9_[_loc1_];
        _loc4_ = _loc6_ + _loc1_ * _loc2_ * -1;
        drawBuff(_loc3_,_loc4_,0);
        _loc1_ = _loc1_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < _loc15_)
    {
        _loc3_ = _loc11_[_loc1_];
        _loc4_ = _loc6_ + _loc1_ * _loc2_ * -1;
        drawBuff(_loc3_,_loc4_,56);
        _loc1_ = _loc1_ + 1;
    }
}
function drawBuff(buffData, pX, pY)
{
    var _loc4_ = buffData.teamType;
    var _loc2_ = buffData.id;
    var _loc1_ = buffData.type;
    var _loc12_ = buffData.img;
    var _loc14_ = buffData.imgBm;
    var _loc11_ = buffData.stackCount;
    var _loc13_ = buffData.remain;
    var _loc10_ = buffData.total;
    var _loc5_ = container_mc.buffContainer["slot" + _loc4_ + _loc2_ + _loc1_];
    _loc5_._visible = true;
    lib.manager.ToolTip.remove(_loc5_);
    _loc5_._x = pX;
    _loc5_._y = pY;
    lib.manager.ToolTip.add(_loc5_,_loc2_ + "\t" + _loc1_,6);
    var _loc6_ = container_mc.buffContainer["textFd" + _loc4_ + _loc2_ + _loc1_];
    _loc6_._visible = true;
    _loc6_._x = pX - 2;
    _loc6_._y = pY + 22;
    lib.display.DrawBitmapData.draw(container_mc.buffContainer,UI["iconFrameBm" + _loc1_],pX,pY,0,0,42,42,1);
    lib.display.DrawBitmapData.draw(container_mc.buffContainer,_loc12_,pX + 2,pY + 2,0,0,38,38,0.6);
    updateStackCount(_loc4_,_loc2_,_loc1_,_loc11_);
    var _loc9_ = container_mc.buffContainer["coolMc" + _loc4_ + _loc2_ + _loc1_];
    if(_loc9_ == undefined && _loc10_ != -1)
    {
        updateCoolTime(_loc4_,_loc2_,_loc1_,_loc13_,_loc10_);
    }
    _loc9_._x = pX + 2;
    _loc9_._y = pY + 2;
}
function removeBuff(_teamType, _id, _type, _bFlag)
{
    var _loc1_ = container_mc.buffContainer["slot" + _teamType + _id + _type];
    var _loc8_ = _loc1_.arrayIndex;
    var _loc6_ = container_mc.buffContainer["textFd" + _teamType + _id + _type];
    var _loc4_ = container_mc.buffContainer["coolMc" + _teamType + _id + _type];
    coolTimeManager.removeCoolTimeInstance(_loc4_);
    _loc4_.removeMovieClip();
    if(_bFlag)
    {
        var _loc3_ = _teamType != 0?otherBuffData:myBuffData;
        _loc3_.splice(_loc8_,1);
    }
    _loc1_._visible = false;
    delete register1.arrayIndex;
    lib.manager.ToolTip.remove(_loc1_);
    _loc6_._visible = false;
    if(_bFlag)
    {
        resetArrayIndex(_loc3_);
    }
}
function removeBuffByArrayIndex(targetArray, arrayIndex)
{
    var _loc1_ = targetArray[arrayIndex];
    var _loc3_ = _loc1_.teamType;
    var _loc2_ = _loc1_.id;
    var _loc4_ = _loc1_.type;
    lib.Debuger.trace("teamType : " + _loc3_ + ", id : " + _loc2_ + ", type : " + _loc4_);
    removeBuff(_loc3_,_loc2_,_loc4_,false);
}
function resetArrayIndex(targetArray)
{
    var _loc7_ = targetArray.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc7_)
    {
        var _loc2_ = targetArray[_loc1_];
        var _loc4_ = _loc2_.teamType;
        var _loc3_ = _loc2_.id;
        var _loc6_ = _loc2_.type;
        var _loc5_ = container_mc.buffContainer["slot" + _loc4_ + _loc3_ + _loc6_];
        _loc5_.arrayIndex = _loc1_;
        _loc1_ = _loc1_ + 1;
    }
}
function ToGame_BFScoreBoard_Init()
{
    fscommand("ToGame_BFScoreBoard_Init");
}
function ToGame_BFScoreBoard_RequestBFInfo()
{
    fscommand("ToGame_BFScoreBoard_RequestBFInfo");
}
function ToGame_BFScoreBoard_RequestBFTeam()
{
    fscommand("ToGame_BFScoreBoard_RequestBFTeam");
}
function ToGame_BFScoreBoard_RequestBFSkill()
{
    fscommand("ToGame_BFScoreBoard_RequestBFSkill");
}
function ToGame_BFScoreBoard_RequestBFGuide()
{
    fscommand("ToGame_BFScoreBoard_RequestBFGuide");
}
function ToGame_BFScoreBoard_CloseUI()
{
    fscommand("ToGame_BFScoreBoard_CloseUI");
}
function BoardReset()
{
    var _loc2_ = true;
    var _loc4_ = 56;
    var _loc5_ = 1024;
    if(BOARD_TYPE == 2 || BOARD_TYPE == 6)
    {
        _loc2_ = false;
        _loc4_ = 16;
        _loc5_ = 774;
    }
    container_mc.timeMc._y = container_mc.stateFd._y = _loc4_;
    container_mc.btnBg._width = _loc5_;
    container_mc.teamName0._visible = _loc2_;
    container_mc.teamName1._visible = _loc2_;
    container_mc.barBgMc._visible = _loc2_;
    var _loc1_ = container_mc.boardType;
    for(var _loc3_ in _loc1_)
    {
        if(typeof _loc1_[_loc3_] == "movieclip")
        {
            _loc1_[_loc3_].removeMovieClip();
        }
    }
    pointListReset();
    container_mc.imgContainer._visible = false;
}
function ballListReset()
{
    var _loc1_ = m_boardType.ballListMc;
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
    if(Number(endTime) == -1)
    {
        endTimeIs = undefined;
        return undefined;
    }
    endTimeIs = Number(endTime);
    var _loc2_ = int(Number(endTime) / 60);
    var _loc1_ = Number(endTime) % 60;
    if(_loc2_ < 10)
    {
        _loc2_ = "0" + _loc2_;
    }
    if(_loc1_ < 10)
    {
        _loc1_ = "0" + _loc1_;
    }
    if(myBattleResult > 0)
    {
        if(BOARD_TYPE != 0 && ENDTIMEALERT_TIME > Number(endTime))
        {
            container_mc.bosangMc.exitTimeFd.textColor = ENDTIMEALERT_COLOR;
        }
        else
        {
            container_mc.bosangMc.exitTimeFd.textColor = DEFAULT_COLOR;
        }
        container_mc.bosangMc.exitTimeFd.text = _loc2_ + ":" + _loc1_;
    }
    else
    {
        if(BOARD_TYPE != 0 && ENDTIMEALERT_TIME > Number(endTime))
        {
            container_mc.timeMc.txt0.textColor = ENDTIMEALERT_COLOR;
            container_mc.timeMc.txt1.textColor = ENDTIMEALERT_COLOR;
            container_mc.timeMc.timeMc.textColor = ENDTIMEALERT_COLOR;
        }
        else
        {
            container_mc.timeMc.txt0.textColor = DEFAULT_COLOR;
            container_mc.timeMc.txt1.textColor = DEFAULT_COLOR;
            container_mc.timeMc.timeMc.textColor = DEFAULT_COLOR;
        }
        container_mc.timeMc.txt0.text = _loc2_;
        container_mc.timeMc.txt1.text = _loc1_;
        container_mc.timeMc.timeSpFd.text = ":";
    }
}
function setRunTimeText(runTime)
{
    if(runTime == "" || runTime == undefined)
    {
        return undefined;
    }
    var _loc5_ = lib.util.ExtString.split(runTime,"\t");
    var _loc4_ = _loc5_[0];
    var _loc3_ = _loc5_[1];
    var _loc2_ = undefined;
    var _loc1_ = undefined;
    if(_loc4_ != -1)
    {
        _loc2_ = int(Number(_loc4_) / 60);
        _loc1_ = Number(_loc4_) % 60;
        if(_loc2_ < 10)
        {
            _loc2_ = "0" + _loc2_;
        }
        if(_loc1_ < 10)
        {
            _loc1_ = "0" + _loc1_;
        }
        m_boardType.timeTxt0.text = _loc2_ + ":" + _loc1_;
    }
    else
    {
        m_boardType.timeTxt0.text = "-";
    }
    if(_loc3_ != -1)
    {
        _loc2_ = int(Number(_loc3_) / 60);
        _loc1_ = Number(_loc3_) % 60;
        if(_loc2_ < 10)
        {
            _loc2_ = "0" + _loc2_;
        }
        if(_loc1_ < 10)
        {
            _loc1_ = "0" + _loc1_;
        }
        m_boardType.timeTxt1.text = _loc2_ + ":" + _loc1_;
    }
    else
    {
        m_boardType.timeTxt1.text = "-";
    }
}
function changeState(flag)
{
    container_mc._visible = true;
    if(flag == "start")
    {
        container_mc.gotoAndStop(1);
        container_mc.btnBg._visible = false;
    }
    else if(flag == "battlemode")
    {
        if(!listOpend)
        {
            container_mc.gotoAndStop(1);
            container_mc.btnBg._visible = false;
            onEndedAni();
        }
    }
    else if(flag == "uimode")
    {
        if(!listOpend)
        {
            container_mc.gotoAndPlay("uimode");
        }
        container_mc.btnBg._visible = true;
    }
    else if(flag == "listopen")
    {
        if(!listOpend)
        {
            container_mc.gotoAndPlay("uimode");
            container_mc.btnBg._visible = true;
        }
        else
        {
            onEndedAni("listopen");
        }
        listOpend = true;
    }
    else if(flag == "listclose")
    {
        onEndedAni();
        if(!_global.gbUIMode)
        {
            container_mc.gotoAndStop(1);
        }
        container_mc.btnBg._visible = false;
        listOpend = false;
    }
    if(LEFT_BTN_VISIBLE)
    {
        container_mc.btn0._visible = true;
    }
    if(MIDDLE_BTN_VISIBLE)
    {
        container_mc.btn1._visible = true;
    }
    if(RIGHT_BTN_VISIBLE)
    {
        container_mc.btn2._visible = true;
    }
    if(GUIDE_BTN_VISIBLE)
    {
        container_mc.btn3._visible = true;
    }
    container_mc.buffContainer._y = !(_global.gbUIMode || listOpend)?87:135;
}
function onEndedAni(flag)
{
    if(flag == "guardicon")
    {
        if(_global.gbUIMode)
        {
            changeState("uimode");
            return undefined;
        }
    }
}
function PlayTweenMotion(_alphaNum)
{
    gs.TweenLite.to(dangerEffMc,0.5,{_alpha:_alphaNum,onComplete:PlayComplete});
}
function PlayComplete()
{
    if(dangerMode)
    {
        if(dangerEffMc._alpha > 50)
        {
            PlayTweenMotion(0);
        }
        else
        {
            PlayTweenMotion(100);
        }
    }
}
function EffectGageReset()
{
    m_boardType.gage_eff0._alpha = 0;
    m_boardType.gage_eff1._alpha = 0;
    m_boardType.gage_eff0._visible = false;
    m_boardType.gage_eff1._visible = false;
}
var UI = this;
var UIname = "BFScoreBoard";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var battleEnded = false;
var listOpend = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
        _root.OnGameEvent("OnGameEventShowUI","BFScoreInfo",bShow);
        _root.OnGameEvent("OnGameEventShowUI","ScoreboardFFA",bShow);
        bWidgetOpen = bShow;
        var _loc2_ = new lib.controls.CustomScaleEvent();
        _loc2_.CustomScaleEventCheck(UI,UIname);
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
myListener.OnGameEventChangeUIMode = function()
{
    if(_global.gbUIMode)
    {
        changeState("uimode");
    }
    else
    {
        changeState("battlemode");
    }
};
var DEFAULT_COLOR = 16777215;
var ENDTIMEALERT_COLOR = lib.info.TextColor.GENERAL_CRITICAL;
var ENDTIMEALERT_TIME = 30;
var endTimeIs;
var interValId = [];
var hightLightRed = 0;
var hightLightBlue = 0;
var READY_STR = lib.util.UIString.getUIString("$274001");
var ENDING_STR = lib.util.UIString.getUIString("$274002");
var TEAMBTN_STR = lib.util.UIString.getUIString("$273001");
var INFOBTN_STR = lib.util.UIString.getUIString("$273013");
var WIN_STR = lib.util.UIString.getUIString("$278003");
var DRAW_STR = lib.util.UIString.getUIString("$278004");
var LOSE_STR = lib.util.UIString.getUIString("$278005");
var openStartY = container_mc.listBgMc._y;
var openTargetY = openStartY + 10;
var myBattleResult;
var MINUTE_STR = lib.util.UIString.getUIString("$101067");
var SEC_STR = lib.util.UIString.getUIString("$101068");
var DROPSHIP_STR = lib.util.UIString.getUIString("$278006");
var ENDTIMEALERT_COLOR = lib.info.TextColor.GENERAL_CRITICAL;
var SEC = 1000;
var endTimeIs;
var LEFT_BTN_VISIBLE = true;
var MIDDLE_BTN_VISIBLE = true;
var RIGHT_BTN_VISIBLE = false;
var GUIDE_BTN_VISIBLE = false;
container_mc.btn2._visible = false;
container_mc.btn3._visible = false;
var m_boardType;
var BOARD_TYPE = 0;
while(interValId.length > 0)
{
    clearInterval(interValId.pop());
}
var interValId = [];
container_mc.redNameFd.textColor = lib.info.TextColor.BLUE_TEAM;
container_mc.blueNameFd.textColor = lib.info.TextColor.RED_TEAM;
myListener.OnGame_BFScoreBoard_SetData = function(batteMode, myScore, myGoalScore, otherScore, otherGoalScore, myBlink, otherBlink, endTime, warningTime, myTeamName, otherTeamName, myImg, otherImg)
{
    BOARD_TYPE = Number(batteMode);
    hightLightMy = Number(myBlink);
    hightLightOther = Number(otherBlink);
    BoardReset();
    if(BOARD_TYPE != 3)
    {
        m_boardType = container_mc.boardType.attachMovie("boardType_" + BOARD_TYPE,"board" + BOARD_TYPE,BOARD_TYPE);
    }
    if(BOARD_TYPE == 0 || BOARD_TYPE == 4 || BOARD_TYPE == 5)
    {
        myListener.OnGame_BFScoreBoard_SetScore(myScore,myGoalScore,otherScore,otherGoalScore);
    }
    else if(BOARD_TYPE == 2 || BOARD_TYPE == 6)
    {
        EffectGageReset();
    }
    else if(BOARD_TYPE == 3)
    {
        myListener.OnGame_BFScoreBoard_SetScorePoint(myScore,otherScore,myImg,otherImg);
    }
    if(warningTime != "" || warningTime != undefined)
    {
        ENDTIMEALERT_TIME = warningTime;
    }
    if(myTeamName != "" && myTeamName != undefined && myTeamName != "undefined")
    {
        container_mc.teamName0.text = myTeamName;
    }
    if(otherTeamName != "" && otherTeamName != undefined && otherTeamName != "undefined")
    {
        container_mc.teamName1.text = otherTeamName;
    }
    myListener.OnGame_BFScoreBoard_SetTimer(endTime);
};
myListener.OnGame_BFScoreBoard_SetName = function(myTeamName, otherTeamName)
{
    if(BOARD_TYPE == 6)
    {
        m_boardType.teamName0.text = myTeamName;
        m_boardType.teamName1.text = otherTeamName;
    }
    else
    {
        container_mc.teamName0.text = myTeamName;
        container_mc.teamName1.text = otherTeamName;
    }
};
var myScoreEffect = false;
var prevScoreEffect = false;
myListener.OnGame_BFScoreBoard_SetScore = function(myScore, myGoalScore, otherScore, otherGoalScore)
{
    myGoalScore = Number(myGoalScore);
    otherGoalScore = Number(otherGoalScore);
    var _loc3_ = myScore + "/" + myGoalScore;
    var _loc2_ = otherScore + "/" + otherGoalScore;
    if(isNaN(myGoalScore) || myGoalScore == 0 || myGoalScore == -1)
    {
        _loc3_ = myScore;
        _loc2_ = otherScore;
    }
    if(m_boardType.score0.text == _loc3_ && m_boardType.score1.text == _loc2_)
    {
        return undefined;
    }
    m_boardType.score0.text = _loc3_;
    m_boardType.score1.text = _loc2_;
    if(BOARD_TYPE == 4)
    {
        return undefined;
    }
    if(Number(myScore) >= hightLightMy && myScoreEffect == false)
    {
        myScoreEffect = true;
        m_boardType.scoreBar0.gotoAndPlay(2);
    }
    if(Number(myScore) < hightLightMy)
    {
        myScoreEffect = false;
        m_boardType.scoreBar0.gotoAndStop(1);
    }
    if(Number(otherScore) >= hightLightOther && prevScoreEffect == false)
    {
        prevScoreEffect = true;
        m_boardType.scoreBar1.gotoAndPlay(2);
    }
    if(Number(otherScore) < hightLightOther)
    {
        prevScoreEffect = false;
        m_boardType.scoreBar1.gotoAndStop(1);
    }
    var _loc7_ = myScore / myGoalScore * 100;
    var _loc8_ = otherScore / otherGoalScore * 100;
    m_boardType.score0Mask._xscale = _loc7_;
    m_boardType.score1Mask._xscale = _loc8_;
};
myListener.OnGame_BFScoreBoard_SetRound = function(myRound, otherRound, totalRound)
{
    myRound = Number(myRound);
    otherRound = Number(otherRound);
    totalRound = Number(totalRound);
    var _loc10_ = 27;
    var _loc12_ = -27;
    var _loc1_ = 0;
    while(_loc1_ < totalRound)
    {
        var _loc4_ = "roundMiddleBlue";
        var _loc5_ = "roundMiddleRed";
        var _loc6_ = totalRound - _loc1_;
        var _loc8_ = _loc1_ + 1;
        if(_loc1_ == 0)
        {
            _loc4_ = "roundFirstBlue";
            _loc5_ = "roundLastRed";
        }
        else if(_loc1_ == totalRound - 1)
        {
            _loc4_ = "roundLastBlue";
            _loc5_ = "roundFirstRed";
        }
        var _loc2_ = m_boardType["blue_" + _loc1_];
        if(_loc2_ == undefined)
        {
            _loc2_ = m_boardType.attachMovie(_loc4_,"blue_" + _loc1_,m_boardType.getNextHighestDepth());
        }
        var _loc3_ = m_boardType["red_" + _loc1_];
        if(_loc3_ == undefined)
        {
            _loc3_ = m_boardType.attachMovie(_loc5_,"red_" + _loc1_,m_boardType.getNextHighestDepth());
        }
        _loc2_._y = _loc3_._y = -13;
        _loc2_._x = _loc10_ * _loc1_;
        if(_loc1_ >= 1)
        {
            _loc2_._x = _loc2_._x + 1;
        }
        _loc3_._x = _loc12_ * _loc1_ + 850;
        _loc2_.textFd.text = _loc2_.mc.textFd.text = Number(_loc1_ + 1);
        _loc3_.textFd.text = _loc3_.mc.textFd.text = _loc6_;
        if(_loc8_ > myRound)
        {
            _loc2_.mc._visible = false;
        }
        else
        {
            _loc2_.mc._visible = true;
        }
        if(_loc6_ > otherRound)
        {
            _loc3_.mc._visible = false;
        }
        else
        {
            _loc3_.mc._visible = true;
        }
        _loc1_ = _loc1_ + 1;
    }
};
myListener.OnGame_BFScoreBoard_SetScorePoint = function(myScore, otherScore, myImg, otherImg)
{
    pointListReset();
    myScore = Number(myScore);
    otherScore = Number(otherScore);
    if(myImg == "" || myImg == "undefined" || myImg == undefined)
    {
        myImg = "reward_0";
    }
    if(otherImg == "" || otherImg == "undefined" || otherImg == undefined)
    {
        otherImg = "reward_1";
    }
    var _loc6_ = flash.display.BitmapData.loadBitmap(myImg);
    var _loc4_ = flash.display.BitmapData.loadBitmap(otherImg);
    var _loc3_ = container_mc.imgContainer;
    _loc3_._visible = true;
    var _loc1_ = 0;
    while(_loc1_ < myScore)
    {
        var _loc2_ = _loc3_.createEmptyMovieClip("my_" + _loc1_,_loc3_.getNextHighestDepth());
        _loc2_.attachBitmap(_loc6_,_loc2_.getNextHighestDepth());
        _loc2_._x = - 78 + 36 * _loc1_;
        _loc1_ = _loc1_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < otherScore)
    {
        _loc2_ = _loc3_.createEmptyMovieClip("other_" + _loc1_,_loc3_.getNextHighestDepth());
        _loc2_.attachBitmap(_loc4_,_loc2_.getNextHighestDepth());
        _loc2_._x = 78 + 36 * _loc1_;
        _loc1_ = _loc1_ + 1;
    }
};
myListener.OnGame_BFScoreBoard_RoundScore = function(myRoundScore, otherRoundScore)
{
    ballListReset();
    var _loc12_ = lib.util.ExtString.split(myRoundScore,"\t");
    var _loc14_ = lib.util.ExtString.split(otherRoundScore,"\t");
    var _loc13_ = _loc12_.length;
    var _loc3_ = 0;
    var _loc2_ = 0;
    var _loc6_ = 0;
    var _loc5_ = 0;
    var _loc9_ = 0;
    var _loc11_ = 0;
    var _loc4_ = 0;
    var _loc8_ = 0;
    var _loc10_ = 87;
    var _loc7_ = 511;
    var _loc1_ = 0;
    while(_loc1_ < _loc13_)
    {
        _loc3_ = Number(_loc12_[_loc1_]);
        if(_loc3_ == 1)
        {
            _loc6_ = _loc6_ + 1;
        }
        else if(_loc3_ == 2)
        {
            _loc5_ = _loc5_ + 1;
        }
        else if(_loc3_ == 3)
        {
            _loc9_ = _loc9_ + 1;
        }
        lineB = m_boardType.ballListMc.attachMovie("blueBall","blueBall" + _loc1_,m_boardType.ballListMc.getNextHighestDepth());
        lineB.gotoAndStop(_loc3_ + 1);
        lineB._x = - 78 + 30 * _loc1_;
        _loc2_ = Number(_loc14_[_loc1_]);
        if(_loc2_ == 1)
        {
            _loc11_ = _loc11_ + 1;
        }
        else if(_loc2_ == 2)
        {
            _loc4_ = _loc4_ + 1;
        }
        else if(_loc2_ == 3)
        {
            _loc8_ = _loc8_ + 1;
        }
        lineR = m_boardType.ballListMc.attachMovie("redBall","redBall" + _loc1_,m_boardType.ballListMc.getNextHighestDepth());
        lineR.gotoAndStop(_loc2_ + 1);
        lineR._x = 78 + 30 * _loc1_;
        _loc10_ = _loc10_ - 30;
        _loc7_ = _loc7_ + 30;
        _loc1_ = _loc1_ + 1;
    }
    m_boardType.blueScore._x = _loc10_;
    m_boardType.redScore._x = _loc7_;
    m_boardType.blueScore.text = _loc6_ + WIN_STR + " " + _loc5_ + DRAW_STR + " " + _loc9_ + LOSE_STR;
    m_boardType.redScore.text = _loc11_ + WIN_STR + " " + _loc4_ + DRAW_STR + " " + _loc8_ + LOSE_STR;
};
var dangerMode = false;
var dangerFocusMc;
var dangerEffMc;
myListener.OnGame_BFScoreBoard_DepenceGage = function(focusType, remainGage, totalGage)
{
    var _loc2_ = Number(remainGage) / Number(totalGage) * 278;
    var _loc1_ = m_boardType["score" + focusType].txt;
    m_boardType["mask" + focusType]._width = _loc2_;
    _loc1_.text = remainGage;
    if(_loc2_ > 240 - _loc1_.textWidth)
    {
        _loc1_._x = 240 - _loc1_.textWidth;
    }
    else
    {
        _loc1_._x = _loc2_;
    }
};
myListener.OnGame_BFScoreBoard_DangerEvent = function(focusType, bool)
{
    dangerEffMc = m_boardType["gage_eff" + focusType];
    if(bool == "1" && dangerMode == false)
    {
        dangerMode = true;
        dangerEffMc._visible = true;
        PlayTweenMotion(100);
    }
    else
    {
        dangerMode = false;
        gs.TweenLite.to(m_boardType.gage_eff0,0.5,{_alpha:0,onComplete:EffectGageReset});
        gs.TweenLite.to(m_boardType.gage_eff1,0.5,{_alpha:0});
    }
};
var bonusCount = 0;
myListener.OnGame_BFScoreBoard_SetBonus = function(team, bonusText, bonusScore)
{
    var _effect = new MovieClip();
    var _loc1_ = bonusText + " +" + bonusScore;
    if(team == 0)
    {
        m_boardType.blueEffect.gotoAndPlay(2);
        _effect = m_boardType.blueMarker.attachMovie("blueEffect_text","effect" + bonusCount,m_boardType.blueMarker.getNextHighestDepth());
    }
    else
    {
        m_boardType.redEffect.gotoAndPlay(2);
        _effect = m_boardType.redMarker.attachMovie("redEffect_text","effect" + bonusCount,m_boardType.redMarker.getNextHighestDepth());
    }
    _effect.topMc.txt.text = _loc1_;
    _effect.midMc.txt.text = _loc1_;
    _effect.topMc.txt.textAutoSize = "shrink";
    _effect.midMc.txt.textAutoSize = "shrink";
    bonusCount++;
    lib.util.FrameSeeker.seek(_effect,1,_effect._totalframes,function()
    {
        bonusCount--;
        _effect.unloadMovie();
    }
    );
};
myListener.OnGame_BFScoreBoard_SetTimer = function(endTime, runTime)
{
    setEndTimeText(endTime);
    setRunTimeText(runTime);
};
myListener.OnGame_BFScoreBoard_SetBattleState = function(_state)
{
    _state = Number(_state);
    battleEnded = _state > 0;
    myBattleResult = _state;
    if(_state == -1)
    {
        lineMax = 10;
        container_mc.stateFd.text = READY_STR;
        container_mc.timeMc._visible = false;
    }
    else if(_state > 0)
    {
        myListener.OnGame_BFScoreBoard_SetTimer(-1);
        container_mc.stateFd.text = ENDING_STR;
        container_mc.timeMc._visible = false;
    }
    else
    {
        container_mc.stateFd.text = "";
        container_mc.timeMc._visible = true;
    }
};
myListener.OnGame_BFScoreBoard_SetStrong = function(_team, _index, _type)
{
    if(_team == "0")
    {
        m_boardType.blueStrong["mc" + _index].gotoAndStop(Number(_type) + 1);
    }
    else
    {
        m_boardType.redStrong["mc" + _index].gotoAndStop(Number(_type) + 1);
    }
};
container_mc.buffContainer.pointTitleFd._visible = false;
container_mc.buffContainer.skillPointBg._visible = false;
myListener.OnGame_BFScoreBoard_SetAbilityPoint = function(_point)
{
    container_mc.buffContainer.pointTitleFd._visible = true;
    container_mc.buffContainer.skillPointBg._visible = true;
    container_mc.buffContainer.pointFd.text = _point;
};
var iconFrameBm0 = flash.display.BitmapData.loadBitmap("slotFrame0");
var iconFrameBm1 = iconFrameBm0;
var iconFrameBm2 = flash.display.BitmapData.loadBitmap("slotFrame2");
var iconFrameBm3 = flash.display.BitmapData.loadBitmap("slotFrame3");
var iconFrameBm4 = flash.display.BitmapData.loadBitmap("slotFrame4");
var myBuffData = [];
var otherBuffData = [];
myListener.OnGame_BFScoreBoard_AddBuff = function(_teamType, _id, _type, _img, _stackCount, _remain, _total)
{
    _teamType = Number(_teamType);
    _type = Number(_type);
    _stackCount = Number(_stackCount);
    _remain = Number(_remain);
    _total = Number(_total);
    addBuff(_teamType,_id,_type,_img,_stackCount,_remain,_total);
};
var amountTextFormat = new TextFormat("$NormalFont",13,16777215,false,false,false,null,null,"right",0,0,0,0);
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
var MAX_SLOT = 6;
myListener.OnGame_BFScoreBoard_RemoveBuff = function(_teamType, _id, _type)
{
    if(_teamType == undefined)
    {
        var _loc1_ = 0;
        while(_loc1_ < myBuffData.length)
        {
            removeBuffByArrayIndex(myBuffData,_loc1_);
            _loc1_ = _loc1_ + 1;
        }
        myBuffData = [];
        _loc1_ = 0;
        while(_loc1_ < otherBuffData.length)
        {
            removeBuffByArrayIndex(otherBuffData,_loc1_);
            _loc1_ = _loc1_ + 1;
        }
        otherBuffData = [];
    }
    else
    {
        removeBuff(_teamType,_id,_type,true);
    }
    drawSlot();
};
myListener.OnGame_BFInfoBoard_Close = function()
{
    changeState("listclose");
};
myListener.OnGame_BFScoreBoard_SetKey = function(infoBtnKeyCode)
{
    if(infoBtnKeyCode != "" && infoBtnKeyCode != undefined)
    {
        infoOpen_btn.setText(INFOBTN_STR + "(" + lib.info.KeyMap.toKeyCode(infoBtnKeyCode) + ")");
    }
};
myListener.OnGame_BFInfoBoard_SetData = function()
{
    changeState("listopen");
};
myListener.OnGame_BFScoreBoard_SetButton = function(_leftBtn, _middleBtn, _rightBtn, _guideBtn)
{
    lib.Debuger.trace("BFScoreBoard - OnGame_BFScoreBoard_SetButton - _guideBtn : " + _guideBtn);
    var _loc2_ = [];
    var _loc5_ = [[365],[286,443],[209,365,521],[129,286,443,600]];
    if(_leftBtn == 0)
    {
        _loc2_.push(container_mc.btn0);
        container_mc.btn0._visible = LEFT_BTN_VISIBLE = true;
        teamOpen_btn.setEnabled(false);
    }
    else if(_leftBtn == 1)
    {
        _loc2_.push(container_mc.btn0);
        container_mc.btn0._visible = LEFT_BTN_VISIBLE = true;
        teamOpen_btn.setEnabled(true);
    }
    else
    {
        container_mc.btn0._visible = LEFT_BTN_VISIBLE = false;
    }
    if(_middleBtn == 0)
    {
        _loc2_.push(container_mc.btn1);
        container_mc.btn1._visible = MIDDLE_BTN_VISIBLE = true;
        infoOpen_btn.setEnabled(false);
    }
    else if(_middleBtn == 1)
    {
        _loc2_.push(container_mc.btn1);
        container_mc.btn1._visible = MIDDLE_BTN_VISIBLE = true;
        infoOpen_btn.setEnabled(true);
    }
    else
    {
        container_mc.btn1._visible = MIDDLE_BTN_VISIBLE = false;
    }
    if(_rightBtn == 0)
    {
        _loc2_.push(container_mc.btn2);
        container_mc.btn2._visible = RIGHT_BTN_VISIBLE = true;
        skillOpen_btn.setEnabled(false);
        container_mc.buffContainer._y = 135;
    }
    else if(_rightBtn == 1)
    {
        _loc2_.push(container_mc.btn2);
        container_mc.btn2._visible = RIGHT_BTN_VISIBLE = true;
        skillOpen_btn.setEnabled(true);
        container_mc.buffContainer._y = 135;
    }
    else
    {
        container_mc.btn2._visible = RIGHT_BTN_VISIBLE = false;
        container_mc.buffContainer._y = 87;
    }
    if(_guideBtn == 0)
    {
        _loc2_.push(container_mc.btn3);
        container_mc.btn3._visible = GUIDE_BTN_VISIBLE = true;
        guide_btn.setEnabled(false);
    }
    else if(_guideBtn == 1)
    {
        _loc2_.push(container_mc.btn3);
        container_mc.btn3._visible = GUIDE_BTN_VISIBLE = true;
        guide_btn.setEnabled(true);
    }
    else
    {
        container_mc.btn3._visible = GUIDE_BTN_VISIBLE = false;
    }
    var _loc3_ = _loc2_.length;
    var _loc4_ = _loc5_[_loc3_ - 1];
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        _loc2_[_loc1_]._x = _loc4_[_loc1_];
        _loc1_ = _loc1_ + 1;
    }
};
var teamOpen_btn = container_mc.btn0.txtBtn;
var infoOpen_btn = container_mc.btn1.txtBtn;
var skillOpen_btn = container_mc.btn2.txtBtn;
var guide_btn = container_mc.btn3.txtBtn;
teamOpen_btn.setRelease(ToGame_BFScoreBoard_RequestBFTeam);
infoOpen_btn.setRelease(ToGame_BFScoreBoard_RequestBFInfo);
skillOpen_btn.setRelease(ToGame_BFScoreBoard_RequestBFSkill);
guide_btn.setRelease(ToGame_BFScoreBoard_RequestBFGuide);
container_mc._visible = false;
onEndedAni();
ToGame_BFScoreBoard_Init();
