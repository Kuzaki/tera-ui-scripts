function tabRelease(num)
{
    var _loc1_ = 100;
    if(num == "0")
    {
        _loc1_ = 100;
        getUrl("FSCommand:ToGame_Enchant_Tab", "0");
        container_mc.equipBtn._visible = false;
        container_mc.equipMc._visible = false;
        container_mc.slotBox._visible = true;
    }
    else
    {
        _loc1_ = 0;
        getUrl("FSCommand:ToGame_Enchant_Tab", "1");
        container_mc.equipBtn._visible = true;
        container_mc.slotBox._visible = false;
        container_mc.equipMc._visible = true;
    }
    container_mc.enchantBtn._alpha = _loc1_;
    container_mc.continueBtn._alpha = _loc1_;
    container_mc.helpIcon0._alpha = _loc1_;
    container_mc.helpIcon1._alpha = _loc1_;
    container_mc.totalFd0._alpha = _loc1_;
    container_mc.totalFd1._alpha = _loc1_;
    container_mc.subTitle0._alpha = _loc1_;
    container_mc.subTitle1._alpha = _loc1_;
    container_mc.subTitle2._alpha = _loc1_;
    container_mc.subTitle3._alpha = _loc1_;
    container_mc.mBtn2._alpha = _loc1_;
    container_mc.noitemFd0._alpha = _loc1_;
    container_mc.noitemFd1._alpha = _loc1_;
    container_mc.Enchant__1._alpha = _loc1_;
    container_mc.Enchant__2._alpha = _loc1_;
}
function ToGame_Enchant_Equipment()
{
    bContinue = false;
    bEnchan = false;
    bEquipment = true;
    fscommand("ToGame_Enchant_Equipment");
}
function ToGame_Enchant_Init()
{
    fscommand("ToGame_Enchant_Init");
}
function ToGame_Enchant_CloseUI()
{
    fscommand("ToGame_Enchant_CloseUI");
}
function ToGame_Enchant_Enchant()
{
    bContinue = false;
    bEnchant = true;
    bEquipment = false;
    fscommand("ToGame_Enchant_Enchant");
}
function ToGame_Enchant_Continue()
{
    bEnchant = false;
    bContinue = true;
    bEquipment = false;
    fscommand("ToGame_Enchant_Continue");
}
function ToGame_Enchant_RequestErrorMessage()
{
    getURL("FSCommand:ToGame_Enchant_RequestErrorMessage",maxCount);
}
function ToGame_Enchant_EndEnchant()
{
    fscommand("ToGame_Enchant_EndEnchant");
}
function ToGame_Enchant_CancelEnchant()
{
    enchantType = undefined;
    if(wakeupMode == 0)
    {
        enchantBtn.setText("$155037");
    }
    else if(wakeupMode == 1)
    {
        enchantBtn.setText("$155038");
    }
    else
    {
        enchantBtn.setText(enchantStr__1);
    }
    continueBtn.setText(continueStr__1);
    equipmentBtn.setText(enchantStr__1);
    enchantBtn.setRelease(ToGame_Enchant_Enchant);
    continueBtn.setRelease(ToGame_Enchant_Continue);
    equipmentBtn.setRelease(ToGame_Enchant_Equipment);
    container_mc.hitblockMc.removeMovieClip();
    bEnchant = false;
    bContinue = false;
    enchantBtn.setEnabled(true);
    continueBtn.setEnabled(true);
    equipmentBtn.setEnabled(true);
    setCount();
    gs.TweenLite.killTweensOf(container_mc.prograss.maskMc,false);
    container_mc.prograss.maskMc._width = 0;
    container_mc.prograss._visible = false;
    fscommand("ToGame_Enchant_CancelEnchant");
}
function ToGame_Enchant_ClickMouseRightBtn(targetId, index)
{
    var _loc1_ = targetId + "\t" + index;
    getURL("FSCommand:ToGame_Enchant_ClickMouseRightBtn",_loc1_);
}
function ToGame_Enchant_SelectListSlot(targetId)
{
    getURL("FSCommand:ToGame_Enchant_SelectListSlot",targetId);
}
function ToGame_Enchant_MasterGuide()
{
    getURL("FSCommand:ToGame_Enchant_MasterGuide",GuideBtnMode);
}
function ToGame_Enchant_MasterGuideInfo()
{
    getURL("FSCommand:ToGame_Enchant_MasterGuide",3);
}
function setCount()
{
    maxBtn.setEnabled(count < maxCount);
    plusBtn.setEnabled(count < maxCount);
    minusBtn.setEnabled(count > 0);
    continueBtn.setEnabled(count > 0);
    container_mc.maxFd.text = count;
    container_mc.maxFd.selectable = maxCount > 0;
}
function setEffectInfo()
{
    container_mc.curEffectFd_0.htmlText = container_mc.curStepFd_0.htmlText;
    container_mc.curEffectFd_1.htmlText = container_mc.curStepFd_1.htmlText;
    container_mc.curEffectFd_0._x = container_mc.curStepFd_0._x;
    container_mc.curEffectFd_1._x = container_mc.curStepFd_1._x;
    container_mc.effectCurInfoFd.htmlText = container_mc.curInfoFd.htmlText;
    container_mc.effectNextInfoFd.htmlText = container_mc.nextInfoFd.htmlText;
    container_mc.effectCurInfoFd._height = container_mc.curInfoFd._height;
    container_mc.effectNextInfoFd._height = container_mc.nextInfoFd._height;
    var _loc1_ = targetItemObj.grade;
    if(_loc1_ != undefined)
    {
        container_mc.effectNameFd.textColor = nameFdColor[_loc1_];
    }
    container_mc.effectNameFd.text = container_mc.nameFd.text;
}
function setPosition(moveH)
{
    stoneSlotStartY = stoneSlotStartY + moveH;
    powderSlotStartY = powderSlotStartY + moveH;
    container_mc.maxFd._y = container_mc.maxFd._y + moveH;
    container_mc.maxFocus._y = container_mc.maxFocus._y + moveH;
    container_mc.maxBg._y = container_mc.maxBg._y + moveH;
    container_mc.subTitle0._y = container_mc.subTitle0._y + moveH;
    container_mc.subTitle1._y = container_mc.subTitle1._y + moveH;
    container_mc.resultFd0._y = container_mc.resultFd0._y + moveH;
    container_mc.resultFd1._y = container_mc.resultFd1._y + moveH;
    container_mc.lockMc._y = container_mc.lockMc._y + moveH;
    container_mc.plusBtn._y = container_mc.plusBtn._y + moveH;
    container_mc.minusBtn._y = container_mc.minusBtn._y + moveH;
    container_mc.continueBtn._y = container_mc.continueBtn._y + moveH;
    container_mc.enchantBtn._y = container_mc.enchantBtn._y + moveH;
    container_mc.equipBtn._y = container_mc.equipBtn._y + moveH;
    container_mc.Enchant__1._y = container_mc.Enchant__1._y + moveH;
    container_mc.Enchant__2._y = container_mc.Enchant__2._y + moveH;
    container_mc.materialCountFd._y = container_mc.materialCountFd._y + moveH;
    container_mc.alkahestCountFd._y = container_mc.alkahestCountFd._y + moveH;
    container_mc.prograss._y = container_mc.prograss._y + moveH;
    container_mc.tabBtn._y = container_mc.tabBtn._y + moveH;
    container_mc.titleFd_0._y = container_mc.titleFd_0._y + moveH;
    container_mc.restoreCountFd._y = container_mc.restoreCountFd._y + moveH;
    container_mc.equipMc._y = container_mc.equipMc._y + moveH;
    container_mc.subTitle2._y = container_mc.subTitle2._y + moveH;
    container_mc.subTitle3._y = container_mc.subTitle3._y + moveH;
    container_mc.noitemFd0._y = container_mc.noitemFd0._y + moveH;
    container_mc.noitemFd1._y = container_mc.noitemFd1._y + moveH;
    container_mc.mBtn2._y = container_mc.mBtn2._y + moveH;
    container_mc.helpIcon0._y = container_mc.helpIcon0._y + moveH;
    container_mc.helpIcon1._y = container_mc.helpIcon1._y + moveH;
    container_mc.totalFd0._y = container_mc.totalFd0._y + moveH;
    container_mc.totalFd1._y = container_mc.totalFd1._y + moveH;
    var _loc2_ = 0;
    while(_loc2_ < 4)
    {
        container_mc.slotBox["Enchant__MaterialListSlot" + _loc2_]._y = stoneSlotStartY;
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < 4)
    {
        container_mc.slotBox["Enchant__AlkahestListSlot" + _loc2_]._y = powderSlotStartY;
        _loc2_ = _loc2_ + 1;
    }
    hit._height = container_mc.continueBtn._y + 60;
}
function clearTargetItemSlot()
{
    container_mc.nameFd.text = "";
    container_mc.uiguideFd._visible = true;
    var _loc1_ = container_mc.Enchant__0;
    delete register1.slotId;
    _loc1_.clear();
    _loc1_.enchantFd.text = "";
    lib.manager.ToolTip.remove(_loc1_.SLOT);
    bTarget = false;
    container_mc.lockMc._visible = true;
    if(wakeupMode != 0)
    {
        container_mc.noitemFd0.htmlText = lib.util.UIString.getUIString("$155061");
        container_mc.noitemFd1.htmlText = lib.util.UIString.getUIString("$155062");
        container_mc.subTitle0._visible = false;
        container_mc.subTitle1._visible = false;
    }
    var _loc2_ = _loc1_.blink;
    if(_loc1_.blink == undefined)
    {
        _loc2_ = _loc1_.attachMovie("slotBlink","blink",_loc1_.getNextHighestDepth());
    }
    _loc2_._visible = true;
    _loc2_._x = _loc1_.Icon._x;
    _loc2_._y = _loc1_.Icon._y;
    _loc2_.hitTestDisable = true;
    clearEquipItemSlot();
}
function clearEquipItemSlot()
{
    var _loc1_ = container_mc.equipMc.Enchant__20;
    delete register1.slotId;
    _loc1_.clear();
    lib.manager.ToolTip.remove(_loc1_.SLOT);
}
function clearMaterialItemList()
{
    bMaterialList = false;
    selectedMaterialId = 0;
    var _loc2_ = 0;
    while(_loc2_ < 4)
    {
        var _loc1_ = container_mc.slotBox["Enchant__MaterialListSlot" + _loc2_];
        _loc1_.btn.recommendMc.gotoAndStop(1);
        _loc1_.btn.recommendMc._visible = false;
        _loc1_.clear();
        _loc1_._visible = false;
        _loc2_ = _loc2_ + 1;
    }
    container_mc.totalFd0.text = "";
}
function clearAlkahestItemList()
{
    selectedAlkahestId = 0;
    bAlkahestList = false;
    var _loc2_ = 0;
    while(_loc2_ < powderCount)
    {
        var _loc1_ = container_mc.slotBox["Enchant__AlkahestListSlot" + _loc2_];
        delete register1.onEnterFrame;
        _loc1_.clear();
        _loc1_._visible = false;
        _loc2_ = _loc2_ + 1;
    }
    container_mc.totalFd1.text = "";
    powderCount = 0;
}
function clearEnchantInfo()
{
    container_mc.curTitleFd._visible = false;
    container_mc.nextTitleFd._visible = false;
    container_mc.curInfoFd.htmlText = "";
    container_mc.nextInfoFd.htmlText = "";
    container_mc.curPlusFd.htmlText = "";
    container_mc.curStepFd_0.htmlText = "";
    container_mc.curStepFd_1.htmlText = "";
    container_mc.nextPlusFd.htmlText = "";
    container_mc.nextStepFd_0.htmlText = "";
    container_mc.nextStepFd_1.htmlText = "";
}
function startPrograss()
{
    var _loc1_ = container_mc.attachMovie("hitblockMc","hitblockMc",container_mc.getNextHighestDepth());
    _loc1_._x = container_mc.prograss._x;
    _loc1_._y = container_mc.prograss._y;
    _loc1_.onRelease = function()
    {
    };
    container_mc.Enchant__0.drag = false;
    gs.TweenLite.killTweensOf(container_mc.prograss.maskMc,false);
    container_mc.prograss._visible = true;
    container_mc.prograss.maskMc._width = 0;
    gs.TweenLite.to(container_mc.prograss.maskMc,2,{delay:0.2,_width:490,ease:easing.Strong.easeOut,onComplete:finishPrograss});
}
function finishPrograss()
{
    enchantType = undefined;
    container_mc.prograss._visible = false;
    bEnchant = false;
    if(wakeupMode == 0)
    {
        enchantBtn.setText("$155037");
    }
    else if(wakeupMode == 1)
    {
        enchantBtn.setText("$155038");
    }
    else
    {
        enchantBtn.setText(enchantStr__1);
    }
    equipmentBtn.setText(enchantStr__1);
    equipmentBtn.setRelease(ToGame_Enchant_Equipment);
    enchantBtn.setRelease(ToGame_Enchant_Enchant);
    container_mc.Enchant__0.drag = true;
    container_mc.hitblockMc.removeMovieClip();
    ToGame_Enchant_EndEnchant();
}
function initStepFd()
{
    container_mc.curTitleFd.text = lib.util.UIString.getUIString("$155028");
    container_mc.curTitleFd.verticalAlign = "center";
    container_mc.curTitleFd.textAutoSize = "shrink";
    container_mc.nextTitleFd.text = lib.util.UIString.getUIString("$155029");
    container_mc.nextTitleFd.verticalAlign = "center";
    container_mc.nextTitleFd.textAutoSize = "shrink";
    var _loc3_ = container_mc.curTitleFd.textWidth + 5;
    var _loc4_ = container_mc.nextTitleFd.textWidth + 5;
    if(_loc3_ < titleMaxSize)
    {
        var _loc1_ = (titleMaxSize - _loc3_) / 2;
        container_mc.curTitleFd._x = container_mc.curTitleFd._x - _loc1_;
        container_mc.curPlusFd._x = container_mc.curPlusFd._x - _loc1_;
        container_mc.curStepFd_0._x = container_mc.curStepFd_0._x - _loc1_;
        container_mc.curStepFd_1._x = container_mc.curStepFd_1._x - _loc1_;
        curStepStart = curStepStart - _loc1_;
    }
    if(_loc4_ < titleMaxSize)
    {
        var _loc2_ = (titleMaxSize - _loc4_) / 2;
        container_mc.nextTitleFd._x = container_mc.nextTitleFd._x - _loc2_;
        container_mc.nextPlusFd._x = container_mc.nextPlusFd._x - _loc2_;
        container_mc.nextStepFd_0._x = container_mc.nextStepFd_0._x - _loc2_;
        container_mc.nextStepFd_1._x = container_mc.nextStepFd_1._x - _loc2_;
        nextStepStart = nextStepStart - _loc2_;
    }
}
function init()
{
    initStepFd();
    setEffectInfoVisible();
    clearTargetItemSlot();
    clearMaterialItemList();
    clearMaterialItemList();
    clearAlkahestItemList();
    container_mc.bg.hitTestDisable = true;
    container_mc.maxFd.type = "input";
    container_mc.enchantBtn.prograss._visible = false;
    container_mc.continueBtn.prograss._visible = false;
    container_mc.resultEffect_slot._visible = false;
    container_mc.curTitleFd._visible = false;
    container_mc.nextTitleFd._visible = false;
    container_mc.noitemFd0.htmlText = lib.util.UIString.getUIString("$155061");
    container_mc.noitemFd1.htmlText = lib.util.UIString.getUIString("$155062");
    container_mc.subTitle0._visible = false;
    container_mc.subTitle1._visible = false;
    container_mc.subTitle2._visible = false;
    container_mc.subTitle3._visible = false;
    container_mc.Enchant__1.drag = false;
    container_mc.Enchant__2.drag = false;
    container_mc.Enchant__1.effect = false;
    container_mc.Enchant__2.effect = false;
    container_mc.masterGuide._visible = false;
    container_mc.mBtn2._visible = false;
    container_mc.bg = container_mc.bg1;
    container_mc.bg2._visible = false;
    container_mc.bg3._visible = false;
    container_mc.onEnterFrame = function()
    {
        delete this.onEnterFrame;
        this._visible = true;
    };
}
function setSlotEffect()
{
    var _loc1_ = container_mc.resultEffect_slot;
    _loc1_._visible = true;
    _loc1_._x = 234;
    _loc1_._y = 119;
    _loc1_.effectMc._alpha = 0;
    bSlot = false;
    gs.TweenLite.to(_loc1_.effectMc,0.3,{_alpha:100,ease:easing.Strong.easeOut,onComplete:slotEffectStepTwo,onCompleteParams:[_loc1_]});
}
function setWakeuoSlotEffect()
{
    container_mc.ewakeUpEffectMc.gotoAndPlay(2);
}
function slotEffectStepTwo(mc)
{
    gs.TweenLite.to(mc.effectMc,0.3,{_alpha:0,ease:easing.Strong.easeOut,onComplete:finishSlotEffect,onCompleteParams:[mc]});
}
function finishSlotEffect(mc)
{
    mc._visible = false;
}
function setTextEffect(resultParam)
{
    setEffectInfo();
    bEffect = true;
    setEffectInfoVisible();
    var _loc10_ = !bContinue?0:0.6;
    var _loc5_ = !bContinue?0.2:0.25;
    bText = false;
    var _loc4_ = container_mc.attachMovie("resultEffect_text","resultEffect_text_0",container_mc.getNextHighestDepth());
    _loc4_.textFd.htmlText = container_mc.nextStepFd_0.htmlText;
    _loc4_._x = container_mc.nextStepFd_0._x + 18;
    _loc4_._y = container_mc.nextStepFd_0._y + 23;
    _loc4_._alpha = 100;
    gs.TweenLite.to(_loc4_,_loc5_,{delay:_loc10_,_alpha:0,ease:easing.Strong.easeOut});
    var _loc1_ = container_mc.attachMovie("resultEffect_textEffect","resultEffect_textE_0",container_mc.getNextHighestDepth());
    _loc1_.textFd.htmlText = "<img src=\'enchant_number_effect_" + nextNum + "\'>";
    _loc1_._x = container_mc.nextStepFd_0._x + 18;
    _loc1_._y = container_mc.nextStepFd_0._y + 23;
    _loc1_._width = _loc1_._height = 150;
    _loc1_.mc = _loc4_;
    _loc1_._alpha = 0;
    if(nextNum > 9)
    {
        var _loc3_ = container_mc.attachMovie("resultEffect_text","resultEffect_text_1",container_mc.getNextHighestDepth());
        _loc3_.textFd.htmlText = container_mc.nextStepFd_1.htmlText;
        _loc3_._x = container_mc.nextStepFd_1._x + 18;
        _loc3_._y = container_mc.nextStepFd_1._y + 23;
        _loc3_._alpha = 100;
        gs.TweenLite.to(_loc3_,_loc5_,{delay:_loc10_,_alpha:0,ease:easing.Strong.easeOut});
        var _loc7_ = int(nextNum / 10);
        var _loc6_ = nextNum % 10;
        _loc1_.textFd.htmlText = "<img src=\'enchant_number_effect_" + _loc7_ + "\'>";
        var _loc2_ = container_mc.attachMovie("resultEffect_textEffect","resultEffect_textE_1",container_mc.getNextHighestDepth());
        _loc2_.textFd.htmlText = "<img src=\'enchant_number_effect_" + _loc6_ + "\'>";
        _loc2_._x = container_mc.nextStepFd_1._x + 18;
        _loc2_._y = container_mc.nextStepFd_1._y + 23;
        _loc2_._width = _loc2_._height = 150;
        _loc2_._alpha = 0;
        _loc2_.mc = _loc3_;
        gs.TweenLite.to(_loc2_,_loc5_,{delay:_loc10_,_alpha:100,ease:easing.Strong.easeOut,onComplete:textEffectStepTwo,onCompleteParams:[_loc2_,1]});
    }
    gs.TweenLite.to(_loc1_,_loc5_,{delay:_loc10_,_alpha:100,ease:easing.Strong.easeOut,onComplete:textEffectStepTwo,onCompleteParams:[_loc1_,1]});
}
function textEffectStepTwo(textMc, textType)
{
    var _loc1_ = !bContinue?0.2:0.25;
    var _loc5_ = !bContinue?0.1:0;
    gs.TweenLite.to(textMc,_loc1_,{delay:_loc5_,_alpha:0,ease:easing.Strong.easeOut,onComplete:finishTextEffect,onCompleteParams:[textMc]});
    gs.TweenLite.to(textMc.mc,_loc1_,{delay:_loc5_,_alpha:100,ease:easing.Strong.easeOut});
}
function finishTextEffect(textMc)
{
    textMc.removeMovieClip();
    bEffect = false;
    timerId = setTimeout(updateEnchantInfo,200);
}
function setResultEffect(resultParam)
{
    var _loc5_ = resultParam != 1?"resultEffect_fail":"resultEffect_success";
    var _loc4_ = resultParam != 1?lib.util.UIString.getUIString("$155031"):lib.util.UIString.getUIString("$155030");
    var _loc9_ = resultParam != 1?0:0.2;
    var _loc2_ = container_mc.attachMovie(_loc5_,"resultEffect",container_mc.getNextHighestDepth());
    _loc2_._x = 140;
    _loc2_._y = 65;
    _loc2_._alpha = 0;
    var _loc1_ = container_mc.attachMovie("resultEffect_text","resultEffect_textMc",container_mc.getNextHighestDepth());
    _loc1_._x = 137;
    _loc1_._y = 86;
    _loc1_.textFd._x = 0;
    _loc1_.textFd._y = 0;
    _loc1_.textFd.text = _loc4_;
    _loc1_.textFd._width = 256;
    _loc1_.textFd._height = 24;
    _loc1_._alpha = 0;
    gs.TweenLite.to(_loc1_,0.15,{delay:_loc9_ + 0.15,_alpha:100,ease:easing.Strong.easeOut});
    gs.TweenLite.to(_loc2_,0.3,{delay:_loc9_,_alpha:100,_x:76,_y:49,_width:384,_height:96,ease:easing.Strong.easeOut,onComplete:resultEffectNextStep,onCompleteParams:[_loc2_,resultParam]});
}
function resultEffectNextStep(mc, resultParam)
{
    gs.TweenLite.to(mc,0.1,{_x:140,_y:65,_width:256,_height:64,ease:easing.Strong.easeOut,onComplete:resultEffectStepTwo,onCompleteParams:[mc]});
}
function resultEffectStepTwo(mc)
{
    gs.TweenLite.to(container_mc.resultEffect_textMc,0.3,{delay:1,_alpha:0,ease:easing.Strong.easeOut});
    gs.TweenLite.to(mc,0.3,{delay:1,_alpha:0,ease:easing.Strong.easeOut,onComplete:resultEffectfinish,onCompleteParams:[mc]});
}
function resultEffectfinish(mc)
{
    container_mc.resultEffect_textMc.removeMovieClip();
    mc.removeMovieClip();
}
function finishEffectSlot(mc)
{
    gs.TweenLite.to(mc,0.4,{_alpha:0,ease:easing.Strong.easeOut});
}
function setEffectInfoVisible(bFlag)
{
    container_mc.curEffectFd_0._visible = bEffect;
    container_mc.curStepFd_0._visible = !bEffect;
    container_mc.curEffectFd_1._visible = bEffect;
    container_mc.curStepFd_1._visible = !bEffect;
    container_mc.nextStepFd_0._visible = !bEffect;
    container_mc.nextStepFd_1._visible = !bEffect;
    container_mc.effectCurInfoFd._visible = bEffect;
    container_mc.curInfoFd._visible = !bEffect;
    container_mc.effectNextInfoFd._visible = bEffect;
    container_mc.nextInfoFd._visible = !bEffect;
    container_mc.effectNameFd._visible = bEffect;
    container_mc.nameFd._visible = !bEffect;
    if(bFlag)
    {
        container_mc.nameFd._alpha = 0;
        container_mc.curStepFd_0._alpha = 0;
        container_mc.curStepFd_1._alpha = 0;
        container_mc.nextStepFd_0._alpha = 0;
        container_mc.nextStepFd_1._alpha = 0;
        gs.TweenLite.to(container_mc.nameFd,0.4,{_alpha:100,ease:easing.Strong.easeOut});
        gs.TweenLite.to(container_mc.curStepFd_0,0.4,{_alpha:100,ease:easing.Strong.easeOut});
        gs.TweenLite.to(container_mc.curStepFd_1,0.4,{_alpha:100,ease:easing.Strong.easeOut});
        gs.TweenLite.to(container_mc.nextStepFd_0,0.4,{_alpha:100,ease:easing.Strong.easeOut});
        gs.TweenLite.to(container_mc.nextStepFd_1,0.4,{_alpha:100,ease:easing.Strong.easeOut});
    }
    if(materialItemObj == undefined)
    {
        container_mc.Enchant__Help0._visible = true;
    }
    if(alkahestItemObj == undefined)
    {
        container_mc.Enchant__Help1._visible = true;
    }
    if(bEffect == false)
    {
        container_mc.resultEffect_text_1.removeMovieClip();
        container_mc.resultEffect_text_0.removeMovieClip();
    }
}
function effectTextNextStep(mc, type)
{
    gs.TweenLite.to(mc,0.1,{_alpha:0,_width:70,_height:70,ease:easing.Strong.easeOut,onComplete:finishEffect});
}
function effectSlotNextStep()
{
    gs.TweenLite.to(container_mc.resultEffect_slot.effectMc,0.25,{_alpha:0,ease:easing.Strong.easeOut,onComplete:finishEffect0});
}
function finishEffect()
{
    timerId = setTimeout(finishAllEffect,200);
}
function updateEnchantInfo()
{
    container_mc.curEffectFd_0.htmlText = "";
    container_mc.curEffectFd_1.htmlText = "";
    container_mc.effectCurInfoFd.htmlText = "";
    container_mc.effectNextInfoFd.htmlText = "";
    container_mc.effectNameFd.htmlText = "";
    bEffect = false;
    setEffectInfoVisible(true);
    clearTimeout(timerId);
    timerId = null;
    drawSlots();
}
function setUiGuide(index)
{
    if(index == 0)
    {
        container_mc.uiguideFd.htmlText = uigideStr0;
    }
    else if(index == 1)
    {
        if(container_mc.nameFd.text == "" || container_mc.nameFd.text == undefined)
        {
            container_mc.uiguideFd.htmlText = uigideStr1;
            container_mc.uiguideFd.htmlText = container_mc.uiguideFd.htmlText + uigideStr3;
        }
        else
        {
            container_mc.uiguideFd.htmlText = uigideStr3;
        }
    }
    else if(index == 2)
    {
        container_mc.uiguideFd.htmlText = uigideStr2;
    }
}
function changeBg(bgIndex)
{
    container_mc.bg1._visible = bgIndex == 1;
    container_mc.bg2._visible = bgIndex == 2;
    container_mc.bg3._visible = bgIndex == 3;
    container_mc.bg = container_mc["bg" + bgIndex];
}
var UI = this;
var UIname = "Enchant";
bWidgetOpen = false;
var dataName = "Enchant__";
var bTarget = false;
var bMaterial = false;
var bAlkahest = false;
var enchantStr__0 = lib.util.UIString.getUIString("$155026");
var enchantStr__1 = lib.util.UIString.getUIString("$155024");
var continueStr__0 = lib.util.UIString.getUIString("$155027");
var continueStr__1 = lib.util.UIString.getUIString("$155025");
var MasterStr__0 = lib.util.UIString.getUIString("$155068");
var MasterStr__1 = lib.util.UIString.getUIString("$155073");
var MasterStr__2 = lib.util.UIString.getUIString("$155074");
var equipmentStr__0 = lib.util.UIString.getUIString("$155024");
container_mc._visible = false;
var bEquipment = false;
var bEnchant = false;
var bContinue = false;
var equipmentCount = 0;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
            gs.TweenLite.killTweensOf(container_mc.prograss.maskMc,false);
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
        gs.TweenLite.killTweensOf(container_mc.prograss.maskMc,false);
        UI._visible = false;
    }
};
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
    if(_UIName.toLowerCase() == UIname.toLowerCase())
    {
        var _loc2_ = - lib.info.AlignInfo.verticalSpace;
        if(UI._y < _loc2_)
        {
            UI._y = _loc2_;
        }
        var _loc3_ = lib.info.AlignInfo.uiScale(UIname,UI);
        var _loc1_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - container_mc.UIDrager._height * (lib.info.AlignInfo.scaleRatio * _loc3_);
        if(UI._y > _loc1_)
        {
            UI._y = _loc1_;
        }
    }
};
var wakeupMode = -1;
container_mc.wake_closeBtn._visible = false;
container_mc.tabBtn.tab.setTab(0);
myListener.OnGame_Enchant_SetWakeUP = function(type)
{
    container_mc.tabBtn._visible = false;
    type = Number(type);
    wakeupMode = type;
    if(levelVisible)
    {
        if(type == 0)
        {
            container_mc.levelMc.gotoAndStop(2);
        }
    }
    if(type == 0)
    {
        container_mc.prograss._y = 444;
        setUiGuide(1);
        container_mc.lockMc.gotoAndStop(2);
        changeBg(2);
        container_mc.prograss.barMc.gotoAndStop(2);
        container_mc.slotBgMc.gotoAndStop(2);
        container_mc.wake_closeBtn._visible = true;
        container_mc.closeBtn._visible = false;
        closeBtn = new lib.util.TxtBtn(container_mc.wake_closeBtn);
        closeBtn.setRelease(ToGame_Enchant_CloseUI);
        container_mc.enchantBtn.gotoAndStop(2);
        lib.manager.ToolTip.remove(container_mc.enchantBtn);
        enchantBtn = new lib.util.TxtBtn(container_mc.enchantBtn.btn,container_mc.enchantBtn.txt);
        enchantBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
        enchantBtn.setRelease(ToGame_Enchant_Enchant);
        enchantBtn.setEnabled(false);
        enchantBtn.setText("$155037");
        container_mc.continueBtn._visible = false;
        container_mc.maxFd._visible = false;
        container_mc.plusBtn._visible = false;
        container_mc.minusBtn._visible = false;
        container_mc.maxFocus._visible = false;
        container_mc.maxBg._visible = false;
        container_mc.titleFd.text = "$155037";
        container_mc.titleFd.textColor = lib.info.TextColor.BTN_UINIQUE_NORMAL;
        container_mc.titleFd_0._visible = false;
        container_mc.continueBtn._visible = false;
        container_mc.curInfoFd._visible = false;
        container_mc.nextInfoFd._visible = false;
        container_mc.restoreCountFd._visible = false;
        container_mc.curTitleFd._visible = false;
        container_mc.nextTitleFd._visible = false;
        container_mc.curPlusFd._visible = false;
        container_mc.curStepFd_0._visible = false;
        container_mc.curStepFd_1._visible = false;
        container_mc.nextPlusFd._visible = false;
        container_mc.nextStepFd_0._visible = false;
        container_mc.nextStepFd_1._visible = false;
        stoneSlotStartY = 394;
        powderSlotStartY = 500;
        container_mc.uiguideFd._y = container_mc.uiguideFd._y - 60;
        container_mc.Enchant__0._y = container_mc.Enchant__0._y - 28;
        container_mc.effectNameFd._y = container_mc.effectNameFd._y - 25;
        container_mc.nameFd._y = container_mc.nameFd._y - 25;
        saveNameFdPosY = container_mc.nameFd._y;
        saveEffectFdPosY = container_mc.effectNameFd._y;
        saveEnchantY = container_mc.Enchant__0._y;
        container_mc.Enchant__1._y = 359;
        container_mc.Enchant__2._y = 469;
        container_mc.totalFd0._y = 426;
        container_mc.totalFd1._y = 536;
        container_mc.enchantBtn._x = 188;
        container_mc.enchantBtn._y = 576;
        container_mc.prograss._y = container_mc.prograss._y - 97;
        container_mc.wake_closeBtn._x = container_mc.wake_closeBtn._x - 69;
        container_mc.wake_closeBtn._y = container_mc.wake_closeBtn._y - 7;
        container_mc.titleFd._y = container_mc.titleFd._y - 3;
        container_mc.helpIcon0._y = 363;
        container_mc.helpIcon1._y = 473;
        container_mc.subTitle1._y = 472;
        container_mc.noitemFd1._y = 472;
        container_mc.mBtn2._y = 532;
        var _loc3_ = lib.util.UIString.getUIString("$155065");
        var _loc2_ = lib.util.UIString.getUIString("$155066");
        lib.manager.ToolTip.add(container_mc.helpIcon0,_loc3_,1);
        lib.manager.ToolTip.add(container_mc.helpIcon1,_loc2_,1);
        container_mc.noitemFd1._visible = false;
        container_mc.noitemFd0._y = 355;
    }
    else
    {
        container_mc.enchantBtn._y = 676;
        setUiGuide(2);
        container_mc.lockMc.gotoAndStop(3);
        changeBg(3);
        container_mc.prograss.barMc.gotoAndStop(2);
        container_mc.slotBgMc.gotoAndStop(3);
        container_mc.wake_closeBtn._visible = true;
        container_mc.closeBtn._visible = false;
        closeBtn = new lib.util.TxtBtn(container_mc.wake_closeBtn);
        closeBtn.setRelease(ToGame_Enchant_CloseUI);
        container_mc.enchantBtn.gotoAndStop(2);
        container_mc.enchantBtn._x = 188;
        enchantBtn = new lib.util.TxtBtn(container_mc.enchantBtn.btn,container_mc.enchantBtn.txt);
        enchantBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
        enchantBtn.setRelease(ToGame_Enchant_Enchant);
        enchantBtn.setEnabled(false);
        enchantBtn.setText("$155038");
        container_mc.continueBtn._visible = false;
        container_mc.maxFd._visible = false;
        container_mc.plusBtn._visible = false;
        container_mc.minusBtn._visible = false;
        container_mc.maxFocus._visible = false;
        container_mc.maxBg._visible = false;
        container_mc.materialTitle0._visible = false;
        container_mc.materialTitle1._visible = false;
        container_mc.materialTitle2._visible = false;
        container_mc.materialTitle3.setText("$155039");
        container_mc.titleFd.text = "$155038";
        container_mc.titleFd.textColor = lib.info.TextColor.BTN_UINIQUE_NORMAL;
        container_mc.noitemFd1._visible = false;
        _loc3_ = lib.util.UIString.getUIString("$155050");
        _loc2_ = lib.util.UIString.getUIString("$155051");
        lib.manager.ToolTip.add(container_mc.helpIcon0,_loc3_,1);
        lib.manager.ToolTip.add(container_mc.helpIcon1,_loc2_,1);
        container_mc.Enchant__1._y = 459;
        container_mc.Enchant__2._y = 568;
        container_mc.totalFd0._y = 526;
        container_mc.totalFd1._y = 636;
        container_mc.prograss._y = 444;
        container_mc.helpIcon0._y = 463;
        container_mc.helpIcon1._y = 573;
        container_mc.subTitle0._y = 455;
        container_mc.noitemFd0._y = 455;
        container_mc.subTitle1._y = 567;
        container_mc.noitemFd1._y = 567;
        container_mc.subTitle2._y = 487;
        container_mc.subTitle3._y = 487;
        stoneSlotStartY = 494;
        powderSlotStartY = 598;
    }
};
var GuideBtnMode = 0;
myListener.OnGame_Enchant_MasterGuide = function(sMode, str)
{
    if(sMode == "0")
    {
        container_mc.masterGuide._visible = false;
        container_mc.nextInfoFd._visible = true;
        return undefined;
    }
    if(sMode == "1")
    {
        masterBtn.setText(MasterStr__0);
        GuideBtnMode = 1;
    }
    else
    {
        masterBtn.setText(MasterStr__1);
        GuideBtnMode = 2;
    }
    container_mc.masterGuide._visible = true;
    container_mc.nextInfoFd._visible = false;
    container_mc.masterGuide.txt.htmlText = str;
};
myListener.OnGame_Enchant_EnchantGuide = function(sMode)
{
    if(sMode == "0")
    {
        container_mc.noitemFd1._height = 99;
        container_mc.mBtn2._visible = false;
    }
    else
    {
        container_mc.noitemFd1._height = 64;
        container_mc.mBtn2._visible = true;
        if(container_mc.subTitle1._visible)
        {
            container_mc.mBtn2._x = container_mc.subTitle1._x + 195;
            container_mc.mBtn2._y = container_mc.subTitle1._y - 11;
        }
        else
        {
            container_mc.mBtn2._x = container_mc.subTitle1._x + 87;
            container_mc.mBtn2._y = container_mc.subTitle1._y + 60;
        }
    }
};
var tab = container_mc.tabBtn.tab;
tab.setRelease(tabRelease);
container_mc.equipMc.txt.verticalAlign = "center";
container_mc.equipMc.txt.htmlText = lib.util.UIString.getUIString("$101108");
myListener.OnGame_Enchant_SetEquipment = function(type, count, imgData)
{
    if(wakeupMode > -1)
    {
        return undefined;
    }
    if(type == "0")
    {
        container_mc.tabBtn._visible = false;
    }
    else
    {
        container_mc.tabBtn._visible = true;
    }
    equipmentCount = count;
    container_mc.equipMc.numTxt.text = lib.util.UIString.getUIString("$155055","count",equipmentCount);
    var _loc1_ = container_mc.equipMc.Enchant__20;
    if(imgData)
    {
        var _loc3_ = lib.util.ExtString.split(imgData,"\t");
        _loc1_.draw(_loc3_[1],52,52);
        _loc1_.grade = _loc3_[2];
        _loc1_.sealType = _loc3_[3];
        _loc1_.masterpiece = _loc3_[4];
        _loc1_.drag = true;
        _loc1_.disable = Boolean(Number(_loc3_[6]));
        lib.manager.ToolTip.add(_loc1_.SLOT,20,6);
        var _loc2_ = _loc3_[5];
        var _loc4_ = _loc1_.enchantFd;
        var _loc5_ = bImpossible <= 0?21433:3615811;
        if(_loc2_ > 11 && _loc2_ < 15)
        {
            _loc5_ = bImpossible <= 0?8915599:2299429;
        }
        else if(_loc2_ > 14)
        {
            _loc5_ = bImpossible <= 0?10624002:4074792;
        }
        _loc4_.shadowColor = _loc5_;
        _loc4_.text = "+" + _loc2_;
        _loc4_._visible = isNaN(_loc2_) == false && _loc2_ > 0;
        _loc4_.textColor = bImpossible <= 0?14145495:7368816;
    }
    else
    {
        _loc1_.enchantFd.text = "";
        delete register1.slotId;
        _loc1_.clear();
        lib.manager.ToolTip.remove(_loc1_.SLOT);
    }
};
var curGap = 0;
var INFO_MIN = 190;
var plusImg = "enchant_number_big_plus";
var nextNum = 0;
myListener.OnGame_Enchant_SetEnchantInfo = function(curInfo, nextInfo, curStep, nextStep)
{
    if(wakeupMode == 0)
    {
        return undefined;
    }
    clearEnchantInfo();
    if(curInfo != undefined)
    {
        _global.gfxExtensions = true;
        container_mc.curTitleFd._visible = true;
        container_mc.curInfoFd.autoSize = true;
        container_mc.curInfoFd._height = 16;
        container_mc.curInfoFd._width = 218;
        container_mc.curInfoFd.htmlText = curInfo;
        container_mc.nextInfoFd.autoSize = true;
        container_mc.nextInfoFd._height = 16;
        container_mc.nextInfoFd._width = 218;
        container_mc.nextInfoFd.htmlText = nextInfo;
        var _loc6_ = container_mc.curInfoFd.textHeight + 33;
        var _loc7_ = container_mc.nextInfoFd.textHeight + 33;
        var _loc5_ = _loc6_ <= _loc7_?_loc7_:_loc6_;
        var _loc8_ = _loc5_ <= INFO_MIN?0:_loc5_ - INFO_MIN;
        var _loc4_ = _loc8_ - curGap;
        curGap = _loc8_;
        if(_loc4_ != 0)
        {
            setPosition(_loc4_);
        }
        container_mc.bg._height = container_mc.bg._height + _loc4_;
        container_mc.infoBg._height = container_mc.infoBg._height + _loc4_;
        curStep = Number(curStep);
        nextStep = Number(nextStep);
        nextNum = nextStep;
        container_mc.curPlusFd.htmlText = "<img src=\'" + plusImg + "\'>";
        container_mc.nextPlusFd.htmlText = "<img src=\'" + plusImg + "\'>";
        if(curStep > 9)
        {
            var _loc10_ = int(curStep / 10);
            var _loc9_ = curStep % 10;
            container_mc.curStepFd_0.htmlText = "<img src=\'enchant_number_big_" + _loc10_ + "\'>";
            container_mc.curStepFd_1.htmlText = "<img src=\'enchant_number_big_" + _loc9_ + "\'>";
            container_mc.curPlusFd._x = container_mc.curTitleFd._x + container_mc.curTitleFd._width + 6;
            container_mc.curStepFd_0._x = container_mc.curPlusFd._x + 20;
            container_mc.curStepFd_1._x = container_mc.curStepFd_0._x + 35;
        }
        else
        {
            container_mc.curStepFd_0.htmlText = "<img src=\'enchant_number_big_" + curStep + "\'>";
            container_mc.curPlusFd._x = container_mc.curTitleFd._x + container_mc.curTitleFd._width + 11;
            container_mc.curStepFd_0._x = container_mc.curPlusFd._x + 30;
        }
        if(nextStep > 9)
        {
            _loc10_ = int(nextStep / 10);
            _loc9_ = nextStep % 10;
            container_mc.nextStepFd_0.htmlText = "<img src=\'enchant_number_big_" + _loc10_ + "\'>";
            container_mc.nextStepFd_1.htmlText = "<img src=\'enchant_number_big_" + _loc9_ + "\'>";
            container_mc.nextPlusFd._x = container_mc.nextTitleFd._x + container_mc.nextTitleFd._width + 6;
            container_mc.nextStepFd_0._x = container_mc.nextPlusFd._x + 20;
            container_mc.nextStepFd_1._x = container_mc.nextStepFd_0._x + 35;
        }
        else
        {
            container_mc.nextStepFd_0.htmlText = "<img src=\'enchant_number_big_" + nextStep + "\'>";
            container_mc.nextPlusFd._x = container_mc.nextTitleFd._x + container_mc.nextTitleFd._width + 11;
            container_mc.nextStepFd_0._x = container_mc.nextPlusFd._x + 30;
        }
        if(bEffect == false)
        {
            setEffectInfo();
        }
    }
};
var nameFdColor = ["0xFFFFFF","0x009900","0x00BFFFF","0xFFA500"];
myListener.OnGame_Enchant_SetTargetItemName = function(nameStr)
{
    container_mc.effectNameFd.text = "";
    container_mc.nameFd.text = "";
    container_mc.nameFd.textColor = "0xFFFFFF";
    if(wakeupMode == 0)
    {
        container_mc.uiguideFd.htmlText = uigideStr1;
        container_mc.uiguideFd.htmlText = container_mc.uiguideFd.htmlText + uigideStr3;
    }
    if(nameStr != undefined)
    {
        if(wakeupMode == 0)
        {
            container_mc.uiguideFd.htmlText = uigideStr3;
        }
        var _loc1_ = targetItemObj.grade;
        if(_loc1_ != undefined)
        {
            container_mc.nameFd.textColor = nameFdColor[_loc1_];
        }
        container_mc.nameFd.text = nameStr;
        if(bEffect == false)
        {
            container_mc.effectNameFd.text = container_mc.nameFd.text;
        }
    }
};
var targetItemObj = undefined;
var levelVisible = false;
container_mc.levelMc._visible = false;
var saveNameFdPosY = container_mc.nameFd._y;
var saveEffectFdPosY = container_mc.effectNameFd._y;
var saveEnchantY = container_mc.Enchant__0._y;
myListener.OnGame_Enchant_SetTargetItemSlot = function(dataList)
{
    var _loc1_ = lib.util.ExtString.split(dataList,"\t");
    clearTargetItemSlot();
    clearEnchantInfo();
    clearMaterialItemList();
    clearAlkahestItemList();
    container_mc.nameFd._y = saveEffectFdPosY;
    container_mc.effectNameFd._y = saveNameFdPosY;
    container_mc.Enchant__0._y = saveEnchantY;
    levelVisible = false;
    container_mc.levelMc._visible = false;
    if(wakeupMode == 0)
    {
        container_mc.uiguideFd.htmlText = uigideStr1;
        container_mc.uiguideFd.htmlText = container_mc.uiguideFd.htmlText + uigideStr3;
    }
    if(bContinue == false)
    {
        count = 0;
        maxCount = 0;
        setCount();
    }
    if(_loc1_.length > 0)
    {
        container_mc.lockMc._visible = false;
        if(wakeupMode != 0)
        {
            container_mc.uiguideFd._visible = false;
            container_mc.noitemFd1.htmlText = lib.util.UIString.getUIString("$155062");
            container_mc.subTitle1._visible = false;
        }
        var _loc2_ = container_mc.Enchant__0;
        _loc2_.blink._visible = false;
        var _loc17_ = _loc1_[0];
        var _loc13_ = _loc1_[1];
        var _loc3_ = Number(_loc1_[2]);
        var _loc16_ = Number(_loc1_[3]);
        var _loc11_ = Number(_loc1_[4]);
        var _loc15_ = Number(_loc1_[5]);
        var _loc4_ = Number(_loc1_[6]);
        var _loc10_ = Number(_loc1_[7]);
        var _loc8_ = Number(_loc1_[8]);
        var _loc12_ = Number(_loc1_[9]);
        var _loc9_ = Number(_loc1_[10]);
        if(_loc8_ > 0 && wakeupMode != 0)
        {
            levelVisible = true;
            container_mc.levelMc._visible = true;
            container_mc.Enchant__0._y = saveEnchantY - 10;
            var _loc7_ = int(_loc12_ / _loc9_ * 100);
            var _loc14_ = 65 * (_loc7_ / 100);
            container_mc.levelMc.txt0.text = _loc7_ + "%";
            container_mc.levelMc.txt1.htmlText = "Lv.<font size=\'18\' color=\'#0096ff\'>" + _loc10_ + "</font>/" + _loc8_;
            container_mc.nameFd._y = saveEffectFdPosY + 6;
            container_mc.effectNameFd._y = saveNameFdPosY + 6;
            container_mc.levelMc.gageMc._width = _loc14_;
        }
        _loc2_.slotId = 0;
        var _loc5_ = _loc2_.enchantFd;
        var _loc6_ = _loc3_ <= 0?21433:3615811;
        if(_loc4_ > 11 && _loc4_ < 15)
        {
            _loc6_ = _loc3_ <= 0?8915599:2299429;
        }
        else if(_loc4_ > 14)
        {
            _loc6_ = _loc3_ <= 0?10624002:4074792;
        }
        _loc5_.shadowColor = _loc6_;
        _loc5_.text = "+" + _loc4_;
        _loc5_._visible = isNaN(_loc4_) == false && _loc4_ > 0;
        _loc5_.textColor = _loc3_ <= 0?14145495:7368816;
        _loc2_.draw(_loc13_,52,52);
        if(_loc3_ == 1)
        {
            _loc2_.impossible = true;
        }
        else if(_loc3_ == 2)
        {
            _loc2_.disable = true;
        }
        _loc2_.masterpiece = _loc15_;
        _loc2_.sealType = _loc11_;
        _loc2_.grade = _loc16_;
        _loc2_.active = true;
        lib.manager.ToolTip.add(_loc2_,0,6);
    }
};
var materialItemList = new Array();
var START_MATERIALLIST_TOOLTIP_INDEX = 3;
var bMaterialList = false;
var stoneSlotStartX = 193;
var stoneSlotStartY = 522;
var stoneTooltipStr = ["$155043","$155044","$155045","$155046"];
myListener.OnGame_Enchant_SetMaterialItemList = function(dataList)
{
    clearMaterialItemList();
    var _loc14_ = lib.util.ExtString.split(dataList,"\n");
    var _loc15_ = _loc14_.length;
    var _loc5_ = 0;
    while(_loc5_ < _loc15_)
    {
        if(wakeupMode != 0)
        {
            container_mc.noitemFd0.htmlText = "";
            container_mc.subTitle0._visible = true;
        }
        var _loc3_ = lib.util.ExtString.split(_loc14_[_loc5_],"\t");
        var _loc4_ = Number(_loc3_[0]);
        var _loc13_ = _loc3_[1];
        var _loc8_ = Number(_loc3_[2]);
        var _loc7_ = Number(_loc3_[3]);
        var _loc12_ = Number(_loc3_[4]);
        var _loc2_ = container_mc.slotBox["Enchant__MaterialListSlot" + _loc4_];
        _loc2_._visible = true;
        if(_loc2_ == undefined)
        {
            _loc2_ = container_mc.slotBox.attachMovie("Comp:TxtBtn2","Enchant__MaterialListSlot" + _loc4_,container_mc.slotBox.getNextHighestDepth());
            _loc2_._x = stoneSlotStartX + 70 * _loc4_;
            _loc2_._y = stoneSlotStartY;
        }
        var _loc6_ = _loc2_.txtBtn;
        _loc6_.setRelease(ToGame_Enchant_SelectListSlot(1));
        var _loc10_ = lib.util.UIString.getUIString("$155054","count",_loc7_);
        _loc6_.setText(_loc10_);
        var _loc9_ = 3 + _loc4_;
        _loc2_.slotId = _loc9_;
        var _loc11_ = lib.util.UIString.getUIString(stoneTooltipStr[_loc5_],"count",_loc7_);
        lib.manager.ToolTip.add(_loc2_.txt,_loc11_,1);
        _loc6_.setEnabled(_loc8_ != 2);
        _loc2_.btn.onRelease2 = function()
        {
            ToGame_Enchant_SelectListSlot(this._parent.slotId);
        };
        if(_loc12_)
        {
            if(_loc2_.btn.recommendMc == undefined)
            {
                _loc2_.btn.attachMovie("recommendMc","recommendMc",1);
                _loc2_.btn.recommendMc.hitTestDisable = true;
            }
            else
            {
                _loc2_.btn.recommendMc.gotoAndPlay(1);
            }
            _loc2_.btn.recommendMc._visible = true;
        }
        else
        {
            _loc2_.btn.recommendMc.removeMovieClip();
        }
        _loc5_ = _loc5_ + 1;
    }
};
var alkahestItemList = new Array();
var START_ALKAHESTLIST_TOOLTIP_INDEX = 7;
var bAlkahestList = false;
var powderCount = 0;
var powderSlotStartX = 193;
var powderSlotStartY = 626;
myListener.OnGame_Enchant_SetAlkahestItemList = function(dataList)
{
    clearAlkahestItemList();
    if(wakeupMode != 0)
    {
        container_mc.uiguideFd._visible = false;
        container_mc.noitemFd1.htmlText = lib.util.UIString.getUIString("$155062");
        container_mc.subTitle1._visible = false;
    }
    var _loc16_ = lib.util.ExtString.split(dataList,"\n");
    var _loc17_ = _loc16_.length;
    var _loc6_ = 0;
    while(_loc6_ < _loc17_)
    {
        container_mc.noitemFd1.htmlText = "";
        container_mc.subTitle1._visible = true;
        var _loc3_ = lib.util.ExtString.split(_loc16_[_loc6_],"\t");
        var _loc4_ = Number(_loc3_[0]);
        var _loc14_ = _loc3_[1];
        var _loc5_ = _loc3_[2];
        var _loc8_ = Number(_loc3_[3]);
        var _loc10_ = Number(_loc3_[4]);
        var _loc13_ = Number(_loc3_[5]);
        var _loc15_ = Number(_loc3_[6]);
        var _loc9_ = Number(_loc3_[7]);
        var _loc11_ = Number(_loc3_[8]);
        var _loc12_ = Number(_loc3_[9]);
        if(_loc5_ == undefined || _loc5_ == "")
        {
            return undefined;
        }
        var _loc2_ = container_mc.slotBox["Enchant__AlkahestListSlot" + _loc4_];
        _loc2_._visible = true;
        if(_loc2_ == undefined)
        {
            _loc2_ = container_mc.slotBox.attachMovie("Comp:Slot","Enchant__AlkahestListSlot" + _loc4_,container_mc.slotBox.getNextHighestDepth());
            _loc2_._x = powderSlotStartX + 68.5 * _loc4_;
            _loc2_._y = powderSlotStartY;
        }
        var _loc7_ = _loc4_ + 7;
        _loc2_.slotId = _loc7_;
        lib.manager.ToolTip.add(_loc2_.SLOT,_loc7_,6);
        _loc2_.onRelease2 = function()
        {
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
            ToGame_Enchant_SelectListSlot(this.slotId);
        };
        _loc2_.draw(_loc5_,46,46);
        _loc2_.disable = _loc8_ == 2;
        _loc2_.grade = _loc10_;
        _loc2_.drag = false;
        _loc2_.num = _loc9_;
        _loc2_.recommand = _loc11_;
        powderCount++;
        _loc6_ = _loc6_ + 1;
    }
};
var selectedStoneSlot;
var selectedPowderSlot;
myListener.OnGame_Enchant_SelectListSlot = function(stoneSlotId, powderSlotId)
{
    stoneSlotId = Number(stoneSlotId);
    if(isNaN(stoneSlotId) == false && stoneSlotId != -1)
    {
        var _loc4_ = container_mc.slotBox["Enchant__MaterialListSlot" + stoneSlotId];
        selectedMaterialId = stoneSlotId + START_MATERIALLIST_TOOLTIP_INDEX;
        selectedStoneSlot.activeMc._alpha = 0;
        _loc4_.activeMc._alpha = 100;
        selectedStoneSlot = _loc4_;
    }
    else
    {
        container_mc.resultFd0.text = "";
        selectedStoneSlot.activeMc._alpha = 0;
        selectedStoneSlot = undefined;
        selectedMaterialId = 0;
    }
    powderSlotId = Number(powderSlotId);
    if(isNaN(powderSlotId) == false && powderSlotId != -1)
    {
        var _loc3_ = container_mc.slotBox["Enchant__AlkahestListSlot" + powderSlotId];
        selectedAlkahestId = powderSlotId + START_ALKAHESTLIST_TOOLTIP_INDEX;
        selectedPowderSlot.active = false;
        _loc3_.active = true;
        selectedPowderSlot = _loc3_;
    }
    else
    {
        container_mc.resultFd1.text = "";
        selectedPowderSlot.active = false;
        selectedPowderSlot = undefined;
        selectedAlkahestId = 0;
        container_mc.alkahestReleaseSlot._visible = false;
    }
};
myListener.OnGame_Enchant_SelectedStoneIcon = function(_data)
{
    container_mc.Enchant__1.clear();
    container_mc.Enchant__1.drag = false;
    container_mc.Enchant__1.effect = false;
    container_mc.Enchant__1.blink._visible = false;
    container_mc.totalFd0.htmlText = "";
    var _loc3_ = lib.util.ExtString.split(_data,"\t");
    var _loc6_ = _loc3_[0];
    var _loc8_ = Number(_loc3_[1]);
    var _loc2_ = Number(_loc3_[2]);
    var _loc4_ = Number(_loc3_[3]);
    var _loc7_ = Number(_loc3_[4]);
    if(_loc6_ == undefined || _loc6_ == "")
    {
        return undefined;
    }
    var _loc1_ = container_mc.Enchant__1;
    lib.manager.ToolTip.add(_loc1_.SLOT,1,6);
    _loc1_.draw(_loc6_,52,52);
    _loc1_.grade = _loc8_;
    if(wakeupMode == 0 || wakeupMode == 1)
    {
        _loc1_.num = _loc2_;
    }
    else if(_loc2_ <= _loc4_ && _loc2_ != 0)
    {
        _loc1_.num = _loc2_;
    }
    _loc1_.disable = _loc7_ == 2 || _loc2_ > _loc4_ || _loc2_ == 0;
    if(_loc2_ > _loc4_ || _loc2_ == 0)
    {
        container_mc.totalFd0.htmlText = "<font color=\'#c00005\'>" + lib.util.UIString.getUIString("$155055","count",_loc4_) + "</font>";
        var _loc5_ = _loc1_.blink;
        if(_loc5_ == undefined)
        {
            _loc5_ = _loc1_.attachMovie("slotBlink","blink",_loc1_.getNextHighestDepth());
        }
        _loc5_._x = _loc1_.Icon._x;
        _loc5_._y = _loc1_.Icon._y;
    }
    else
    {
        container_mc.totalFd0.htmlText = lib.util.UIString.getUIString("$155055","count",_loc4_);
        _loc1_.blink._visible = false;
    }
};
myListener.OnGame_Enchant_SelectedPowderIcon = function(_data)
{
    container_mc.Enchant__2.clear();
    container_mc.Enchant__2.drag = false;
    container_mc.Enchant__2.effect = false;
    container_mc.Enchant__2.blink._visible = false;
    container_mc.totalFd1.htmlText = "";
    var _loc2_ = lib.util.ExtString.split(_data,"\t");
    var _loc6_ = _loc2_[0];
    var _loc8_ = Number(_loc2_[1]);
    var _loc3_ = Number(_loc2_[2]);
    var _loc4_ = Number(_loc2_[3]);
    var _loc7_ = Number(_loc2_[4]);
    if(_loc6_ == undefined || _loc6_ == "")
    {
        return undefined;
    }
    var _loc1_ = container_mc.Enchant__2;
    _loc1_.slotId = 2;
    lib.manager.ToolTip.add(_loc1_.SLOT,2,6);
    _loc1_.draw(_loc6_,52,52);
    _loc1_.num = _loc3_;
    _loc1_.grade = _loc8_;
    _loc1_.disable = _loc7_ == 2 || _loc3_ > _loc4_ || _loc3_ == 0;
    if(_loc3_ > _loc4_ || _loc3_ == 0)
    {
        container_mc.totalFd1.htmlText = "<font color=\'#c00005\'>" + lib.util.UIString.getUIString("$155055","count",_loc4_) + "</font>";
        var _loc5_ = _loc1_.blink;
        if(_loc5_ == undefined)
        {
            _loc5_ = _loc1_.attachMovie("slotBlink","blink",_loc1_.getNextHighestDepth());
        }
        _loc5_._x = _loc1_.Icon._x;
        _loc5_._y = _loc1_.Icon._y;
    }
    else
    {
        container_mc.totalFd1.htmlText = lib.util.UIString.getUIString("$155055","count",_loc4_);
        _loc1_.blink._visible = false;
    }
};
var POWDER_STR1 = lib.util.UIString.getUIString("$155070");
myListener.OnGame_Enchant_Shortage = function(stone, powder)
{
    if(stone != "" && stone != undefined)
    {
        var _loc2_ = lib.util.ExtString.split(stone,"\t");
        var _loc4_ = lib.util.UIString.getUIString("$155059","count",_loc2_[0],"name",_loc2_[1]);
        _loc4_ = _loc4_ + ("<br>" + lib.util.UIString.getUIString("$155072","count",_loc2_[2]));
        container_mc.noitemFd0.htmlText = _loc4_;
        container_mc.noitemFd0._visible = true;
    }
    if(powder != "" && powder != undefined)
    {
        var _loc1_ = lib.util.ExtString.split(powder,"\t");
        var _loc3_ = lib.util.UIString.getUIString("$155060","count",_loc1_[0],"name",_loc1_[1]);
        _loc3_ = _loc3_ + ("<br>" + String(_loc1_[2]));
        _loc3_ = _loc3_ + POWDER_STR1;
        container_mc.noitemFd1.htmlText = _loc3_;
        container_mc.noitemFd1._visible = true;
    }
};
myListener.OnGame_Enchant_ShortageStrEdit = function(str0, str1)
{
    if(str0 != "" && str0 != undefined)
    {
        container_mc.noitemFd0.htmlText = str0;
        container_mc.noitemFd0._visible = true;
    }
    if(str1 != "" && str1 != undefined)
    {
        container_mc.noitemFd1.htmlText = str1;
        container_mc.noitemFd1._visible = true;
    }
};
myListener.OnGame_Enchant_SetBtnEnabled = function(bContinueBtn, bEnchantBtn, bEquipmentBtn)
{
    bContinueBtn = Number(bContinueBtn);
    bEnchantBtn = Number(bEnchantBtn);
    bEquipmentBtn = Number(bEquipmentBtn);
    enchantBtn.setEnabled(bEnchantBtn);
    continueBtn.setEnabled(bContinueBtn);
    equipmentBtn.setEnabled(bEquipmentBtn);
};
var enchantType;
myListener.OnGame_Enchant_StartEnchant = function(type)
{
    enchantType = Number(type);
    if(enchantType == 0)
    {
        if(wakeupMode == 0)
        {
            enchantBtn.setText("$155063");
        }
        else if(wakeupMode == 1)
        {
            enchantBtn.setText("$155064");
        }
        else
        {
            enchantBtn.setText(enchantStr__0);
            equipmentBtn.setText(enchantStr__0);
        }
        enchantBtn.setRelease(ToGame_Enchant_CancelEnchant);
        equipmentBtn.setRelease(ToGame_Enchant_CancelEnchant);
        continueBtn.setEnabled(false);
        equipmentBtn.setEnabled(true);
        enchantBtn.setEnabled(true);
    }
    else if(enchantType == 1)
    {
        continueBtn.setText(continueStr__0);
        continueBtn.setRelease(ToGame_Enchant_CancelEnchant);
        enchantBtn.setEnabled(false);
        equipmentBtn.setEnabled(false);
        continueBtn.setEnabled(true);
    }
    else
    {
        enchantBtn.setEnabled(false);
        continueBtn.setEnabled(false);
        equipmentBtn.setEnabled(false);
    }
    startPrograss();
};
myListener.OnGame_Enchant_CancelContinue = function()
{
    enchantType = undefined;
    gs.TweenLite.killTweensOf(container_mc.prograss.maskMc,false);
    container_mc.prograss.maskMc._width = 0;
    container_mc.prograss._visible = false;
    enchantBtn.setText(enchantStr__1);
    equipmentBtn.setText(enchantStr__1);
    continueBtn.setText(continueStr__1);
    equipmentBtn.setRelease(ToGame_Enchant_Equipment);
    enchantBtn.setRelease(ToGame_Enchant_Enchant);
    continueBtn.setRelease(ToGame_Enchant_Continue);
    bEnchant = false;
    bContinue = false;
    bEquipment = false;
    container_mc.Enchant__0.drag = true;
    container_mc.hitblockMc.removeMovieClip();
};
myListener.OnGame_Enchant_EndContinue = function()
{
    enchantType = undefined;
    continueBtn.setText(continueStr__1);
    continueBtn.setRelease(ToGame_Enchant_Continue);
    bEnchant = false;
    bContinue = false;
    container_mc.Enchant__0.drag = true;
    container_mc.hitblockMc.removeMovieClip();
};
myListener.OnGame_Enchant_Exp = function(exp)
{
    exp = Number(exp);
    container_mc.expgageBar._visible = exp != -1;
    container_mc.expgageBg._visible = exp != -1;
    container_mc.expTxt._visible = exp != -1;
    container_mc.expTxt2._visible = exp != -1;
    container_mc.expgageBar._width = exp / 100 * (container_mc.expgageBg._width - 4);
    container_mc.expTxt2.text = exp + "%";
};
myListener.OnGame_Enchant_Exp(-1);
var rightClicked = false;
var targetId = null;
var rightClickedTarget = null;
myListener.OnGame_MouseDown = function(button, target)
{
    button = Number(button);
    if(button == 2)
    {
        if(target._parent._name == "Enchant__0")
        {
            rightClicked = true;
            rightClickedTarget = target._parent;
            targetId = target._parent.slotId;
            if(targetId != undefined)
            {
                ToGame_Enchant_ClickMouseRightBtn(0,0);
            }
        }
        else if(target._parent._name == "Enchant__2")
        {
            rightClicked = true;
            rightClickedTarget = target._parent;
            targetId = target._parent.slotId;
            if(targetId != undefined)
            {
                ToGame_Enchant_ClickMouseRightBtn(2,1);
            }
        }
    }
};
myListener.OnGame_MouseUp = function(button, target)
{
    button = Number(button);
    if(button == 2)
    {
        if(rightClicked)
        {
            rightClicked = false;
            targetId = target._parent.slotId;
            if(targetId != undefined)
            {
                ToGame_Enchant_ClickMouseRightBtn(targetId,1);
            }
            rightClickedTarget = null;
            targetId = null;
        }
    }
};
var bEffect = false;
myListener.OnGame_Enchant_SetResult = function(resultParam)
{
    resultParam = Number(resultParam);
    if(resultParam == false)
    {
        setResultEffect(resultParam);
        return undefined;
    }
    if(bContinue == false)
    {
        if(wakeupMode == 0)
        {
            setWakeuoSlotEffect();
        }
        else
        {
            setSlotEffect();
            setResultEffect(resultParam);
        }
    }
    if(wakeupMode != 0)
    {
        setTextEffect();
    }
};
myListener.OnGame_Enchant_VipBuff = function(num)
{
    container_mc.vipTxt.htmlText = lib.util.UIString.getUIString("$500110","count",num);
};
var equipmentStr = equipmentStr__0;
var equipmentBtn = new lib.util.TxtBtn(container_mc.equipBtn.btn,container_mc.equipBtn.txt);
equipmentBtn.setRelease(ToGame_Enchant_Equipment);
equipmentBtn.setEnabled(false);
equipmentBtn.setText(equipmentStr);
container_mc.equipMc._visible = false;
container_mc.equipBtn._visible = false;
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_Enchant_CloseUI);
var enchantBtn = new lib.util.TxtBtn(container_mc.enchantBtn.btn,container_mc.enchantBtn.txt);
enchantBtn.setRelease(ToGame_Enchant_Enchant);
enchantBtn.setEnabled(false);
enchantBtn.setText(enchantStr__1);
var continueBtn = new lib.util.TxtBtn(container_mc.continueBtn.btn,container_mc.continueBtn.txt);
continueBtn.setRelease(ToGame_Enchant_Continue);
continueBtn.setEnabled(false);
continueBtn.setText(continueStr__1);
var plusBtn = new lib.util.TxtBtn(container_mc.plusBtn);
plusBtn.setEnabled(false);
var minusBtn = new lib.util.TxtBtn(container_mc.minusBtn);
minusBtn.setEnabled(false);
var maxBtn = new lib.util.TxtBtn(container_mc.maxBtn);
maxBtn.setEnabled(false);
var masterBtn = new lib.util.TxtBtn(container_mc.masterGuide.mBtn.btn,container_mc.masterGuide.mBtn.txt);
masterBtn.setRelease(ToGame_Enchant_MasterGuide);
var masterBtn2 = new lib.util.TxtBtn(container_mc.mBtn2.btn,container_mc.mBtn2.txt);
masterBtn2.setRelease(ToGame_Enchant_MasterGuideInfo);
masterBtn2.setText(MasterStr__2);
var count = 0;
container_mc.plusBtn.onRelease2 = function()
{
    count++;
    container_mc.maxFd.text = count;
    setCount();
};
container_mc.minusBtn.onRelease2 = function()
{
    count--;
    container_mc.maxFd.text = count;
    setCount();
};
container_mc.maxBtn.onRelease2 = function()
{
    count = maxCount;
    container_mc.maxFd.text = count;
    setCount();
};
var maxFd = new lib.util.ExtTextField(container_mc.maxFd,1,container_mc.maxFocus);
maxFd.onEnterKey = function()
{
    Selection.setFocus(null);
    var _loc2_ = Number(this.text);
    if(_loc2_ == NaN)
    {
        container_mc.maxFd.text = count;
    }
    else
    {
        if(_loc2_ > maxCount)
        {
            container_mc.maxFd.text = maxCount;
            _loc2_ = maxCount;
            ToGame_Enchant_RequestErrorMessage();
        }
        count = _loc2_;
        setCount();
    }
};
maxFd.onKillFocusEvent = function()
{
    bChangePathTime = false;
    var _loc2_ = Number(this.text);
    if(_loc2_ == NaN)
    {
        container_mc.maxFd.text = count;
    }
    else
    {
        if(_loc2_ > maxCount)
        {
            container_mc.maxFd.text = maxCount;
            _loc2_ = maxCount;
            ToGame_Enchant_RequestErrorMessage();
        }
        count = _loc2_;
        setCount();
    }
};
container_mc.maxFd.onChanged = function()
{
    lib.util.StrByteLen.getLenth3(this,4);
    var _loc2_ = Number(this.text);
    if(_loc2_ < 0)
    {
        this.text = 0;
        count = 0;
    }
};
var nextText = "";
var dplusBtn = container_mc.plusBtn._y;
var dminusBtn = container_mc.minusBtn._y;
var denchantBtn = container_mc.enchantBtn._y;
var dmaxFd = container_mc.maxFd._y;
var dmaxFocus = container_mc.maxFocus._y;
var dmaxBg = container_mc.maxBg._y;
var dmaxFd = container_mc.maxFd._y;
var dmaxFd = container_mc.maxFd._y;
var dmaxFd = container_mc.maxFd._y;
var curStepStart = 40;
var nextStepStart = 335;
var titleMaxSize = 65;
var timerId = null;
var uigideStr0 = lib.util.UIString.getUIString("$155033");
var uigideStr1 = lib.util.UIString.getUIString("$155034");
var uigideStr3 = lib.util.UIString.getUIString("$155067");
var uigideStr2 = lib.util.UIString.getUIString("$155035");
container_mc.uiguideFd.hitTestDisable = true;
container_mc.bg1.hitTestDisable = true;
container_mc.bg2.hitTestDisable = true;
container_mc.bg3.hitTestDisable = true;
var helpStr0 = lib.util.UIString.getUIString("$155047");
var helpStr1 = lib.util.UIString.getUIString("$155048");
var helpStr2 = lib.util.UIString.getUIString("$155049");
var helpStr3 = lib.util.UIString.getUIString("$155052");
lib.manager.ToolTip.add(container_mc.helpIcon0,helpStr0,1);
lib.manager.ToolTip.add(container_mc.helpIcon1,helpStr1,1);
lib.manager.ToolTip.add(container_mc.continueBtn,helpStr2,1);
lib.manager.ToolTip.add(container_mc.enchantBtn,helpStr3,1);
container_mc.noitemFd0.verticalAlign = "center";
container_mc.noitemFd1.verticalAlign = "center";
setUiGuide(0);
init();
ToGame_Enchant_Init();
