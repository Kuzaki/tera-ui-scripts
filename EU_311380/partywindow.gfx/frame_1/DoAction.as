var UI = this;
UI._visible = false;
var UIname = "PartyWindow";
var con = this;
var bWidgetOpen = false;
var myListener = new Object();
function getPartyWindowByParamIndex(paramIndex)
{
    lib.Debuger.trace("paramIndex : " + paramIndex);
    var _loc3_ = 0;
    while(_loc3_ < partyMemberTotalNum)
    {
        var _loc2_ = this["mc_PartyWindow" + _loc3_];
        if(_loc2_.paramIndex == paramIndex)
        {
            lib.Debuger.trace("mc.param ttpe : " + typeof _loc2_.paramIndex);
            lib.Debuger.trace("mc.paramIndex : " + _loc2_.paramIndex);
            return _loc2_;
        }
        _loc3_ = _loc3_ + 1;
    }
    _loc3_ = 0;
    while(_loc3_ < partyMemberTotalNum)
    {
        _loc2_ = this["mc_PartyWindow" + _loc3_];
        if(_loc2_.paramIndex == undefined)
        {
            lib.Debuger.trace("mc.paramIndex : " + _loc2_.paramIndex);
            _loc2_.paramIndex = paramIndex;
            return _loc2_;
        }
        _loc3_ = _loc3_ + 1;
    }
    return null;
}
function checkOutofStage()
{
    var _loc2_ = 0;
    while(_loc2_ < partyMemberTotalNum)
    {
        var _loc1_ = con["mc_PartyWindow" + _loc2_];
        var _loc4_ = lib.info.AlignInfo.xPixelToRatio(_loc1_._x + _loc1_._width);
        var _loc3_ = lib.info.AlignInfo.yPixelToRatio(_loc1_._y + _loc1_._height);
        if(_loc1_._x < 0)
        {
            _loc1_._x = lib.info.AlignInfo.zeroPointX;
        }
        if(_loc4_ > 100)
        {
            _loc1_._x = lib.info.AlignInfo.xRatioToPixel(100) - _loc1_._width;
        }
        if(_loc1_._y < 0)
        {
            _loc1_._y = lib.info.AlignInfo.zeroPointY;
        }
        else if(_loc3_ > 100)
        {
            _loc1_._y = lib.info.AlignInfo.yRatioToPixel(100) - _loc1_._height;
        }
        _loc2_ = _loc2_ + 1;
    }
}
function init()
{
    var _loc6_ = 0;
    while(_loc6_ < partyMemberTotalNum)
    {
        var _loc5_ = UI["mc_PartyWindow" + _loc6_];
        var _loc7_ = _loc5_.buff_container;
        _loc7_.slotCount = 0;
        _loc7_.debuffSlotCount = 0;
        var _loc3_ = 0;
        while(_loc3_ < MAX_GROUP_COUNT)
        {
            var _loc2_ = _loc5_["group_" + _loc3_];
            _loc2_.base = _loc5_;
            _loc2_.buffArray = [];
            _loc2_.buffContainer.slotCount = 0;
            _loc2_.buffContainer.debuffSlotCount = 0;
            _loc2_._visible = false;
            _loc2_.bg._visible = false;
            _loc2_.buffContainer._visible = false;
            if(0 < _loc3_)
            {
                _loc2_.gotoAndStop(_loc3_);
            }
            _loc2_.onRollOver = function()
            {
                var _loc2_ = this.base;
                if(_loc2_ != curHighestDepthMc)
                {
                    _loc2_.swapDepths(curHighestDepthMc);
                    curHighestDepthMc = _loc2_;
                }
                this.icon.gotoAndStop(2);
                this.iconBg.gotoAndStop(2);
                this.bg._visible = true;
                this.inBg._visible = true;
                this.buffContainer._visible = true;
            };
            _loc2_.onRollOut = function()
            {
                this.icon.gotoAndStop(1);
                this.iconBg.gotoAndStop(1);
                this.bg._visible = false;
                this.inBg._visible = true;
                this.buffContainer._visible = false;
            };
            _loc3_ = _loc3_ + 1;
        }
        _loc6_ = _loc6_ + 1;
    }
}
function getContainer(partyIndex, group)
{
    var _loc1_ = UI["mc_PartyWindow" + partyIndex];
    var _loc2_ = _loc1_.buff_container;
    var _loc3_ = !bGroup[group]?_loc2_:_loc1_["group_" + group].buffContainer;
    return _loc3_;
}
function getDatas(partyIndex, group)
{
    var _loc1_ = UI["mc_PartyWindow" + partyIndex];
    var _loc2_ = _loc1_["group_" + group];
    return _loc2_.buffArray;
}
function getBuffData(partyIndex, id, group)
{
    var _loc2_ = getDatas(partyIndex,group);
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
function redrawParty(group)
{
    var _loc1_ = 0;
    while(_loc1_ < partyMemberTotalNum)
    {
        redrawGroup(_loc1_,group);
        if(bGroup[group])
        {
            buffAlign(_loc1_,group);
        }
        _loc1_ = _loc1_ + 1;
    }
}
function redrawGroup(partyIndex, group)
{
    var _loc16_ = UI["mc_PartyWindow" + partyIndex];
    var _loc17_ = getContainer(partyIndex,group);
    var _loc12_ = getDatas(partyIndex,group);
    var _loc2_ = 0;
    while(_loc2_ < _loc12_.length)
    {
        var _loc1_ = _loc12_[_loc2_];
        var _loc4_ = _loc1_.id;
        var _loc11_ = _loc1_.type;
        var _loc6_ = _loc1_.stackCnt;
        var _loc7_ = _loc1_.bRelaxMerit;
        var _loc8_ = _loc1_.img;
        var _loc13_ = _loc1_.remain;
        var _loc3_ = _loc1_.total;
        var _loc9_ = _loc1_.startTime;
        var _loc5_ = getTimer();
        var _loc10_ = _loc9_ + _loc3_ - _loc5_;
        drawSlot(partyIndex,group,_loc4_,_loc11_,_loc6_,_loc7_,_loc8_,_loc10_,_loc3_);
        _loc2_ = _loc2_ + 1;
    }
}
function createSlot(targetContainer, slotType)
{
    var _loc3_ = SLOT_TYPE_BUFF != slotType?targetContainer.debuffSlotCount:targetContainer.slotCount;
    var _loc4_ = SLOT_TYPE_BUFF != slotType?"deSlot_":"slot_";
    var _loc2_ = targetContainer.attachMovie("Slot_link",_loc4_ + _loc3_,targetContainer.getNextHighestDepth());
    _loc2_.drag = false;
    if(SLOT_TYPE_BUFF == slotType)
    {
        targetContainer.slotCount++;
    }
    else
    {
        targetContainer.debuffSlotCount++;
    }
    return _loc2_;
}
function clearSlotByIndex(targetContainer, slotType, index, bFromIndex)
{
    var _loc4_ = SLOT_TYPE_BUFF != slotType?"deSlot_":"slot_";
    if(false == bFromIndex)
    {
        var _loc7_ = targetContainer[_loc4_ + index];
        clearSlotByTarget(_loc7_);
        return undefined;
    }
    var _loc5_ = SLOT_TYPE_BUFF != slotType?targetContainer.debuffSlotCount:targetContainer.slotCount;
    var _loc1_ = index;
    while(_loc1_ < _loc5_)
    {
        var _loc2_ = targetContainer[_loc4_ + _loc1_];
        clearSlotByTarget(_loc2_);
        _loc1_ = _loc1_ + 1;
    }
}
function clearSlotByTarget(targetSlot)
{
    targetSlot.stack.text = "";
    targetSlot.partyIndex = null;
    targetSlot.group = null;
    targetSlot.id = null;
    targetSlot.type = null;
    clearSlotCoolTime(targetSlot);
    lib.manager.ToolTip.remove(targetSlot.SLOT);
    targetSlot._visible = false;
}
function clearSlotCoolTime(targetSlot)
{
    targetSlot.warn = false;
    lib.util.Warning.remove(targetSlot,true);
    targetSlot._alpha = 100;
    targetSlot.cool.remove();
    delete targetSlot.cool.onTick;
    delete targetSlot.cool.onFinished;
    targetSlot.cool.onTick = null;
    targetSlot.cool.onFinished = null;
    delete targetSlot.cool;
    targetSlot.cool = null;
    targetSlot.Count.txt.text = "";
    targetSlot.CoolTime.clear();
    targetSlot.CoolTime._visible = false;
}
function drawSlot(targetSlot, buffObj)
{
    clearSlotByTarget(targetSlot);
    var _loc10_ = getTimer();
    var _loc14_ = buffObj.partyIndex;
    var _loc15_ = UI["mc_PartyWindow" + _loc14_];
    var paramIndex = _loc15_.paramIndex;
    var id = buffObj.id;
    var _loc5_ = buffObj.type;
    var group = buffObj.group;
    var _loc3_ = buffObj.img;
    var _loc4_ = buffObj.stackCnt;
    var _loc7_ = buffObj.bRelaxMerit;
    var _loc16_ = buffObj.startTime;
    var _loc6_ = buffObj.total;
    var _loc8_ = _loc16_ + _loc6_ - _loc10_;
    var _loc12_ = textFdColorArr[_loc5_];
    var _loc13_ = 1 >= _loc5_?1:_loc5_ + 1;
    targetSlot.Count.txt.textColor = _loc12_;
    targetSlot.frame_mc.gotoAndStop(_loc13_);
    if(_loc4_ < 0 || 1 < _loc4_)
    {
        targetSlot.stack.text = _loc4_;
        targetSlot.stack.textColor = _loc4_ >= 0?16777215:13369345;
    }
    if(_loc7_ != 1)
    {
        if(0 != _loc6_)
        {
            if(_loc8_ <= 0)
            {
                myListener.OnGame_PartyWindow_RemoveBuff(paramIndex,id,group);
            }
            else
            {
                targetSlot.CoolTime._visible = true;
                targetSlot.Count._visible = true;
                targetSlot.cool = new lib.util.CoolTime(_loc8_,_loc6_);
                targetSlot.cool.onTick = function()
                {
                    targetSlot.Count.txt.text = this.getCountText();
                    if(this.getSecond() <= 3 && targetSlot.warn == false)
                    {
                        lib.util.Warning.add(targetSlot);
                        targetSlot.warn = true;
                    }
                    lib.util.CoolTime.draw(targetSlot.CoolTime,28,28,this.getDgree(),0,45,true);
                };
                targetSlot.cool.onFinished = function()
                {
                    myListener.OnGame_PartyWindow_RemoveBuff(paramIndex,id,group);
                    clearSlotCoolTime();
                };
            }
        }
    }
    else
    {
        disableTrans = lib.info.ColorTrans.disableTrans();
        var _loc11_ = new flash.geom.Transform(targetSlot.Icon);
        _loc11_.colorTransform = disableTrans;
    }
    targetSlot.id = id;
    targetSlot.type = _loc5_;
    targetSlot.draw(_loc3_,28,28);
    targetSlot.Count.txt.textAutoSize = "fit";
    if(_loc7_ == 1)
    {
        var _loc17_ = _loc3_.substring(19,_loc3_.length);
        lib.manager.ToolTip.add(targetSlot.SLOT,_loc17_,5,maked.Icon);
    }
    else
    {
        var _loc9_ = _loc3_.substring(20,_loc3_.length);
        lib.manager.ToolTip.add(targetSlot.SLOT,_loc9_,4,maked.Icon);
    }
    targetSlot._visible = true;
}
function addBuff(partyIndex, id, stackCnt, type, group, bRelaxMerit, img, remain, total, curTime)
{
    var _loc8_ = getDatas(partyIndex,group);
    var _loc1_ = getBuffData(partyIndex,id,group);
    if(undefined == _loc1_)
    {
        _loc1_ = {partyIndex:partyIndex,id:id,stackCnt:stackCnt,type:type,group:group,bRelaxMerit:bRelaxMerit,img:img,remain:remain,total:total};
        var _loc11_ = curTime - (total - remain);
        _loc1_.startTime = _loc11_;
        _loc8_.push(_loc1_);
    }
    else
    {
        updateBuff(_loc1_,partyIndex,id,stackCnt,type,group,bRelaxMerit,img,remain,total,curTime);
    }
}
function updateBuff(targetObj, partyIndex, id, stackCnt, type, group, bRelaxMerit, img, remain, total, curTime)
{
    if(undefined == targetObj)
    {
        return undefined;
    }
    var _loc2_ = curTime - (total - remain);
    targetObj.partyIndex = partyIndex;
    targetObj.id = id;
    targetObj.stackCnt = stackCnt;
    targetObj.type = type;
    targetObj.group = group;
    targetObj.bRelaxMerit = bRelaxMerit;
    targetObj.img = img;
    targetObj.remain = remain;
    targetObj.total = total;
    targetObj.startTime = _loc2_;
}
function removeBuff(partyIndex, id, group)
{
    var _loc2_ = getDatas(partyIndex,group);
    var _loc3_ = _loc2_.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        if(id == _loc2_[_loc1_].id)
        {
            _loc2_.splice(_loc1_,1);
            break;
        }
        _loc1_ = _loc1_ + 1;
    }
}
function groupButtonAlign(partyIndex)
{
    var _loc7_ = 0;
    var _loc9_ = UI["mc_PartyWindow" + partyIndex];
    var _loc2_ = 1;
    while(_loc2_ < 4)
    {
        var _loc5_ = getContainer(partyIndex,_loc2_);
        var _loc3_ = getDatas(partyIndex,_loc2_);
        if(false == bGroup[_loc2_] || 0 == _loc3_.length)
        {
            var _loc6_ = _loc9_["group_" + _loc2_];
            _loc6_._visible = false;
        }
        else
        {
            var _loc1_ = 0;
            while(_loc1_ < _loc3_.length)
            {
                var _loc4_ = _loc3_[_loc1_];
                _loc1_ = _loc1_ + 1;
            }
            _loc5_._parent._visible = true;
            _loc5_._parent._x = 21 + _loc7_ * 34;
            _loc7_ = _loc7_ + 1;
        }
        _loc2_ = _loc2_ + 1;
    }
    return _loc7_;
}
function buffAlign(partyIndex, group)
{
    var _loc2_ = getDatas(partyIndex,group);
    if(bGroup[group])
    {
        buffAlignForGroup(partyIndex,group);
    }
    if(false == bGroup[group] || 0 == _loc2_.length || 1 == _loc2_.length)
    {
        buffAlignForNotGroup(partyIndex);
    }
}
function isDebuff(type)
{
    var _loc1_ = type >= 2?true:false;
    return _loc1_;
}
function buffAlignForNotGroup(partyIndex)
{
    var _loc20_ = UI["mc_PartyWindow" + partyIndex];
    var _loc14_ = new Array();
    var _loc10_ = new Array();
    var _loc11_ = new Array();
    var _loc15_ = new Array();
    var _loc9_ = new Array();
    var _loc8_ = new Array();
    var _loc4_ = 0;
    while(_loc4_ < MAX_GROUP_COUNT)
    {
        datas = getDatas(partyIndex,_loc4_);
        if(!(bGroup[_loc4_] || 0 == datas.length))
        {
            var _loc1_ = 0;
            while(_loc1_ < datas.length)
            {
                var _loc6_ = datas[_loc1_];
                var _loc13_ = _loc6_.type;
                var _loc2_ = _loc6_.bRelaxMerit;
                if(isDebuff(_loc13_))
                {
                    if(_loc2_)
                    {
                        _loc9_.push(_loc6_);
                    }
                    else
                    {
                        _loc8_.push(_loc6_);
                    }
                }
                else if(_loc2_)
                {
                    _loc10_.push(_loc6_);
                }
                else
                {
                    _loc11_.push(_loc6_);
                }
                _loc1_ = _loc1_ + 1;
            }
        }
        _loc4_ = _loc4_ + 1;
    }
    _loc14_ = _loc10_.concat(_loc11_);
    _loc15_ = _loc9_.concat(_loc8_);
    var _loc5_ = _loc20_.buff_container;
    var _loc17_ = _loc14_.length;
    var _loc16_ = _loc15_.length;
    var _loc22_ = _loc5_.slotCount;
    var _loc21_ = _loc5_.debuffSlotCount;
    clearSlotByIndex(_loc5_,SLOT_TYPE_BUFF,_loc17_,true);
    clearSlotByIndex(_loc5_,SLOT_TYPE_DEBUFF,_loc16_,true);
    var _loc19_ = groupButtonAlign(partyIndex);
    _loc4_ = 0;
    while(_loc4_ < _loc17_)
    {
        var _loc3_ = _loc5_["slot_" + _loc4_];
        _loc6_ = _loc14_[_loc4_];
        var _loc12_ = _loc6_.id;
        _loc13_ = _loc6_.type;
        if(undefined == _loc3_)
        {
            _loc3_ = createSlot(_loc5_,SLOT_TYPE_BUFF);
        }
        drawSlot(_loc3_,_loc6_);
        var _loc7_ = (_loc4_ + _loc19_) * 34;
        _loc3_._x = _loc7_;
        _loc3_._y = 0;
        _loc4_ = _loc4_ + 1;
    }
    _loc4_ = 0;
    while(_loc4_ < _loc16_)
    {
        _loc3_ = _loc5_["deSlot_" + _loc4_];
        _loc6_ = _loc15_[_loc4_];
        _loc12_ = _loc6_.id;
        _loc13_ = _loc6_.type;
        if(undefined == _loc3_)
        {
            _loc3_ = createSlot(_loc5_,SLOT_TYPE_DEBUFF);
        }
        drawSlot(_loc3_,_loc6_);
        _loc3_._x = _loc4_ * (buffGap + buffWidth);
        _loc3_._y = 46;
        _loc4_ = _loc4_ + 1;
    }
}
function buffAlignForGroup(partyIndex, group)
{
    var _loc7_ = getContainer(partyIndex,group);
    var _loc8_ = getDatas(partyIndex,group);
    var _loc11_ = new Array();
    var _loc13_ = new Array();
    var _loc14_ = new Array();
    var _loc1_ = 0;
    while(_loc1_ < _loc8_.length)
    {
        var _loc3_ = _loc8_[_loc1_];
        var _loc6_ = _loc3_.bRelaxMerit;
        if(_loc6_)
        {
            _loc13_.push(_loc3_);
        }
        else
        {
            _loc14_.push(_loc3_);
        }
        _loc1_ = _loc1_ + 1;
    }
    _loc11_ = _loc13_.concat(_loc14_);
    var _loc18_ = _loc7_.slotCount;
    var _loc12_ = _loc11_.length;
    var _loc15_ = 0;
    clearSlotByIndex(_loc7_,SLOT_TYPE_BUFF,_loc12_,true);
    _loc1_ = 0;
    while(_loc1_ < _loc12_)
    {
        var _loc2_ = _loc7_["slot_" + _loc1_];
        _loc3_ = _loc11_[_loc1_];
        var _loc9_ = _loc3_.id;
        var _loc10_ = _loc3_.type;
        if(undefined == _loc2_)
        {
            _loc2_ = createSlot(_loc7_,SLOT_TYPE_BUFF);
        }
        drawSlot(_loc2_,_loc3_);
        var _loc5_ = 4 + _loc1_ % 4 * 34;
        var _loc4_ = 4 + int(_loc1_ / 4) * 47;
        _loc2_._x = _loc5_;
        _loc2_._y = _loc15_ = _loc4_;
        _loc1_ = _loc1_ + 1;
    }
    _loc7_._parent.bg._height = _loc15_ + 47;
}
function clearAllContainer(partyIndex)
{
    var _loc3_ = UI["mc_PartyWindow" + partyIndex];
    var _loc4_ = _loc3_.buff_container;
    clearSlotByIndex(_loc4_,SLOT_TYPE_BUFF,0,true);
    clearSlotByIndex(_loc4_,SLOT_TYPE_DEBUFF,0,true);
    groupButtonAlign(partyIndex);
    var _loc1_ = 0;
    while(_loc1_ < MAX_GROUP_COUNT)
    {
        var _loc2_ = _loc3_["group_" + _loc1_];
        clearSlotByIndex(_loc2_.buffContainer,SLOT_TYPE_BUFF,0,true);
        clearSlotByIndex(_loc2_.buffContainer,SLOT_TYPE_DEBUFF,0,true);
        _loc1_ = _loc1_ + 1;
    }
}
function clearContainer(partyIndex, group)
{
    var _loc1_ = getContainer(partyIndex,group);
    clearSlotByIndex(_loc1_,SLOT_TYPE_BUFF,0,true);
    clearSlotByIndex(_loc1_,SLOT_TYPE_DEBUFF,0,true);
}
function setHeal(targetMember, amount)
{
    this["mc_PartyWindow" + targetMember].heal = amount;
    animateHealHP(targetMember);
    checkWarning(targetMember);
}
function setDemage(targetMember, amount)
{
    this["mc_PartyWindow" + targetMember].demage = amount;
    animateHP(targetMember);
    checkWarning(targetMember);
}
function checkWarning(targetMember)
{
    var _loc2_ = this["mc_PartyWindow" + targetMember];
    if(_loc2_.currentEnergy <= 25)
    {
        animateWarning(targetMember,true);
        _loc2_.isWarning = true;
    }
    if(_loc2_.currentEnergy > 25)
    {
        animateWarning(targetMember,false);
        _loc2_.isWarning = false;
    }
}
function animateWarning(targetMember, warning)
{
    var _loc2_ = this["mc_PartyWindow" + targetMember];
    warning;
    if(warning)
    {
        _loc2_.MC_party_warning._visible = true;
        _loc2_.MC_party_warning2._visible = true;
        lib.util.Warning.add(_loc2_.MC_party_warning);
        lib.util.Warning.add(_loc2_.MC_party_warning2);
        _loc2_.MC_party_warning.onEnterFrame = function()
        {
            this.gotoAndStop(startFrame);
        };
        var level;
        if(_loc2_.currentEnergy <= 25 && _loc2_.currentEnergy > 20)
        {
            level = 1;
        }
        else if(_loc2_.currentEnergy <= 20 && _loc2_.currentEnergy > 15)
        {
            level = 2;
        }
        else
        {
            level = 3;
        }
        var upDown = "up";
        _loc2_.Hp_Bar.Hp_Bar1.hpWarning_mc.onEnterFrame = function()
        {
            if(this._alpha >= 100)
            {
                upDown = "down";
            }
            else if(this._alpha <= 0)
            {
                upDown = "up";
            }
            if(upDown == "up")
            {
                this._alpha = this._alpha + 10 * level;
            }
            else if(upDown == "down")
            {
                this._alpha = this._alpha - 10 * level;
            }
        };
    }
    else
    {
        _loc2_.MC_party_warning._visible = false;
        _loc2_.MC_party_warning2._visible = false;
        lib.util.Warning.remove(_loc2_.MC_party_warning);
        lib.util.Warning.remove(_loc2_.MC_party_warning2);
        delete _loc2_.Hp_Bar.Hp_Bar1.hpWarning_mc.onEnterFrame;
        _loc2_.Hp_Bar.Hp_Bar1.hpWarning_mc._alpha = 0;
    }
}
function animateHealHP(targetMember)
{
    var target = this["mc_PartyWindow" + targetMember];
    delete target.hpDownTween;
    target.hpUp1Tween.stop();
    target.hpUp2Tween.stop();
    target.currentEnergy = target.currentEnergy + target.heal;
    if(!target.isHealing)
    {
        target.Hp_Bar.Hp_Bar3._xscale = target.Hp_Bar.Hp_Bar1._xscale;
    }
    target.Hp_Bar.Hp_Bar3._visible = true;
    target.isHealing = true;
    gs.TweenLite.killTweensOf(target.Hp_Bar.Hp_Bar3,true);
    gs.TweenLite.to(target.Hp_Bar.Hp_Bar3,0.25,{_xscale:target.currentEnergy,ease:gs.easing.Strong.easeOut,onComplete:endMotion,onCompleteParams:[gageMc,targetxscale,tgGage,gaugeRate]});
    target.hpUp1Tween = new mx.transitions.Tween(target.Hp_Bar.Hp_Bar3,"_xscale",mx.transitions.easing.Strong.easeInOut,target.Hp_Bar.Hp_Bar3._xscale,target.currentEnergy,7,false);
    target.hpUp2Tween = new mx.transitions.Tween(target.Hp_Bar.Hp_Bar1,"_xscale",mx.transitions.easing.Strong.easeInOut,target.Hp_Bar.Hp_Bar1._xscale,target.currentEnergy,10,false);
    target.hpUp2Tween.onMotionFinished = function()
    {
        target.Hp_Bar.Hp_Bar3._visible = false;
        target.isHealing = false;
        delete target.hpUp1Tween;
        delete target.hpUp2Tween;
        target.hpDownTween.stop();
        target.Hp_Bar.Hp_Bar2._xscale = target.currentEnergy;
    };
}
function animateHP(targetMember)
{
    var target = this["mc_PartyWindow" + targetMember];
    target.currentEnergy = target.currentEnergy - target.demage;
    target.Hp_Bar.Hp_Bar1._xscale = target.currentEnergy;
    target.hpDownTween.stop();
    if(target.isHealing)
    {
        target.hpUp1Tween.stop();
        target.hpUp2Tween.stop();
        target.Hp_Bar.Hp_Bar1._xscale = target.currentHp;
        target.Hp_Bar.Hp_Bar2._xscale = target.Hp_Bar.Hp_Bar3._xscale;
        target.Hp_Bar.Hp_Bar3._xscale = target.currentHp;
        target.Hp_Bar.Hp_Bar3._visible = false;
        target.isHealing = false;
    }
    target.hpDownTween = new mx.transitions.Tween(target.Hp_Bar.Hp_Bar2,"_xscale",mx.transitions.easing.Strong.easeInOut,target.Hp_Bar.Hp_Bar2._xscale,target.currentEnergy,aniSpeed,false);
    target.hpDownTween.onMotionFinished = function()
    {
        target.hpDownTween = null;
        target.Hp_Bar.Hp_Bar3._xscale = target.currentHp;
    };
}
function setMpHeal(targetMember, amount)
{
    this["mc_PartyWindow" + targetMember].mpHeal = amount;
    animateHealMP(targetMember);
}
function setAddMpHeal(targetMember, amount)
{
    this["mc_PartyWindow" + targetMember].mpAddHeal = amount;
    animateHealAddMP(targetMember);
}
function animateHealMP(targetMember)
{
    var target = this["mc_PartyWindow" + targetMember];
    target.currentMp = target.currentMp + target.mpHeal;
    target.mpUp1Tween.stop();
    target.mpUp2Tween.stop();
    delete target.mpAddDownTween;
    target.Mp_Bar.Mp_Bar3._visible = true;
    if(!target.isMpHealing)
    {
        target.Mp_Bar.Mp_Bar3._xscale = target.Mp_Bar.Mp_Bar1._xscale;
    }
    target.isMpHealing = true;
    target.mpUp1Tween = new mx.transitions.Tween(target.Mp_Bar.Mp_Bar3,"_xscale",mx.transitions.easing.Strong.easeInOut,target.Mp_Bar.Mp_Bar3._xscale,target.currentMp,aniSpeed - 7,false);
    target.mpUp1Tween.onMotionFinished = function()
    {
        target.mpUp2Tween = new mx.transitions.Tween(target.Mp_Bar.Mp_Bar1,"_xscale",mx.transitions.easing.Strong.easeInOut,target.Mp_Bar.Mp_Bar1._xscale,target.currentMp,aniSpeed,false);
        target.mpUp2Tween.onMotionFinished = function()
        {
            delete target.mpUp1Tween;
            delete target.mpUp2Tween;
            target.mpDownTween.stop();
            target.Mp_Bar.Mp_Bar2._xscale = target.currentMp;
            target.isMpHealing = false;
            target.Mp_Bar.Mp_Bar3._visible = false;
        };
    };
}
function animateHealAddMP(targetMember)
{
    var target = this["mc_PartyWindow" + targetMember];
    target.currentAddMp = target.currentAddMp + target.mpAddHeal;
    target.mpAddUp1Tween.stop();
    target.mpAddUp2Tween.stop();
    delete target.mpAddDownTween;
    target.MpAdd_Bar.Mp_Bar3._visible = true;
    if(!target.isMpAddHealing)
    {
        target.MpAdd_Bar.Mp_Bar3._xscale = target.MpAdd_Bar.Mp_Bar1._xscale;
    }
    target.isMpAddHealing = true;
    target.mpAddUp1Tween = new mx.transitions.Tween(target.MpAdd_Bar.Mp_Bar3,"_xscale",mx.transitions.easing.Strong.easeInOut,target.MpAdd_Bar.Mp_Bar3._xscale,target.currentAddMp,aniSpeed - 7,false);
    target.mpAddUp1Tween.onMotionFinished = function()
    {
        target.MpAdd_Bar.Mp_Bar2._xscale = target.currentAddMp;
        target.mpAddUp2Tween = new mx.transitions.Tween(target.MpAdd_Bar.Mp_Bar1,"_xscale",mx.transitions.easing.Strong.easeInOut,target.MpAdd_Bar.Mp_Bar1._xscale,target.currentAddMp,aniSpeed,false);
        target.mpAddUp2Tween.onMotionFinished = function()
        {
            delete target.mpAddUp1Tween;
            delete target.mpAddUp2Tween;
            target.mpAddDownTween.stop();
            target.MpAdd_Bar.Mp_Bar2._xscale = target.currentAddMp;
            target.isMpAddHealing = false;
            target.MpAdd_Bar.Mp_Bar3._visible = false;
        };
    };
}
function setMpDemage(targetMember, amount)
{
    var _loc2_ = this["mc_PartyWindow" + targetMember];
    _loc2_.mpDemage = amount;
    animateMP(targetMember);
}
function setAddMpDemage(targetMember, amount)
{
    var _loc2_ = this["mc_PartyWindow" + targetMember];
    _loc2_.mpAddDemage = amount;
    animateAddMP(targetMember);
}
function animateMP(targetMember)
{
    var _loc2_ = this["mc_PartyWindow" + targetMember];
    _loc2_.currentMp = _loc2_.currentMp - _loc2_.mpDemage;
    _loc2_.mpDownTween.stop();
    if(_loc2_.isMpHealing)
    {
        _loc2_.mpUp1Tween.stop();
        _loc2_.mpUp2Tween.stop();
        _loc2_.Mp_Bar.Mp_Bar1._xscale = _loc2_.currentMp;
        _loc2_.Mp_Bar.Mp_Bar2._xscale = _loc2_.Mp_Bar.Mp_Bar3._xscale;
        _loc2_.Mp_Bar.Mp_Bar3._xscale = _loc2_.currentMp;
        _loc2_.Mp_Bar.Mp_Bar3._visible = false;
        _loc2_.isMpHealing = false;
    }
    _loc2_.Mp_Bar.Mp_Bar1._xscale = _loc2_.currentMp;
    _loc2_.mpDownTween = new mx.transitions.Tween(_loc2_.Mp_Bar.Mp_Bar2,"_xscale",mx.transitions.easing.Strong.easeInOut,_loc2_.Mp_Bar.Mp_Bar2._xscale,_loc2_.currentMp,aniSpeed,false);
}
function animateAddMP(targetMember)
{
    var _loc2_ = this["mc_PartyWindow" + targetMember];
    _loc2_.currentAddMp = _loc2_.currentAddMp - _loc2_.mpAddDemage;
    _loc2_.mpAddDownTween.stop();
    if(_loc2_.isMpAddHealing)
    {
        _loc2_.mpAddUp1Tween.stop();
        _loc2_.mpAddUp2Tween.stop();
        _loc2_.MpAdd_Bar.Mp_Bar1._xscale = _loc2_.currentAddMp;
        _loc2_.MpAdd_Bar.Mp_Bar2._xscale = _loc2_.MpAdd_Bar.Mp_Bar3._xscale;
        _loc2_.MpAdd_Bar.Mp_Bar3._xscale = _loc2_.currentAddMp;
        _loc2_.MpAdd_Bar.Mp_Bar3._visible = false;
        _loc2_.isMpAddHealing = false;
    }
    _loc2_.MpAdd_Bar.Mp_Bar1._xscale = _loc2_.currentAddMp;
    _loc2_.mpAddDownTween = new mx.transitions.Tween(_loc2_.MpAdd_Bar.Mp_Bar2,"_xscale",mx.transitions.easing.Strong.easeInOut,_loc2_.MpAdd_Bar.Mp_Bar2._xscale,_loc2_.currentAddMp,aniSpeed,false);
}
function ToGame_Community_AddFriend(name)
{
    getURL("FSCommand:ToGame_Community_AddFriend",name);
}
function ToGame_Community_WhisperToFriend(friendId)
{
    getURL("FSCommand:ToGame_Community_WhisperToFriend",friendId);
}
function ToGame_Community_InviteGuild(name)
{
    getURL("FSCommand:ToGame_Community_InviteGuild",name);
}
function ToGameBanPartyMember(memberIndex)
{
    getURL("FSCommand:ToGameBanPartyMember",memberIndex);
}
function ToGameDelegatePartyMember(memberIndex)
{
    getURL("FSCommand:ToGameDelegatePartyMember",memberIndex);
}
function ToGame_PartyWindow_Follow(memberIndex)
{
    getURL("FSCommand:ToGame_PartyWindow_Follow",memberIndex);
}
function ToGame_PartyWindow_CloseUI()
{
    fscommand("ToGame_PartyWindow_CloseUI");
}
function ToGame_PartyWindow_CallMenu(memberIndex)
{
    getURL("FSCommand:ToGame_PartyWindow_CallMenu",memberIndex);
}
function ToGame_ToolTip_PartyMemberInfo(memberIndex)
{
    lib.Debuger.trace("ToGame_ToolTip_PartyMemberInfo : " + memberIndex);
    getURL("FSCommand:ToGame_ToolTip_PartyMemberInfo",memberIndex);
}
function ToGame_PartyWindow_SelectMenu(memberIndex, id)
{
    getURL("FSCommand:ToGame_PartyWindow_SelectMenu",memberIndex + "\t" + id);
}
function showHp(memberIndex, bTrue)
{
    var _loc1_ = con["mc_PartyWindow" + memberIndex];
    _loc1_.Hp_Bar._visible = bTrue;
    _loc1_.text_Hp_left._visible = bTrue;
    _loc1_.text_Hp_right._visible = bTrue;
    _loc1_.slash1._visible = bTrue;
}
function showMp(memberIndex, bTrue)
{
    var _loc1_ = con["mc_PartyWindow" + memberIndex];
    _loc1_.Mp_Bar._visible = bTrue;
    _loc1_.text_Mp_left._visible = bTrue;
    _loc1_.text_Mp_right._visible = bTrue;
    _loc1_.slash2._visible = bTrue;
}
function showSt(memberIndex, bTrue)
{
    var _loc1_ = con["mc_PartyWindow" + memberIndex];
    if(_loc1_.class_st != true)
    {
        if(bTrue == 1)
        {
            bTrue = 0;
        }
    }
    _loc1_.St_Bar._visible = bTrue;
    _loc1_.text_St_left._visible = bTrue;
    _loc1_.text_St_right._visible = bTrue;
    _loc1_.slash3._visible = bTrue;
    if(_loc1_.class_st == true)
    {
        if(bTrue == 1)
        {
            _loc1_.st_bg._visible = bTrue;
        }
    }
    else
    {
        _loc1_.st_bg._visible = false;
    }
}
function closePopupTick()
{
    popUp_mc.cnt = 0;
    popUp_mc.onEnterFrame = function()
    {
        popUp_mc.cnt++;
        if(popUp_mc.cnt >= 50)
        {
            popUp_mc.cnt = 0;
            popUp_mc._visible = false;
            delete popUp_mc.onEnterFrame;
        }
    };
}
function searchBuff(partyIndex, id, type, remove)
{
    var _loc1_ = UI["mc_PartyWindow" + partyIndex];
    if(isNaN(type))
    {
        var _loc2_ = 0;
        while(_loc2_ < _loc1_.buff_array.length)
        {
            if(_loc1_.buff_array[_loc2_]._name == "buff_" + id)
            {
                var _loc5_ = _loc1_.buff_array[_loc2_];
                if(remove == 1)
                {
                    _loc1_.buff_array.splice(_loc2_,1);
                }
                return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
        }
        _loc2_ = 0;
        while(_loc2_ < _loc1_.debuff_array.length)
        {
            if(_loc1_.debuff_array[_loc2_]._name == "debuff_" + id)
            {
                _loc5_ = _loc1_.debuff_array[_loc2_];
                if(remove == 1)
                {
                    _loc1_.debuff_array.splice(_loc2_,1);
                }
                return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
        }
        return null;
    }
    if(type == 0)
    {
        _loc2_ = 0;
        while(_loc2_ < _loc1_.buff_array.length)
        {
            if(_loc1_.buff_array[_loc2_]._name == "buff_" + id)
            {
                _loc5_ = _loc1_.buff_array[_loc2_];
                if(remove == 1)
                {
                    _loc1_.buff_array.splice(_loc2_,1);
                }
                return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
        }
        return null;
    }
    if(type >= 1)
    {
        _loc2_ = 0;
        while(_loc2_ < _loc1_.debuff_array.length)
        {
            if(_loc1_.debuff_array[_loc2_]._name == "debuff_" + id)
            {
                _loc5_ = _loc1_.debuff_array[_loc2_];
                if(remove == 1)
                {
                    _loc1_.debuff_array.splice(_loc2_,1);
                }
                return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
        }
        return null;
    }
}
function checkMemberBlur(memberIndex)
{
    var _loc1_ = con["mc_PartyWindow" + memberIndex];
    if(!_loc1_.connection)
    {
        _loc1_._alpha = 50;
    }
    else if(!_loc1_.die)
    {
        if(!_loc1_.sameWorld)
        {
            _loc1_._alpha = 50;
        }
        else if(!_loc1_.inRange)
        {
            _loc1_._alpha = 50;
        }
        else
        {
            _loc1_._alpha = 100;
        }
    }
}
function PartyWindow_EnergyOption_HP(_hp, _maxHp, _instance, memberIndex)
{
    if(_instance.die_mc._visible == false && _instance.text_state.text == "")
    {
        if(UI["EnergyOption_Flag" + memberIndex] == true)
        {
            _instance.text_Hp_100._visible = true;
        }
        _instance.text_Hp_100.htmlText = int(10000 * _hp / _maxHp) / 100 + " %";
    }
    else if(UI["EnergyOption_Flag" + memberIndex] == false)
    {
        _instance.text_Hp_100._visible = false;
    }
    if(_instance.text_Hp_100._visible == true)
    {
        _instance.text_Hp_left._visible = false;
        _instance.slash1._visible = false;
        _instance.text_Hp_right._visible = false;
    }
}
function PartyWindow_EnergyOption_MP(_mp, _maxMp, _instance, memberIndex)
{
    if(_instance.die_mc._visible == false && _instance.text_state.text == "")
    {
        if(UI["EnergyOption_Flag" + memberIndex] == true)
        {
            _instance.text_Mp_100._visible = true;
        }
        _instance.text_Mp_100.htmlText = int(10000 * _mp / _maxMp) / 100 + " %";
    }
    else if(UI["EnergyOption_Flag" + memberIndex] == false)
    {
        _instance.text_Mp_100._visible = false;
    }
    if(_instance.text_Mp_100._visible == true)
    {
        _instance.text_Mp_left._visible = false;
        _instance.slash2._visible = false;
        _instance.text_Mp_right._visible = false;
    }
}
function PartyWindow_EnergyOption_ST(_st, _maxSt, _instance)
{
    if(_instance.die_mc._visible == false && _instance.text_state.text == "")
    {
        _instance.text_St_100.htmlText = int(10000 * _st / _maxSt) / 100 + " %";
    }
}
function hpmpHandler(value)
{
    if(value == 0)
    {
        myListener.OnGame_PartyWindow_EnergyOption("0");
        EnergyOption_Flag0 = false;
        EnergyOption_Flag1 = false;
        EnergyOption_Flag2 = false;
        EnergyOption_Flag3 = false;
    }
    else if(value == 1)
    {
        myListener.OnGame_PartyWindow_EnergyOption("1");
        EnergyOption_Flag0 = true;
        EnergyOption_Flag1 = true;
        EnergyOption_Flag2 = true;
        EnergyOption_Flag3 = true;
    }
}
function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.CHARACTERWINDOW_PERCENT_BOOLEAN)
    {
        hpmpHandler(event.value);
    }
}
function ToGame_PartyWindow_DiceDistributionStart_End(_memberIndex)
{
    lib.Debuger.trace("ToGame_PartyWindow_DiceDistributionStart_End : " + _memberIndex);
    getURL("FSCommand:ToGame_PartyWindow_DiceDistributionStart_End",_memberIndex);
}
function ToGame_PartyWindow_DiceDistributionData_End(_memberIndex)
{
    lib.Debuger.trace("ToGame_PartyWindow_DiceDistributionData_End : " + _memberIndex);
    getURL("FSCommand:ToGame_PartyWindow_DiceDistributionData_End",_memberIndex);
}
function ToGame_PartyWindow_DiceDistributionIcon_End(_memberIndex)
{
    lib.Debuger.trace("ToGame_PartyWindow_DiceDistributionIcon_End : " + _memberIndex);
    getURL("FSCommand:ToGame_PartyWindow_DiceDistributionIcon_End",_memberIndex);
}
function ToGame_PartyWindow_GoldDistributionStart_End(_memberIndex)
{
    lib.Debuger.trace("ToGame_PartyWindow_GoldDistributionStart_End : " + _memberIndex);
    getURL("FSCommand:ToGame_PartyWindow_GoldDistributionStart_End",_memberIndex);
}
function ToGame_PartyWindow_GoldDistributionData_End(_memberIndex)
{
    lib.Debuger.trace("ToGame_PartyWindow_GoldDistributionData_End : " + _memberIndex);
    getURL("FSCommand:ToGame_PartyWindow_GoldDistributionData_End",_memberIndex);
}
function ToGame_PartyWindow_GoldDistributionIcon_End(_memberIndex)
{
    lib.Debuger.trace("ToGame_PartyWindow_GoldDistributionIcon_End : " + _memberIndex);
    getURL("FSCommand:ToGame_PartyWindow_GoldDistributionIcon_End",_memberIndex);
}
function test()
{
    this._visible = true;
    myListener.OnGameEventPartyMemberAdd(0,"aaa");
    myListener.OnGame_PartyWindow_AchievementRating(0,4);
}
if(_global.EventBroadCaster)
{
    _global.EventBroadCaster.addListener(myListener);
}
var levelStr = lib.util.UIString.getUIString("$023001");
var partyMemberTotalNum = 4;
var partyMember0 = this.mc_PartyWindow0;
var partyMember1 = this.mc_PartyWindow1;
var partyMember2 = this.mc_PartyWindow2;
var partyMember3 = this.mc_PartyWindow3;
var partyMemberBaseY_array = [partyMember0._y,partyMember1._y,partyMember2._y,partyMember3._y];
var member_array = [{name:"",level:0},{name:"",level:0},{name:"",level:0},{name:"",level:0}];
var lineH = 50;
var lineW = 220;
var contentsXY = {x:container_mc.contents_mc._x,y:container_mc.contents_mc._y};
var gapH = container_mc.bg_mc._height - container_mc.mask_mc._height;
var buffGap = 4;
var buffWidth = 30;
var maxNumInOneLine = 30;
var aniSpeed = 15;
var warningTime = 0;
var NUM_ABNORMAL_SLOT = 17;
var COLOR_DISTRIBUTION_ACTIVE = 65535;
var COLOR_DISTRIBUTION_NOT_ACTIVE = 16776960;
var rightClickedMember = null;
var DiceMc_StatEnd = 7;
var DiceMc_Stat2End = 30;
var DiceMc_Stat3End = 45;
var DiceMcDiceMc_StatEnd = 15;
var DiceMcDiceMc_Stat2End = 30;
var class_name_Array = "";
var class_st = false;
var curHighestDepthMc = this.mc_PartyWindow3;
var MAX_GROUP_COUNT = 4;
var EnergyOption_Flag0 = false;
var EnergyOption_Flag1 = false;
var EnergyOption_Flag2 = false;
var EnergyOption_Flag3 = false;
var axis = new lib.util.AxisResetter();
var i = 0;
while(i < partyMemberTotalNum)
{
    var mc = this["mc_PartyWindow" + i];
    member.die = 0;
    member.sameWorld = 0;
    member.inRange = 0;
    member.connection = 0;
    mc.class_name = "";
    mc._visible = false;
    mc.partyIcon.gotoAndStop(4);
    mc.partyIcon2.gotoAndStop(4);
    mc.MC_party_warning._visible = false;
    mc.MC_party_warning2._visible = false;
    mc.DistributionIcon._visible = false;
    mc.text_state.text = "";
    mc.die_mc._visible = false;
    mc.offline_mc._visible = false;
    mc.index = i;
    mc.Mic._visible = false;
    mc.bg2.hitTestDiable = true;
    mc.buffCnt = 0;
    mc.UIDrager.setData(mc._name,mc);
    mc.UIDrager.adjustDragLimit(-30,0,0,-40 * lib.info.AlignInfo.scaleRatio);
    mc.BattleIconGroup._visible = false;
    mc.achievementMc.hitTestDiable = true;
    mc.Hp_Bar.Hp_Bar3._visible = false;
    mc.Mp_Bar.Mp_Bar3._visible = false;
    mc.MpAdd_Bar.Mp_Bar3._visible = false;
    mc.firstHpData = true;
    mc.hp = null;
    mc.maxHp = null;
    mc.currentEnergy = hp / maxHp * 100;
    mc.demage = null;
    mc.heal = null;
    mc.isWarning = false;
    mc.hpDownTween = null;
    mc.hpUp1Tween = null;
    mc.hpUp2Tween = null;
    mc.firstMpData = true;
    mc.currentMp = null;
    mc.currentAddMp = null;
    mc.mpDownTween = null;
    mc.mpUp1Tween = null;
    mc.mpUp2Tween = null;
    mc.mpAddDownTween = null;
    mc.mpAddUp1Tween = null;
    mc.mpAddUp2Tween = null;
    mc.isMpHealing = false;
    mc.isMpAddHealing = false;
    mc.mpHeal = null;
    mc.mpAddHeal = null;
    mc.mpDemage = null;
    mc.mpAddDemage = null;
    mc.buff_array = new Array();
    mc.debuff_array = new Array();
    mc.merit_array = new Array();
    mc.buff_array.cnt = 0;
    mc.debuff_array.cnt = 0;
    mc.merit_array.cnt = 0;
    mc.isDebuffState = false;
    mc.class_st = false;
    mc.achievementMc.gotoAndStop(1);
    i++;
}
popUp_mc._visible = false;
partyMember0.hp = 100;
partyMember0.maxHp = 100;
partyMember0.currentEnergy = hp / maxHp * 100;
partyMember0.currentMp = 100;
partyMember0.currentAddMp = 100;
var custommanager = lib.manager.CustomScaleManger.getInstance();
custommanager.addCustomScale(partyMember0,UIname);
custommanager.addCustomScale(partyMember1,UIname);
custommanager.addCustomScale(partyMember2,UIname);
custommanager.addCustomScale(partyMember3,UIname);
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
    if(!_global.gbUIMode)
    {
    }
};
myListener.OnGame_ScaleUI = function()
{
    checkOutofStage();
};
myListener.OnGame_ChangeStageSize = function()
{
    checkOutofStage();
};
init();
var bGroup = [false,false,false,false];
var SLOT_TYPE_BUFF = 0;
var SLOT_TYPE_DEBUFF = 1;
var textFdColorArr = [lib.info.TextColor.SLOT_ABNORMALITY_BUFF,lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF,lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_WEAK,lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_TICK,lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_STUN];
myListener.OnGame_PartyWindow_AddBuff = function(paramIndex, id, stackCnt, type, group, bRelaxMerit, img, remain, total, buffName)
{
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        return undefined;
    }
    var _loc3_ = _loc1_.index;
    stackCnt = Number(stackCnt);
    type = Number(type);
    group = Number(group);
    remain = Math.abs(Number(remain));
    total = Math.abs(Number(total));
    bRelaxMerit = Number(bRelaxMerit);
    var _loc6_ = getTimer();
    addBuff(_loc3_,id,stackCnt,type,group,bRelaxMerit,img,remain,total,_loc6_);
    buffAlign(_loc3_,group);
};
myListener.OnGame_PartyWindow_UpdateBuff = function(paramIndex, id, group, stackCnt, useRelaxMerit, img, remain, total)
{
    var _loc10_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc10_)
    {
        return undefined;
    }
    var _loc9_ = _loc10_.index;
    remain = Number(remain);
    total = Number(total);
    useRelaxMerit = Boolean(Number(useRelaxMerit));
    var _loc3_ = getBuffData(_loc9_,id,group);
    if(_loc3_ == undefined)
    {
        return undefined;
    }
    var _loc13_ = getTimer();
    var _loc4_ = _loc3_.type;
    var _loc14_ = !_loc3_.bRelaxMerit?_loc3_.bRelaxMerit:!(1 == _loc3_.bRelaxMerit && useRelaxMerit);
    updateBuff(_loc3_,_loc9_,id,stackCnt,_loc4_,group,_loc14_,img,remain,total,_loc13_);
    var _loc5_ = getContainer(_loc9_,group);
    var _loc7_ = !isDebuff(_loc4_)?"slot_":"deSlot_";
    var _loc8_ = !isDebuff(_loc4_)?_loc5_.slotCount:_loc5_.debuffSlotCount;
    var _loc2_ = 0;
    while(_loc2_ < _loc8_)
    {
        var _loc1_ = _loc5_[_loc7_ + _loc2_];
        if(_loc1_.id == id && _loc1_.type == _loc4_)
        {
            drawSlot(_loc1_,_loc3_);
            break;
        }
        _loc2_ = _loc2_ + 1;
    }
};
myListener.OnGame_PartyWindow_RemoveBuff = function(paramIndex, id, group)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc1_ = _loc2_.index;
    var _loc6_ = UI["mc_PartyWindow" + _loc1_];
    var _loc4_ = getBuffData(_loc1_,id,group);
    if(_loc4_ == undefined)
    {
        return undefined;
    }
    removeBuff(_loc1_,id,group);
    buffAlign(_loc1_,group);
};
myListener.OnGame_PartyWindow_ClearBuff = function(paramIndex, type)
{
    var _loc14_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc14_)
    {
        return undefined;
    }
    var _loc5_ = _loc14_.index;
    var _loc12_ = UI["mc_PartyWindow" + _loc5_];
    type = Number(type);
    var _loc6_ = [];
    if(isNaN(type))
    {
        var _loc4_ = 0;
        while(_loc4_ < 4)
        {
            var _loc9_ = _loc12_["group_" + _loc4_];
            _loc9_.buffArray = [];
            _loc4_ = _loc4_ + 1;
        }
        clearAllContainer(_loc5_);
    }
    else
    {
        _loc4_ = 0;
        while(_loc4_ < 4)
        {
            var _loc11_ = getContainer(_loc5_,_loc4_);
            var _loc3_ = getDatas(_loc5_,_loc4_);
            var _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
                if(_loc3_[_loc2_].type == type)
                {
                    var _loc1_ = new Object();
                    _loc1_.id = _loc3_[_loc2_].id;
                    _loc1_.partyIndex = _loc5_;
                    _loc1_.group = _loc4_;
                    _loc6_.push(_loc1_);
                }
                _loc2_ = _loc2_ + 1;
            }
            _loc4_ = _loc4_ + 1;
        }
        _loc4_ = 0;
        while(_loc4_ < _loc6_.length)
        {
            var _loc8_ = _loc6_[_loc4_].id;
            var _loc7_ = _loc6_[_loc4_].group;
            removeBuff(_loc5_,_loc8_,_loc7_);
            _loc4_ = _loc4_ + 1;
        }
        var _loc13_ = 0;
        _loc4_ = 0;
        while(_loc4_ < 4)
        {
            if(bGroup[_loc4_])
            {
                buffAlignForGroup(_loc5_,_loc4_);
            }
            else
            {
                _loc13_ = _loc4_;
            }
            _loc4_ = _loc4_ + 1;
        }
        buffAlignForNotGroup(_loc5_);
    }
};
myListener.OnGame_PartyWindow_HoldBuff = function(paramIndex, id, group)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc4_ = _loc2_.index;
    var _loc3_ = getBuffData(_loc4_,id,group);
    if(_loc3_ == undefined)
    {
        return undefined;
    }
    var _loc6_ = _loc3_.type;
    var _loc5_ = getContainer(_loc4_,group);
    var _loc1_ = _loc5_["slot_" + id + "_" + _loc6_];
    if(_loc1_ != null)
    {
        _loc1_.cool.remove();
        delete register1.cool;
    }
};
myListener.OnGameEventPartyMemberEnableRelaxMeritIcon = function(paramIndex, id, group, bEnable)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc1_ = _loc2_.index;
    var _loc11_ = UI["mc_PartyWindow" + _loc1_];
    bEnable = Number(bEnable);
    var _loc3_ = getBuffData(_loc1_,id,group);
    if(_loc3_ == undefined)
    {
        return undefined;
    }
    var _loc9_ = _loc3_.type;
    var _loc8_ = getContainer(_loc1_,group);
    var _loc12_ = _loc8_["slot_" + id + "_" + _loc9_];
    if(bEnable)
    {
        search.Icon._visible = false;
        search.coolTimeMask._visible = true;
        enableTrans = lib.info.ColorTrans.enableTrans();
        var _loc7_ = new flash.geom.Transform(search.Icon);
        _loc7_.colorTransform = enableTrans;
        myListener.OnGame_PartyWindow_UpdateBuff(paramIndex,id,group,"",search.coolTime,search.coolTimeTotal);
    }
    else
    {
        delete search.timer.onEnterFrame;
        search.Icon._visible = true;
        search.coolTimeMask._visible = false;
        disableTrans = lib.info.ColorTrans.disableTrans();
        _loc7_ = new flash.geom.Transform(search.Icon);
        _loc7_.colorTransform = disableTrans;
    }
};
myListener.OnGame_AbnormalityOption_SetOption = function(optionData)
{
    var _loc7_ = false;
    var _loc6_ = 0;
    var _loc8_ = lib.util.ExtString.split(optionData,"\t");
    var _loc4_ = 3;
    while(_loc4_ < 6)
    {
        var _loc3_ = Boolean(Number(_loc8_[_loc4_]));
        var _loc2_ = _loc4_ - 2;
        var _loc5_ = bGroup[_loc2_];
        if(_loc3_ != _loc5_)
        {
            _loc7_ = true;
            if(_loc5_)
            {
                var _loc1_ = 0;
                while(_loc1_ < partyMemberTotalNum)
                {
                    clearContainer(_loc1_,_loc2_);
                    _loc1_ = _loc1_ + 1;
                }
            }
            bGroup[_loc2_] = _loc3_;
            if(_loc3_)
            {
                _loc1_ = 0;
                while(_loc1_ < partyMemberTotalNum)
                {
                    buffAlignForGroup(_loc1_,_loc2_);
                    _loc1_ = _loc1_ + 1;
                }
            }
            else
            {
                _loc6_ = _loc2_;
            }
        }
        _loc4_ = _loc4_ + 1;
    }
    if(_loc7_)
    {
        _loc4_ = 0;
        while(_loc4_ < partyMemberTotalNum)
        {
            buffAlignForNotGroup(_loc4_,_loc6_);
            _loc4_ = _loc4_ + 1;
        }
    }
};
myListener.OnGameEventPartyMemberUpdateHP = function(paramIndex, hp, maxHp, maxHpAdd)
{
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        return undefined;
    }
    var _loc5_ = _loc1_.index;
    hp = Number(hp);
    maxHp = Number(maxHp);
    maxHpAdd = Number(maxHpAdd);
    if(isNaN(hp))
    {
        hp = 0;
    }
    if(isNaN(maxHp))
    {
        maxHp = 0;
    }
    if(isNaN(maxHpAdd))
    {
        maxHpAdd = 0;
    }
    maxHp = maxHp + maxHpAdd;
    if(hp > maxHp)
    {
        hp = maxHp;
    }
    var _loc7_ = hp / maxHp;
    var _loc4_ = _loc7_ * 100;
    if(isNaN(_loc4_))
    {
        _loc4_ = 0;
    }
    if(_loc1_.firstHpData || _loc1_.hp == hp && _loc1_.maxHp != maxHp)
    {
        _loc1_.firstHpData = false;
        _loc1_.currentEnergy = _loc4_;
        _loc1_.Hp_Bar.Hp_Bar1._xscale = _loc1_.currentEnergy;
        _loc1_.Hp_Bar.Hp_Bar2._xscale = _loc1_.currentEnergy;
        _loc1_.Hp_Bar.Hp_Bar3._xscale = _loc1_.currentEnergy;
        _loc1_.hp = hp;
        _loc1_.maxHp = maxHp;
        if(member.connection != 0)
        {
            checkWarning(_loc5_);
        }
        _loc1_.text_Hp_left.text = hp;
        _loc1_.text_Hp_right.text = maxHp;
    }
    else if(_loc1_.hp != hp || _loc1_.maxHp != maxHp)
    {
        if(_loc4_ < 100)
        {
            if(_loc4_ < _loc1_.currentEnergy)
            {
                if(_loc7_ != 0)
                {
                    setDemage(_loc5_,_loc1_.currentEnergy - _loc4_);
                }
                else
                {
                    setDemage(_loc5_,_loc1_.currentEnergy);
                }
            }
            else
            {
                setHeal(_loc5_,_loc4_ - _loc1_.currentEnergy);
            }
        }
        else if(_loc4_ == 100)
        {
            setHeal(_loc5_,_loc4_ - _loc1_.currentEnergy);
        }
        else if(_loc4_ == 0)
        {
            setDemage(_loc5_,_loc1_.currentEnergy);
        }
        _loc1_.hp = hp;
        _loc1_.maxHp = maxHp;
        _loc1_.text_Hp_left.text = hp;
        _loc1_.text_Hp_right.text = maxHp;
    }
    PartyWindow_EnergyOption_HP(hp,maxHp,_loc1_,_loc5_);
};
myListener.OnGameEventPartyMemberUpdateMP = function(paramIndex, mp, maxMp, maxMpAdd)
{
    var _loc9_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc9_)
    {
        return undefined;
    }
    var _loc3_ = _loc9_.index;
    mp = Number(mp);
    maxMp = Number(maxMp);
    maxMpAdd = Number(maxMpAdd);
    if(isNaN(mp))
    {
        mp = 0;
    }
    if(isNaN(maxMp))
    {
        maxMp = 0;
    }
    if(isNaN(maxMpAdd))
    {
        maxMpAdd = 0;
    }
    maxMp = maxMp + maxMpAdd;
    if(mp > maxMp)
    {
        mp = maxMp;
    }
    var _loc1_ = con["mc_PartyWindow" + _loc3_];
    var _loc6_ = undefined;
    var _loc5_ = undefined;
    var _loc10_ = mp - maxMp >= 0?maxMp:mp;
    if(mp - maxMp > 0)
    {
        var _loc8_ = mp - maxMp >= maxMpAdd?maxMpAdd:mp - maxMp;
        if(_loc8_ >= maxMp)
        {
            _loc8_ = maxMp;
        }
    }
    else
    {
        _loc8_ = 0;
    }
    _loc6_ = _loc10_ / maxMp * 100;
    _loc5_ = _loc8_ / maxMp * 100;
    if(isNaN(_loc6_))
    {
        _loc6_ = 0;
    }
    if(isNaN(_loc5_))
    {
        _loc5_ = 0;
    }
    if(_loc1_.firstMpData)
    {
        _loc1_.firstMpData = false;
        _loc1_.currentMp = _loc6_;
        _loc1_.currentAddMp = _loc5_;
        _loc1_.MpAdd_Bar.Mp_Bar1._xscale = _loc1_.currentAddMp;
        _loc1_.MpAdd_Bar.Mp_Bar2._xscale = _loc1_.currentAddMp;
        _loc1_.MpAdd_Bar.Mp_Bar3._xscale = _loc1_.currentAddMp;
        _loc1_.Mp_Bar.Mp_Bar1._xscale = _loc1_.currentMp;
        _loc1_.Mp_Bar.Mp_Bar2._xscale = _loc1_.currentMp;
        _loc1_.Mp_Bar.Mp_Bar3._xscale = _loc1_.currentMp;
        _loc1_.text_Mp_left.text = mp;
        _loc1_.text_Mp_right.text = maxMp;
    }
    else
    {
        if(_loc1_.mp != mp || _loc1_.maxMp != maxMp || _loc1_.maxMpAdd != maxMpAdd)
        {
            if(_loc6_ < 100)
            {
                if(_loc6_ < _loc1_.currentMp)
                {
                    if(_loc6_ != 0)
                    {
                        setMpDemage(_loc3_,_loc1_.currentMp - _loc6_);
                    }
                    else
                    {
                        setMpDemage(_loc3_,_loc1_.currentMp);
                    }
                }
                else
                {
                    setMpHeal(_loc3_,_loc6_ - _loc1_.currentMp);
                }
                if(_loc1_.MpAdd_Bar.Mp_Bar1._xscale > 0)
                {
                    setAddMpDemage(_loc3_,_loc1_.currentAddMp);
                }
            }
            else if(_loc6_ == 100)
            {
                setMpHeal(_loc3_,_loc6_ - _loc1_.currentMp);
            }
            else if(_loc6_ == 0)
            {
                setMpDemage(_loc3_,_loc1_.currentMp);
            }
            if(_loc5_ < 100 && _loc5_ > 0)
            {
                if(_loc5_ < _loc1_.currentAddMp)
                {
                    if(_loc5_ != 0)
                    {
                        setAddMpDemage(_loc3_,_loc1_.currentAddMp - _loc5_);
                    }
                    else
                    {
                        setAddMpDemage(_loc3_,_loc1_.currentAddMp);
                    }
                }
                else
                {
                    setAddMpHeal(_loc3_,_loc5_ - _loc1_.currentAddMp);
                }
                if(_loc1_.Mp_Bar.Mp_Bar1._xscale < 100)
                {
                    setMpHeal(_loc3_,100 - _loc1_.currentMp);
                }
            }
            else if(_loc5_ == 100)
            {
                setAddMpHeal(_loc3_,_loc5_ - _loc1_.currentAddMp);
            }
            else if(_loc5_ == 0)
            {
                setAddMpDemage(_loc3_,_loc1_.currentAddMp);
            }
        }
        _loc1_.text_Mp_left.text = mp;
        _loc1_.text_Mp_right.text = maxMp;
    }
    PartyWindow_EnergyOption_MP(mp,maxMp,_loc1_,_loc3_);
};
myListener.OnGameEventPartyMemberUpdateST = function(paramIndex, st, maxSt, maxStAdd)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc8_ = _loc2_.index;
    var _loc9_ = Number(st);
    var _loc4_ = Number(maxSt);
    var _loc5_ = Number(maxStAdd);
    var _loc6_ = _loc4_ + _loc5_;
    var _loc1_ = con["mc_PartyWindow" + _loc8_];
    if(maxSt == 0)
    {
        _loc1_.St_Bar._width = 0.1;
    }
    else
    {
        _loc1_.St_Bar._width = _loc9_ / _loc6_ * 157.9;
    }
    if(_loc1_.St_Bar._width > 157.9)
    {
        _loc1_.St_Bar._width = 157.9;
    }
    _loc1_.text_St_left.text = st;
    _loc1_.text_St_right.text = maxSt;
    PartyWindow_EnergyOption_ST(st,maxSt,_loc1_);
};
myListener.OnGame_PartyWindow_SetClass = function(paramIndex, Class, gageType, position)
{
    var _loc4_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc4_)
    {
        return undefined;
    }
    var _loc3_ = _loc4_.index;
    var _loc1_ = UI["mc_PartyWindow" + _loc3_];
    Class = Number(Class);
    var _loc6_ = Class;
    UI["partyMember" + _loc3_].class_name = _loc6_;
    _loc1_.class_mc.gotoAndStop(Class + 1);
    if(_loc1_.class_mc.type_mc)
    {
        if(position == 0)
        {
            _loc1_.class_mc.type_mc.gotoAndStop(1);
        }
        else if(position == 1)
        {
            _loc1_.class_mc.type_mc.gotoAndStop(2);
        }
    }
    lib.manager.ToolTip.add(_loc1_.class_mc,lib.info.ToolTipStr["CLASS_" + Class],1);
    if(Class == 9)
    {
        gageType = 2;
    }
    if(gageType > 0)
    {
        _loc1_.class_st = true;
    }
    else
    {
        _loc1_.class_st = false;
    }
    if(_loc1_.class_st == true)
    {
        _loc1_.hp_bg._y = 31;
        _loc1_.mp_bg._y = 43;
        _loc1_.st_bg._y = 55;
        _loc1_.Hp_Bar._y = 32.9;
        _loc1_.Mp_Bar._y = 45;
        _loc1_.St_Bar._y = 56.9;
        _loc1_.st_bg._visible = true;
        _loc1_.St_Bar._visible = true;
        _loc1_.St_Bar.gotoAndStop(Number(gageType));
        _loc1_.text_Hp_left._y = 28;
        _loc1_.text_Hp_right._y = 28;
        _loc1_.slash1._y = 28;
        _loc1_.text_Hp_100._y = 28;
        _loc1_.text_Mp_left._y = 41.8;
        _loc1_.text_Mp_right._y = 41.8;
        _loc1_.slash2._y = 41.8;
        _loc1_.text_Mp_100._y = 41.8;
        _loc1_.text_St_left._y = 52.8;
        _loc1_.text_St_right._y = 52.8;
        _loc1_.slash3._y = 52.8;
        _loc1_.text_St_100._y = 52.8;
        if(UI["EnergyOption_Flag" + _loc3_] == true)
        {
            _loc1_.text_St_100._visible = true;
        }
        else
        {
            _loc1_.text_St_left._visible = true;
            _loc1_.text_St_right._visible = true;
            _loc1_.slash3._visible = true;
        }
    }
    else
    {
        _loc1_.hp_bg._y = 37;
        _loc1_.mp_bg._y = 49;
        _loc1_.st_bg._y = 61;
        _loc1_.Hp_Bar._y = 38.9;
        _loc1_.Mp_Bar._y = 51;
        _loc1_.St_Bar._y = 62.9;
        _loc1_.st_bg._visible = false;
        _loc1_.St_Bar._visible = false;
        _loc1_.text_Hp_left._y = 34;
        _loc1_.text_Hp_right._y = 34;
        _loc1_.slash1._y = 34;
        _loc1_.text_Hp_100._y = 34;
        _loc1_.text_Mp_left._y = 47.8;
        _loc1_.text_Mp_right._y = 47.8;
        _loc1_.slash2._y = 47.8;
        _loc1_.text_Mp_100._y = 47.8;
        _loc1_.text_St_left._y = 60.8;
        _loc1_.text_St_right._y = 60.8;
        _loc1_.slash3._y = 60.8;
        _loc1_.text_St_100._y = 60.8;
        _loc1_.text_St_left._visible = false;
        _loc1_.text_St_right._visible = false;
        _loc1_.slash3._visible = false;
        _loc1_.text_St_100._visible = false;
    }
};
myListener.OnGameEventPartyMemberUpdateRestConditionLevel = function(paramIndex, conditionLevel, relaxValue)
{
    var _loc5_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc5_)
    {
        return undefined;
    }
    var _loc7_ = _loc5_.index;
    var _loc4_ = relaxValue;
    var _loc6_ = "mc_PartyWindow" + _loc7_;
    var _loc2_ = UI[_loc6_];
    conditionLevel = Number(conditionLevel);
    var _loc1_ = "";
    if(conditionLevel == 1)
    {
        _loc1_ = lib.info.ToolTipStr.CONDBAD;
    }
    else if(conditionLevel == 2)
    {
        _loc1_ = lib.info.ToolTipStr.CONDNORMAL;
    }
    else if(conditionLevel == 3)
    {
        _loc1_ = lib.info.ToolTipStr.CONDGOOD;
    }
    else if(conditionLevel == 4)
    {
        _loc1_ = lib.info.ToolTipStr.CONDBEST;
    }
    switch(conditionLevel)
    {
        case 4:
            _loc2_.RestIcon.gotoAndStop(4);
            _loc1_ = lib.util.UIString.getUIString(_loc1_) + "( " + _loc4_ + "% )";
            lib.manager.ToolTip.add(_loc2_.RestIcon,_loc1_,1);
            break;
        case 3:
            _loc2_.RestIcon.gotoAndStop(3);
            _loc1_ = lib.util.UIString.getUIString(_loc1_) + "( " + _loc4_ + "% )";
            lib.manager.ToolTip.add(_loc2_.RestIcon,_loc1_,1);
            break;
        case 2:
            _loc2_.RestIcon.gotoAndStop(2);
            _loc1_ = lib.util.UIString.getUIString(_loc1_) + "( " + _loc4_ + "% )";
            lib.manager.ToolTip.add(_loc2_.RestIcon,_loc1_,1);
            break;
        case 1:
            _loc2_.RestIcon.gotoAndStop(1);
            _loc1_ = lib.util.UIString.getUIString(_loc1_) + "( " + _loc4_ + "% )";
            lib.manager.ToolTip.add(_loc2_.RestIcon,_loc1_,1);
    }
};
myListener.OnGameEventPartyMemberUpdateBattleState = function(paramIndex, bBattle)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc5_ = _loc2_.index;
    bBattle = Number(bBattle);
    var _loc4_ = "mc_PartyWindow" + _loc5_;
    var _loc1_ = UI[_loc4_];
    if(bBattle)
    {
        _loc1_.BattleIconGroup._visible = true;
        lib.manager.ToolTip.add(_loc1_.BattleIconGroup,lib.info.ToolTipStr.WAR,1);
    }
    else
    {
        _loc1_.BattleIconGroup._visible = false;
        lib.manager.ToolTip.remove(_loc1_.BattleIconGroup);
    }
    if(_loc1_.DistributionIcon._visible == true)
    {
        _loc1_.BattleIconGroup._x = 262.4;
    }
    else
    {
        _loc1_.BattleIconGroup._x = 239.3;
    }
};
var connection = null;
myListener.OnGame_PartyWindow_SetConnection = function(paramIndex, states)
{
    var _loc3_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc3_)
    {
        return undefined;
    }
    var _loc2_ = _loc3_.index;
    var _loc1_ = con["mc_PartyWindow" + _loc2_];
    states = _loc1_.connection = Number(states);
    if(_loc1_.connection == 0)
    {
        _loc1_.text_state.text = "$023010";
        showHp(_loc2_,0);
        showMp(_loc2_,0);
        showSt(_loc2_,0);
        _loc1_.hp_bg._visible = false;
        _loc1_.mp_bg._visible = false;
        _loc1_.st_bg._visible = false;
        _loc1_.bg.gotoAndStop(2);
        _loc1_.bg2.gotoAndStop(2);
        _loc1_.bg3.gotoAndStop(2);
        _loc1_.die_mc._visible = false;
        lib.util.Warning.remove(_loc1_.MC_party_warning);
        lib.util.Warning.remove(_loc1_.MC_party_warning2);
        _loc1_.buff_container._visible = false;
        lib.Debuger.trace("EnergyOption_Flag0 : " + EnergyOption_Flag0);
        lib.Debuger.trace("EnergyOption_Flag1 : " + EnergyOption_Flag1);
        lib.Debuger.trace("EnergyOption_Flag2 : " + EnergyOption_Flag2);
        lib.Debuger.trace("EnergyOption_Flag3 : " + EnergyOption_Flag3);
        _loc1_.text_Hp_100._visible = false;
        _loc1_.text_Hp_left._visible = false;
        _loc1_.slash1._visible = false;
        _loc1_.text_Hp_right._visible = false;
        _loc1_.text_Mp_100._visible = false;
        _loc1_.text_Mp_left._visible = false;
        _loc1_.slash2._visible = false;
        _loc1_.text_Mp_right._visible = false;
        _loc1_.text_St_100._visible = false;
        _loc1_.text_St_left._visible = false;
        _loc1_.slash3._visible = false;
        _loc1_.text_St_right._visible = false;
    }
    else
    {
        _loc1_.text_state.text = "";
        showHp(_loc2_,1);
        showMp(_loc2_,1);
        showSt(_loc2_,1);
        _loc1_.hp_bg._visible = true;
        _loc1_.mp_bg._visible = true;
        _loc1_.st_bg._visible = true;
        _loc1_.bg.gotoAndStop(1);
        _loc1_.bg2.gotoAndStop(1);
        _loc1_.bg3.gotoAndStop(1);
        _loc1_.buff_container._visible = true;
        lib.Debuger.trace("EnergyOption_Flag0 : " + EnergyOption_Flag0);
        lib.Debuger.trace("EnergyOption_Flag1 : " + EnergyOption_Flag1);
        lib.Debuger.trace("EnergyOption_Flag2 : " + EnergyOption_Flag2);
        lib.Debuger.trace("EnergyOption_Flag3 : " + EnergyOption_Flag3);
        if(EnergyOption_Flag0 == true && EnergyOption_Flag1 == true && EnergyOption_Flag2 == true && EnergyOption_Flag3 == true)
        {
            myListener.OnGame_PartyWindow_EnergyOption("1");
        }
        else
        {
            myListener.OnGame_PartyWindow_EnergyOption("0");
        }
    }
    checkMemberBlur(_loc2_);
};
myListener.OnGame_PartyWindow_SetSurvival = function(paramIndex, state)
{
    var _loc4_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc4_)
    {
        return undefined;
    }
    var _loc2_ = _loc4_.index;
    state = Number(state);
    var _loc1_ = con["mc_PartyWindow" + _loc2_];
    _loc1_.die = !state;
    if(_loc1_.connection == 1)
    {
        if(state == 0)
        {
            showHp(_loc2_,0);
            showMp(_loc2_,0);
            showSt(_loc2_,0);
            _loc1_.die_mc._visible = true;
            lib.manager.ToolTip.add(_loc1_.die_mc,lib.info.ToolTipStr.DEATH,1);
            _loc1_.bg.gotoAndStop(2);
            _loc1_.bg2.gotoAndStop(2);
            _loc1_.text_Hp_100._visible = false;
            _loc1_.text_Hp_left._visible = false;
            _loc1_.slash1._visible = false;
            _loc1_.text_Hp_right._visible = false;
            _loc1_.text_Mp_100._visible = false;
            _loc1_.text_Mp_left._visible = false;
            _loc1_.slash2._visible = false;
            _loc1_.text_Mp_right._visible = false;
            _loc1_.text_St_100._visible = false;
            _loc1_.text_St_left._visible = false;
            _loc1_.slash3._visible = false;
            _loc1_.text_St_right._visible = false;
            _loc1_.partyIcon._visible = false;
            _loc1_.partyIcon2._visible = false;
        }
        else if(state == 1)
        {
            showHp(_loc2_,1);
            showMp(_loc2_,1);
            showSt(_loc2_,1);
            _loc1_.die_mc._visible = false;
            lib.manager.ToolTip.remove(_loc1_.die_mc);
            _loc1_.bg.gotoAndStop(1);
            _loc1_.bg2.gotoAndStop(1);
            _loc1_.partyIcon._visible = true;
            _loc1_.partyIcon2._visible = true;
        }
        if(UI["mc_PartyWindow" + _loc2_].partyIcon._visible != false)
        {
            UI["mc_PartyWindow" + _loc2_].partyIcon2._x = 242.8;
        }
        else if(UI["mc_PartyWindow" + _loc2_].partyIcon._visible == false)
        {
            UI["mc_PartyWindow" + _loc2_].partyIcon2._x = 221.8;
        }
        if(UI["mc_PartyWindow" + _loc2_].partyIcon._visible != false && UI["mc_PartyWindow" + _loc2_].partyIcon2._visible != false)
        {
            UI["mc_PartyWindow" + _loc2_].die_mc._x = 271.1;
        }
        else if(UI["mc_PartyWindow" + _loc2_].partyIcon._visible != false && UI["mc_PartyWindow" + _loc2_].partyIcon2._visible == false)
        {
            UI["mc_PartyWindow" + _loc2_].die_mc._x = 250.8;
        }
        else if(UI["mc_PartyWindow" + _loc2_].partyIcon._visible == false && UI["mc_PartyWindow" + _loc2_].partyIcon2._visible != false)
        {
            UI["mc_PartyWindow" + _loc2_].die_mc._x = 250.8;
        }
        else if(UI["mc_PartyWindow" + _loc2_].partyIcon._visible == false && UI["mc_PartyWindow" + _loc2_].partyIcon2._visible == false)
        {
            UI["mc_PartyWindow" + _loc2_].die_mc._x = 225.8;
        }
    }
    checkMemberBlur(_loc2_);
};
myListener.OnGame_PartyWindow_SetSameWorld = function(paramIndex, state, inRange)
{
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        return undefined;
    }
    var _loc3_ = _loc1_.index;
    state = Number(state);
    inRange = Number(inRange);
    var _loc2_ = con["mc_PartyWindow" + _loc3_];
    _loc2_.inRange = inRange;
    _loc2_.sameWorld = state;
    checkMemberBlur(_loc3_);
};
myListener.OnGame_PartyWindow_SetVoiceChat = function(paramIndex, state)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc4_ = _loc2_.index;
    state = Number(state);
    var _loc1_ = con["mc_PartyWindow" + _loc4_];
    _loc1_.Mic._visible = state;
    if(state)
    {
        _loc1_.Mic.gotoAndPlay(2);
        lib.manager.ToolTip.add(_loc1_.Mic,lib.util.UIString.getUIString("$023012"),1);
    }
    else
    {
        _loc1_.Mic.gotoAndStop(1);
        lib.manager.ToolTip.remove(_loc1_.Mic);
    }
};
myListener.OnGameEventPartyClear = function()
{
    this.OnGameEventPartyWindowShow(0,false);
    this.OnGameEventPartyWindowShow(1,false);
    this.OnGameEventPartyWindowShow(2,false);
    this.OnGameEventPartyWindowShow(3,false);
};
myListener.OnGame_PartyWindow_OpenMenu = function(dataList)
{
    var _loc3_ = 0;
    while(_loc3_ < 30)
    {
        popUp_mc["line" + _loc3_].removeMovieClip();
        _loc3_ = _loc3_ + 1;
    }
    var _loc4_ = dataList.split("\n");
    if(_loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
    {
        _loc4_.splice(_loc4_.length - 1,1);
    }
    if(dataList != undefined && dataList != null && dataList != "")
    {
        dataIn = true;
        _loc3_ = 0;
        while(_loc3_ < _loc4_.length)
        {
            if(_loc4_.length > 1)
            {
                var _loc2_ = popUp_mc.attachMovie("line","line" + _loc3_,popUp_mc.getNextHighestDepth());
                _loc2_._x = 0;
                _loc2_._y = _loc3_ * lineH;
            }
            _loc3_ = _loc3_ + 1;
        }
        _loc3_ = 0;
        while(_loc3_ < _loc4_.length)
        {
            _loc2_ = popUp_mc["line" + _loc3_];
            _loc2_.txt.text = _loc4_[_loc3_];
            var _loc5_ = new TextFormat();
            if(_loc2_.txt.maxscroll > 1)
            {
                _loc5_.size = 18;
                _loc2_.txt.setTextFormat(_loc5_);
                _loc2_.txt._height = 50;
                _loc2_.txt._y = 0;
            }
            _loc2_.txt.verticalAlign = "center";
            _loc2_.txt.textAutoSize = "shrink”";
            _loc2_.index = _loc3_;
            _loc2_.hit.onRollOver = function()
            {
                delete popUp_mc.onEnterFrame;
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
            };
            _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
                closePopupTick();
            };
            _loc2_.hit.onPress = function()
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            };
            _loc2_.hit.onRelease = function()
            {
                ToGame_PartyWindow_SelectMenu(rightClickedMember,this._parent.index);
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
                popUp_mc._visible = false;
            };
            _loc3_ = _loc3_ + 1;
        }
        popUp_mc.bg._height = _loc4_.length * lineH;
        closePopupTick();
    }
    else
    {
        delete popUp_mc.onEnterFrame;
    }
    popUp_mc._visible = true;
};
myListener.OnGameEventPartyMemberAdd = function(paramIndex, Name)
{
    if(bWidgetOpen == false)
    {
        _root.BaseUIListener.OnGameEventShowUI(UI._name,true);
    }
    paramIndex = Number(paramIndex);
    this.OnGameEventPartyWindowShow(paramIndex,true);
    this.OnGameEventPartyMemberUpdateUserName(paramIndex,Name);
};
myListener.OnGameEventPartyWindowShow = function(paramIndex, bShow)
{
    if(bWidgetOpen == false)
    {
        _root.BaseUIListener.OnGameEventShowUI(UI._name,true);
    }
    var _loc3_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc3_)
    {
        return undefined;
    }
    var _loc4_ = _loc3_.index;
    var _loc5_ = "mc_PartyWindow" + _loc4_;
    _root.ToGame_RequestSetUIPosition(_loc5_);
    if(!bShow)
    {
        this.OnGame_PartyWindow_ClearBuff(paramIndex);
        _loc3_.paramIndex = undefined;
    }
    else
    {
        bRemoveBuff[_loc4_] = false;
    }
    _loc3_._visible = bShow;
};
myListener.OnGameEventPartyMemberUpdateUserName = function(paramIndex, Name)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc1_ = _loc2_.index;
    _loc1_ = Number(_loc1_);
    var _loc3_ = "mc_PartyWindow" + _loc1_;
    lib.util.ExtString.textCut(con[_loc3_].text_Name,Name,1);
    member_array[_loc1_].name = Name;
    lib.manager.ToolTip.add(_loc2_.UIDrager,paramIndex,9);
};
myListener.OnGame_SetUIPosition = function(bLocked, UIName, posXRatio, posYRatio, notRatio)
{
    var _loc1_ = 0;
    while(_loc1_ < partyMemberTotalNum)
    {
        if("mc_PartyWindow" + _loc1_ == UIName)
        {
            bLocked = Number(bLocked);
            posXRatio = Number(posXRatio);
            posYRatio = Number(posYRatio);
            var _loc2_ = con["mc_PartyWindow" + _loc1_];
            if(bLocked == 0)
            {
                posYRatio = lib.info.AlignInfo.yPixelToRatio(partyMemberBaseY_array[_loc1_]);
            }
            _loc2_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
            _loc2_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
        }
        _loc1_ = _loc1_ + 1;
    }
};
myListener.OnGame_ResetUIPosition = function()
{
    var _loc1_ = 0;
    while(_loc1_ < partyMemberTotalNum)
    {
        var _loc2_ = con["mc_PartyWindow" + _loc1_];
        _loc2_._x = lib.info.AlignInfo.zeroPointX;
        _loc2_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * lib.info.AlignInfo.yPixelToRatio(partyMemberBaseY_array[_loc1_]);
        lib.info.AlignInfo.savePos(_loc2_,0);
        _loc1_ = _loc1_ + 1;
    }
};
var lvStr = lib.util.UIString.getUIString("$021010");
myListener.OnGameEventPartyMemberUpdateUserLevel = function(paramIndex, Level)
{
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        return undefined;
    }
    var _loc2_ = _loc1_.index;
    var _loc3_ = "mc_PartyWindow" + _loc2_;
    con[_loc3_].text_lv.text = Level;
    member_array[_loc2_].level = Level;
};
myListener.OnGameEventAmIPartyMaster = function(bTrue)
{
    bTrue = Number(bTrue);
    if(bTrue)
    {
        popUp_mc.gotoAndStop(1);
    }
    else
    {
        popUp_mc.gotoAndStop(2);
    }
};
myListener.OnGame_PartyWindow_SetPartyMaster = function(paramIndex, flag)
{
    var _loc2_ = -1;
    if(-1 != paramIndex)
    {
        var _loc3_ = getPartyWindowByParamIndex(paramIndex);
        if(null == _loc3_)
        {
            return undefined;
        }
        _loc2_ = _loc3_.index;
    }
    partymember_position();
    if(flag == 0)
    {
        UI["mc_PartyWindow" + _loc2_].partyIcon.gotoAndStop(4);
        lib.manager.ToolTip.add(UI["mc_PartyWindow" + _loc2_].partyIcon,lib.util.UIString.getUIString("$023008"),1);
        member.die_mc._x = 225.8;
    }
    else if(flag == 1)
    {
        UI["mc_PartyWindow" + _loc2_].partyIcon.gotoAndStop(1);
        lib.manager.ToolTip.add(UI["mc_PartyWindow" + _loc2_].partyIcon,lib.util.UIString.getUIString("$023007"),1);
        member.die_mc._x = 250.8;
    }
    else if(flag == 2)
    {
        UI["mc_PartyWindow" + _loc2_].partyIcon.gotoAndStop(2);
        lib.manager.ToolTip.add(UI["mc_PartyWindow" + _loc2_].partyIcon,lib.util.UIString.getUIString("$023013"),1);
        member.die_mc._x = 250.8;
    }
    else
    {
        UI["mc_PartyWindow" + _loc2_].partyIcon.gotoAndStop(4);
        member.die_mc._x = 225.8;
    }
    if(UI["mc_PartyWindow" + _loc2_].partyIcon._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc2_].partyIcon2._x = 242.8;
    }
    else if(UI["mc_PartyWindow" + _loc2_].partyIcon._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc2_].partyIcon2._x = 221.8;
    }
    if(UI["mc_PartyWindow" + _loc2_].partyIcon._currentframe != 4 && UI["mc_PartyWindow" + _loc2_].partyIcon2._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc2_].die_mc._x = 271.1;
    }
    else if(UI["mc_PartyWindow" + _loc2_].partyIcon._currentframe != 4 && UI["mc_PartyWindow" + _loc2_].partyIcon2._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc2_].die_mc._x = 250.8;
    }
    else if(UI["mc_PartyWindow" + _loc2_].partyIcon._currentframe == 4 && UI["mc_PartyWindow" + _loc2_].partyIcon2._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc2_].die_mc._x = 250.8;
    }
    else if(UI["mc_PartyWindow" + _loc2_].partyIcon._currentframe == 4 && UI["mc_PartyWindow" + _loc2_].partyIcon2._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc2_].die_mc._x = 225.8;
    }
    if(_loc2_ == -1)
    {
        partymember_position();
    }
    partymember_position = function()
    {
        var _loc2_ = 0;
        while(_loc2_ < 4)
        {
            var _loc1_ = UI["mc_PartyWindow" + _loc2_];
            _loc1_.partyIcon.gotoAndStop(4);
            if(_loc1_.partyIcon._currentframe != 4)
            {
                _loc1_.partyIcon2._x = 242.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4)
            {
                _loc1_.partyIcon2._x = 221.8;
            }
            if(_loc1_.partyIcon._currentframe != 4 && _loc1_.partyIcon2._currentframe != 4)
            {
                _loc1_.die_mc._x = 271.1;
            }
            else if(_loc1_.partyIcon._currentframe != 4 && _loc1_.partyIcon2._currentframe == 4)
            {
                _loc1_.die_mc._x = 250.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4 && _loc1_.partyIcon2._currentframe != 4)
            {
                _loc1_.die_mc._x = 250.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4 && _loc1_.partyIcon2._currentframe == 4)
            {
                _loc1_.die_mc._x = 225.8;
            }
            _loc2_ = _loc2_ + 1;
        }
    };
};
myListener.OnGame_PartyWindow_SetPartyRaidDistributionMaster = function(paramIndex, flag)
{
    var _loc3_ = -1;
    if(-1 != paramIndex)
    {
        var _loc4_ = getPartyWindowByParamIndex(paramIndex);
        if(null == _loc4_)
        {
            return undefined;
        }
        _loc3_ = _loc4_.index;
    }
    if(flag == 0)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(4);
    }
    else if(flag == 1)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(3);
    }
    else
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(4);
    }
    UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(4);
    if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2._x = 242.8;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2._x = 221.8;
    }
    if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe != 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 271.1;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe != 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 250.8;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe == 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 250.8;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe == 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 225.8;
    }
    if(_loc3_ == -1)
    {
        var _loc2_ = 0;
        while(_loc2_ < 4)
        {
            var _loc1_ = UI["mc_PartyWindow" + _loc2_];
            _loc1_.partyIcon2.gotoAndStop(4);
            if(_loc1_.partyIcon._currentframe != 4)
            {
                _loc1_.partyIcon2._x = 242.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4)
            {
                _loc1_.partyIcon2._x = 221.8;
            }
            if(_loc1_.partyIcon._currentframe != 4 && _loc1_.partyIcon2._currentframe != 4)
            {
                _loc1_.die_mc._x = 271.1;
            }
            else if(_loc1_.partyIcon._currentframe != 4 && _loc1_.partyIcon2._currentframe == 4)
            {
                _loc1_.die_mc._x = 250.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4 && _loc1_.partyIcon2._currentframe != 4)
            {
                _loc1_.die_mc._x = 250.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4 && _loc1_.partyIcon2._currentframe == 4)
            {
                _loc1_.die_mc._x = 225.8;
            }
            _loc2_ = _loc2_ + 1;
        }
    }
};
myListener.OnGame_PartyWindow_SetPartyRaidReady = function(paramIndex, flag)
{
    var _loc3_ = -1;
    if(-1 != paramIndex)
    {
        var _loc4_ = getPartyWindowByParamIndex(paramIndex);
        if(null == _loc4_)
        {
            return undefined;
        }
        _loc3_ = _loc4_.index;
    }
    if(flag == 0)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(4);
    }
    else if(flag == 1)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(3);
        UI["mc_PartyWindow" + _loc3_].partyIcon2.icons.gotoAndStop(1);
        lib.manager.ToolTip.add(UI["mc_PartyWindow" + _loc3_].partyIcon2,lib.util.UIString.getUIString("$023014"),1);
    }
    else if(flag == 2)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(3);
        UI["mc_PartyWindow" + _loc3_].partyIcon2.icons.gotoAndStop(2);
        lib.manager.ToolTip.add(UI["mc_PartyWindow" + _loc3_].partyIcon2,lib.util.UIString.getUIString("$023015"),1);
    }
    else
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2.gotoAndStop(4);
    }
    if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2._x = 242.8;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc3_].partyIcon2._x = 221.8;
    }
    if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe != 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 271.1;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe != 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 250.8;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe == 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe != 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 250.8;
    }
    else if(UI["mc_PartyWindow" + _loc3_].partyIcon._currentframe == 4 && UI["mc_PartyWindow" + _loc3_].partyIcon2._currentframe == 4)
    {
        UI["mc_PartyWindow" + _loc3_].die_mc._x = 225.8;
    }
    if(_loc3_ == -1)
    {
        var _loc2_ = 0;
        while(_loc2_ < 4)
        {
            var _loc1_ = UI["mc_PartyWindow" + _loc2_];
            _loc1_.partyIcon2.gotoAndStop(4);
            if(_loc1_.partyIcon._currentframe != 4)
            {
                _loc1_.partyIcon2._x = 242.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4)
            {
                _loc1_.partyIcon2._x = 221.8;
            }
            if(_loc1_.partyIcon._currentframe != 4 && _loc1_.partyIcon2._currentframe != 4)
            {
                _loc1_.die_mc._x = 271.1;
            }
            else if(_loc1_.partyIcon._currentframe != 4 && _loc1_.partyIcon2._currentframe == 4)
            {
                _loc1_.die_mc._x = 250.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4 && _loc1_.partyIcon2._currentframe != 4)
            {
                _loc1_.die_mc._x = 250.8;
            }
            else if(_loc1_.partyIcon._currentframe == 4 && _loc1_.partyIcon2._currentframe == 4)
            {
                _loc1_.die_mc._x = 225.8;
            }
            _loc2_ = _loc2_ + 1;
        }
    }
};
myListener.OnGame_PartyWindow_SetPartyRaid = function(paramIndex, flag)
{
    var _loc2_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc2_)
    {
        return undefined;
    }
    var _loc1_ = _loc2_.index;
    if(flag == 0)
    {
        UI["mc_PartyWindow" + _loc1_].DistributionIcon._visible = false;
        UI["mc_PartyWindow" + _loc1_].BattleIconGroup._x = 239.3;
    }
    else if(flag == 1)
    {
        UI["mc_PartyWindow" + _loc1_].DistributionIcon._visible = true;
        UI["mc_PartyWindow" + _loc1_].BattleIconGroup._x = 262.4;
        lib.manager.ToolTip.add(UI["mc_PartyWindow" + _loc1_].DistributionIcon,lib.util.UIString.getUIString("$023016"),1);
    }
};
myListener.OnGame_MouseDown = function(button, target)
{
    button = Number(button);
    if(button == 2)
    {
        if(target._parent._parent._parent.UIname == UIname)
        {
            rightClickedMember = target._parent._parent.paramIndex;
            popUp_mc._x = UI._xmouse;
            popUp_mc._y = UI._ymouse;
            ToGame_PartyWindow_CallMenu(rightClickedMember);
        }
    }
};
myListener.OnGame_PartyWindow_EnergyOption = function(flag)
{
    if(flag == "0")
    {
        if(UI.mc_PartyWindow0.die_mc._visible == false && UI.mc_PartyWindow0.text_state.text == "")
        {
            EnergyOption_Flag0 = false;
            UI.mc_PartyWindow0.text_Hp_100._visible = false;
            UI.mc_PartyWindow0.text_Mp_100._visible = false;
            UI.mc_PartyWindow0.text_St_100._visible = false;
            UI.mc_PartyWindow0.text_Hp_left._visible = true;
            UI.mc_PartyWindow0.slash1._visible = true;
            UI.mc_PartyWindow0.text_Hp_right._visible = true;
            UI.mc_PartyWindow0.text_Mp_left._visible = true;
            UI.mc_PartyWindow0.slash2._visible = true;
            UI.mc_PartyWindow0.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow0.class_st == true)
            {
                UI.mc_PartyWindow0.text_St_left._visible = true;
                UI.mc_PartyWindow0.slash3._visible = true;
                UI.mc_PartyWindow0.text_St_right._visible = true;
            }
        }
        if(UI.mc_PartyWindow1.die_mc._visible == false && UI.mc_PartyWindow1.text_state.text == "")
        {
            EnergyOption_Flag1 = false;
            UI.mc_PartyWindow1.text_Hp_100._visible = false;
            UI.mc_PartyWindow1.text_Mp_100._visible = false;
            UI.mc_PartyWindow1.text_St_100._visible = false;
            UI.mc_PartyWindow1.text_Hp_left._visible = true;
            UI.mc_PartyWindow1.slash1._visible = true;
            UI.mc_PartyWindow1.text_Hp_right._visible = true;
            UI.mc_PartyWindow1.text_Mp_left._visible = true;
            UI.mc_PartyWindow1.slash2._visible = true;
            UI.mc_PartyWindow1.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow1.class_st == true)
            {
                UI.mc_PartyWindow1.text_St_left._visible = true;
                UI.mc_PartyWindow1.slash3._visible = true;
                UI.mc_PartyWindow1.text_St_right._visible = true;
            }
        }
        if(UI.mc_PartyWindow2.die_mc._visible == false && UI.mc_PartyWindow2.text_state.text == "")
        {
            EnergyOption_Flag2 = false;
            UI.mc_PartyWindow2.text_Hp_100._visible = false;
            UI.mc_PartyWindow2.text_Mp_100._visible = false;
            UI.mc_PartyWindow2.text_St_100._visible = false;
            UI.mc_PartyWindow2.text_Hp_left._visible = true;
            UI.mc_PartyWindow2.slash1._visible = true;
            UI.mc_PartyWindow2.text_Hp_right._visible = true;
            UI.mc_PartyWindow2.text_Mp_left._visible = true;
            UI.mc_PartyWindow2.slash2._visible = true;
            UI.mc_PartyWindow2.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow2.class_st == true)
            {
                UI.mc_PartyWindow2.text_St_left._visible = true;
                UI.mc_PartyWindow2.slash3._visible = true;
                UI.mc_PartyWindow2.text_St_right._visible = true;
            }
        }
        if(UI.mc_PartyWindow3.die_mc._visible == false && UI.mc_PartyWindow3.text_state.text == "")
        {
            EnergyOption_Flag3 = false;
            UI.mc_PartyWindow3.text_Hp_100._visible = false;
            UI.mc_PartyWindow3.text_Mp_100._visible = false;
            UI.mc_PartyWindow3.text_St_100._visible = false;
            UI.mc_PartyWindow3.text_Hp_left._visible = true;
            UI.mc_PartyWindow3.slash1._visible = true;
            UI.mc_PartyWindow3.text_Hp_right._visible = true;
            UI.mc_PartyWindow3.text_Mp_left._visible = true;
            UI.mc_PartyWindow3.slash2._visible = true;
            UI.mc_PartyWindow3.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow3.class_st == true)
            {
                UI.mc_PartyWindow3.text_St_left._visible = true;
                UI.mc_PartyWindow3.slash3._visible = true;
                UI.mc_PartyWindow3.text_St_right._visible = true;
            }
        }
    }
    else if(flag == "1")
    {
        if(UI.mc_PartyWindow0.die_mc._visible == false && UI.mc_PartyWindow0.text_state.text == "")
        {
            UI.mc_PartyWindow0.text_Hp_100._visible = true;
            UI.mc_PartyWindow0.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow0.class_st == true)
            {
                UI.mc_PartyWindow0.text_Sp_100._visible = true;
            }
            UI.mc_PartyWindow0.text_Hp_left._visible = false;
            UI.mc_PartyWindow0.slash1._visible = false;
            UI.mc_PartyWindow0.text_Hp_right._visible = false;
            UI.mc_PartyWindow0.text_Mp_left._visible = false;
            UI.mc_PartyWindow0.slash2._visible = false;
            UI.mc_PartyWindow0.text_Mp_right._visible = false;
            UI.mc_PartyWindow0.text_St_left._visible = false;
            UI.mc_PartyWindow0.slash3._visible = false;
            UI.mc_PartyWindow0.text_St_right._visible = false;
        }
        if(UI.mc_PartyWindow1.die_mc._visible == false && UI.mc_PartyWindow1.text_state.text == "")
        {
            UI.mc_PartyWindow1.text_Hp_100._visible = true;
            UI.mc_PartyWindow1.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow1.class_st == true)
            {
                UI.mc_PartyWindow1.text_St_100._visible = true;
            }
            UI.mc_PartyWindow1.text_Hp_left._visible = false;
            UI.mc_PartyWindow1.slash1._visible = false;
            UI.mc_PartyWindow1.text_Hp_right._visible = false;
            UI.mc_PartyWindow1.text_Mp_left._visible = false;
            UI.mc_PartyWindow1.slash2._visible = false;
            UI.mc_PartyWindow1.text_Mp_right._visible = false;
            UI.mc_PartyWindow1.text_St_left._visible = false;
            UI.mc_PartyWindow1.slash3._visible = false;
            UI.mc_PartyWindow1.text_St_right._visible = false;
        }
        if(UI.mc_PartyWindow2.die_mc._visible == false && UI.mc_PartyWindow2.text_state.text == "")
        {
            UI.mc_PartyWindow2.text_Hp_100._visible = true;
            UI.mc_PartyWindow2.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow2.class_st == true)
            {
                UI.mc_PartyWindow2.text_St_100._visible = true;
            }
            UI.mc_PartyWindow2.text_Hp_left._visible = false;
            UI.mc_PartyWindow2.slash1._visible = false;
            UI.mc_PartyWindow2.text_Hp_right._visible = false;
            UI.mc_PartyWindow2.text_Mp_left._visible = false;
            UI.mc_PartyWindow2.slash2._visible = false;
            UI.mc_PartyWindow2.text_Mp_right._visible = false;
            UI.mc_PartyWindow2.text_St_left._visible = false;
            UI.mc_PartyWindow2.slash3._visible = false;
            UI.mc_PartyWindow2.text_St_right._visible = false;
        }
        if(UI.mc_PartyWindow3.die_mc._visible == false && UI.mc_PartyWindow3.text_state.text == "")
        {
            UI.mc_PartyWindow3.text_Hp_100._visible = true;
            UI.mc_PartyWindow3.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow3.class_st == true)
            {
                UI.mc_PartyWindow3.text_St_100._visible = true;
            }
            UI.mc_PartyWindow3.text_Hp_left._visible = false;
            UI.mc_PartyWindow3.slash1._visible = false;
            UI.mc_PartyWindow3.text_Hp_right._visible = false;
            UI.mc_PartyWindow3.text_Mp_left._visible = false;
            UI.mc_PartyWindow3.slash2._visible = false;
            UI.mc_PartyWindow3.text_Mp_right._visible = false;
            UI.mc_PartyWindow3.text_St_left._visible = false;
            UI.mc_PartyWindow3.slash3._visible = false;
            UI.mc_PartyWindow3.text_St_right._visible = false;
        }
    }
    UI.mc_PartyWindow0.UIDrager.onRelease2 = function()
    {
        if(UI.mc_PartyWindow0.UIDrager.pos_state == "false")
        {
            if(UI.mc_PartyWindow0.die_mc._visible == false && UI.mc_PartyWindow0.text_state.text == "")
            {
                var _loc1_ = UI.mc_PartyWindow0.paramIndex;
                if(EnergyOption_Flag0 == false)
                {
                    EnergyOption_Flag0 = true;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"1");
                }
                else if(EnergyOption_Flag0 == true)
                {
                    EnergyOption_Flag0 = false;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"0");
                }
            }
        }
    };
    UI.mc_PartyWindow1.UIDrager.onRelease2 = function()
    {
        if(UI.mc_PartyWindow1.UIDrager.pos_state == "false")
        {
            if(UI.mc_PartyWindow1.die_mc._visible == false && UI.mc_PartyWindow1.text_state.text == "")
            {
                var _loc1_ = UI.mc_PartyWindow1.paramIndex;
                if(EnergyOption_Flag1 == false)
                {
                    EnergyOption_Flag1 = true;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"1");
                }
                else if(EnergyOption_Flag1 == true)
                {
                    EnergyOption_Flag1 = false;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"0");
                }
            }
        }
    };
    UI.mc_PartyWindow2.UIDrager.onRelease2 = function()
    {
        if(UI.mc_PartyWindow2.UIDrager.pos_state == "false")
        {
            if(UI.mc_PartyWindow2.die_mc._visible == false && UI.mc_PartyWindow2.text_state.text == "")
            {
                var _loc1_ = UI.mc_PartyWindow2.paramIndex;
                if(EnergyOption_Flag2 == false)
                {
                    EnergyOption_Flag2 = true;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"1");
                }
                else if(EnergyOption_Flag2 == true)
                {
                    EnergyOption_Flag2 = false;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"0");
                }
            }
        }
    };
    UI.mc_PartyWindow3.UIDrager.onRelease2 = function()
    {
        if(UI.mc_PartyWindow3.UIDrager.pos_state == "false")
        {
            if(UI.mc_PartyWindow3.die_mc._visible == false && UI.mc_PartyWindow3.text_state.text == "")
            {
                var _loc1_ = UI.mc_PartyWindow3.paramIndex;
                if(EnergyOption_Flag3 == false)
                {
                    EnergyOption_Flag3 = true;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"1");
                }
                else if(EnergyOption_Flag3 == true)
                {
                    EnergyOption_Flag3 = false;
                    myListener.OnGame_PartyWindow_EnergyOption_Flag(String(_loc1_),"0");
                }
            }
        }
    };
};
myListener.OnGame_PartyWindow_EnergyOption_Flag = function(paramIndex, flag)
{
    var _loc2_ = getPartyWindowByParamIndex(Number(paramIndex));
    if(null == _loc2_)
    {
        return undefined;
    }
    memberIndex = _loc2_.index;
    if(memberIndex == 0)
    {
        if(flag == "0")
        {
            UI.mc_PartyWindow0.text_Hp_100._visible = false;
            UI.mc_PartyWindow0.text_Mp_100._visible = false;
            UI.mc_PartyWindow0.text_St_100._visible = false;
            UI.mc_PartyWindow0.text_Hp_left._visible = true;
            UI.mc_PartyWindow0.slash1._visible = true;
            UI.mc_PartyWindow0.text_Hp_right._visible = true;
            UI.mc_PartyWindow0.text_Mp_left._visible = true;
            UI.mc_PartyWindow0.slash2._visible = true;
            UI.mc_PartyWindow0.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow0.class_st == true)
            {
                UI.mc_PartyWindow0.text_St_left._visible = true;
                UI.mc_PartyWindow0.slash3._visible = true;
                UI.mc_PartyWindow0.text_St_right._visible = true;
            }
        }
        else if(flag == "1")
        {
            UI.mc_PartyWindow0.text_Hp_100._visible = true;
            UI.mc_PartyWindow0.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow0.class_st == true)
            {
                UI.mc_PartyWindow0.text_St_100._visible = true;
            }
            UI.mc_PartyWindow0.text_Hp_left._visible = false;
            UI.mc_PartyWindow0.slash1._visible = false;
            UI.mc_PartyWindow0.text_Hp_right._visible = false;
            UI.mc_PartyWindow0.text_Mp_left._visible = false;
            UI.mc_PartyWindow0.slash2._visible = false;
            UI.mc_PartyWindow0.text_Mp_right._visible = false;
            UI.mc_PartyWindow0.text_St_left._visible = false;
            UI.mc_PartyWindow0.slash3._visible = false;
            UI.mc_PartyWindow0.text_St_right._visible = false;
        }
    }
    if(memberIndex == 1)
    {
        if(flag == "0")
        {
            UI.mc_PartyWindow1.text_Hp_100._visible = false;
            UI.mc_PartyWindow1.text_Mp_100._visible = false;
            UI.mc_PartyWindow1.text_St_100._visible = false;
            UI.mc_PartyWindow1.text_Hp_left._visible = true;
            UI.mc_PartyWindow1.slash1._visible = true;
            UI.mc_PartyWindow1.text_Hp_right._visible = true;
            UI.mc_PartyWindow1.text_Mp_left._visible = true;
            UI.mc_PartyWindow1.slash2._visible = true;
            UI.mc_PartyWindow1.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow1.class_st == true)
            {
                UI.mc_PartyWindow1.text_St_left._visible = true;
                UI.mc_PartyWindow1.slash3._visible = true;
                UI.mc_PartyWindow1.text_St_right._visible = true;
            }
        }
        else if(flag == "1")
        {
            UI.mc_PartyWindow1.text_Hp_100._visible = true;
            UI.mc_PartyWindow1.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow1.class_st == true)
            {
                UI.mc_PartyWindow1.text_St_100._visible = true;
            }
            UI.mc_PartyWindow1.text_Hp_left._visible = false;
            UI.mc_PartyWindow1.slash1._visible = false;
            UI.mc_PartyWindow1.text_Hp_right._visible = false;
            UI.mc_PartyWindow1.text_Mp_left._visible = false;
            UI.mc_PartyWindow1.slash2._visible = false;
            UI.mc_PartyWindow1.text_Mp_right._visible = false;
            UI.mc_PartyWindow1.text_St_left._visible = false;
            UI.mc_PartyWindow1.slash3._visible = false;
            UI.mc_PartyWindow1.text_St_right._visible = false;
        }
    }
    if(memberIndex == 2)
    {
        if(flag == "0")
        {
            UI.mc_PartyWindow2.text_Hp_100._visible = false;
            UI.mc_PartyWindow2.text_Mp_100._visible = false;
            UI.mc_PartyWindow2.text_St_100._visible = false;
            UI.mc_PartyWindow2.text_Hp_left._visible = true;
            UI.mc_PartyWindow2.slash1._visible = true;
            UI.mc_PartyWindow2.text_Hp_right._visible = true;
            UI.mc_PartyWindow2.text_Mp_left._visible = true;
            UI.mc_PartyWindow2.slash2._visible = true;
            UI.mc_PartyWindow2.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow2.class_st == true)
            {
                UI.mc_PartyWindow2.text_St_left._visible = true;
                UI.mc_PartyWindow2.slash3._visible = true;
                UI.mc_PartyWindow2.text_St_right._visible = true;
            }
        }
        else if(flag == "1")
        {
            UI.mc_PartyWindow2.text_Hp_100._visible = true;
            UI.mc_PartyWindow2.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow2.class_st == true)
            {
                UI.mc_PartyWindow2.text_St_100._visible = true;
            }
            UI.mc_PartyWindow2.text_Hp_left._visible = false;
            UI.mc_PartyWindow2.slash1._visible = false;
            UI.mc_PartyWindow2.text_Hp_right._visible = false;
            UI.mc_PartyWindow2.text_Mp_left._visible = false;
            UI.mc_PartyWindow2.slash2._visible = false;
            UI.mc_PartyWindow2.text_Mp_right._visible = false;
            UI.mc_PartyWindow2.text_St_left._visible = false;
            UI.mc_PartyWindow2.slash3._visible = false;
            UI.mc_PartyWindow2.text_St_right._visible = false;
        }
    }
    if(memberIndex == 3)
    {
        if(flag == "0")
        {
            UI.mc_PartyWindow3.text_Hp_100._visible = false;
            UI.mc_PartyWindow3.text_Mp_100._visible = false;
            UI.mc_PartyWindow3.text_St_100._visible = false;
            UI.mc_PartyWindow3.text_Hp_left._visible = true;
            UI.mc_PartyWindow3.slash1._visible = true;
            UI.mc_PartyWindow3.text_Hp_right._visible = true;
            UI.mc_PartyWindow3.text_Mp_left._visible = true;
            UI.mc_PartyWindow3.slash2._visible = true;
            UI.mc_PartyWindow3.text_Mp_right._visible = true;
            if(UI.mc_PartyWindow3.class_st == true)
            {
                UI.mc_PartyWindow3.text_St_left._visible = true;
                UI.mc_PartyWindow3.slash3._visible = true;
                UI.mc_PartyWindow3.text_St_right._visible = true;
            }
        }
        else if(flag == "1")
        {
            UI.mc_PartyWindow3.text_Hp_100._visible = true;
            UI.mc_PartyWindow3.text_Mp_100._visible = true;
            if(UI.mc_PartyWindow3.class_st == true)
            {
                UI.mc_PartyWindow3.text_St_100._visible = true;
            }
            UI.mc_PartyWindow3.text_Hp_left._visible = false;
            UI.mc_PartyWindow3.slash1._visible = false;
            UI.mc_PartyWindow3.text_Hp_right._visible = false;
            UI.mc_PartyWindow3.text_Mp_left._visible = false;
            UI.mc_PartyWindow3.slash2._visible = false;
            UI.mc_PartyWindow3.text_Mp_right._visible = false;
            UI.mc_PartyWindow3.text_St_left._visible = false;
            UI.mc_PartyWindow3.slash3._visible = false;
            UI.mc_PartyWindow3.text_St_right._visible = false;
        }
    }
};
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.CHARACTERWINDOW_PERCENT_BOOLEAN,this,"hpmpHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
myListener.OnGameEventPartyMember_DistributionOption = function()
{
};
myListener.OnGameEventPartyMember_DiceDistributionStart = function(paramIndex, _type)
{
    var mc = getPartyWindowByParamIndex(paramIndex);
    if(null == mc)
    {
        return undefined;
    }
    var memberIndex = mc.index;
    mc.DistributionType = 0;
    mc.DiceMc._x = 216;
    if(true == mc.partyIcon._visible && 4 != mc.partyIcon._currentframe)
    {
        mc.DiceMc._x = mc.DiceMc._x + 26;
    }
    if(true == mc.partyIcon2._visible && 4 != mc.partyIcon2._currentframe)
    {
        mc.DiceMc._x = mc.DiceMc._x + 26;
    }
    if(true == mc.die_mc._visible)
    {
        mc.DiceMc._x = mc.die_mc._x + mc.die_mc._width + 5;
    }
    if(_type == 1)
    {
        mc.DiceMc._visible = false;
        mc.DistributionType = 1;
    }
    else
    {
        mc.DiceMc._visible = true;
        mc.DistributionType = 0;
    }
    mc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.MaskMc.gotoAndStop(1);
    mc.DiceMc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.mc.gotoAndStop(1);
    mc.onEnterFrame = null;
    mc.onEnterFrame = function()
    {
        if(UI["mc_PartyWindow" + memberIndex].DiceMc._currentframe == DiceMc_StatEnd)
        {
            if(UI["mc_PartyWindow" + memberIndex].DiceMc.DiceMc._currentframe == DiceMcDiceMc_StatEnd)
            {
                mc.onEnterFrame = null;
                ToGame_PartyWindow_DiceDistributionStart_End(paramIndex);
            }
        }
    };
};
myListener.OnGameEventPartyMember_DiceDistributionData = function(paramIndex, _data, flag)
{
    var mc = getPartyWindowByParamIndex(paramIndex);
    if(null == mc)
    {
        return undefined;
    }
    var _loc3_ = mc.index;
    if(mc.DistributionType == 1)
    {
        mc.DiceMc._visible = false;
    }
    else
    {
        mc.DiceMc._visible = true;
    }
    if(mc.DiceMc._currentframe <= 200)
    {
        if(mc.DiceMc.DiceMc._currentframe <= 180)
        {
            mc.DiceMc.DiceMc.gotoAndPlay("start2");
            mc.DiceMc.DiceMc.txt_mc.gotoAndStop(1);
            if(_data > 100)
            {
                _data = _data - 100;
            }
            mc.DiceMc.DiceMc.txt_mc.txt.text = _data;
            if(flag == "1")
            {
                mc.DiceMc.DiceMc.txt_mc.txt._xscale = mc.DiceMc.DiceMc.txt_mc.txt._yscale = 100;
                mc.DiceMc.DiceMc.txt_mc.txt._y = 0;
                mc.DiceMc.DiceMc.txt_mc.txt.textColor = 12845056;
            }
            else if(flag == "0")
            {
                mc.DiceMc.DiceMc.txt_mc.txt._xscale = mc.DiceMc.DiceMc.txt_mc.txt._yscale = 80;
                mc.DiceMc.DiceMc.txt_mc.txt._y = 5;
                mc.DiceMc.DiceMc.txt_mc.txt.textColor = 16777215;
            }
            mc.DiceMc.DiceMc.onEnterFrame = null;
            mc.DiceMc.DiceMc.onEnterFrame = function()
            {
                if(mc.DiceMc.DiceMc._currentframe == DiceMcDiceMc_Stat2End)
                {
                    mc.DiceMc.DiceMc.onEnterFrame = null;
                    ToGame_PartyWindow_DiceDistributionData_End(paramIndex);
                }
            };
        }
    }
};
myListener.OnGameEventPartyMember_DiceDistributionIcon = function(_data)
{
    var _loc1_ = _data.split("\t");
    var paramIndex = Number(_loc1_[0]);
    var mc = getPartyWindowByParamIndex(paramIndex);
    if(null == mc)
    {
        return undefined;
    }
    var _loc2_ = mc.index;
    if(mc.DistributionType == 1)
    {
        mc.DiceMc._visible = false;
    }
    else
    {
        mc.DiceMc._visible = true;
    }
    if(mc.DiceMc._currentframe <= 200)
    {
        mc.DiceMc.IconMc.IconMc.draw(_loc1_[1]);
        mc.DiceMc.IconMc.IconMc.grade = _loc1_[2];
        mc.DiceMc.IconMc.IconMc.sealType = _loc1_[3];
        mc.DiceMc.IconMc.IconMc.display = true;
        mc.DiceMc.IconMc.IconMc.effect = false;
        mc.DiceMc.IconMc.IconMc.drag = false;
        mc.DiceMc.IconMc._visible = true;
        mc.DiceMc.gotoAndPlay("start2");
        mc.DiceMc.onEnterFrame = null;
        mc.DiceMc.onEnterFrame = function()
        {
            if(mc.DiceMc._currentframe == DiceMc_Stat2End)
            {
                mc.DiceMc.onEnterFrame = null;
                ToGame_PartyWindow_DiceDistributionIcon_End(paramIndex);
            }
        };
    }
};
myListener.OnGameEventPartyMember_DiceDistributionEnd = function(paramIndex)
{
    UI.onEnterFrame = null;
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        lib.Debuger.trace("return paramIndex : " + paramIndex);
        return undefined;
    }
    var _loc3_ = _loc1_.index;
    _loc1_.DiceMc.IconMc.IconMc.clear();
    _loc1_.DiceMc.IconMc._visible = false;
    if(_loc1_.DistributionType == 1)
    {
        return undefined;
    }
    if(_loc1_.DiceMc._currentframe > DiceMc_Stat2End)
    {
        _loc1_.DiceMc._visible = false;
    }
    else
    {
        _loc1_.DiceMc._visible = true;
    }
    _loc1_.DiceMc.gotoAndPlay("start3");
};
myListener.OnGameEventPartyMember_GoldDistributionStart = function(paramIndex)
{
    var mc = getPartyWindowByParamIndex(paramIndex);
    if(null == mc)
    {
        return undefined;
    }
    var memberIndex = mc.index;
    mc.DiceMc._visible = true;
    mc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.MaskMc.gotoAndStop(2);
    mc.DiceMc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.mc.gotoAndStop(2);
    mc.onEnterFrame = null;
    mc.onEnterFrame = function()
    {
        if(UI["mc_PartyWindow" + memberIndex].DiceMc._currentframe == DiceMc_StatEnd)
        {
            if(UI["mc_PartyWindow" + memberIndex].DiceMc.DiceMc._currentframe == DiceMcDiceMc_StatEnd)
            {
                mc.onEnterFrame = null;
                ToGame_PartyWindow_GoldDistributionStart_End(paramIndex);
            }
        }
    };
};
myListener.OnGameEventPartyMember_GoldDistributionData = function(paramIndex, flag)
{
    var mc = getPartyWindowByParamIndex(paramIndex);
    if(null == mc)
    {
        return undefined;
    }
    var _loc2_ = mc.index;
    mc.DiceMc._visible = true;
    if(mc.DiceMc._currentframe <= 200)
    {
        if(mc.DiceMc.DiceMc._currentframe <= 180)
        {
            mc.DiceMc.DiceMc.gotoAndPlay("start2");
            if(flag == "0")
            {
                mc.DiceMc.DiceMc.txt_mc.gotoAndStop(3);
            }
            else if(flag == "1")
            {
                mc.DiceMc.DiceMc.txt_mc.gotoAndStop(2);
            }
            else if(flag == "2")
            {
                mc.DiceMc.DiceMc.txt_mc.gotoAndStop(4);
            }
            else
            {
                mc.DiceMc.DiceMc.txt_mc.gotoAndStop(1);
            }
            mc.DiceMc.DiceMc.onEnterFrame = null;
            mc.DiceMc.DiceMc.onEnterFrame = function()
            {
                if(mc.DiceMc.DiceMc._currentframe == DiceMcDiceMc_Stat2End)
                {
                    mc.DiceMc.DiceMc.onEnterFrame = null;
                    ToGame_PartyWindow_GoldDistributionData_End(paramIndex);
                }
            };
        }
    }
};
myListener.OnGameEventPartyMember_GoldDistributionIcon = function(_data)
{
    var paramIndex = Number(teamList[0]);
    var mc = getPartyWindowByParamIndex(paramIndex);
    if(null == mc)
    {
        return undefined;
    }
    var _loc1_ = mc.index;
    var teamList = _data.split("\t");
    mc.DiceMc._visible = true;
    if(mc.DiceMc._currentframe <= 200)
    {
        lib.util.DrawBitmap.draw(mc.DiceMc.IconMc.IconMc,teamList[1],50,50);
        mc.DiceMc.IconMc._visible = true;
        mc.DiceMc.gotoAndPlay("start2");
        mc.DiceMc.onEnterFrame = null;
        mc.DiceMc.onEnterFrame = function()
        {
            if(mc.DiceMc._currentframe == DiceMc_Stat2End)
            {
                mc.DiceMc.onEnterFrame = null;
                ToGame_PartyWindow_GoldDistributionIcon_End(paramIndex);
            }
        };
    }
};
myListener.OnGameEventPartyMember_GoldDistributionEnd = function(paramIndex)
{
    UI.onEnterFrame = null;
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        return undefined;
    }
    var _loc2_ = _loc1_.index;
    lib.util.DrawBitmap.clear(_loc1_.DiceMc.IconMc.IconMc);
    _loc1_.DiceMc.IconMc._visible = false;
    if(_loc1_.DiceMc._currentframe > DiceMc_Stat2End)
    {
        _loc1_.DiceMc._visible = false;
    }
    else
    {
        _loc1_.DiceMc._visible = true;
    }
    _loc1_.DiceMc.gotoAndPlay("start3");
};
var debuffColor = new flash.geom.ColorTransform(0.35,0.35,0.35,1,107,25,166,0);
var normalColor = lib.info.ColorTrans.enableTrans();
myListener.OnGame_PartyWindow_DebuffState = function(paramIndex, debuff)
{
    var _loc3_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc3_)
    {
        return undefined;
    }
    var _loc2_ = _loc3_.index;
    var _loc1_ = UI["mc_PartyWindow" + _loc2_];
    var _loc4_ = new flash.geom.Transform(_loc1_.Hp_Bar);
    var _loc5_ = new flash.geom.Transform(_loc1_.MC_party_warning);
    _loc1_.isDebuffState = Number(debuff);
    if(Number(debuff))
    {
        _loc4_.colorTransform = debuffColor;
        _loc5_.colorTransform = debuffColor;
        animateWarning(_loc2_,_loc1_.isWarning);
    }
    else
    {
        _loc4_.colorTransform = normalColor;
        _loc5_.colorTransform = normalColor;
        animateWarning(_loc2_,_loc1_.isWarning);
    }
};
myListener.OnGame_PartyWindow_AchievementRating = function(paramIndex, nGrade)
{
    var _loc1_ = getPartyWindowByParamIndex(paramIndex);
    if(null == _loc1_)
    {
        return undefined;
    }
    var _loc3_ = _loc1_.index;
    var _loc2_ = con["mc_PartyWindow" + _loc3_];
    _loc2_.achievementMc.gotoAndStop(nGrade + 1);
};
fscommand("ToGame_Party_Init");
fscommand("ToGame_PartyWindow_Init");
