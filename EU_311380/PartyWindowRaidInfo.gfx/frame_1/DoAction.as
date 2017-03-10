function setOptionBtn(mc)
{
    optionFocus._visible = false;
    optionFocus = mc;
    optionFocus._visible = true;
    var _loc2_ = new lib.util.TxtBtn(mc);
    lib.manager.ToolTip.add(mc,lib.util.UIString.getUIString("$023504"),1);
    _loc2_.setRelease(ToGame_PartyWindowRaidInfo_PartyRaidMemberOption);
}
function ToGame_PartyWindowRaidInfo_PartyRaidMemberOption()
{
    if(optionMc._visible)
    {
        getURL("FSCommand:ToGame_PartyWindowRaidInfo_OptionView",0);
        optionMc._visible = false;
    }
    else
    {
        getURL("FSCommand:ToGame_PartyWindowRaidInfo_OptionView",0);
        optionMc._visible = true;
        optionMc._x = optionFocus._parent._x + 80;
        optionMc._y = optionFocus._parent._y + 10;
    }
}
function AutoPosition()
{
    autoPositionMode = true;
    delete optionMc.onEnterFrame;
    optionMc.onEnterFrame = function()
    {
        delete optionMc.onEnterFrame;
        var _loc6_ = 0;
        var _loc2_ = 0;
        var _loc5_ = [];
        var _loc11_ = [];
        var _loc10_ = [];
        _loc2_ = 0;
        while(_loc2_ < 6)
        {
            var _loc3_ = UI["PartyRaidMc" + _loc2_];
            if(_loc3_._visible)
            {
                _loc3_.mcR = null;
                _loc3_.mcB = null;
                _loc3_.mcP = null;
                _loc6_ = _loc6_ + 1;
                _loc5_.push(_loc3_);
            }
            _loc2_ = _loc2_ + 1;
        }
        var _loc9_ = _loc5_[0]._x;
        var _loc8_ = _loc5_[0]._y;
        var _loc13_ = pw * 2;
        _loc11_ = [_loc9_,_loc9_ + pw,_loc9_ + _loc13_,_loc9_,_loc9_ + pw,_loc9_ + _loc13_];
        _loc10_ = [_loc8_,_loc8_,_loc8_,_loc8_ + ph,_loc8_ + ph,_loc8_ + ph];
        var _loc7_ = 0;
        var _loc12_ = 2;
        if(_loc6_ == 4)
        {
            _loc11_ = [_loc9_,_loc9_ + pw,_loc9_,_loc9_ + pw];
            _loc10_ = [_loc8_,_loc8_,_loc8_ + ph,_loc8_ + ph];
            _loc12_ = 1;
        }
        _loc5_[0]._alpha = 100;
        _loc2_ = 1;
        while(_loc2_ < _loc6_)
        {
            _loc3_ = _loc5_[_loc2_];
            _loc3_._x = _loc11_[_loc2_];
            if(partyBoardType == 1 && _loc2_ > _loc12_)
            {
                _loc7_ = plusH;
            }
            _loc3_._y = _loc10_[_loc2_] + _loc7_;
            var _loc4_ = _root.GetRegisterUIData(_loc3_._name);
            com.bluehole.tera.managers.LayoutManager.saveUIPositon(_loc3_,_loc4_.PA,1);
            SetMagnetic(_loc3_);
            _loc2_ = _loc2_ + 1;
        }
    };
}
function SetBg(bool)
{
    if(PartyRaidMember0._visible)
    {
        PartyRaidMember0.bg._visible = PartyRaidMember0.topBg._visible = bool;
    }
    if(PartyRaidMember1._visible)
    {
        PartyRaidMember1.bg._visible = PartyRaidMember1.topBg._visible = bool;
    }
    if(PartyRaidMember2._visible)
    {
        PartyRaidMember2.bg._visible = PartyRaidMember2.topBg._visible = bool;
    }
    if(PartyRaidMember3._visible)
    {
        PartyRaidMember3.bg._visible = PartyRaidMember3.topBg._visible = bool;
    }
    if(PartyRaidMember4._visible)
    {
        PartyRaidMember4.bg._visible = PartyRaidMember4.topBg._visible = bool;
    }
    if(PartyRaidMember5._visible)
    {
        PartyRaidMember5.bg._visible = PartyRaidMember5.topBg._visible = bool;
    }
}
function InitLine(line)
{
    line.State = 0;
    line.stateTxt._visible = false;
    line.dieMc._visible = false;
    line.warningMc.gotoAndStop(1);
    line.buffCnt = 0;
    line.buff_array = [];
    line.debuff_array = [];
}
function SetLine(mc)
{
    if(!mc)
    {
        return undefined;
    }
    var _loc5_ = 45;
    var _loc4_ = 0;
    if(!mc.init)
    {
        _root.ToGame_RequestSetUIPosition(mc._name);
        mc.bg.count = 0;
        mc.bg.onEnterFrame = function()
        {
            this.count = this.count + 1;
            if(this.count > 3)
            {
                delete this.onEnterFrame;
                this._parent._alpha = 100;
            }
        };
        mc.init = true;
        _loc4_ = 0;
        while(_loc4_ < 5)
        {
            var _loc3_ = mc.attachMovie("lineMc","line" + _loc4_,5 - _loc4_);
            _loc3_.idx = _loc4_;
            _loc3_._x = 39;
            _loc3_._y = _loc5_;
            InitLine(_loc3_);
            BuffBox(_loc3_);
            _loc3_.buffMc.bg._visible = false;
            if(partyBoardType == 0)
            {
                _loc5_ = _loc5_ + 43;
                _loc3_.gotoAndStop(1);
                _loc3_.warningMc.gotoAndStop(1);
                _loc3_.buffMc._visible = false;
                _loc3_.debuffMc._visible = false;
                _loc3_.numTxt._y = 8;
            }
            else
            {
                _loc3_.gotoAndStop(2);
                _loc3_.warningMc.gotoAndStop(1);
                _loc3_.buffMc._visible = true;
                _loc3_.debuffMc._visible = true;
                _loc3_.numTxt._y = 38;
                _loc5_ = _loc5_ + 68;
            }
            _loc4_ = _loc4_ + 1;
        }
    }
    else
    {
        _loc4_ = 0;
        while(_loc4_ < 5)
        {
            _loc3_ = mc["line" + _loc4_];
            _loc3_._y = _loc5_;
            _loc3_.buffMc.bg._visible = false;
            if(partyBoardType == 0)
            {
                _loc3_.gotoAndStop(1);
                _loc3_.DiceMc._visible = false;
                _loc3_.warningMc.gotoAndStop(1);
                _loc3_.buffMc._visible = false;
                _loc3_.debuffMc._visible = false;
                _loc3_.numTxt._y = 8;
                _loc5_ = _loc5_ + 43;
            }
            else
            {
                _loc3_.gotoAndStop(2);
                _loc3_.DiceMc._visible = true;
                _loc3_.warningMc.gotoAndStop(1);
                _loc3_.buffMc._visible = true;
                _loc3_.debuffMc._visible = true;
                _loc3_.numTxt._y = 38;
                _loc5_ = _loc5_ + 68;
            }
            _loc4_ = _loc4_ + 1;
        }
    }
    mc.bg._height = _loc5_ + 46;
    mc.hitR._height = _loc5_ + 20;
    mc.hitB._y = _loc5_;
    if(mc.mcB)
    {
        mc.mcB._y = mc._y + mc._height - (ph - minusH);
    }
}
function SetLine2(line)
{
    if(partyBoardType == 0)
    {
        line.buffMc._visible = false;
        line.debuffMc._visible = false;
        line.numTxt._y = 8;
    }
    else
    {
        line.buffMc._visible = true;
        line.debuffMc._visible = true;
        line.numTxt._y = 38;
    }
}
function ToGame_PartyWindowRaidInfo_Init()
{
    fscommand("ToGame_PartyWindowRaidInfo_Init");
}
function ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End(group, index)
{
    getURL("FSCommand:ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End",group + "\t" + index);
}
function ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End(group, index)
{
    getURL("FSCommand:ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End",group + "\t" + index);
}
function ToGame_PartyWindowRaidInfo_SetView(num)
{
    getURL("FSCommand:ToGame_PartyWindowRaidInfo_SetView",num);
}
function ToGame_PartyWindowRaidInfo_SetCheck()
{
    var _loc2_ = "";
    var _loc1_ = 0;
    while(_loc1_ < 4)
    {
        _loc2_ = _loc2_ + (Number(optionMc["checkBtn" + _loc1_].checked) + "\t");
        _loc1_ = _loc1_ + 1;
    }
    _loc2_ = _loc2_ + String(Number(optionMc.checkBtn4.checked));
    getURL("FSCommand:ToGame_PartyWindowRaidInfo_SetCheck",_loc2_);
}
function ToGame_PartyWindowRaidInfo_PartyRaidMemberPopupCallMenuSet(group, index)
{
    getURL("FSCommand:ToGame_PartyWindowRaidInfo_PartyRaidMemberPopupCallMenuSets",group + "\t" + index);
    myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberPopupSet(group,index);
}
function BuffBox(mc)
{
    mc.buffMc.onRollOver = function()
    {
        var _loc4_ = this._parent;
        var _loc3_ = _loc4_.buff_array.length;
        if(_loc3_ < 6)
        {
            this.bg._visible = false;
            return undefined;
        }
        var _loc2_ = undefined;
        _loc2_ = 0;
        while(_loc2_ < _loc3_)
        {
            mc = _loc4_.buff_array[_loc2_];
            mc._visible = true;
            _loc2_ = _loc2_ + 1;
        }
        this.bg._height = 30 + int(_loc3_ / 5) * 26;
        this.bg._visible = true;
    };
    mc.buffMc.onRollOut = mc.buffMc.onReleaseOutside = function()
    {
        var _loc4_ = this._parent;
        var _loc3_ = _loc4_.buff_array.length;
        if(_loc3_ < 6)
        {
            return undefined;
        }
        var _loc2_ = undefined;
        _loc2_ = 5;
        while(_loc2_ < _loc3_)
        {
            mc = _loc4_.buff_array[_loc2_];
            mc._visible = false;
            _loc2_ = _loc2_ + 1;
        }
        this.bg._visible = false;
    };
}
function buffAlign(group, index, flag)
{
    var _loc4_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc1_ = 0;
    var _loc6_ = _loc4_.buff_array.length;
    var _loc2_ = undefined;
    var _loc3_ = 0;
    _loc1_ = 0;
    while(_loc1_ < _loc6_)
    {
        _loc2_ = _loc4_.buff_array[_loc1_];
        if(_loc1_ < 5)
        {
            _loc2_._visible = true;
            _loc3_ = _loc1_ * 25;
        }
        else
        {
            _loc2_._visible = false;
            _loc3_ = _loc1_ % 5 * 25;
        }
        _loc2_._y = int(_loc1_ / 5) * 25;
        _loc2_._x = _loc3_;
        _loc1_ = _loc1_ + 1;
    }
    var _loc5_ = _loc4_.debuff_array.length;
    _loc1_ = 0;
    while(_loc1_ < _loc5_)
    {
        _loc2_ = _loc4_.debuff_array[_loc1_];
        if(_loc1_ < 3)
        {
            _loc2_._visible = true;
        }
        else
        {
            _loc2_._visible = false;
        }
        _loc3_ = 1 - (_loc1_ + 1) * 25;
        _loc2_._x = _loc3_;
        _loc1_ = _loc1_ + 1;
    }
}
function searchBuff(group, index, id, type, remove)
{
    var _loc2_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc6_ = _loc2_.buff_array.length;
    var _loc7_ = _loc2_.debuff_array.length;
    var _loc1_ = 0;
    if(isNaN(type))
    {
        _loc1_ = 0;
        while(_loc1_ < _loc6_)
        {
            if(_loc2_.buff_array[_loc1_]._name == "buff_" + id)
            {
                var _loc5_ = _loc2_.buff_array[_loc1_];
                if(remove == 1)
                {
                    _loc2_.buff_array.splice(_loc1_,1);
                }
                return _loc5_;
            }
            _loc1_ = _loc1_ + 1;
        }
        _loc1_ = 0;
        while(_loc1_ < _loc7_)
        {
            if(_loc2_.debuff_array[_loc1_]._name == "debuff_" + id)
            {
                _loc5_ = _loc2_.debuff_array[_loc1_];
                if(remove == 1)
                {
                    _loc2_.debuff_array.splice(_loc1_,1);
                }
                return _loc5_;
            }
            _loc1_ = _loc1_ + 1;
        }
        return null;
    }
    if(type == 0)
    {
        _loc1_ = 0;
        while(_loc1_ < _loc6_)
        {
            if(_loc2_.buff_array[_loc1_]._name == "buff_" + id)
            {
                _loc5_ = _loc2_.buff_array[_loc1_];
                if(remove == 1)
                {
                    _loc2_.buff_array.splice(_loc1_,1);
                }
                return _loc5_;
            }
            _loc1_ = _loc1_ + 1;
        }
        return null;
    }
    if(type >= 1)
    {
        _loc1_ = 0;
        while(_loc1_ < _loc7_)
        {
            if(_loc2_.debuff_array[_loc1_]._name == "debuff_" + id)
            {
                _loc5_ = _loc2_.debuff_array[_loc1_];
                if(remove == 1)
                {
                    _loc2_.debuff_array.splice(_loc1_,1);
                }
                return _loc5_;
            }
            _loc1_ = _loc1_ + 1;
        }
        return null;
    }
}
function SetDrag(mc)
{
    mc.UIDrager.setData(mc._name,mc,"",false);
    mc.UIDrager.adjustDragLimit(0,0,0,-40 * lib.info.AlignInfo.scaleRatio);
    mc.UIDrager.onPress2 = function()
    {
        optionMc._visible = false;
        dragFocus = this._parent;
        Mouse.addListener(mouseListner);
        autoPositionMode = false;
        dragFocus.swapDepths(depthCount);
        depthCount++;
        var _loc2_ = dragFocus.mcP;
        if(_loc2_.mcR == dragFocus)
        {
            _loc2_.mcR = null;
        }
        if(_loc2_.mcB == dragFocus)
        {
            _loc2_.mcB = null;
        }
    };
    mc.UIDrager.onRelease2 = function()
    {
        dragFocus = null;
        Mouse.removeListener(mouseListner);
        SetMagnetic(this._parent);
    };
    mc.hitR._visible = false;
    mc.hitB._visible = false;
    mc.mcR = null;
    mc.mcB = null;
    mc.mcP = null;
}
function childCheck(mc)
{
    var _loc2_ = mc.mcR;
    var _loc3_ = mc.mcB;
    if(_loc2_)
    {
        _loc2_._x = mc._x + pw;
        _loc2_._y = mc._y;
        childCheck(_loc2_);
        var _loc5_ = _root.GetRegisterUIData(_loc2_._name);
        com.bluehole.tera.managers.LayoutManager.saveUIPositon(_loc2_,_loc5_.PA,1);
    }
    if(_loc3_)
    {
        _loc3_._x = mc._x;
        _loc3_._y = mc._y + mc._height - (ph - minusH);
        childCheck(_loc3_);
        _loc5_ = _root.GetRegisterUIData(_loc3_._name);
        com.bluehole.tera.managers.LayoutManager.saveUIPositon(_loc3_,_loc5_.PA,1);
    }
}
function hitCheck(mc)
{
    if(mc == dragFocus)
    {
        return undefined;
    }
    if(!mc._visible)
    {
        return undefined;
    }
    var _loc7_ = dragFocus._x;
    var _loc5_ = dragFocus._y;
    var _loc4_ = mc._x;
    var _loc3_ = mc._y;
    var _loc6_ = mc._height;
    var _loc2_ = false;
    if(!mc.mcR)
    {
        var _loc12_ = pw - 10 + _loc4_;
        var _loc9_ = pw + 30 + _loc4_;
        var _loc10_ = _loc3_ - 50;
        var _loc8_ = _loc3_ + 50;
        _loc2_ = hitSize(_loc7_,_loc5_,_loc12_,_loc9_,_loc10_,_loc8_);
        mc.hitR._visible = _loc2_;
    }
    if(!mc.mcB)
    {
        var _loc15_ = _loc4_ - 60;
        var _loc13_ = _loc4_ + 80;
        var _loc14_ = _loc3_ + _loc6_ - 70;
        var _loc11_ = _loc3_ + _loc6_ - 40;
        _loc2_ = hitSize(_loc7_,_loc5_,_loc15_,_loc13_,_loc14_,_loc11_);
        mc.hitB._visible = _loc2_;
    }
}
function SetMagnetic(mc)
{
    if(!mc._visible)
    {
        return undefined;
    }
    delete mc.onEnterFrame;
    mc.onEnterFrame = function()
    {
        delete this.onEnterFrame;
        MagneticCheck(this,PartyRaidMember0);
        MagneticCheck(this,PartyRaidMember1);
        MagneticCheck(this,PartyRaidMember2);
        MagneticCheck(this,PartyRaidMember3);
        MagneticCheck(this,PartyRaidMember4);
        MagneticCheck(this,PartyRaidMember5);
    };
}
function hitSize(targetX, targetY, minX, maxX, minY, maxY)
{
    var _loc1_ = false;
    if(targetX > minX && targetX < maxX && targetY > minY && targetY < maxY)
    {
        _loc1_ = true;
    }
    return _loc1_;
}
function MagneticCheck(childMc, parentMc)
{
    var _loc11_ = _root.GetRegisterUIData(parentMc._name);
    com.bluehole.tera.managers.LayoutManager.saveUIPositon(parentMc,_loc11_.PA,1);
    com.bluehole.tera.managers.LayoutManager.saveUIPositon(childMc,_loc11_.PA,1);
    if(childMc == parentMc)
    {
        return undefined;
    }
    if(!parentMc._visible)
    {
        return undefined;
    }
    var _loc9_ = childMc._x;
    var _loc7_ = childMc._y;
    var _loc6_ = parentMc._x;
    var _loc5_ = parentMc._y;
    var _loc8_ = parentMc._height;
    var _loc4_ = false;
    parentMc.hitR._visible = false;
    parentMc.hitB._visible = false;
    if(!parentMc.mcR)
    {
        var _loc16_ = pw - 10 + _loc6_;
        var _loc13_ = pw + 30 + _loc6_;
        var _loc14_ = _loc5_ - 50;
        var _loc12_ = _loc5_ + 50;
        _loc4_ = hitSize(_loc9_,_loc7_,_loc16_,_loc13_,_loc14_,_loc12_);
        if(_loc4_)
        {
            var _loc10_ = childMc.mcP;
            if(_loc10_.mcR == childMc)
            {
                _loc10_.mcR = null;
            }
            if(_loc10_.mcB == childMc)
            {
                _loc10_.mcB = null;
            }
            parentMc.mcR = childMc;
            childMc.mcP = parentMc;
            childCheck(parentMc);
        }
    }
    else if(parentMc.mcR == childMc)
    {
        _loc7_ = childMc._y = parentMc._y;
        _loc16_ = pw - 10 + _loc6_;
        _loc13_ = pw + 30 + _loc6_;
        _loc14_ = _loc5_ - 50;
        _loc12_ = _loc5_ + 50;
        _loc4_ = hitSize(_loc9_,childMc._y = parentMc._y,_loc16_,_loc13_,_loc14_,_loc12_);
        if(!_loc4_)
        {
            parentMc.mcR = null;
        }
    }
    if(!parentMc.mcB)
    {
        var _loc19_ = _loc6_ - 60;
        var _loc17_ = _loc6_ + 80;
        var _loc18_ = _loc5_ + _loc8_ - 70;
        var _loc15_ = _loc5_ + _loc8_ - 40;
        _loc4_ = hitSize(_loc9_,childMc._y = parentMc._y,_loc19_,_loc17_,_loc18_,_loc15_);
        if(_loc4_)
        {
            _loc10_ = childMc.mcP;
            if(_loc10_.mcR == childMc)
            {
                _loc10_.mcR = null;
            }
            if(_loc10_.mcB == childMc)
            {
                _loc10_.mcB = null;
            }
            parentMc.mcB = childMc;
            childMc.mcP = parentMc;
            childCheck(parentMc);
        }
    }
    else if(parentMc.mcB == childMc)
    {
        _loc19_ = _loc6_ - 60;
        _loc17_ = _loc6_ + 80;
        _loc18_ = _loc5_ + _loc8_ - 70;
        _loc15_ = _loc5_ + _loc8_ - 40;
        _loc4_ = hitSize(_loc9_,childMc._y = parentMc._y,_loc19_,_loc17_,_loc18_,_loc15_);
        if(!_loc4_)
        {
            parentMc.mcB = null;
        }
    }
}
var UI = this;
var UIname = "PartyWindowRaidInfo";
var bWidgetOpen = false;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var scaleNum = 1.11;
var pw = 164 * scaleNum;
var pw2 = 328 * scaleNum;
var ph = 228 * scaleNum;
var plusH = 113 * scaleNum;
var minusH = 170 * scaleNum;
var partyBoardType = 0;
var partyBoardCount = 6;
var autoPositionMode = false;
var PartyRaidMember0 = UI.PartyRaidMc0;
var PartyRaidMember1 = UI.PartyRaidMc1;
var PartyRaidMember2 = UI.PartyRaidMc2;
var PartyRaidMember3 = UI.PartyRaidMc3;
var PartyRaidMember4 = UI.PartyRaidMc4;
var PartyRaidMember5 = UI.PartyRaidMc5;
PartyRaidMember0.diceArr = [0,0,0,0,0];
PartyRaidMember1.diceArr = [0,0,0,0,0];
PartyRaidMember2.diceArr = [0,0,0,0,0];
PartyRaidMember3.diceArr = [0,0,0,0,0];
PartyRaidMember4.diceArr = [0,0,0,0,0];
PartyRaidMember5.diceArr = [0,0,0,0,0];
PartyRaidMember0.init = false;
PartyRaidMember1.init = false;
PartyRaidMember2.init = false;
PartyRaidMember3.init = false;
PartyRaidMember4.init = false;
PartyRaidMember5.init = false;
PartyRaidMember0._visible = false;
PartyRaidMember1._visible = false;
PartyRaidMember2._visible = false;
PartyRaidMember3._visible = false;
PartyRaidMember4._visible = false;
PartyRaidMember5._visible = false;
PartyRaidMember0._alpha = 0;
PartyRaidMember1._alpha = 0;
PartyRaidMember2._alpha = 0;
PartyRaidMember3._alpha = 0;
PartyRaidMember4._alpha = 0;
PartyRaidMember5._alpha = 0;
PartyRaidMember0.optionBtn._visible = true;
PartyRaidMember1.optionBtn._visible = false;
PartyRaidMember2.optionBtn._visible = false;
PartyRaidMember3.optionBtn._visible = false;
PartyRaidMember4.optionBtn._visible = false;
PartyRaidMember5.optionBtn._visible = false;
PartyRaidMember0.idx = 0;
PartyRaidMember1.idx = 1;
PartyRaidMember2.idx = 2;
PartyRaidMember3.idx = 3;
PartyRaidMember4.idx = 4;
PartyRaidMember5.idx = 5;
optionMc._visible = false;
var optionFocus = PartyRaidMember0.optionBtn;
setOptionBtn(PartyRaidMember0.optionBtn);
var optionCloseBtn = new lib.util.TxtBtn(optionMc.btn);
optionCloseBtn.setRelease(function()
{
    optionMc._visible = false;
}
);
var optionResetBtn = new lib.util.TxtBtn(optionMc.autoBtn.btn,optionMc.autoBtn.txt);
optionResetBtn.setRelease(AutoPosition);
myListener.OnGame_PartyWindowRaidInfo_OptionView = function(bool)
{
    optionMc._visible = Boolean(Number(bool));
};
optionMc.swapDepths(9999);
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
myListener.OnGameEventChangeUIMode = function(bShow)
{
    if(_global.gbUIMode && bWidgetOpen)
    {
        SetBg(true);
        optionFocus._alpha = 100;
    }
    else
    {
        SetBg(false);
        optionMc._visible = false;
        optionFocus._alpha = 50;
    }
};
myListener.OnGame_SetUIPosition = function(_bLocked, _UiName, _posXRatio, _posYRatio)
{
    var _loc1_ = UI[_UiName];
    if(_loc1_._visible)
    {
        var _loc3_ = Number(_bLocked);
        var _loc7_ = Number(_posXRatio);
        var _loc5_ = Number(_posYRatio);
        if(_loc3_ != 0)
        {
            if(!(_posXRatio == 0 && _posYRatio == 0))
            {
                var _loc2_ = UI._xscale * 0.01;
                _loc1_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc7_ * _loc2_;
                var _loc6_ = com.bluehole.tera.managers.LayoutManager.getOriginCoord(_loc1_);
                var _loc4_ = 1 / lib.info.AlignInfo.onePercentPixelH / _loc2_;
                _loc1_._y = _loc5_ / _loc4_ + _loc6_.y;
                _loc1_.mcP = null;
                _loc1_.mcR = null;
                _loc1_.mcB = null;
            }
        }
        SetMagnetic(_loc1_);
    }
};
myListener.OnGame_ChangeStageSize = function()
{
    myListener.OnGame_ResetUIPosition();
};
myListener.OnGame_ResetUIPosition = function()
{
    var _loc7_ = 0;
    var _loc6_ = 200;
    var _loc8_ = pw * 2;
    posX = [_loc7_,_loc7_ + pw,_loc7_ + _loc8_,_loc7_,_loc7_ + pw,_loc7_ + _loc8_];
    posY = [_loc6_,_loc6_,_loc6_,_loc6_ + ph,_loc6_ + ph,_loc6_ + ph];
    var _loc4_ = 0;
    var _loc5_ = 2;
    i = 0;
    while(i < 6)
    {
        var _loc2_ = UI["PartyRaidMc" + i];
        _loc2_._x = posX[i];
        if(partyBoardType == 1 && i > _loc5_)
        {
            _loc4_ = plusH;
        }
        _loc2_._y = posY[i] + _loc4_;
        var _loc3_ = _root.GetRegisterUIData(_loc2_._name);
        com.bluehole.tera.managers.LayoutManager.saveUIPositon(_loc2_,_loc3_.PA,1);
        SetMagnetic(_loc2_);
        i++;
    }
};
myListener.OnGame_MouseDown = function(button, target)
{
    button = Number(button);
    if(button == 2)
    {
        if(target._parent._parent._parent.UIname == UIname)
        {
            rightClickedMember = target._parent._parent.idx;
            rightClickedMember_Sub = target._parent.idx;
            ToGame_PartyWindowRaidInfo_PartyRaidMemberPopupCallMenuSet(rightClickedMember,rightClickedMember_Sub);
        }
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberVisibleSet = function(group, bool)
{
    group = int(group);
    var _loc1_ = UI["PartyRaidMc" + group];
    _loc1_._visible = Boolean(Number(bool));
    _loc1_.titleTxt.htmlText = lib.util.UIString.getUIString("$023511") + " " + (Number(group) + 1);
    _loc1_.optionBtn._x = _loc1_.titleTxt.textWidth + 60;
    if(bool)
    {
        SetLine(_loc1_);
        if(autoPositionMode)
        {
            AutoPosition();
        }
        else
        {
            SetMagnetic(_loc1_);
        }
        if(_loc1_.idx < optionFocus._parent.idx)
        {
            setOptionBtn(_loc1_.optionBtn);
        }
    }
    else
    {
        if(_loc1_ == optionFocus._parent)
        {
            setOptionBtn(UI.PartyRaidMc5.optionBtn);
        }
        if(autoPositionMode)
        {
            AutoPosition();
        }
        var _loc2_ = _loc1_.mcP;
        if(_loc2_.mcR == _loc1_)
        {
            _loc2_.mcR = null;
        }
        if(_loc2_.mcB == _loc1_)
        {
            _loc2_.mcB = null;
        }
    }
    _loc1_._visible = Boolean(Number(bool));
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberMasterSet = function(group, index, bool)
{
    group = int(group);
    index = int(index);
    bool = int(bool);
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    _loc1_.stateMc.gotoAndStop(2);
    if(bool == 1)
    {
        _loc1_.State = 1;
        _loc1_.stateMc.icons.gotoAndStop(2);
        lib.manager.ToolTip.add(_loc1_.stateMc,lib.util.UIString.getUIString("$023508"),1);
    }
    else
    {
        _loc1_.State = 0;
        _loc1_.stateMc.icons.gotoAndStop(1);
        lib.manager.ToolTip.remove(_loc1_.stateMc);
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberSet = function(group, index)
{
    group = int(group);
    index = int(index);
    var _loc3_ = UI["PartyRaidMc" + group]["line" + index];
    _loc3_._visible = true;
    lib.manager.ToolTip.add(_loc3_.tooltipHit,group + "\t" + index,10);
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemove = function(group, index)
{
    group = int(group);
    index = int(index);
    var _loc3_ = UI["PartyRaidMc" + group]["line" + index];
    myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet(group,index);
    _loc3_._visible = false;
    lib.manager.ToolTip.remove(_loc3_.tooltipHit);
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberClassSet = function(group, index, classType)
{
    group = int(group);
    index = int(index);
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    _loc1_.classMc.gotoAndStop(Number(classType) + 1);
    var _loc4_ = lib.info.ToolTipStr["CLASS_" + Number(classType)];
    lib.manager.ToolTip.add(_loc1_.classMc,_loc4_);
};
var userGroup;
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberIDSet = function(group, index, nameStr, user)
{
    group = int(group);
    index = int(index);
    user = int(user);
    var _loc2_ = UI["PartyRaidMc" + group];
    var _loc1_ = _loc2_["line" + index];
    _loc1_.nameTxt.verticalAlign = "center";
    _loc1_.nameTxt.setText(nameStr,0);
    if(user == 1)
    {
        userGroup.titleTxt.textColor = lib.info.TextColor.UI_PARTY_NORMAL;
        userGroup = _loc2_;
        _loc2_.titleTxt.textColor = lib.info.TextColor.LIST_MYGUILD;
        _loc1_.nameColor = lib.info.TextColor.LIST_MYGUILD;
        _loc1_.nameTxt.textColor = lib.info.TextColor.LIST_MYGUILD;
    }
    else
    {
        if(userGroup != _loc2_)
        {
            UI["PartyRaidMc" + group].titleTxt.textColor = lib.info.TextColor.UI_PARTY_NORMAL;
        }
        _loc1_.nameColor = lib.info.TextColor.UI_PARTY_NORMAL;
        _loc1_.nameTxt.textColor = lib.info.TextColor.UI_PARTY_NORMAL;
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberOffSet = function(group, index, bool)
{
    group = int(group);
    index = int(index);
    bool = int(bool);
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    _loc1_.stateTxt._visible = !Boolean(Number(bool));
    _loc1_.gageHp._visible = _loc1_.gageMp._visible = Boolean(Number(bool));
    if(bool == 1)
    {
        _loc1_.warningMc.gotoAndStop(1);
        _loc1_.classMc._alpha = 100;
        if(_loc1_.dieMc._visible)
        {
            _loc1_.nameTxt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
        }
        else
        {
            _loc1_.nameTxt.textColor = lib.info.TextColor.UI_PARTY_NORMAL;
        }
    }
    else
    {
        _loc1_.classMc._alpha = 30;
        myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet(group,index);
        _loc1_.nameTxt.textColor = lib.info.TextColor.GENERAL_OFFLINE;
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberHpSet = function(group, index, currentHp, maxHp)
{
    group = int(group);
    index = int(index);
    var _loc4_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc1_ = Number(currentHp) / Number(maxHp) * 124;
    if(_loc1_ > 124)
    {
        _loc1_ = 124;
    }
    _loc4_.gageHp._width = _loc1_;
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberMpSet = function(group, index, currentMp, maxMp)
{
    group = int(group);
    index = int(index);
    var _loc4_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc1_ = Number(currentMp) / Number(maxMp) * 124;
    if(_loc1_ > 124)
    {
        _loc1_ = 124;
    }
    _loc4_.gageMp._width = _loc1_;
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberDieSet = function(group, index, bool)
{
    group = int(group);
    index = int(index);
    bool = int(bool);
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    if(bool == 1)
    {
        _loc1_.dieMc._visible = true;
        _loc1_.stateMc._alpha = 0;
        _loc1_.nameTxt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
        lib.manager.ToolTip.add(_loc1_.dieMc,lib.util.UIString.getUIString("$023507"),1);
    }
    else
    {
        _loc1_.dieMc._visible = false;
        _loc1_.stateMc._alpha = 100;
        lib.manager.ToolTip.remove(_loc1_.stateMc);
        _loc1_.nameTxt.textColor = _loc1_.nameColor;
    }
    if(_loc1_.stateTxt._visible)
    {
        _loc1_.nameTxt.textColor = lib.info.TextColor.GENERAL_OFFLINE;
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberReadySet = function(group, index, type)
{
    group = int(group);
    index = int(index);
    type = int(type);
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    if(type == 1)
    {
        if(_loc1_.State == 1)
        {
            return undefined;
        }
        _loc1_.stateMc.gotoAndStop(3);
        _loc1_.stateMc.icons.gotoAndStop(1);
        lib.manager.ToolTip.add(_loc1_.stateMc,lib.util.UIString.getUIString("$023509"),1);
    }
    else if(type == 2)
    {
        if(_loc1_.State == 1)
        {
            return undefined;
        }
        if(!_loc1_.stateMc._visible)
        {
            _loc1_.stateMc._visible = true;
        }
        _loc1_.stateMc.gotoAndStop(3);
        _loc1_.stateMc.icons.gotoAndStop(2);
        lib.manager.ToolTip.add(_loc1_.stateMc,lib.util.UIString.getUIString("$023510"),1);
    }
    else
    {
        var _loc4_ = 1 + Number(_loc1_.State);
        _loc1_.stateMc.gotoAndStop(2);
        _loc1_.stateMc.icons.gotoAndStop(_loc4_);
        lib.manager.ToolTip.remove(_loc1_.stateMc);
        if(_loc1_.stateTxt._visible)
        {
            _loc1_.stateMc._visible = false;
        }
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberBuffSet = function(group, index, id, stackCnt, type, bRelaxMerit, img, remain, total)
{
    group = int(group);
    index = int(index);
    type = Number(type);
    remain = Math.abs(Number(remain));
    total = Math.abs(Number(total));
    var _loc3_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc7_ = null;
    var _loc8_ = null;
    var _loc9_ = null;
    var _loc4_ = null;
    if(type == 0)
    {
        _loc7_ = _loc3_.buffMc;
        _loc4_ = _loc3_.buff_array;
        _loc9_ = _loc4_.length;
        _loc8_ = "buff_";
    }
    else
    {
        _loc7_ = _loc3_.debuffMc;
        _loc4_ = _loc3_.debuff_array;
        _loc9_ = _loc4_.length;
        _loc8_ = "debuff_";
    }
    if(!_loc7_)
    {
        return undefined;
    }
    var _loc15_ = searchBuff(group,index,id,type);
    if(_loc15_ == null)
    {
        var _loc12_ = "Slot_link";
        var _loc1_ = _loc7_.attachMovie(_loc12_,_loc8_ + id,_loc3_.buffCnt);
        _loc1_.frame_mc._width = 24;
        _loc1_.frame_mc._height = 24;
        if(type == 0)
        {
            _loc1_.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
            _loc1_.frame_mc.gotoAndStop(1);
        }
        else if(type == 1)
        {
            _loc1_.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF;
            _loc1_.frame_mc.gotoAndStop(1);
        }
        else if(type == 2)
        {
            _loc1_.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_WEAK;
            _loc1_.frame_mc.gotoAndStop(3);
        }
        else if(type == 3)
        {
            _loc1_.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_TICK;
            _loc1_.frame_mc.gotoAndStop(4);
        }
        else if(type == 4)
        {
            _loc1_.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_STUN;
            _loc1_.frame_mc.gotoAndStop(5);
        }
        _loc1_.warn = false;
        _loc1_.stack._width = 22;
        _loc1_.stack._height = 22;
        _loc1_.stack._xscale = 60;
        _loc1_.stack._yscale = 60;
        _loc1_.stack._x = 8.45;
        _loc1_.stack._y = 1.45;
        _loc4_.push(_loc1_);
        _loc3_.buffCnt++;
        if(total == 0)
        {
            _loc1_.Count._visible = false;
            _loc1_.CoolTime._visible = false;
            delete _loc1_.timer.onEnterFrame;
        }
        else if(remain <= 0)
        {
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(group,index,id);
        }
        _loc1_.id = id;
        _loc1_.type = type;
        _loc1_.img = img;
        _loc1_.draw(img,22,22);
        _loc1_.drag = false;
        _loc1_.effect = false;
        var _loc14_ = img.substring(20,img.length);
        lib.manager.ToolTip.add(_loc1_.SLOT,_loc14_,4,_loc1_.Icon);
    }
    buffAlign(group,index);
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberUpdateBuffSet = function(group, index, id, stackCnt, useRelaxMerit, img, remain, total)
{
    group = int(group);
    index = int(index);
    remain = Number(remain);
    total = Number(total);
    var _loc1_ = searchBuff(group,index,id);
    if(img != undefined && img != "null" && img != "")
    {
        if(_loc1_.TEX != img)
        {
            _loc1_.draw(img,22,22);
        }
    }
    _loc1_.stack._width = 22;
    _loc1_.stack._height = 22;
    _loc1_.stack._xscale = 60;
    _loc1_.stack._yscale = 60;
    _loc1_.stack._x = 8.45;
    _loc1_.stack._y = 1.45;
    if(total == 0)
    {
        _loc1_.warn = false;
        _loc1_.Count._visible = false;
        _loc1_.CoolTime._visible = false;
    }
    if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
    {
        _loc1_.warn = false;
        if(remain <= 0)
        {
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(group,index,id);
        }
    }
    buffAlign(group,index);
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet = function(group, index, id)
{
    group = int(group);
    index = int(index);
    var _loc4_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc3_ = searchBuff(group,index,id,null,1);
    var _loc6_ = undefined;
    var _loc5_ = _loc3_.type;
    if(_loc5_ == 0)
    {
        _loc6_ = _loc4_.buff_array;
    }
    else if(_loc5_ >= 1)
    {
        _loc6_ = _loc4_.debuff_array;
    }
    if(_loc3_ != undefined)
    {
        removeMovieClip(_loc3_);
    }
    buffAlign(group,index);
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet = function(group, index, type)
{
    group = int(group);
    index = int(index);
    var _loc6_ = UI["PartyRaidMc" + group]["line" + index];
    var _loc7_ = Number(type);
    var _loc1_ = 0;
    if(isNaN(_loc7_) || _loc7_ == undefined)
    {
        var _loc4_ = _loc6_.buff_array.concat();
        var _loc5_ = _loc6_.debuff_array.concat();
        _loc1_ = 0;
        while(_loc1_ < _loc4_.length)
        {
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(group,index,_loc4_[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
        _loc1_ = 0;
        while(_loc1_ < _loc5_.length)
        {
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(group,index,_loc5_[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
        return undefined;
    }
    var _loc9_ = undefined;
    if(type == 0)
    {
        imsi_arrray = _loc6_.buff_array.concat();
        _loc1_ = 0;
        while(_loc1_ < imsi_arrray.length)
        {
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(group,index,imsi_arrray[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
    }
    else if(type >= 1)
    {
        imsi_arrray = _loc6_.debuff_array.concat();
        _loc1_ = 0;
        while(_loc1_ < imsi_arrray.length)
        {
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(group,index,imsi_arrray[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
    }
    buffAlign(group,index);
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberHoldBuffSet = function(group, index, id)
{
    group = int(group);
    index = int(index);
    buffAlign(group,index);
};
var DiceMc_StatEnd = 7;
var DiceMc_Stat2End = 30;
var DiceMc_Stat3End = 45;
var DiceMcDiceMc_StatEnd = 15;
var DiceMcDiceMc_Stat2End = 60;
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart = function(group, index)
{
    group = int(group);
    index = int(index);
    var _loc4_ = UI["PartyRaidMc" + group];
    var _loc5_ = _loc4_["line" + index];
    _loc5_.numTxt.text = "...";
    _loc4_.diceArr[index] = 1;
    _loc5_.stateMc._visible = false;
    _loc5_.dieMc._alpha = 0;
    if(partyBoardType == 0)
    {
        _loc4_.DiceMc._visible = true;
        _loc5_.DiceMc._visible = false;
    }
    else
    {
        _loc4_.DiceMc._visible = false;
        _loc5_.DiceMc._visible = true;
    }
    if(_loc5_.DiceMc._currentframe == 1)
    {
        _loc5_.DiceMc.gotoAndPlay("start");
        _loc5_.DiceMc.mc.MaskMc.gotoAndStop(1);
        _loc5_.DiceMc.mc.gotoAndPlay("start");
        _loc5_.DiceMc.mc.mc.gotoAndStop(1);
    }
    if(_loc4_.DiceMc._currentframe == 1)
    {
        _loc4_.DiceMc.gotoAndPlay("start");
        _loc4_.DiceMc.mc.MaskMc.gotoAndStop(1);
        _loc4_.DiceMc.mc.gotoAndPlay("start");
        _loc4_.DiceMc.mc.mc.gotoAndStop(1);
        _loc4_.DiceMc.onEnterFrame = null;
        _loc4_.DiceMc.onEnterFrame = function()
        {
            if(this._currentframe == DiceMc_StatEnd)
            {
                if(this.DiceMc._currentframe == DiceMcDiceMc_StatEnd)
                {
                    delete this.onEnterFrame;
                    var _loc2_ = 0;
                    while(_loc2_ < 5)
                    {
                        var _loc3_ = this._parent.diceArr[_loc2_];
                        if(_loc3_ == 1)
                        {
                            ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End(group,_loc2_);
                        }
                        _loc2_ = _loc2_ + 1;
                    }
                }
            }
        };
    }
    return undefined;
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData = function(group, index, _data, flag)
{
    group = int(group);
    index = int(index);
    flag = int(flag);
    var _loc5_ = UI["PartyRaidMc" + group];
    var _loc4_ = UI["PartyRaidMc" + group]["line" + index];
    _loc4_.numTxt.setText(_data);
    _loc4_.stateMc._visible = false;
    _loc4_.dieMc._alpha = 0;
    if(partyBoardType == 1)
    {
        _loc4_.DiceMc._visible = true;
        _loc4_.DiceMc.gotoAndStop(7);
        _loc4_.DiceMc.mc.gotoAndStop(15);
    }
    else
    {
        _loc5_.DiceMc._visible = true;
        _loc5_.DiceMc.gotoAndStop(7);
        _loc5_.DiceMc.mc.gotoAndStop(15);
    }
    if(flag == 1)
    {
        _loc4_.numTxt.textColor = 12845056;
    }
    else if(flag == 0)
    {
        _loc4_.numTxt.textColor = 16777215;
        return undefined;
    }
    _loc4_.DiceMc.count = 0;
    _loc4_.DiceMc.onEnterFrame = null;
    _loc4_.DiceMc.onEnterFrame = function()
    {
        this.count++;
        if(DiceMcDiceMc_Stat2End <= this.count)
        {
            delete this.onEnterFrame;
            myListener.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionEnd(group,index);
            var _loc2_ = 0;
            while(_loc2_ < 5)
            {
                var _loc3_ = this._parent._parent.diceArr[_loc2_];
                if(_loc3_ == 1)
                {
                    ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End(group,_loc2_);
                }
                _loc2_ = _loc2_ + 1;
            }
        }
    };
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionEnd = function(group, index)
{
    group = int(group);
    index = int(index);
    var groupMc = UI["PartyRaidMc" + group];
    var _loc2_ = groupMc["line" + index];
    delete _loc2_.DiceMc.onEnterFrame;
    if(_loc2_.DiceMc._currentframe == 1)
    {
        return undefined;
    }
    groupMc.DiceMc.gotoAndPlay(31);
    _loc2_.DiceMc.gotoAndPlay(31);
    _loc2_.DiceMc.count = 0;
    _loc2_.DiceMc.onEnterFrame = null;
    _loc2_.DiceMc.onEnterFrame = function()
    {
        this.count++;
        if(24 <= this.count)
        {
            delete this.onEnterFrame;
            groupMc.DiceMc._visible = false;
            var _loc2_ = this._parent;
            _loc2_.dieMc._alpha = 100;
            _loc2_.stateMc._visible = true;
            _loc2_.numTxt.htmlText = "";
            _loc2_.DiceMc._visible = false;
        }
    };
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberDangerStateSet = function(group, index, flag)
{
    group = int(group);
    index = int(index);
    flag = int(flag);
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    if(flag == 1 && !_loc1_.stateTxt._visible)
    {
        if(_loc1_.warningMc._currentframe == 2)
        {
            return undefined;
        }
        _loc1_.warningMc.gotoAndStop(2);
    }
    else
    {
        _loc1_.warningMc.gotoAndStop(1);
    }
};
myListener.OnGame_PartyWindowRaidInfo_SetOption = function(_view, checkList)
{
    var _loc2_ = false;
    if(_view == "1")
    {
        partyBoardType = 1;
        optionMc.radioBtn0.checked = true;
        optionMc.radioBtn1.checked = false;
        optionMc.lockMc._visible = false;
    }
    else
    {
        partyBoardType = 0;
        optionMc.radioBtn0.checked = false;
        optionMc.radioBtn1.checked = true;
        optionMc.lockMc._visible = true;
    }
    var _loc1_ = lib.util.ExtString.split(checkList,"\t");
    optionMc.checkBtn0.checked = Boolean(Number(_loc1_[0]));
    optionMc.checkBtn1.checked = Boolean(Number(_loc1_[1]));
    optionMc.checkBtn2.checked = Boolean(Number(_loc1_[2]));
    optionMc.checkBtn3.checked = Boolean(Number(_loc1_[3]));
    optionMc.checkBtn4.checked = Boolean(Number(_loc1_[4]));
};
myListener.OnGame_PartyWindowRaidInfo_ResetPosition = function()
{
    AutoPosition();
};
var i = 0;
while(i < 5)
{
    optionMc["checkBtn" + i].idx = i;
    optionMc["checkBtn" + i].onChanged = function()
    {
        ToGame_PartyWindowRaidInfo_SetCheck();
    };
    i++;
}
optionMc.radioBtn0.onChanged = function()
{
    if(this.checked)
    {
        partyBoardType = 1;
        optionMc.radioBtn1.checked = false;
        optionMc.lockMc._visible = false;
        ToGame_PartyWindowRaidInfo_SetView(1);
        var _loc3_ = 0;
        while(_loc3_ < 6)
        {
            var _loc2_ = UI["PartyRaidMc" + _loc3_];
            _loc2_.DiceMc._visible = false;
            SetLine(_loc2_);
            if(!autoPositionMode)
            {
                SetMagnetic(_loc2_);
            }
            _loc3_ = _loc3_ + 1;
        }
        if(autoPositionMode)
        {
            AutoPosition();
        }
    }
};
optionMc.radioBtn1.onChanged = function()
{
    if(this.checked)
    {
        partyBoardType = 0;
        optionMc.radioBtn0.checked = false;
        optionMc.lockMc._visible = true;
        ToGame_PartyWindowRaidInfo_SetView(0);
        var _loc3_ = 0;
        while(_loc3_ < 6)
        {
            var _loc2_ = UI["PartyRaidMc" + _loc3_];
            _loc2_.DiceMc._visible = true;
            SetLine(_loc2_);
            if(!autoPositionMode)
            {
                SetMagnetic(_loc2_);
            }
            _loc3_ = _loc3_ + 1;
        }
        if(autoPositionMode)
        {
            AutoPosition();
        }
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberPopupSet = function(group, index)
{
    if(group != undefined && index != undefined)
    {
        getURL("FSCommand:ToGame_PartyWindowRaidInfo_InteractionMenu",group + "\t" + index);
    }
};
myListener.OnGame_PartyWindowRaidInfo_PartyRaidMemberDebuffStateSet = function(group, index, type)
{
    var _loc1_ = UI["PartyRaidMc" + group]["line" + index];
    if(type)
    {
        _loc1_.gageHp.gotoAndStop(4);
    }
    else
    {
        _loc1_.gageHp.gotoAndStop(1);
    }
};
var buffGap = 4;
var buffWidth = 22;
var mouseListner = {};
var dragFocus = null;
var autoDisX = 0;
var autoDisY = 0;
var depthCount = 10;
mouseListner.onMouseMove = function()
{
    childCheck(dragFocus);
    hitCheck(PartyRaidMember0);
    hitCheck(PartyRaidMember1);
    hitCheck(PartyRaidMember2);
    hitCheck(PartyRaidMember3);
    hitCheck(PartyRaidMember4);
    hitCheck(PartyRaidMember5);
};
SetDrag(PartyRaidMember0);
SetDrag(PartyRaidMember1);
SetDrag(PartyRaidMember2);
SetDrag(PartyRaidMember3);
SetDrag(PartyRaidMember4);
SetDrag(PartyRaidMember5);
myListener.OnGameEventShowWindow("PartyWindowRaidInfo",1);
