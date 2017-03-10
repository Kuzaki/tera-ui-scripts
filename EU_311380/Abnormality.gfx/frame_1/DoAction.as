function alignTypeHandler(value)
{
    if(value != null)
    {
        alignType = value;
        resetContainerPos();
        if(value == 0)
        {
            slotStartX0 = slotStartX1 = -42;
            slotStartY0 = 0;
            slotStartY1 = 56;
            slotSpaceX = - SLOTSPACE;
            slotSpaceY = 0;
        }
        else if(value == 1)
        {
            slotStartX0 = slotStartX1 = 42;
            slotStartY0 = 0;
            slotStartY1 = 56;
            slotSpaceX = SLOTSPACE;
            slotSpaceY = 0;
        }
        else if(value == 2)
        {
            slotStartX0 = 0;
            slotStartX1 = 56;
            slotStartY0 = slotStartY1 = -42;
            slotSpaceX = 0;
            slotSpaceY = - SLOTSPACE - 10;
        }
        else if(value == 3)
        {
            slotStartX0 = 0;
            slotStartX1 = 56;
            slotStartY0 = slotStartY1 = 42;
            slotSpaceX = 0;
            slotSpaceY = SLOTSPACE + 10;
        }
        allRedrawContainer();
    }
}
function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE)
    {
        alignTypeHandler(event.value);
    }
}
function addBuff(id, type, group, iconName, bRelaxMerit, amount, remainTime, totalTime)
{
    var _loc5_ = getTimer();
    var _loc8_ = _loc5_ - (totalTime - remainTime);
    var _loc1_ = getBuffData(id,group);
    if(_loc1_ != undefined)
    {
        if(_loc1_.amount != amount)
        {
            _loc1_.amount = amount;
        }
        if(bRelaxMerit != _loc1_.bRelaxMerit)
        {
            _loc1_.bRelaxMerit = bRelaxMerit;
        }
    }
    else
    {
        var _loc2_ = groupBuffDatas[group];
        _loc1_ = {id:id,type:type,group:group,iconName:iconName,bRelaxMerit:bRelaxMerit,enableRelaxMerit:0,iconImg:flash.display.BitmapData.loadBitmap(iconName),amount:amount,remainTime:remainTime,totalTime:totalTime};
        if(bRelaxMerit == 1)
        {
            if(_loc2_[0].totalTime == 0)
            {
                var _loc7_ = _loc2_.shift();
                _loc2_.unshift(_loc1_);
                _loc2_.unshift(_loc7_);
            }
            else
            {
                _loc2_.unshift(_loc1_);
            }
        }
        else
        {
            _loc2_.push(_loc1_);
        }
    }
    _loc1_.bDraw = true;
    _loc1_.startTime = _loc8_;
    redrawContainer(group);
}
function removeBuff(id, group)
{
    var _loc5_ = groupBuffDatas[group];
    var _loc11_ = _loc5_.length;
    var _loc9_ = getBuffData(id,group);
    var _loc10_ = getBuffIndex(id,group);
    var _loc6_ = _loc9_.type;
    var _loc3_ = getContainer(group);
    _loc5_.splice(_loc10_,1);
    var _loc4_ = _loc3_["coolTime_ani" + _loc6_ + "_" + id];
    coolTimeManager.removeCoolTimeInstance(_loc4_);
    _loc4_.removeMovieClip();
    var _loc8_ = _loc3_["btn" + id];
    _loc8_._visible = false;
    var _loc7_ = _loc3_["amountTxt" + _loc6_ + "_" + id];
    _loc7_._visible = false;
    redrawContainer(group);
}
function getBuffData(id, group)
{
    var _loc2_ = groupBuffDatas[group];
    var _loc1_ = 0;
    while(_loc1_ < _loc2_.length)
    {
        if(_loc2_[_loc1_].id == id)
        {
            return _loc2_[_loc1_];
        }
        _loc1_ = _loc1_ + 1;
    }
    return undefined;
}
function getBuffIndex(id, group)
{
    var _loc2_ = groupBuffDatas[group];
    var _loc1_ = 0;
    while(_loc1_ < _loc2_.length)
    {
        if(_loc2_[_loc1_].id == id)
        {
            return _loc1_;
        }
        _loc1_ = _loc1_ + 1;
    }
    return -1;
}
function updateAmount(id, type, group, amount, bRelaxMerit)
{
    var _loc4_ = getContainer(group);
    var _loc1_ = _loc4_["amountTxt" + type + "_" + id];
    _loc1_._visible = true;
    if(type == 0)
    {
        _loc1_.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
    }
    else if(type == 1)
    {
        _loc1_.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF;
    }
    else if(type == 2)
    {
        _loc1_.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_WEAK;
    }
    else if(type == 3)
    {
        _loc1_.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_TICK;
    }
    else if(type == 4)
    {
        _loc1_.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_STUN;
    }
    if(amount > 1 || amount < 0)
    {
        if(amount < 0)
        {
            _loc1_.textColor = 13369345;
        }
        else
        {
            _loc1_.textColor = 16777215;
        }
    }
    else
    {
        amount = "";
    }
    _loc1_.text = String(amount);
}
function hideBuff(id, type, group)
{
    var _loc6_ = getBuffData(id,group);
    _loc6_.bDraw = false;
    var _loc1_ = getContainer(group);
    var _loc5_ = _loc1_["btn" + id];
    _loc5_._visible = false;
    var _loc2_ = _loc1_["amountTxt" + type + "_" + id];
    _loc2_._visible = false;
    redrawContainer(group);
}
function getContainer(group)
{
    var _loc1_ = container_mc.buffContainer;
    if(0 < group && bGroup[group])
    {
        _loc1_ = container_mc["group_" + group].buffContainer;
    }
    return _loc1_;
}
function updateCoolTime(id, type, group, remain, total)
{
    var _loc2_ = getContainer(group);
    var _loc1_ = _loc2_["coolTime_ani" + type + "_" + id];
    if(!(remain <= 0 || total <= 0))
    {
        _loc1_._visible = true;
        _loc1_.setCoolTime(remain,total);
        coolTimeManager.addCoolTimeInstance(_loc1_);
        _loc1_.coolTimeWarning.removeMovieClip();
    }
}
function alignGroupIcon()
{
    var _loc3_ = 0;
    var _loc1_ = 1;
    while(_loc1_ < MAX_GROUP_COUNT)
    {
        var _loc2_ = container_mc["group_" + _loc1_];
        var _loc4_ = groupBuffDatas[_loc1_];
        if(0 == _loc4_.length || false == bGroup[_loc1_])
        {
            _loc2_._visible = false;
        }
        else
        {
            _loc2_._visible = true;
            _loc2_._x = slotStartX0 + _loc3_ * slotSpaceX - 5;
            _loc2_._y = slotStartY0 + _loc3_ * slotSpaceY - 5;
            _loc3_ = _loc3_ + 1;
        }
        _loc1_ = _loc1_ + 1;
    }
}
function computePosX(count, type, drawType)
{
    var _loc1_ = 0;
    if(0 == drawType)
    {
        var _loc2_ = type >= 2?slotStartX1:slotStartX0;
        _loc1_ = _loc2_ + count * slotSpaceX;
    }
    else
    {
        _loc2_ = count % 4;
        _loc1_ = 6 + _loc2_ * SLOTSPACE;
    }
    return _loc1_;
}
function computePosY(count, type, drawType)
{
    var _loc1_ = 0;
    if(0 == drawType)
    {
        var _loc2_ = type >= 2?slotStartY1:slotStartY0;
        _loc1_ = _loc2_ + count * slotSpaceY;
    }
    else
    {
        _loc2_ = int(count / 4);
        _loc1_ = slotStartY2 + _loc2_ * 67;
    }
    return _loc1_;
}
function getStartBuffCount(group)
{
    var _loc3_ = 0;
    var _loc1_ = 1;
    while(_loc1_ < 4)
    {
        var _loc2_ = groupBuffDatas[_loc1_];
        if(bGroup[_loc1_] && 0 < _loc2_.length)
        {
            _loc3_ = _loc3_ + 1;
        }
        _loc1_ = _loc1_ + 1;
    }
    if(0 < group)
    {
        _loc2_ = groupBuffDatas[0];
        _loc1_ = 0;
        while(_loc1_ < _loc2_.length)
        {
            var _loc4_ = _loc2_[_loc1_];
            var _loc5_ = _loc4_.type;
            if(_loc5_ < 2)
            {
                _loc3_ = _loc3_ + 1;
            }
            _loc1_ = _loc1_ + 1;
        }
        _loc1_ = 1;
        while(_loc1_ < group)
        {
            if(!bGroup[_loc1_])
            {
                _loc2_ = groupBuffDatas[_loc1_];
                _loc3_ = _loc3_ + _loc2_.length;
            }
            _loc1_ = _loc1_ + 1;
        }
    }
    return _loc3_;
}
function drawSlot(group, bClearContainer)
{
    var _loc5_ = getContainer(group);
    if(bClearContainer)
    {
        _loc5_.clear();
    }
    var _loc28_ = groupBuffDatas[group];
    var _loc12_ = !bGroup[group]?0:1;
    var _loc16_ = 0;
    var _loc17_ = 0;
    if(_loc12_ == 0)
    {
        _loc16_ = getStartBuffCount(group);
    }
    var _loc9_ = 0;
    while(_loc9_ < _loc28_.length)
    {
        var _loc3_ = _loc28_[_loc9_];
        var _loc23_ = _loc3_.bDraw;
        if(_loc23_ != false)
        {
            var id = _loc3_.id;
            var type = _loc3_.type;
            var _loc29_ = _loc3_.remainTime;
            var _loc14_ = _loc3_.totalTime;
            var _loc27_ = _loc3_.amount;
            var _loc20_ = _loc3_.iconImg;
            var _loc10_ = _loc3_.iconName;
            var _loc11_ = _loc3_.bRelaxMerit;
            var _loc18_ = _loc3_.enableRelaxMerit;
            var _loc24_ = _loc3_.startTime;
            var _loc21_ = getTimer();
            var _loc25_ = _loc24_ + _loc14_ - _loc21_;
            var _loc7_ = 0;
            var _loc6_ = 0;
            if(type < 2)
            {
                _loc7_ = computePosX(_loc16_,type,_loc12_);
                _loc6_ = computePosY(_loc16_,type,_loc12_);
                _loc16_ = _loc16_ + 1;
            }
            else
            {
                _loc7_ = computePosX(_loc17_,type,_loc12_);
                _loc6_ = computePosY(_loc17_,type,_loc12_);
                _loc17_ = _loc17_ + 1;
            }
            lib.display.DrawBitmapData.draw(_loc5_,UI["iconFrameBm" + type],_loc7_,_loc6_,0,0,42,42,1);
            lib.display.DrawBitmapData.draw(_loc5_,_loc20_,_loc7_ + 2,_loc6_ + 2,0,0,38,38,0.6);
            var _loc4_ = _loc5_["btn" + id];
            if(_loc4_ == undefined)
            {
                _loc4_ = _loc5_.attachMovie("emptyBtn","btn" + id,_loc5_.getNextHighestDepth());
                if(false == bGroup[group])
                {
                    _loc4_.onPress = function()
                    {
                        var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
                        var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
                        UI.startDrag(false,-10,_loc2_ - 15,Stage.width - 30,_loc1_ - 50);
                    };
                    _loc4_.onRelease = function()
                    {
                        lib.info.AlignInfo.savePos(UI,true);
                        UI.stopDrag();
                    };
                }
                _loc4_.index = _loc9_;
                _loc4_.id = id;
                var _loc13_ = _loc10_.indexOf("__",0) + 2;
                var _loc15_ = _loc10_.substring(_loc13_,_loc10_.length);
                if(_loc13_ == 19)
                {
                    lib.manager.ToolTip.add(_loc4_,_loc15_,5);
                }
                else
                {
                    lib.manager.ToolTip.add(_loc4_,_loc15_,4);
                }
            }
            _loc4_._visible = true;
            _loc4_._x = _loc7_;
            _loc4_._y = _loc6_;
            var _loc8_ = _loc5_["amountTxt" + type + "_" + id];
            if(_loc8_ == undefined)
            {
                _loc8_ = creatTextfield(_loc5_,"amountTxt" + type + "_" + id,0,0,40,23,amountTextFormat);
                _loc8_.hitTestDisable = true;
            }
            _loc8_._visible = true;
            _loc8_._x = _loc7_ - 2;
            _loc8_._y = _loc6_ + 22;
            updateAmount(id,type,group,_loc27_,_loc11_);
            var _loc2_ = _loc5_["coolTime_ani" + type + "_" + id];
            if(_loc2_ == undefined)
            {
                _loc2_ = _loc5_.attachMovie("coolTime_ani","coolTime_ani" + type + "_" + id,_loc5_.getNextHighestDepth());
                _loc2_.id = id;
                _loc2_.type = type;
                _loc2_.group = group;
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
                _loc2_.onFinished = function()
                {
                    updateCoolTime(this.id,this.type,this.group,0,0);
                };
            }
            _loc2_._x = _loc7_ + 2;
            _loc2_._y = _loc6_ + 2;
            if(_loc11_ != 1 && _loc2_.coolTime == undefined)
            {
                updateCoolTime(id,type,group,_loc25_,_loc14_);
            }
            else if(_loc11_ == 1 && _loc18_ != 1)
            {
                lib.display.DrawBitmapData.draw(_loc5_,disableBmData,_loc7_ + 2,_loc6_ + 2,0,0,38,38,1);
            }
        }
        _loc9_ = _loc9_ + 1;
    }
}
function creatTextfield(container, tname, tx, ty, tw, th, tforamt)
{
    var _loc1_ = container[tname];
    if(_loc1_ == undefined)
    {
        _loc1_ = container.createTextField(tname,container.getNextHighestDepth(),tx,ty,tw,th);
        _loc1_.hitTestDisable = true;
        _loc1_.border = false;
        _loc1_.background = false;
        _loc1_.selectable = false;
        _loc1_.wordWrap = false;
        _loc1_.type = "dynamic";
        _loc1_.multiline = false;
        _loc1_.html = true;
        _loc1_.antiAliasType = "normal";
        _loc1_.setNewTextFormat(tforamt);
        _loc1_._visible = false;
        _loc1_.shadowColor = 0;
        _loc1_.shadowBlurX = 1.7;
        _loc1_.shadowBlurY = 1.7;
        _loc1_.shadowStrength = 5;
        _loc1_.shadowDistance = 0;
        _loc1_.shadowAngle = 90;
    }
    _loc1_._x = tx;
    _loc1_._y = ty;
}
function clearContainer(group)
{
    var _loc5_ = getContainer(group);
    var _loc9_ = groupBuffDatas[group];
    var _loc3_ = 0;
    while(_loc3_ < _loc9_.length)
    {
        var _loc6_ = _loc9_[_loc3_];
        var _loc2_ = _loc6_.id;
        var _loc4_ = _loc6_.type;
        var _loc8_ = _loc5_["btn" + _loc2_];
        _loc8_._visible = false;
        var _loc7_ = _loc5_["amountTxt" + _loc4_ + "_" + _loc2_];
        _loc7_._visible = false;
        var _loc1_ = _loc5_["coolTime_ani" + _loc4_ + "_" + _loc2_];
        if(_loc1_)
        {
            _loc1_.coolTimeWarning.removeMovieClip();
            coolTimeManager.removeCoolTimeInstance(_loc1_);
            delete register1.coolTime;
            _loc1_.removeMovieClip();
        }
        _loc1_ = _loc5_["coolTime_ani" + _loc4_ + "_" + _loc2_];
        _loc3_ = _loc3_ + 1;
    }
}
function computeGroupBgPosition(target)
{
    var _loc6_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
    var _loc7_ = (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
    var _loc2_ = new Object();
    var _loc3_ = target.bg._height;
    if(alignType == 0 || alignType == 1)
    {
        var _loc5_ = -5;
        var _loc4_ = -1 * _loc3_;
        target.bg._x = _loc5_;
        target.bg._y = _loc4_;
        target.buffContainer._x = target.inBg._x = _loc5_ + 12;
        target.buffContainer._y = target.inBg._y = _loc4_ + 2;
        _loc2_.x = _loc5_ + target.bg._width - 10;
        _loc2_.y = _loc4_;
        target.localToGlobal(_loc2_);
        if(Stage.width - _loc6_ < _loc2_.x)
        {
            target.bg._x = -165;
            target.buffContainer._x = target.inBg._x = -153;
        }
        if(_loc2_.y < -1 * _loc7_)
        {
            target.bg._y = 52;
            target.buffContainer._y = target.inBg._y = 54;
        }
    }
    else
    {
        _loc5_ = -212;
        _loc4_ = 5;
        target.bg._x = _loc5_;
        target.bg._y = _loc4_;
        target.buffContainer._x = target.inBg._x = _loc5_ + 12;
        target.buffContainer._y = target.inBg._y = _loc4_ + 2;
        _loc2_.x = _loc5_ + 10;
        _loc2_.y = _loc4_ + _loc3_;
        target.localToGlobal(_loc2_);
        if(_loc2_.x < -1 * _loc6_)
        {
            target.bg._x = 42;
            target.buffContainer._x = target.inBg._x = 54;
        }
        if(Stage.height - _loc7_ < _loc2_.y)
        {
            target.bg._y = 47 - _loc3_;
            target.buffContainer._y = target.inBg._y = 47 - _loc3_ + 2;
        }
    }
}
function drawGroupBg(group)
{
    var _loc5_ = getContainer(group);
    _loc5_.clear();
    var _loc2_ = _loc5_._parent.inBg;
    for(var _loc1_ in _loc2_)
    {
        if(typeof _loc2_[_loc1_] == "movieclip")
        {
            _loc2_[_loc1_]._visible = false;
        }
    }
    var _loc7_ = groupBuffDatas[group];
    var _loc6_ = _loc7_.length;
    var _loc9_ = 4;
    var _loc4_ = int(_loc6_ / 4);
    if(0 < _loc6_ % 4)
    {
        _loc4_ = _loc4_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < _loc4_)
    {
        var _loc3_ = _loc2_["inBg_" + _loc1_];
        if(_loc3_)
        {
            _loc3_._visible = true;
        }
        else
        {
            _loc3_ = _loc2_.attachMovie("group_bg_in","inBg_" + _loc1_,_loc2_.getNextHighestDepth());
            _loc3_._y = 67 * _loc1_;
        }
        _loc1_ = _loc1_ + 1;
    }
    var _loc8_ = 67 * _loc4_ + 4;
    _loc5_._parent.bg._height = _loc8_;
    computeGroupBgPosition(_loc5_._parent);
}
function redrawContainer(group)
{
    alignGroupIcon();
    if(bGroup[group])
    {
        drawGroupBg(group);
        drawSlot(group,false);
    }
    var _loc3_ = groupBuffDatas[group];
    if(false == bGroup[group] || 1 == _loc3_.length || 0 == _loc3_.length)
    {
        container_mc.buffContainer.clear();
        var _loc1_ = 0;
        while(_loc1_ < 4)
        {
            if(false == bGroup[_loc1_])
            {
                drawSlot(_loc1_,false);
            }
            _loc1_ = _loc1_ + 1;
        }
    }
}
function allRedrawContainer()
{
    var _loc2_ = -1;
    var _loc1_ = 0;
    while(_loc1_ < 4)
    {
        if(bGroup[_loc1_])
        {
            redrawContainer(_loc1_);
        }
        else
        {
            _loc2_ = _loc1_;
        }
        _loc1_ = _loc1_ + 1;
    }
    if(-1 != _loc2_)
    {
        redrawContainer(_loc2_);
    }
}
function init()
{
    var _loc2_ = 1;
    while(_loc2_ < 4)
    {
        var _loc1_ = container_mc["group_" + _loc2_];
        _loc1_._visible = false;
        _loc1_.inBg._visible = false;
        _loc1_.bg._visible = false;
        _loc1_.buffContainer._visible = false;
        _loc1_.gotoAndStop(_loc2_);
        setGroupMouseEvent(_loc1_);
        _loc2_ = _loc2_ + 1;
    }
}
function setGroupMouseEvent(target)
{
    target.onPress = function()
    {
        var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
        var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
        UI.startDrag(false,-10,_loc2_ - 15,Stage.width - 30,_loc1_ - 50);
    };
    target.onRelease = function()
    {
        lib.info.AlignInfo.savePos(UI,true);
        UI.stopDrag();
        var _loc1_ = 1;
        while(_loc1_ < 4)
        {
            if(false != bGroup[_loc1_])
            {
                var _loc2_ = container_mc["group_" + _loc1_];
                computeGroupBgPosition(_loc2_);
            }
            _loc1_ = _loc1_ + 1;
        }
    };
    target.onRollOver = function()
    {
        this.buffContainer._visible = true;
        this.inBg._visible = true;
        this.bg._visible = true;
        this.icon.gotoAndStop(2);
        this.iconBg.gotoAndStop(2);
    };
    target.onRollOut = function()
    {
        this.buffContainer._visible = false;
        this.inBg._visible = false;
        this.bg._visible = false;
        this.icon.gotoAndStop(1);
        this.iconBg.gotoAndStop(1);
    };
}
function ToGame_AbnormalityOption_RequestOpen()
{
    var _loc2_ = UI._x;
    var _loc1_ = UI._y;
    if(origX != _loc2_ || origY != _loc1_)
    {
        return undefined;
    }
    fscommand("ToGame_AbnormalityOption_RequestOpen");
}
var UI = this;
UI._visible = false;
var UIname = "Abnormality";
var bWindowOpen = true;
container_mc.UIDrager._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var slotStartX0 = 0;
var slotStartX1 = 0;
var slotStartX2 = 10;
var slotStartY0 = 0;
var slotStartY1 = 56;
var slotStartY2 = 6;
var SLOTSPACE = 48;
var SLOTSPACEY = 65;
var SLOTSIZE = 42;
var groupBuffDatas = [];
groupBuffDatas[0] = [];
groupBuffDatas[1] = [];
groupBuffDatas[2] = [];
groupBuffDatas[3] = [];
var alignType = 0;
var slotSpaceX;
var slotSpaceY;
var bGroup = [false,false,false,false];
var origX = 0;
var origY = 0;
var optionBtn = new lib.util.TxtBtn(container_mc.optionBtn);
optionBtn.setRelease(ToGame_AbnormalityOption_RequestOpen);
container_mc.optionBtn.onPress2 = function()
{
    origX = UI._x;
    origY = UI._y;
    var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
    var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
    UI.startDrag(false,-10,_loc2_ - 15,Stage.width - 30,_loc1_ - 50);
};
container_mc.optionBtn.onRelease2 = function()
{
    lib.info.AlignInfo.savePos(UI,true);
    UI.stopDrag();
};
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE,this,"alignTypeHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = bShow;
        UI._visible = bShow;
        var _loc1_ = new lib.controls.CustomScaleEvent();
        _loc1_.CustomScaleEventCheck(UI,UIname);
    }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
    if(!_global.gbUIMode)
    {
    }
};
myListener.OnGame_Abnormality_AddBuff = function(id, amount, type, group, bRelaxMerit, iconImg, remainTime, totalTime)
{
    type = Number(type);
    group = Number(group);
    remainTime = Math.abs(Number(remainTime));
    totalTime = Math.abs(Number(totalTime));
    amount = Number(amount);
    bRelaxMerit = Number(bRelaxMerit);
    addBuff(id,type,group,iconImg,bRelaxMerit,amount,remainTime,totalTime);
};
var bgImgBm = flash.display.BitmapData.loadBitmap("bgImg0");
var lineImgBm = flash.display.BitmapData.loadBitmap("bgImg1");
var iconFrameBm0 = flash.display.BitmapData.loadBitmap("slotFrame0");
var iconFrameBm1 = iconFrameBm0;
var iconFrameBm2 = flash.display.BitmapData.loadBitmap("slotFrame2");
var iconFrameBm3 = flash.display.BitmapData.loadBitmap("slotFrame3");
var iconFrameBm4 = flash.display.BitmapData.loadBitmap("slotFrame4");
var disableBmData = flash.display.BitmapData.loadBitmap("buffDisable");
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
var MAX_GROUP_COUNT = 4;
var amountTextFormat = new TextFormat("$NormalFont",13,16777215,false,false,false,null,null,"right",0,0,0,0);
myListener.OnGame_Abnormality_UpdateBuff = function(id, group, stackCnt, useRelaxMerit, img, remain, total)
{
    remain = Number(remain);
    total = Number(total);
    group = Number(group);
    stackCnt = Number(stackCnt);
    var _loc1_ = getBuffData(id,group);
    if(undefined != _loc1_)
    {
        var _loc5_ = _loc1_.bRelaxMerit;
        var _loc8_ = _loc1_.type;
        _loc1_.enableRelaxMerit = Number(useRelaxMerit);
        if(Number(useRelaxMerit) == 1 || _loc5_ == 0)
        {
            if(isNaN(remain))
            {
                remain = _loc1_.remainTime;
            }
            if(isNaN(total))
            {
                total = _loc1_.totalTime;
            }
            updateCoolTime(id,_loc8_,group,remain,total);
        }
    }
    myListener.OnGame_Abnormality_AddBuff(id,stackCnt,undefined,group,_loc5_,img,remain,total);
};
myListener.OnGame_Abnormality_RemoveBuff = function(id, group)
{
    removeBuff(id,group);
};
myListener.OnGame_Abnormality_ClearBuff = function(type)
{
    type = Number(type);
    var _loc4_ = [];
    var _loc5_ = 0;
    while(_loc5_ < 4)
    {
        var _loc3_ = groupBuffDatas[_loc5_];
        var _loc2_ = 0;
        while(_loc2_ < _loc3_.length)
        {
            var _loc1_ = new Object();
            _loc1_.id = _loc3_[_loc2_].id;
            _loc1_.group = _loc5_;
            if(isNaN(type))
            {
                _loc4_.push(_loc1_);
            }
            else if(_loc3_[_loc2_].type == type)
            {
                _loc4_.push(_loc1_);
            }
            _loc2_ = _loc2_ + 1;
        }
        _loc5_ = _loc5_ + 1;
    }
    var _loc7_ = _loc4_.length;
    _loc5_ = _loc7_ - 1;
    while(_loc5_ >= 0)
    {
        removeBuff(_loc4_[_loc5_].id,_loc4_[_loc5_].group);
        _loc5_ = _loc5_ - 1;
    }
};
myListener.OnGame_abnormality_HoldBuff = function(id, group)
{
    var _loc1_ = getBuffData(id,group);
    updateCoolTime(id,_loc1_.type,group,-1,-1);
};
myListener.OnGameEventEnableRelaxMeritIcon = function(id, group, bEnable)
{
    bEnable = Number(bEnable);
    var _loc2_ = getBuffData(id,group);
    _loc2_.enableRelaxMerit = bEnable;
    redrawContainer(group);
};
myListener.OnGame_AbnormalityOption_SetOption = function(optionData)
{
    var _loc5_ = false;
    var _loc6_ = lib.util.ExtString.split(optionData,"\t");
    var _loc1_ = 0;
    while(_loc1_ < 3)
    {
        var _loc3_ = Boolean(Number(_loc6_[_loc1_]));
        var _loc2_ = _loc1_ + 1;
        var _loc4_ = bGroup[_loc2_];
        if(_loc3_ != _loc4_)
        {
            _loc5_ = true;
            clearContainer(_loc2_);
            bGroup[_loc2_] = _loc3_;
        }
        _loc1_ = _loc1_ + 1;
    }
    if(_loc5_)
    {
        allRedrawContainer();
    }
};
init();
stop();
