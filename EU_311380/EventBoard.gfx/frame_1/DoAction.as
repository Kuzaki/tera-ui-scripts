function SetTextPosition(str)
{
    var _loc1_ = container_mc.str0.textHeight;
    if(_loc1_ > 80)
    {
        container_mc.str01._visible = true;
        container_mc.str0._visible = false;
        container_mc.str01.htmlText = str;
    }
    else if(_loc1_ > 40)
    {
        container_mc.str01._visible = false;
        container_mc.str0._visible = true;
        container_mc.str0._y = 25;
    }
    else
    {
        container_mc.str01._visible = false;
        container_mc.str0._visible = true;
        container_mc.str0._y = 45;
    }
    container_mc.str1._y = 92;
    var _loc2_ = container_mc.str0.textWidth + 40;
    container_mc.bg._width = _loc2_;
    container_mc.bg._x = (- _loc2_) / 2;
}
function boxClear()
{
    var _loc1_ = container_mc.roundBox;
    for(var _loc2_ in _loc1_)
    {
        if(typeof _loc1_[_loc2_] == "movieclip")
        {
            _loc1_[_loc2_].removeMovieClip();
        }
    }
}
function listReset(_lineMc)
{
    var _loc1_ = _lineMc;
    for(var _loc2_ in _loc1_)
    {
        if(typeof _loc1_[_loc2_] == "movieclip")
        {
            _loc1_[_loc2_].removeMovieClip();
        }
    }
}
function ToGame_EventBoard_ResultSelect()
{
    var _loc1_ = revivalType;
    getURL("FSCommand:ToGame_EventBoard_ResultSelect",_loc1_);
}
function ToGame_EventBoard_RewardEnter()
{
    fscommand("ToGame_EventBoard_RewardEnter");
}
function ToGame_EventBoard_Init()
{
    fscommand("ToGame_EventBoard_Init");
}
var UI = this;
var UIname = "EventBoard";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var STR_0 = lib.util.UIString.getUIString("$012066");
var STR_1 = lib.util.UIString.getUIString("$012067");
var STR_2 = lib.util.UIString.getUIString("$012068");
container_mc.roundBox._visible = false;
container_mc.roungBg._visible = false;
container_mc.titleTxt.text = STR_2;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
        if(bShow)
        {
            UI._visible = true;
        }
        else
        {
            UI._visible = false;
        }
    }
    UI.onEnterFrame = function()
    {
        delete this.onEnterFrame;
    };
};
myListener.OnGame_ScaleUI = function()
{
    myListener.OnGame_ChangeStageSize();
};
myListener.OnGame_ChangeStageSize = function()
{
    container_mc._x = lib.info.AlignInfo.xRatioToPixel(50);
    container_mc._y = lib.info.AlignInfo.yRatioToPixel(25);
};
myListener.OnGame_ChangeStageSize();
myListener.OnGame_EventBoard_QuizStart = function(str0, str1)
{
    container_mc.str0.htmlText = str0;
    container_mc.str1.htmlText = str1;
    SetTextPosition(str0);
};
myListener.OnGame_EventBoard_QuizEnd = function(type, str)
{
    if(type == "0")
    {
        container_mc.str0.htmlText = STR_0;
        SetTextPosition(STR_0);
    }
    else
    {
        container_mc.str0.htmlText = STR_1;
        SetTextPosition(STR_1);
    }
    container_mc.str1.htmlText = str;
    container_mc.str0._y = 25;
    container_mc.str1._y = 72;
};
myListener.OnGame_EventBoard_GuideMode = function(str0, str1)
{
    container_mc.str0.htmlText = str0;
    SetTextPosition(str0);
    if(str1 == "" || str1 == undefined)
    {
        container_mc.str1.htmlText = "";
    }
    else
    {
        container_mc.str1.htmlText = str1;
    }
};
var revivalBtn;
var revivalType = -1;
myListener.OnGame_EventBoard_RevivalMode = function(bool, str0, str1)
{
    if(bool == "1")
    {
        container_mc.popupMc._visible = true;
        container_mc.popupMc.gotoAndStop(1);
    }
    else
    {
        container_mc.popupMc._visible = false;
    }
    container_mc.str0.htmlText = str0;
    SetTextPosition(str0);
    if(str1 == "" || str1 == undefined)
    {
        container_mc.str1.htmlText = "";
    }
    else
    {
        container_mc.str1.htmlText = str1;
    }
    revivalBtn = new lib.util.TxtBtn(container_mc.popupMc.txtBtn.btn,container_mc.popupMc.txtBtn.txt);
    revivalBtn.setRelease(ToGame_EventBoard_ResultSelect);
    revivalBtn.setEnabled(false);
    container_mc.popupMc.oxMc.gotoAndStop(1);
    container_mc.popupMc.btn0.onPress = function()
    {
        container_mc.popupMc.oxMc.oBtn.gotoAndStop(1);
    };
    container_mc.popupMc.btn0.onRollOver = function()
    {
        container_mc.popupMc.oxMc.oBtn.gotoAndStop(2);
    };
    container_mc.popupMc.btn0.onRollOut = container_mc.popupMc.btn0.onReleaseOutside = function()
    {
        container_mc.popupMc.oxMc.oBtn.gotoAndStop(1);
    };
    container_mc.popupMc.btn0.onRelease = function()
    {
        container_mc.popupMc.oxMc.gotoAndStop(2);
        revivalBtn.setEnabled(true);
        revivalType = 1;
    };
    container_mc.popupMc.btn1.onPress = function()
    {
        container_mc.popupMc.oxMc.xBtn.gotoAndStop(1);
    };
    container_mc.popupMc.btn1.onRollOver = function()
    {
        container_mc.popupMc.oxMc.xBtn.gotoAndStop(2);
    };
    container_mc.popupMc.btn1.onRollOut = container_mc.popupMc.btn1.onReleaseOutside = function()
    {
        container_mc.popupMc.oxMc.xBtn.gotoAndStop(1);
    };
    container_mc.popupMc.btn1.onRelease = function()
    {
        container_mc.popupMc.oxMc.gotoAndStop(3);
        revivalBtn.setEnabled(true);
        revivalType = 0;
    };
};
var roundTotal = 0;
var roundCount = 0;
myListener.OnGame_EventBoard_SetRound = function(index, total, bool)
{
    if(bool == "1")
    {
        container_mc.roundBox._visible = true;
        container_mc.roungBg._visible = true;
    }
    else
    {
        container_mc.roundBox._visible = false;
        container_mc.roungBg._visible = false;
    }
    if(roundTotal != total)
    {
        boxClear();
        roundTotal = total;
        var _loc3_ = Number(index) - 1;
        var _loc1_ = undefined;
        _loc1_ = 0;
        while(_loc1_ < total)
        {
            var _loc2_ = container_mc.roundBox.attachMovie("roundMc","roundMc" + _loc1_,_loc1_);
            _loc2_._x = 55 * _loc1_;
            if(_loc1_ == _loc3_)
            {
                _loc2_.gotoAndStop(3);
            }
            else if(_loc1_ < _loc3_)
            {
                _loc2_.gotoAndStop(2);
            }
            _loc2_.txt.text = _loc1_ + 1;
            _loc1_ = _loc1_ + 1;
        }
        container_mc.roundBox._x = -38 - 27.5 * (_loc1_ - 1);
    }
    else
    {
        var _loc6_ = container_mc.roundBox["roundMc" + (index - 1)];
        var _loc7_ = container_mc.roundBox["roundMc" + (index - 2)];
        if(_loc7_)
        {
            _loc7_.gotoAndStop(2);
        }
        _loc6_.gotoAndStop(3);
        _loc6_.txt.text = Number(index);
    }
};
myListener.OnGame_EventBoard_SetReward = function(bool, iData, str)
{
    if(bool == "1")
    {
        container_mc.popupMc._visible = true;
        container_mc.popupMc.gotoAndStop(2);
        var _loc6_ = new lib.util.TxtBtn(container_mc.popupMc.txtBtn.btn,container_mc.popupMc.txtBtn.txt);
        _loc6_.setRelease(ToGame_EventBoard_RewardEnter);
        _loc6_.setEnabled(true);
        container_mc.popupMc.txt0.text = str;
        listReset(container_mc.popupMc.slotBox);
        var _loc5_ = lib.util.ExtString.split(iData,"\n");
        var _loc4_ = _loc5_.length;
        var _loc3_ = 0;
        while(_loc3_ < _loc4_)
        {
            var _loc2_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
            var _loc1_ = container_mc.popupMc.slotBox.attachMovie("Slot_link","item" + _loc3_,container_mc.popupMc.slotBox.getNextHighestDepth());
            _loc1_._width = 48;
            _loc1_._height = 48;
            _loc1_._x = _loc3_ * 50;
            _loc1_.BG_FRAME = true;
            _loc1_.index = _loc2_[0];
            _loc1_.draw(_loc2_[1]);
            _loc1_.SLOT.enabled = false;
            _loc1_.grade = _loc2_[4];
            _loc1_.sealType = _loc2_[5];
            _loc1_.masterpiece = _loc2_[6];
            _loc1_.drag = false;
            _loc1_.FX_IMPOSSIBLE._visible = true;
            if(Number(_loc2_[3]))
            {
                _loc1_.num = _loc2_[3];
            }
            lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6,_loc1_.Icon);
            _loc3_ = _loc3_ + 1;
        }
        container_mc.popupMc.slotBox._x = 210 - (_loc4_ - 1) * 25;
    }
    container_mc.popupMc._visible = false;
    return undefined;
};
myListener.OnGame_EventBoard_SetRewardPoint = function(dataList)
{
    var _loc6_ = lib.util.ExtString.split(dataList,"\n");
    var _loc5_ = _loc6_.length;
    listReset(container_mc.popupMc.rewardBox);
    if(_loc5_ == 1)
    {
        container_mc.popupMc.rewardBox._x = 161;
        container_mc.popupMc.rewardBox._xscale = 100;
        container_mc.popupMc.rewardBox._yscale = 100;
    }
    else if(_loc5_ == 2)
    {
        container_mc.popupMc.rewardBox._x = 76;
        container_mc.popupMc.rewardBox._xscale = 100;
        container_mc.popupMc.rewardBox._yscale = 100;
    }
    else if(_loc5_ == 3)
    {
        container_mc.popupMc.rewardBox._x = 12;
        container_mc.popupMc.rewardBox._xscale = 90;
        container_mc.popupMc.rewardBox._yscale = 90;
        _loc5_ = 3;
    }
    var _loc1_ = 0;
    while(_loc1_ < _loc5_)
    {
        var _loc3_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
        if(_loc3_[0] != undefined)
        {
            var _loc2_ = container_mc.popupMc.rewardBox.attachMovie("rewardMc","rewardMc" + _loc1_,_loc1_);
            _loc2_._x = 170 * _loc1_;
            var _loc4_ = Number(_loc3_[1]) + 1;
            _loc2_.gotoAndStop(_loc4_);
            if(_loc4_ == 1)
            {
                _loc2_.txt.htmlText = lib.util.GoldCurrency.SetGoldText(_loc3_[0],0,0,0,0);
            }
            else
            {
                _loc2_.txt.htmlText = lib.util.CurrencyFormat.makeComma(_loc3_[0]);
            }
        }
        _loc1_ = _loc1_ + 1;
    }
};
container_mc.popupMc._visible = false;
ToGame_EventBoard_Init();
