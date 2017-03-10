var UI = this;
var UIname = "QuestTaskInfo";
UI._visible = false;
container_mc.temp._visible = false;
container_mc.temp.text = lib.util.UIString.getUIString("$091045");
var BACK_UP_ITEM_BUTTON_MAX_WIDTH = 175;
var BACK_UP_ITEM_BUTTON_MIN_WIDTH = 100;
var buttonTextWidth = container_mc.temp.textWidth + 5;
var backUpButtonWidth = Math.min(BACK_UP_ITEM_BUTTON_MAX_WIDTH,buttonTextWidth);
backUpButtonWidth = Math.max(BACK_UP_ITEM_BUTTON_MIN_WIDTH,buttonTextWidth);
var slotsWidth = 275 - backUpButtonWidth - 32;
var slotCount = Math.round(slotsWidth / 35);
backUpButtonWidth = 243 - slotCount * 35;
container_mc.topEffect._visible = false;
container_mc.underEffect._visible = false;
container_mc.underLine._visible = false;
var questContainerY = container_mc.questContainer._y;
var questScroll = container_mc.scroll;
questScroll._visible = false;
questScroll.addListener(container_mc.questContainer);
var curScrollY = 0;
var curMc = null;
var bSet = false;
container_mc.questContainer.onScroll = function()
{
    var _loc2_ = curScrollY;
    container_mc.questContainer._y = questContainerY - arguments[0];
    curScrollY = questContainerY - container_mc.questContainer._y;
    if(_loc2_ != curScrollY)
    {
        getCurMc();
    }
};
var displaySize = container_mc.questMask._height;
questScroll.setWheel(container_mc.questContainer);
questScroll.wheelDelta = 1;
questScroll.pageSize = 0;
questScroll.displaySize = displaySize;
questScroll.defaultBarSizeRatio = 0.3333333333333333;
questScroll.rowHeightLimit = false;
questScroll.rowHeight = 70;
questScroll.scroll = 0;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
var bWidgetOpen = true;
var bHideQuest = false;
var questMaxNum = 3;
var posChangeStartIndex = null;
var posChangeEndIndex = null;
var activedBlet = null;
var addEffectTime = 10000;
var STR_INFINITY = lib.util.UIString.getUIString("$091021");
var STR_CANT_PROGRESS = lib.util.UIString.getUIString("$091030");
var COLOR_CANT_PROGRESS = lib.info.TextColor.GENERAL_IMPOSSIBLE;
var COLOR_QUEST_COMPLETE = lib.info.TextColor.UI_QUESTINFO_COMPLETE;
var COLOR_LOW_EXP = lib.info.TextColor.UI_QUESTINFO_NAME_LOWEXP;
var COLOR_TASK_COMPLETE = lib.info.TextColor.UI_QUESTINFO_FULL;
var COLOR_TASK_NOCOMPLETE = lib.info.TextColor.UI_QUESTINFO_SHORT;
var COLOR_QUESTTYPE_MISSION = lib.info.TextColor.UI_QUESTINFO_NAME_MISSION;
var COLOR_QUESTTYPE_GUILD = lib.info.TextColor.UI_QUESTINFO_NAME_GUILD;
var COLOR_QUESTTYPE_NORMAL = lib.info.TextColor.UI_QUESTINFO_NAME;
var axis = new lib.util.AxisResetter();
container_mc.mainLabel.txt.hitTestDisable = true;
var bBackUpStr = lib.util.UIString.getUIString("$091045");
var effect_array = [];
var questList = new lib.util.List(container_mc.questContainer,"mc");
questList.setAlignDirection("B");
questList.yGap = 3;
questList.setHitArea("bg_mc");
questList.setClearNextDepth(false);
var partyTaskList = new lib.util.List(container_mc.partyTaskContainer,"mc");
partyTaskList.setAlignDirection("B");
partyTaskList.setAddAlign(false);
partyTaskList.setRemoveAlign(false);
myListener.OnGame_QuestTaskInfo_UpdateList = function(listData)
{
    var _loc8_ = lib.util.ExtString.split(listData,"\n");
    var _loc3_ = 0;
    while(_loc3_ < _loc8_.length)
    {
        var _loc2_ = lib.util.ExtString.split(_loc8_[_loc3_],"\t");
        var _loc4_ = _loc2_[0];
        var _loc7_ = Number(_loc2_[1]);
        var _loc6_ = Number(_loc2_[2]);
        var _loc1_ = questList.getItem(_loc4_);
        if(_loc1_ != null)
        {
            var _loc5_ = questList.getIndex(_loc4_);
            if(_loc7_ != _loc5_)
            {
                questList.setRemoveAlign(false);
                questList.slice(_loc5_);
                questList.setRemoveAlign(true);
                questList.setAddAlign(false);
                questList.add(_loc4_,_loc1_,_loc7_);
                questList.setAddAlign(true);
            }
            _loc1_.setQuestTrackingNumber(_loc6_);
            if(_loc6_ < 1)
            {
                _loc1_.setQuestProgress(_loc1_.getQuestProgress());
            }
        }
        _loc3_ = _loc3_ + 1;
    }
    setScrollVisible();
};
var taskDatas = lib.gamedata.QuestTaskDataCollection.getInstance();
taskDatas.addEventListener(gfx.events.EventTypes.ADD,this,"taskUpdateHandler");
taskDatas.addEventListener(gfx.events.EventTypes.UPDATE,this,"taskUpdateHandler");
taskDatas.addEventListener(gfx.events.EventTypes.REMOVE,this,"taskRemoveHandler");
taskDatas.addEventListener(gfx.events.EventTypes.CLEAR,this,"taskClearHandler");
var newEffect_Array = [];
var testArray = [];
var ADD_EFFECT = 1;
var UPDATE_EFFECT = 2;
var prevQuestNum = 0;
lib.manager.ToolTip.add(container_mc.mainLabel.folderUp,lib.util.UIString.getUIString("$093007"),1);
function getCurMc()
{
    var _loc6_ = questList.align(true);
    var _loc8_ = _loc6_[lastIndex].y;
    var _loc7_ = questList.getLength();
    var _loc1_ = 0;
    while(_loc1_ < _loc7_)
    {
        var _loc2_ = questList.getItemAt(_loc1_);
        var _loc3_ = _loc6_[_loc1_].y;
        var _loc4_ = _loc3_ + _loc2_._height / 2;
        var _loc5_ = _loc3_ + _loc2_._height;
        if(curScrollY >= _loc3_ && curScrollY <= _loc4_)
        {
            curMc = _loc2_;
            break;
        }
        if(curScrollY > _loc4_ && curScrollY <= _loc5_)
        {
            curMc = questList.getItemAt(_loc1_ + 1);
            break;
        }
        _loc1_ = _loc1_ + 1;
    }
}
function addQuest(questId, optionAddIndex)
{
    questId;
    if(questId == "undefined" || questId == undefined)
    {
        return undefined;
    }
    var mc = questList.getItem(questId);
    if(mc == null)
    {
        mc = questList.add(questId,"task_link",optionAddIndex);
        mc.testId = questId;
        mc.newBg_mc._visible = false;
        mc.backUpItem_mc._visible = false;
        mc.backUpItem_mc.onLoad = function()
        {
            var _loc2_ = this.txtBtn;
            this.setWidth(backUpButtonWidth);
        };
        mc.setMaxSlotCol(slotCount + 1);
        mc.effectType = ADD_EFFECT;
        if(questList.getLength() > questMaxNum)
        {
            mc.onNewEffectFinished = function()
            {
                taskDatas.removeData(this.paramId);
                ToGame_QuestTaskInfo_RemoveQuestInfo(this.paramId,this.getQuestType());
            };
        }
        mc.setEnablePartyTaskToggleBtn(false);
        mc.onReleaseMinimizeToggleBtn = function()
        {
            if(this.newBg_mc._visible)
            {
                mc.bg_mc._visible = true;
                mc.newBg_mc._visible = false;
                mc.onNewEffectFinished();
                delete mc.count;
            }
            mc.setMinimizeMode(!this.getMinimizeMode());
            mc.resizeFrame();
            align();
            setScrollVisible();
        };
        mc.onReleasePartyTaskToggleBtn = function()
        {
            mc.setTogglePartyTaskToggleBtn(!mc.getTogglePartyTaskToggleBtn());
            mc.partyTask_mc._visible = mc.partyTaskToggle_mc._currentframe != 2?false:true;
        };
        mc.onReleaseCloseBtn = function()
        {
            ToGame_QuestTaskInfo_RemoveQuestInfo(this.paramId,this.getQuestType());
        };
        mc.bg_mc.onRollOver = function()
        {
            mc.showFocusEffect();
            mc.partyTask_mc.showFocusEffect();
            mc.partyTask_mc.swapDepths(mc.partyTask_mc._parent.getNextHighestDepth());
        };
        mc.bg_mc.onRollOut = function()
        {
            mc.hideFocusEffect();
            mc.partyTask_mc.hideFocusEffect();
        };
        mc.bg_mc.onPress = function()
        {
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
        };
        mc.bg_mc.onRelease = mc.bg_mc.onReleaseOutside = function()
        {
            mc.hideFocusEffect();
            mc.partyTask_mc.hideFocusEffect();
            stopDragCheck(mc);
            if(questDragging)
            {
                endPosChange(mc);
            }
            else
            {
                ToGame_QuestTaskInfo_ClickDialogBtn(mc.paramId);
            }
            mc._alpha = 100;
        };
        mc.backUpItem_mc.btn.onRelease2 = function()
        {
            ToGame_QuestTaskInfo_BackUpItem(mc.paramId);
        };
    }
    return mc;
}
function removeQuest(questId)
{
    var _loc1_ = questList.getItem(questId);
    if(_loc1_ == curMc)
    {
        var _loc3_ = questList.getIndex(questId);
        curMc = questList.getItemAt(_loc3_ + 1);
    }
    _loc1_.clear();
    questList.remove(questId);
    partyTaskList.remove(questId);
    setScrollVisible(true);
}
function addPartyTask(questId)
{
    var _loc2_ = questList.getItem(questId);
    var partyTaskMc = partyTaskList.add(questId,"partyTask_link");
    _loc2_.attachPartyTask(partyTaskMc);
    partyTaskMc.setBase(_loc2_);
    partyTaskMc.setQuestType(_loc2_.getQuestType());
    partyTaskMc.setLabel(_loc2_.getLabel());
    partyTaskMc._x = partyTaskMc._x - 230;
    partyTaskMc._y = _loc2_._y;
    partyTaskMc._visible = _loc2_.partyTaskToggle_mc._currentframe != 2?false:true;
    partyTaskMc.bg_mc.onRollOver = function()
    {
        partyTaskMc.getBase().showFocusEffect();
        partyTaskMc.showFocusEffect();
        partyTaskMc.swapDepths(partyTaskMc._parent.getNextHighestDepth());
    };
    partyTaskMc.bg_mc.onRollOut = function()
    {
        partyTaskMc.getBase().hideFocusEffect();
        partyTaskMc.hideFocusEffect();
    };
    partyTaskMc.bg_mc.onPress = function()
    {
        lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
        partyTaskMc.startDrag();
        partyTaskMc._alpha = 70;
    };
    partyTaskMc.bg_mc.onRelease = partyTaskMc.bg_mc.onReleaseOutside = function()
    {
        partyTaskMc.stopDrag();
        partyTaskMc._alpha = 100;
    };
    partyTaskMc.onReleaseCloseBtn = function()
    {
        this._visible = false;
        this.getBase().partyTaskToggle_mc.gotoAndStop(1);
        lib.manager.ToolTip.hide();
    };
    return partyTaskMc;
}
function taskUpdateHandler(event)
{
    var _loc16_ = (lib.gamedata.QuestTaskData)event.target;
    var id = _loc16_.getId();
    var _loc26_ = String(id).split("`");
    var _loc17_ = _loc26_[0];
    var _loc21_ = _loc16_.getListIndex();
    var mc = addQuest(_loc17_,_loc21_);
    var _loc20_ = questList.getIndex(_loc17_);
    mc.paramId = id;
    mc.markerHit.onRelease = function()
    {
        var _loc2_ = this.bMarker;
        ToGame_QuestTaskInfo_RequestSparkleImage(mc.paramId,_loc2_);
    };
    if(event.targetType == "quest")
    {
        var _loc24_ = _loc16_.getStep();
        if(mc.getQuestStep() != _loc24_ && !isNaN(mc.getQuestStep()))
        {
            var _loc10_ = mc;
            questList.setRemoveAlign(false);
            questList.slice(_loc20_);
            questList.setRemoveAlign(true);
            questList.setAddAlign(false);
            mc = addQuest(_loc17_,_loc20_);
            mc.paramId = id;
            questList.setAddAlign(true);
            mc._x = mc._x + mc._width;
            mc._y = _loc10_._y;
            mc.setMinimizeMode(_loc10_.getMinimizeMode());
            mc.previousTask_mc = _loc10_;
            var _loc22_ = mc.attachPartyTask(_loc10_.partyTask_mc);
            _loc22_.setBase(mc);
            _loc22_.setQuestType(_loc10_.getQuestType());
            mc.setEnablePartyTaskToggleBtn(_loc10_.getEnablePartyTaskToggleBtn());
            mc.setTogglePartyTaskToggleBtn(_loc10_.getTogglePartyTaskToggleBtn());
            _loc10_.setSlowlyHide();
            _loc10_.detachPartyTask();
            _loc10_.setEnableInteraction(false);
            _loc10_.backUpItem_mc._visible = false;
            prevQuestNum = _loc10_._x - _loc10_._width;
            align();
        }
        setQuestInfo(_loc16_,mc);
    }
    else if(event.targetType == "item")
    {
        var _loc23_ = _loc16_.getItemList();
        var _loc25_ = _loc16_.getIsBackUpItem();
        var _loc11_ = mc.setItemList(_loc23_,_loc25_);
        var _loc3_ = 0;
        while(_loc3_ < _loc11_.length)
        {
            var _loc7_ = _loc11_[_loc3_];
            _loc7_.onRelease = function()
            {
                ToGame_QuestTaskInfo_ClickItem(this.id);
            };
            _loc3_ = _loc3_ + 1;
        }
        align();
        setScrollVisible(_loc17_);
        var _loc19_ = mc.effectType;
        if(_loc19_ == ADD_EFFECT || _loc19_ == UPDATE_EFFECT)
        {
            if(!bHideQuest)
            {
                showEffect(_loc16_,_loc21_,_loc19_);
            }
            else
            {
                mc.onNewEffectFinished();
            }
            delete mc.effectType;
        }
    }
    else if(event.targetType == "task")
    {
        setTaskInfo(_loc16_,mc);
    }
    else if(event.targetType == "partyTask")
    {
        if(_loc16_.getTaskDataPartyColl().getLength() <= 0)
        {
            mc.detachPartyTask();
            mc.setTogglePartyTaskToggleBtn(false);
            mc.setEnablePartyTaskToggleBtn(false);
            partyTaskList.remove(_loc17_);
        }
        else
        {
            mc.setEnablePartyTaskToggleBtn(true);
            var _loc28_ = _loc16_.getTaskDataPartyColl();
            var _loc15_ = mc.partyTask_mc;
            if(_loc15_ == undefined || _loc15_ == null)
            {
                _loc15_ = addPartyTask(_loc17_);
            }
            mc.paramId = id;
            _loc15_.clearTask();
            var _loc12_ = 0;
            var _loc13_ = _loc28_.getIterator();
            while(_loc13_.hasNext())
            {
                var _loc2_ = (lib.gamedata.QuestTaskSubData)_loc13_.next();
                var _loc9_ = _loc2_.getLabel();
                var _loc6_ = _loc2_.getCurNum();
                var _loc8_ = _loc2_.getTotalNum();
                var _loc14_ = _loc2_.getFailed();
                var _loc4_ = _loc2_.getPerformerName();
                var _loc5_ = _loc2_.getStep();
                _loc15_.updateTask(_loc12_,_loc9_,_loc6_,_loc8_,_loc4_,_loc5_);
                _loc12_ = _loc12_ + 1;
            }
        }
    }
}
function taskRemoveHandler(event)
{
    var _loc4_ = event.data.getId();
    var _loc5_ = String(_loc4_).split("`");
    var _loc3_ = _loc5_[0];
    removeNewEffect(_loc4_);
    removeQuest(_loc3_);
    checkOverMaxQuest();
    var _loc1_ = 1;
    while(_loc1_ < effect_array.length)
    {
        var _loc2_ = effect_array[_loc1_];
        if(_loc2_ == _loc3_)
        {
            effect_array.splice(_loc1_,1);
        }
        _loc1_ = _loc1_ + 1;
    }
}
function removeNewEffect(id)
{
    var _loc4_ = newEffect_Array.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc4_)
    {
        var _loc3_ = newEffect_Array[_loc1_];
        var _loc2_ = _loc3_.getId();
        if(id == _loc2_)
        {
            newEffect_Array.splice(_loc1_,1);
        }
        _loc1_ = _loc1_ + 1;
    }
    var _loc6_ = container_mc.newContainer["newMc_" + id];
    if(_loc6_ != undefined)
    {
        gs.TweenLite.killTweensOf(_loc6_,false);
        _loc6_.removeMovieClip();
    }
}
function taskClearHandler(event)
{
    questList.clear();
    partyTaskList.clear();
    setScrollVisible();
}
function showEffect(questData, listIndex, effectType)
{
    var _loc8_ = questList.align(true);
    var _loc2_ = _loc8_[listIndex].y;
    var _loc3_ = 33.5 + container_mc.questContainer._y * -1;
    var _loc6_ = _loc3_ + displaySize;
    var _loc1_ = questList.getItemAt(listIndex);
    if(_loc2_ >= _loc3_ && _loc2_ < _loc6_)
    {
        _loc1_.bg_mc._visible = false;
        _loc1_.newBg_mc._visible = true;
        _loc1_.newBg_mc._height = _loc1_.bg_mc._height + 6;
        _loc1_.count = 0;
        stepOneOfEffectTypeOne(_loc1_);
    }
    else
    {
        var _loc4_ = "top";
        if(_loc2_ >= _loc6_)
        {
            _loc4_ = "under";
        }
        questData.lineEffect = _loc4_;
        questData.mc = _loc1_;
        var _loc5_ = createNewEffectMc(questData);
        newEffect_Array.push(_loc5_);
        var _loc7_ = newEffect_Array.length;
        if(_loc7_ < 2)
        {
            playNewEffect(_loc5_,undefined);
        }
    }
}
function createNewEffectMc(questData)
{
    var _loc5_ = questData.getId();
    var _loc6_ = questData.lineEffect;
    var _loc7_ = questData.mc;
    var _loc3_ = container_mc.newContainer;
    var _loc1_ = _loc3_.attachMovie("task_link","newMc_" + _loc5_,_loc3_.getNextHighestDepth());
    _loc1_.targetMc = _loc7_;
    _loc1_.lineEffect = _loc6_;
    setQuestInfo(questData,_loc1_);
    setTaskInfo(questData,_loc1_);
    var _loc4_ = questData.getItemList();
    _loc1_.setItemList(_loc4_,false);
    _loc1_.partyTaskToggle_mc._visible = false;
    _loc1_.minimizeToggle_mc._visible = false;
    _loc1_.close_mc._visible = false;
    _loc1_.bg_mc._visible = false;
    _loc1_.backUpItem_mc._visible = false;
    _loc1_.newBg_mc._height = _loc1_.bg_mc._height + 6;
    _loc1_._visible = false;
    return _loc1_;
}
function stepOneOfEffectTypeOne(mc)
{
    gs.TweenLite.killTweensOf(mc,false);
    if(mc.count < 3)
    {
        mc.count++;
        gs.TweenLite.to(mc,0.3,{_alpha:0,ease:easing.Regular.easeOut,onComplete:stepTwoOfEffectTypeOne,onCompleteParams:[mc]});
    }
    else
    {
        if(_global.gbUIMode)
        {
            mc.bg_mc._visible = true;
        }
        else
        {
            mc.bg_mc._visible = false;
        }
        mc.newBg_mc._visible = false;
        mc.onNewEffectFinished();
        delete mc.count;
    }
}
function stepTwoOfEffectTypeOne(mc)
{
    gs.TweenLite.to(mc,0.3,{_alpha:100,ease:Regular.easeOut,onComplete:stepOneOfEffectTypeOne,onCompleteParams:[mc]});
}
function playNewEffect(curMc, preMc)
{
    var _loc4_ = curMc._height;
    curMc._yscale = 0;
    curMc._y = _loc4_ / 2;
    curMc._visible = true;
    var _loc5_ = curMc.newEffect.attachMovie("newEffect","newEffect",curMc.newEffect.getNextHighestDepth());
    curMc.newEffect._y = _loc4_ / 2;
    _loc5_._alpha = 0;
    gs.TweenLite.to(curMc,0.3,{_y:0,_yscale:100,ease:Regular.easeOut});
    gs.TweenLite.to(_loc5_,0.5,{delay:0.3,_alpha:100,ease:Regular.easeOut,onComplete:stepTwoOfEffectTypeTwo,onCompleteParams:[curMc]});
    if(preMc != undefined)
    {
        preMc.newEffect.newEffect.removeMovieClip();
        gs.TweenLite.to(preMc,0.3,{_y:_loc4_,ease:Regular.easeOut});
        var _loc6_ = preMc.lineEffect;
        var _loc2_ = container_mc[_loc6_ + "Effect"];
        _loc2_._visible = true;
        gs.TweenLite.killTweensOf(_loc2_,false);
        _loc2_._alpha = 0;
        gs.TweenLite.to(_loc2_,0.5,{delay:0.2,_alpha:100,ease:Regular.easeOut,onComplete:stepTwoOfLineEffect,onCompleteParams:[_loc2_]});
        container_mc.scroll.barBtn.glow._visible = true;
        lib.util.Warning.add(container_mc.scroll.barBtn.glow);
        gs.TweenLite.to(preMc,0.3,{delay:0.3,_alpha:0,ease:Regular.easeOut,onComplete:stepThreeOfEffectTypeTwo,onCompleteParams:[preMc]});
    }
}
function stepTwoOfLineEffect(lineMc)
{
    gs.TweenLite.to(lineMc,0.5,{_alpha:0,ease:Regular.easeOut,onComplete:finishLineEffect,onCompleteParams:[lineMc]});
}
function finishLineEffect(lineMc)
{
    lineMc._visible = false;
    container_mc.scroll.barBtn.glow._visible = false;
    lib.util.Warning.remove(container_mc.scroll.barBtn.glow);
}
function stepTwoOfEffectTypeTwo(curMc)
{
    if(newEffect_Array.length > 0)
    {
        newEffect_Array.shift();
        var _loc4_ = newEffect_Array[0];
        playNewEffect(_loc4_,curMc);
    }
    else
    {
        gs.TweenLite.to(curMc,0.3,{_alpha:0,ease:Regular.easeOut,onComplete:stepThreeOfEffectTypeTwo,onCompleteParams:[curMc]});
        var _loc2_ = mc.lineEffect;
        var _loc1_ = container_mc[_loc2_ + "Effect"];
        _loc1_._visible = true;
        gs.TweenLite.killTweensOf(_loc1_,false);
        _loc1_._alpha = 0;
        container_mc.scroll.barBtn.glow._visible = true;
        lib.util.Warning.add(container_mc.scroll.barBtn.glow);
        container_mc.scroll.glow = true;
        gs.TweenLite.to(_loc1_,0.5,{delay:0.2,_alpha:100,ease:Regular.easeOut,onComplete:stepTwoOfLineEffect,onCompleteParams:[_loc1_]});
    }
}
function stepThreeOfEffectTypeTwo(mc)
{
    var _loc1_ = mc.targetMc;
    _loc1_.onNewEffectFinished();
    mc.removeMovieClip();
}
function setTaskInfo(questData, mc)
{
    var _loc11_ = questData.getTaskDataColl();
    var _loc6_ = 0;
    var _loc7_ = _loc11_.getIterator();
    while(_loc7_.hasNext())
    {
        var _loc1_ = (lib.gamedata.QuestTaskSubData)_loc7_.next();
        var _loc5_ = _loc1_.getLabel();
        var _loc3_ = _loc1_.getCurNum();
        var _loc4_ = _loc1_.getTotalNum();
        var _loc2_ = _loc1_.getFailed();
        var _loc9_ = _loc1_.getPerformerName();
        var _loc10_ = _loc1_.getStep();
        mc.updateTask(_loc6_,_loc5_,_loc3_,_loc4_,_loc2_);
        if(_loc2_)
        {
            mc.setFailed();
        }
        _loc6_ = _loc6_ + 1;
    }
    mc.removeTask(_loc6_,true);
}
function setQuestInfo(questData, mc)
{
    var _loc8_ = questData.getLabel();
    var _loc10_ = questData.getRecommendPartyMemberNum();
    var _loc12_ = questData.getStep();
    var _loc16_ = questData.getTimeLimitStr();
    var _loc14_ = questData.getQuestType();
    var _loc13_ = questData.getQuestProgressType();
    var _loc6_ = questData.getRepeatCurNum();
    var _loc7_ = questData.getRepeatTotalNum();
    var _loc17_ = questData.getIsCantProgress();
    var _loc15_ = questData.getIsComplete();
    var _loc9_ = questData.getTrackingNum();
    var _loc5_ = questData.getMapName();
    var _loc4_ = questData.getQuestLevel();
    mc.setQuestStep(_loc12_);
    if(_loc10_ > 1)
    {
        mc.showRecommendPartyNumIcon(_loc10_);
    }
    mc.setTimerStr(_loc16_);
    if(_loc4_ == null || _loc4_ == undefined || _loc4_ == "")
    {
        _loc4_ = "";
    }
    else
    {
        _loc4_ = lib.util.UIString.getUIString("221004") + _loc4_;
    }
    if(_loc5_ == null || _loc5_ == undefined || _loc5_ == "")
    {
        _loc5_ = "";
    }
    var _loc11_ = _loc4_ + " " + _loc5_;
    mc.setQuestInfo(_loc11_);
    if(!(_loc6_ == 0 && _loc7_ == 0 || _loc6_ == "" && _loc7_ == "" || (_loc6_ == undefined || _loc7_ == undefined)))
    {
        if(_loc7_ != -1)
        {
            _loc8_ = _loc8_ + (" < " + _loc6_ + "/" + _loc7_ + " >");
        }
        else
        {
            _loc8_ = _loc8_ + (" < " + _loc6_ + "/" + STR_INFINITY + " >");
        }
    }
    if(_loc17_)
    {
        _loc8_ = _loc8_ + STR_CANT_PROGRESS;
        mc.setLabelColor(COLOR_CANT_PROGRESS);
    }
    mc.setLabel(_loc8_);
    mc.setUIMode(_global.gbUIMode);
    mc.setQuestType(_loc14_);
    mc.setQuestProgress(_loc13_);
    if(_loc9_ > 0)
    {
        mc.setQuestTrackingNumber(_loc9_);
    }
    if(_loc15_)
    {
        mc.setQuestComplete();
    }
    else
    {
        mc.setQuestNotComplete();
    }
}
function align()
{
    var _loc5_ = questList.align(true);
    var _loc2_ = 0;
    while(_loc2_ < _loc5_.length)
    {
        var _loc3_ = _loc5_[_loc2_];
        var _loc1_ = questList.getItemAt(_loc2_);
        var _loc6_ = _loc3_.x;
        var _loc4_ = _loc3_.y;
        _loc1_._x = _loc3_.x;
        _loc1_._y = _loc3_.y;
        if(_loc1_.previousTask_mc != undefined)
        {
            gs.TweenLite.killTweensOf(_loc1_.previousTask_mc);
            gs.TweenLite.to(_loc1_.previousTask_mc,0.2,{_x:prevQuestNum,_y:_loc4_,ease:Strong.easeOut});
        }
        _loc2_ = _loc2_ + 1;
    }
}
function SetButton(btnMc)
{
    btnMc.onRelease = function()
    {
        lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
        if(bHideQuest)
        {
            showQuests();
        }
        else
        {
            hideQuests();
        }
        customizeData.saveData(lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN,Number(bHideQuest),true);
    };
}
function showQuests()
{
    var _loc1_ = lib.util.UIString.getUIString("$093007");
    bHideQuest = false;
    container_mc.questContainer._visible = true;
    container_mc.mainLabel.txt.setText(_loc1_);
    container_mc.mainLabel.folderUp._visible = true;
    container_mc.mainLabel.folderDown._visible = false;
    container_mc.scroll._visible = bScrollVisible;
    container_mc.underLine._visible = bScrollVisible;
    container_mc.newContainer;
    container_mc.underEffect;
    container_mc.topEffect;
    SetButton(container_mc.mainLabel.folderUp);
    lib.manager.ToolTip.add(container_mc.mainLabel.folderUp,_loc1_,1);
}
function hideQuests()
{
    var _loc1_ = lib.util.UIString.getUIString("$093008");
    bHideQuest = true;
    container_mc.questContainer._visible = false;
    container_mc.mainLabel.txt.setText(lib.util.UIString.getUIString("$093008"));
    container_mc.mainLabel.folderUp._visible = false;
    container_mc.mainLabel.folderDown._visible = true;
    container_mc.scroll._visible = false;
    container_mc.underLine._visible = false;
    SetButton(container_mc.mainLabel.folderDown);
    lib.manager.ToolTip.add(container_mc.mainLabel.folderDown,_loc1_,1);
}
function startPosChange(targetMc)
{
    questDragging = true;
    posChangeStartIndex = questList.getIndex(targetMc.id);
    questList.setRemoveAlign(false);
    questList.slice(posChangeStartIndex);
    align();
    questList.setRemoveAlign(true);
    if(targetMc.getBlinking())
    {
        targetMc.stopBlink(true);
    }
    targetMc.previousTask_mc._visible = false;
    targetMc.swapDepths(targetMc._parent.getNextHighestDepth());
    startDrag(targetMc,0,0,0,0,2000);
    targetMc.onEnterFrame = function()
    {
        activedBlet._visible = false;
        posChangeEndIndex = hitTestAndReturnTargetIndex(this);
        var _loc2_ = questList.getItemAt(posChangeEndIndex);
        _loc2_.blet_mc._visible = true;
        activedBlet = _loc2_.blet_mc;
    };
    checkOverMaxQuest();
}
function endPosChange(targetMc)
{
    lib.manager.UISound.play("1195");
    questDragging = false;
    targetMc.stopDrag();
    delete targetMc.onEnterFrame;
    activedBlet._visible = false;
    if(posChangeEndIndex != null)
    {
        var _loc3_ = questList.getItem(posChangeEndIndex);
        questList.setAddAlign(false);
        questList.add(targetMc.id,targetMc,posChangeEndIndex);
        align();
        questList.setAddAlign(true);
    }
    else
    {
        questList.setAddAlign(false);
        questList.add(targetMc.id,targetMc,questList.getLength());
        align();
        questList.setAddAlign(true);
    }
    posChangeEndIndex = null;
    targetMc.setUIMode(_global.gbUIMode);
    checkOverMaxQuest();
    ToGame_QuestTaskInfo_ChangeQuestSequence();
}
function hitTestAndReturnTargetIndex(movingMc)
{
    var _loc4_ = new flash.geom.Rectangle(movingMc._x,movingMc._y,20,20);
    var _loc2_ = null;
    var _loc5_ = questList.getIterator();
    var _loc3_ = 0;
    while(_loc5_.hasNext())
    {
        var _loc1_ = _loc5_.next();
        _loc2_ = new flash.geom.Rectangle(_loc1_._x,_loc1_._y,_loc1_.bg_mc._width,_loc1_.bg_mc._height / 2);
        if(_loc2_.intersects(_loc4_))
        {
            return _loc3_;
        }
        _loc2_ = new flash.geom.Rectangle(_loc1_._x,_loc1_._y + _loc1_.bg_mc._height / 2,_loc1_.bg_mc._width,_loc1_.bg_mc._height / 2);
        if(_loc2_.intersects(_loc4_))
        {
            return _loc3_ + 1;
        }
        _loc3_ = _loc3_ + 1;
    }
    return null;
}
function startDragCheck(dragTarget)
{
    var _loc4_ = _root._xmouse;
    var fY = _root._ymouse;
    var _loc3_ = dragTarget.dragStartChecker != undefined?dragTarget.dragStartChecker:dragTarget.createEmptyMovieClip("dragStartChecker",dragTarget.getNextHighestDepth());
    _loc3_.onEnterFrame = function()
    {
        if(Math.abs(fY - _root._ymouse) > 10)
        {
            delete this.onEnterFrame;
            startPosChange(dragTarget);
        }
    };
}
function stopDragCheck(dragTarget)
{
    delete dragTarget.dragStartChecker.onEnterFrame;
}
function setScrollVisible()
{
    var _loc2_ = questList.getLength() - 1;
    var _loc8_ = questList.getItemAt(_loc2_);
    var _loc7_ = questList.align(true);
    var _loc4_ = _loc7_[_loc2_].y;
    var _loc5_ = _loc8_.getMinimizeMode() != 0?35:_loc8_._height;
    var _loc10_ = _loc4_ + _loc5_;
    var _loc6_ = !(_loc10_ < displaySize || _loc2_ < 0)?true:false;
    if(bScrollVisible != _loc6_)
    {
        questScroll.scroll = 0;
        bMoveScroll = false;
        bScrollVisible = _loc6_;
        questScroll._visible = bScrollVisible && !bHideQuest;
        container_mc.underLine._visible = bScrollVisible && !bHideQuest;
        var _loc1_ = !bScrollVisible?-26:26;
        container_mc.mainLabel.bg._width = container_mc.mainLabel.bg._width + _loc1_;
        container_mc.mainLabel.folderUp._x = container_mc.mainLabel.folderUp._x + _loc1_;
        container_mc.mainLabel.folderDown._x = container_mc.mainLabel.folderDown._x + _loc1_;
        container_mc.mainLabel.txt._width = container_mc.mainLabel.txt._width + _loc1_;
        container_mc.UIDrager._width = container_mc.UIDrager._width + _loc1_;
        hit._width = hit._width + _loc1_;
    }
    var _loc9_ = questList.getIndex(curMc.id);
    var _loc3_ = _loc7_[_loc9_].y;
    questScroll.pageSize = _loc4_ + _loc5_;
    if(isNaN(_loc3_) == false && _loc3_ != undefined)
    {
        questScroll.setScrollPosition(_loc3_);
        bSet = true;
    }
}
function ToGame_QuestTaskInfo_RequestPartyInfo(id)
{
    getURL("FSCommand:ToGame_QuestTaskInfo_RequestPartyInfo",id);
}
function ToGame_QuestTaskInfo_ClickDialogBtn(id)
{
    getURL("FSCommand:ToGame_QuestTaskInfo_ClickDialogBtn",id);
}
function ToGame_QuestTaskInfo_ClickLockBtn(id, bMission)
{
    getURL("FSCommand:ToGame_QuestTaskInfo_ClickLockBtn",id + "\t" + bMission);
}
function ToGame_QuestTaskInfo_RemoveQuestInfo(id, bMissionQuest)
{
    getURL("FSCommand:ToGame_QuestTaskInfo_RemoveQuestInfo",id + "\t" + bMissionQuest);
}
function ToGame_QuestTaskInfo_AddQuestInfo(id, bMissionQuest)
{
    getURL("FSCommand:ToGame_QuestTaskInfo_AddQuestInfo",id + "\t" + bMissionQuest);
}
function ToGame_QuestTaskInfo_BackUpItem(id)
{
    lib.Debuger.trace("ToGame_QuestTaskInfo_BackUpItem : " + id);
    getURL("FSCommand:ToGame_QuestTaskInfo_BackUpItem",id);
}
function ToGame_QuestTaskInfo_ChangeQuestSequence()
{
    var _loc3_ = "";
    var _loc4_ = questList.getLength();
    var _loc1_ = 0;
    while(_loc1_ < _loc4_)
    {
        var _loc2_ = questList.getItemAt(_loc1_);
        _loc3_ = _loc3_ + _loc2_.paramId;
        if(_loc1_ != _loc4_)
        {
            _loc3_ = _loc3_ + "\t";
        }
        _loc1_ = _loc1_ + 1;
    }
    getURL("FSCommand:ToGame_QuestTaskInfo_ChangeQuestSequence",_loc3_);
}
function ToGame_QuestTaskInfo_ClickItem(id)
{
    getURL("FSCommand:ToGame_QuestTaskInfo_ClickItem",id);
}
function ToGame_QuestTaskInfo_RequestSparkleImage(id, bMarker)
{
    var _loc1_ = id + "\t" + bMarker;
    getURL("FSCommand:ToGame_QuestTaskInfo_RequestSparkleImage",_loc1_);
}
function minimizeHandler(value)
{
    if(value != null)
    {
        bHideQuest = value;
        if(value == 1)
        {
            hideQuests();
        }
        else
        {
            showQuests();
        }
    }
}
function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN)
    {
        minimizeHandler(event.value);
    }
}
if(container_mc.mainLabel.folderUp._visible)
{
    SetButton(container_mc.mainLabel.folderUp);
}
else
{
    SetButton(container_mc.mainLabel.folderDown);
}
var questDragging = false;
var bScrollVisible = false;
var bMoveScroll = false;
myListener.OnGame_ResetUIPosition = function()
{
    var _loc2_ = questList.getIterator();
    while(_loc2_.hasNext())
    {
        var _loc1_ = questList.next();
        _loc1_.partyTask_mc._x = _loc1_._x - 230;
        _loc1_.partyTask_mc._y = _loc1_._y;
    }
};
myListener.OnGame_QuestTaskInfo_SetQuestMaxNum = function(num)
{
    num = Number(num);
    questMaxNum = num;
};
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == "questtaskinfo")
    {
        var _loc2_ = new lib.controls.CustomScaleEvent();
        _loc2_.CustomScaleEventCheck(UI,UIname);
        bWidgetOpen = bShow;
        if(bWidgetOpen)
        {
            UI._visible = true;
            myListener.OnGameEventChangeUIMode(_global.gbUIMode);
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
    }
    container_mc.mainLabel._visible = _global.gbUIMode;
    container_mc.checkBox._visible = _global.gbUIMode;
    container_mc.scroll._visible = _global.gbUIMode && bScrollVisible && !bHideQuest;
    container_mc.underLine._visible = _global.gbUIMode && bScrollVisible && !bHideQuest;
    var _loc3_ = questList.getIterator();
    while(_loc3_.hasNext())
    {
        var _loc2_ = questList.next();
        _loc2_.setUIMode(_global.gbUIMode);
    }
};
myListener.OnGame_QuestTaskInfo_SetLock = function(id, bLock)
{
    var _loc2_ = undefined;
    bLock = Number(bLock);
    var _loc1_ = 0;
    while(_loc1_ < task_array.length)
    {
        if(task_array[_loc1_].id == id)
        {
            _loc2_ = task_array[_loc1_];
        }
        _loc1_ = _loc1_ + 1;
    }
    if(bLock == 1)
    {
        _loc2_.lock_mc.gotoAndStop(2);
        _loc2_.lock_mc.locked = true;
        lib.manager.ToolTip.add(_loc2_.lock_mc,closeStr,1);
    }
    else if(bLock == 0)
    {
        _loc2_.lock_mc.gotoAndStop(1);
        _loc2_.lock_mc.locked = false;
        ToGame_QuestTaskInfo_RemoveQuestInfo(_loc2_.paramId,_loc2_.bMission);
        lib.manager.ToolTip.add(_loc2_.lock_mc,lib.util.UIString.getUIString("$093003"),1);
    }
};
myListener.OnGame_QuestTaskInfo_Open = function()
{
    showQuests();
};
myListener.OnGame_DoubleClick = function(target)
{
    if(target == container_mc.mainLabel)
    {
        if(bHideQuest)
        {
            showQuests();
        }
        else
        {
            hideQuests();
        }
    }
};
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN,this,"minimizeHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
resizeHitArea();
fscommand("ToGame_QuestTaskInfo_Init");
