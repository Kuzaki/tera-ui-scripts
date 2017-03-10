var UI = this;
UI._visible = false;
var UIname = "CharacterWindow";
var DismissDisible = 1;
var BanDisible = 1;
var myListener = new Object();
function checkAndResetUIPositionTransform()
{
    if(lib.info.AlignInfo.yPixelToRatio(UI._y + hit._height * lib.info.AlignInfo.scaleRatio) < 70)
    {
        container_mc.lv_txt._y = 66.5 + class_st_PlusY;
        container_mc.name_txt._y = 66.5 + class_st_PlusY;
        container_mc.statMc._y = 63 + class_st_PlusY;
        container_mc.DiceMc._y = 64 + class_st_PlusY;
        var _loc1_ = container_mc.groupMc;
        if(_loc1_ != undefined)
        {
            _loc1_._y = 95 + class_st_PlusY;
        }
    }
    else
    {
        container_mc.lv_txt._y = -27.5;
        container_mc.name_txt._y = -27.5;
        container_mc.statMc._y = -57;
        container_mc.DiceMc._y = -52;
        _loc1_ = container_mc.groupMc;
        if(_loc1_ != undefined)
        {
            _loc1_._y = -55;
        }
    }
}
function frameTrans(stat, plusAmount, dontAnimation)
{
    var _loc2_ = aniSpeed;
    if(stat == "ADDHPDEMAGE" || stat == "ADDMPDEMAGE")
    {
        _loc2_ = demageSpeed;
    }
    if(dontAnimation != undefined && dontAnimation != 0)
    {
        _loc2_ = 1;
    }
    if(plusAmount == 0)
    {
        plusAmount = 0.001;
    }
    if(stat == "ADDHPHEAL")
    {
        var _loc4_ = saveHpFrame100;
        if(plusAmount != undefined && plusAmount != 0)
        {
            _loc4_ = plusAmount;
        }
        gs.TweenLite.killTweensOf(container_mc.bg_hp,true);
        gs.TweenLite.to(container_mc.bg_hp,_loc2_ / 25,{_width:1024 + _loc4_ / 100 * baseWidth,ease:Strong.easeOut});
    }
    else if(stat == "ADDHPDEMAGE")
    {
        _loc4_ = saveHpFrame100;
        if(plusAmount != undefined && plusAmount != 0)
        {
            _loc4_ = plusAmount;
        }
        gs.TweenLite.killTweensOf(container_mc.bg_hp,true);
        gs.TweenLite.to(container_mc.bg_hp,_loc2_ / 25,{_width:1024 + _loc4_ / 100 * baseWidth,ease:Strong.easeOut});
    }
    else if(stat == "ADDMPHEAL")
    {
        _loc4_ = saveMpFrame100;
        if(plusAmount != undefined && plusAmount != 0)
        {
            _loc4_ = plusAmount;
        }
        gs.TweenLite.killTweensOf(container_mc.bg_mp,true);
        gs.TweenLite.to(container_mc.bg_mp,_loc2_ / 25,{_width:736 + _loc4_ / 100 * baseWidth,ease:Strong.easeOut});
    }
    else if(stat == "ADDMPDEMAGE")
    {
        _loc4_ = saveMpFrame100;
        if(plusAmount != undefined && plusAmount != 0)
        {
            _loc4_ = plusAmount;
        }
        gs.TweenLite.killTweensOf(container_mc.bg_mp,true);
        gs.TweenLite.to(container_mc.bg_mp,_loc2_ / 25,{_width:736 + _loc4_ / 100 * baseWidth,ease:Strong.easeOut});
    }
    else if(stat == "ADDSTHEAL")
    {
        _loc4_ = saveStFrame100;
        if(plusAmount != undefined && plusAmount != 0)
        {
            _loc4_ = plusAmount;
        }
        gs.TweenLite.killTweensOf(container_mc.bg_st,true);
        gs.TweenLite.to(container_mc.bg_st,_loc2_ / 25,{_width:726 + _loc4_ / 100 * baseWidth,ease:Strong.easeOut});
        container_mc.st_txt._x = container_mc.bg_st._x + 595 + _loc4_ / 100 * baseWidth;
    }
    else if(stat == "ADDSTDEMAGE")
    {
        _loc4_ = saveStFrame100;
        if(plusAmount != undefined && plusAmount != 0)
        {
            _loc4_ = plusAmount;
        }
        gs.TweenLite.killTweensOf(container_mc.bg_st,true);
        gs.TweenLite.to(container_mc.bg_st,_loc2_ / 25,{_width:726 + _loc4_ / 100 * baseWidth,ease:Strong.easeOut});
        container_mc.st_txt._x = container_mc.bg_st._x + 595 + _loc4_ / 100 * baseWidth;
    }
}
function setAddGage(_type)
{
    if(gageMode == _type)
    {
        return undefined;
    }
    gageMode = _type;
    if(_type == 0)
    {
        container_mc.stMc._visible = false;
        container_mc.st_txt._visible = false;
        class_st_PlusY = 0;
    }
    else
    {
        container_mc.stMc._visible = true;
        container_mc.stMc.gotoAndStop(Number(_type));
        if(_type == 1)
        {
            class_st_PlusY = 20;
            container_mc.st_txt._visible = true;
            container_mc.st_txt._x = 666;
        }
        else if(_type == 2)
        {
            class_st_PlusY = 43;
            container_mc.st_txt._visible = true;
            container_mc.st_txt._x = 750;
            container_mc.st_txt._y = 90;
            container_mc.stMc.stUp.hitTestDiable = true;
            gageN = container_mc.stMc.stNor;
            gageN._width = 0.1;
        }
        else if(_type == 3)
        {
            class_st_PlusY = 30;
            container_mc.st_txt._visible = true;
            container_mc.st_txt._x = 700;
            gageN = container_mc.stMc.stNor;
            container_mc.stMc.angerMc.gotoAndStop(1);
            gageN._width = 0.1;
        }
        else if(_type == 4)
        {
            class_st_PlusY = 30;
            container_mc.st_txt._visible = true;
            container_mc.st_txt._x = 700;
            gageN = container_mc.stMc.stNor;
            container_mc.stMc.angerMc.gotoAndStop(1);
            gageN._width = 0.1;
        }
        else if(_type == 5)
        {
            class_st_PlusY = 30;
            container_mc.st_txt._visible = true;
            gageN = container_mc.stMc.stNor;
            container_mc.stMc.angerMc.gotoAndStop(1);
            gageN._width = 0.1;
        }
        else if(_type == 6)
        {
            class_st_PlusY = 30;
            container_mc.st_txt._visible = true;
            container_mc.st_txt._x = 700;
            gageN = container_mc.stMc.stNor;
            gageN._width = 0.1;
        }
    }
}
function DamageEvent()
{
    container_mc.hpMc.hpGlow_mc._alpha = 100;
    gs.TweenLite.killTweensOf(container_mc.hpMc.hpGlow_mc,false);
    gs.TweenLite.to(container_mc.hpMc.hpGlow_mc,1,{_alpha:0,ease:Strong.easeOut});
}
function WarningEvent()
{
    var _loc1_ = undefined;
    if(container_mc.hpNor.hpWarning_mc._alpha > 50)
    {
        _loc1_ = 0;
    }
    else
    {
        _loc1_ = 100;
    }
    gs.TweenLite.to(container_mc.hpNor.hpWarning_mc,WarningLevel,{_alpha:_loc1_,onComplete:WarningEvent});
}
function animateHpWarning(warning, hp100)
{
    warning = warning || isDebuffState;
    gs.TweenLite.killTweensOf(container_mc.hpNor.hpWarning_mc,false);
    if(warning)
    {
        if(hp100 > 0)
        {
            container_mc.hpNor.hpWarning_mc._visible = true;
            if(!isHealing)
            {
                container_mc.hpNor.hpWarning_mc._xscale = saveHp100;
            }
            if(hp100 <= 25 && hp100 > 20)
            {
                WarningLevel = 0.5;
            }
            else if(hp100 <= 20 && hp100 > 15)
            {
                WarningLevel = 0.35;
            }
            else
            {
                WarningLevel = 0.2;
            }
            WarningEvent();
        }
    }
    else
    {
        container_mc.hpNor.hpWarning_mc._visible = false;
        container_mc.hpNor.hpWarning_mc._alpha = 100;
    }
}
function feverGage(st, maxSt)
{
    if(maxSt == 0 || maxSt == undefined)
    {
        return undefined;
    }
    var _loc1_ = st / maxSt * feverWid;
    var _loc3_ = 0.3;
    if(prevFever == maxSt && st == 0)
    {
        gs.TweenLite.killTweensOf(container_mc.stMc.stLine,false);
        gs.TweenLite.killTweensOf(container_mc.stMc.stNor,false);
        container_mc.stMc.stNor._width = _loc1_;
        container_mc.stMc.stLine._x = _loc1_;
        container_mc.stMc.stUp.gotoAndPlay(48);
        return undefined;
    }
    if(st == maxSt)
    {
        container_mc.stMc.stUp.gotoAndPlay(25);
    }
    else
    {
        container_mc.stMc.stUp.gotoAndPlay(2);
    }
    prevFever = st;
    container_mc.stMc.stLine.gotoAndPlay(2);
    gs.TweenLite.killTweensOf(container_mc.stMc.stLine,false);
    gs.TweenLite.to(container_mc.stMc.stLine,_loc3_,{_x:_loc1_,ease:Regular.easeOut});
    gs.TweenLite.killTweensOf(container_mc.stMc.stNor,false);
    gs.TweenLite.to(container_mc.stMc.stNor,_loc3_,{_width:_loc1_,ease:Regular.easeOut});
}
function angerGage(st, maxSt, time)
{
    if(maxSt == 0 || maxSt == undefined)
    {
        container_mc.stMc.angerMc.gotoAndStop(1);
        return undefined;
    }
    var _loc1_ = st / maxSt * angerWid;
    var _loc3_ = container_mc.stMc.angerMc._currentframe;
    if(st == maxSt)
    {
        lib.util.FrameSeeker.seek(container_mc.stMc.angerMc,_loc3_,12);
    }
    else
    {
        lib.util.FrameSeeker.seek(container_mc.stMc.angerMc,_loc3_,1);
    }
    container_mc.stMc.effectBar.gotoAndPlay(2);
    gs.TweenLite.killTweensOf(container_mc.stMc.stNor,false);
    gs.TweenLite.to(container_mc.stMc.stNor,time,{_width:_loc1_,ease:Regular.easeOut});
    gs.TweenLite.killTweensOf(container_mc.stMc.effectBar,false);
    gs.TweenLite.to(container_mc.stMc.effectBar,time,{_x:_loc1_,ease:Regular.easeOut});
}
function stackGage(st, maxSt)
{
    var _loc2_ = st / maxSt * angerWid;
    var _loc1_ = 0.3;
    gs.TweenLite.killTweensOf(container_mc.stMc.stNor,false);
    gs.TweenLite.to(container_mc.stMc.stNor,_loc1_,{_width:_loc2_,ease:Regular.easeOut});
}
function playChangeEffect(durability)
{
    var _loc2_ = container_mc.statMc.durabilityIcon.effect.effect;
    if(_loc2_ != undefined)
    {
        gs.TweenLite.killTweensOf(_loc2_,false);
        _loc2_.removeMovieClip();
    }
    var _loc3_ = container_mc.statMc.durabilityIcon.effect_1;
    if(_loc3_ != undefined)
    {
        gs.TweenLite.killTweensOf(_loc3_,false);
        _loc3_._alpha = 0;
    }
    var _loc1_ = container_mc.statMc.durabilityIcon.effect.effect_0;
    if(_loc1_ == undefined)
    {
        _loc1_ = container_mc.statMc.durabilityIcon.effect.attachMovie("durabilityChangeEffect_0","effect_0",container_mc.statMc.durabilityIcon.effect.getNextHighestDepth());
        _loc1_.hitTestDisable = true;
    }
    _loc1_._alpha = 0;
    _loc1_.durability = durability;
    _loc1_.effectType = 0;
    showChangeEffect(_loc1_);
}
function showChangeEffect(target)
{
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,0.2,{_alpha:100,onComplete:hideChangeEffect,onCompleteParams:[target]});
}
function hideChangeEffect(target)
{
    gs.TweenLite.to(target,0.2,{_alpha:0,onComplete:endChangeEffect,onCompleteParams:[target]});
}
function endChangeEffect(target)
{
    if(target.effectType == 0)
    {
        var _loc1_ = container_mc.statMc.durabilityIcon.effect_1;
        if(_loc1_ == undefined)
        {
            _loc1_ = container_mc.statMc.durabilityIcon.attachMovie("durabilityChangeEffect_1","effect_1",container_mc.statMc.durabilityIcon.getNextHighestDepth());
            _loc1_.hitTestDisable = true;
            _loc1_._alpha = 0;
            _loc1_.effectType = 1;
        }
        container_mc.statMc.durabilityIcon.gotoAndStop(target.durability);
        showChangeEffect(_loc1_);
    }
    else if(target.effectType == 1)
    {
        if(container_mc.statMc.durabilityIcon._currentframe == 3)
        {
            var _loc3_ = container_mc.statMc.durabilityIcon.effect.attachMovie("durabilityEffect","effect",container_mc.statMc.durabilityIcon.effect.getNextHighestDepth());
            _loc3_._alpha = 0;
            playDurabilityEffect(_loc3_,100);
        }
    }
    target.removeMovieClip();
}
function playDurabilityEffect(target, num, delay)
{
    var _loc1_ = num != 0?0:100;
    delay = delay == undefined?0:delay;
    gs.TweenLite.to(target,0.3,{_alpha:num,delay:delay,onComplete:playDurabilityEffect,onCompleteParams:[target,_loc1_]});
}
function setPosition()
{
    var _loc2_ = undefined;
    var _loc3_ = 116;
    if(container_mc.statMc.ico_division._visible)
    {
        _loc3_ = _loc3_ + 52;
    }
    if(container_mc.statMc.equipmentIcon)
    {
        _loc3_ = _loc3_ + 52;
    }
    var _loc4_ = iconArray.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc4_)
    {
        _loc2_ = container_mc.statMc[iconArray[_loc1_]];
        if(_loc2_)
        {
            _loc2_._x = _loc3_;
            if(_loc2_._visible)
            {
                _loc3_ = _loc3_ + 52;
            }
        }
        _loc1_ = _loc1_ + 1;
    }
}
function ToGameBanPartyMember(memberIndex)
{
    getURL("FSCommand:ToGameBanPartyMember",memberIndex);
    statMc_BtnInit();
}
function ToGameDelegatePartyMember(memberIndex)
{
    getURL("FSCommand:ToGameDelegatePartyMember",memberIndex);
    statMc_BtnInit();
}
function ToGameParyMemberRandomDistributionPolicy(bRandom)
{
    getURL("FSCommand:ToGameParyMemberRandomDistributionPolicy",bRandom);
    statMc_BtnInit();
}
function ToGameLeaveParty()
{
    fscommand("ToGameLeaveParty");
    statMc_BtnInit();
}
function ToGameDismissParty()
{
    fscommand("ToGameDismissParty");
    statMc_BtnInit();
}
function ToGame_CharacterWindow_OpenPartyLootingSetting()
{
    fscommand("ToGame_CharacterWindow_OpenPartyLootingSetting");
    statMc_BtnInit();
}
function ToGame_CharacterWindow_InitDungeon()
{
    fscommand("ToGame_CharacterWindow_InitDungeon");
    statMc_BtnInit();
}
function ToGame_CharacterWindow_ReadyWar()
{
    fscommand("ToGame_CharacterWindow_ReadyWar");
    statMc_BtnInit();
}
function ToGame_CharacterWindow_PartyInvite(memberIndex, flag)
{
    getURL("FSCommand:ToGame_CharacterWindow_PartyInvite",memberIndex + "\t" + flag);
    statMc_BtnInit();
}
function ToGame_CharacterWindow_PartyDistributionSet(memberIndex)
{
    getURL("FSCommand:ToGame_CharacterWindow_PartyDistributionSet",memberIndex);
    statMc_BtnInit();
}
function statMc_BtnInit()
{
    if(container_mc.statMc.menu_mc.effect._alpha != 0)
    {
        container_mc.statMc.menu_mc.effect._alpha = 0;
    }
    if(container_mc.statMc.menu_mc2.effect._alpha != 0)
    {
        container_mc.statMc.menu_mc2.effect._alpha = 0;
    }
}
function EnergySetting()
{
    if(EnergyOption_Flag == false)
    {
        container_mc.hp_txt.htmlText = hpStrN;
        container_mc.mp_txt.htmlText = mpStrN;
        container_mc.st_txt.htmlText = stStrN;
    }
    else if(EnergyOption_Flag == true)
    {
        container_mc.hp_txt.htmlText = hpStrP;
        container_mc.mp_txt.htmlText = mpStrP;
        container_mc.st_txt.htmlText = stStrN;
    }
}
function CharacterWindow_EnergyOption_HP(_hp, _maxHp, _maxHpAdd)
{
    hpStrP = int(10000 * _hp / (_maxHp + _maxHpAdd)) / 100 + " %";
}
function CharacterWindow_EnergyOption_MP(_mp, _maxMp, _maxMpAdd)
{
    mpStrP = int(10000 * _mp / (_maxMp + _maxMpAdd)) / 100 + " %";
}
function CharacterWindow_EnergyOption_ST(_st, _maxSt, _maxStAdd)
{
    stStrP = int(10000 * _st / (_maxSt + _maxStAdd)) / 100 + " %";
}
function hpmpHandler(value)
{
    if(value == 0)
    {
        EnergyOption_Flag = false;
        myListener.OnGame_CharacterWindow_EnergyOption("0");
    }
    else if(value == 1)
    {
        EnergyOption_Flag = true;
        myListener.OnGame_CharacterWindow_EnergyOption("1");
    }
}
function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.CHARACTERWINDOW_PERCENT_BOOLEAN)
    {
        hpmpHandler(event.value);
    }
}
function stackEvent()
{
    var _loc2_ = container_mc.stMc.stackMc;
    var _loc1_ = undefined;
    if(_loc2_._alpha > 50)
    {
        _loc1_ = 0;
    }
    else
    {
        _loc1_ = 100;
    }
    gs.TweenLite.to(_loc2_,0.5,{_alpha:_loc1_,onComplete:stackEvent});
}
function ToGame_CharacterWindow_DiceDistributionStart_End()
{
    fscommand("ToGame_CharacterWindow_DiceDistributionStart_End");
}
function ToGame_CharacterWindow_DiceDistributionData_End()
{
    fscommand("ToGame_CharacterWindow_DiceDistributionData_End");
}
function ToGame_CharacterWindow_DiceDistributionIcon_End()
{
    fscommand("ToGame_CharacterWindow_DiceDistributionIcon_End");
}
function ToGame_CharacterWindow_GoldDistributionStart_End()
{
    fscommand("ToGame_CharacterWindow_GoldDistributionStart_End");
}
function ToGame_CharacterWindow_GoldDistributionData_End()
{
    fscommand("ToGame_CharacterWindow_GoldDistributionData_End");
}
function ToGame_CharacterWindow_GoldDistributionIcon_End()
{
    fscommand("ToGame_CharacterWindow_GoldDistributionIcon_End");
}
function ToGame_CharacterWindow_PetClick()
{
    fscommand("ToGame_CharacterWindow_PetClick");
}
function ToGame_CharacterWindow_DurabilityClick()
{
    fscommand("ToGame_CharacterWindow_DurabilityClick");
}
function buttonTween(target, num)
{
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,0.2,{_alpha:num});
}
function drawBar($barType, $current, $total, $add)
{
    var _loc6_ = undefined;
    switch($barType)
    {
        case 0:
            _loc6_ = "hp";
            break;
        case 1:
            _loc6_ = "mp";
            break;
        case 2:
            _loc6_ = "st";
            break;
        case 3:
            _loc6_ = "mp2";
    }
    var _loc7_ = UI["gageData" + $barType];
    var _loc11_ = _loc7_.current;
    var _loc13_ = _loc7_.total;
    var _loc14_ = _loc7_.add;
    var _loc12_ = _loc7_.grate;
    var _loc1_ = undefined;
    var _loc2_ = undefined;
    var _loc4_ = undefined;
    if($barType == 2)
    {
        _loc1_ = container_mc.stMc.stNor;
        _loc2_ = container_mc.stMc.stUp;
        _loc4_ = container_mc.stMc.stDown;
    }
    else
    {
        _loc1_ = container_mc[_loc6_ + "Nor"];
        _loc2_ = container_mc[_loc6_ + "Up"];
        _loc4_ = container_mc[_loc6_ + "Down"];
    }
    if($current == 0)
    {
        $current = 0.001;
    }
    if($total == 0)
    {
        $total = 100;
    }
    var _loc3_ = $current / $total * 100;
    UI["gageData" + $barType].total = $total;
    UI["gageData" + $barType].add = $add;
    UI["gageData" + $barType].current = $current;
    UI["gageData" + $barType].grate = _loc3_;
    if(_loc11_ == undefined)
    {
        _loc1_._xscale = _loc3_;
        _loc2_._visible = false;
        _loc4_._visible = false;
        return undefined;
    }
    var _loc8_ = _loc3_ - _loc12_;
    gs.TweenLite.killTweensOf(_loc2_,true);
    gs.TweenLite.killTweensOf(_loc4_,true);
    if(_loc1_.prevRate)
    {
        _loc1_._xscale = _loc1_.prevRate;
    }
    _loc1_.prevRate = _loc3_;
    if(_loc8_ > 0)
    {
        _loc4_._visible = false;
        _loc2_._visible = true;
        _loc2_._xscale = 0.001;
        _loc2_._x = _loc1_._x + _loc1_._width;
        gageMotion(_loc2_,_loc8_,_loc1_,_loc3_);
    }
    else if(_loc8_ < 0)
    {
        if($barType == 2)
        {
            _loc2_._visible = false;
            gs.TweenLite.to(_loc1_,0.3,{_xscale:_loc3_,ease:gs.easing.Strong.easeOut});
        }
        else
        {
            if($barType == 0)
            {
                DamageEvent();
            }
            _loc2_._visible = false;
            _loc4_._visible = true;
            _loc4_._xscale = 0.001;
            _loc4_._x = _loc1_._x + _loc1_._width;
            gageMotion(_loc4_,_loc8_,_loc1_,_loc3_);
        }
    }
    else
    {
        _loc1_._xscale = _loc3_;
    }
}
function gageMotion(gageMc, targetxscale, tgGage, gaugeRate)
{
    if(tgGage._xscale == gaugeRate)
    {
        return undefined;
    }
    gs.TweenLite.to(gageMc,0.3,{_xscale:targetxscale,ease:gs.easing.Strong.easeOut,onComplete:endMotion,onCompleteParams:[gageMc,targetxscale,tgGage,gaugeRate]});
}
function endMotion(gageMc, targetxscale, tgGage, gaugeRate)
{
    gageMc._visible = false;
    tgGage._xscale = gaugeRate;
}
function feverEffectOn()
{
    gs.TweenLite.killTweensOf(feverEffectMc,true);
    gs.TweenLite.to(feverEffectMc,0.5,{_alpha:100,onComplete:EffectMotion,ease:gs.easing.Strong.easeOut});
}
function EffectMotion()
{
    gs.TweenLite.killTweensOf(feverEffectMc,true);
    gs.TweenLite.to(feverEffectMc,0.5,{_alpha:0,onComplete:feverEffectOn,ease:gs.easing.Strong.easeOut});
}
function creatPopup(type)
{
    var newPopUP = UI.attachMovie("popUpMc","popUpMc",UI.getNextHighestDepth());
    var _loc5_ = new Array();
    if(type == 2 || type == 4)
    {
        if(partyRaidMaster == true)
        {
            if(DismissDisible == 1)
            {
                _loc5_ = "$021003\n$021004\n$021005\n$021006\n$021029\n$021030\n$021031".split("\n");
            }
            else
            {
                _loc5_ = "$021003\n$021004\n$021005\n$021006\n$021007\n$021029\n$021030\n$021031".split("\n");
            }
        }
        else if(DismissDisible == 1)
        {
            _loc5_ = "$021003\n$021004\n$021005\n$021006\n$021013".split("\n");
        }
        else
        {
            _loc5_ = "$021003\n$021004\n$021005\n$021006\n$021007\n$021013".split("\n");
        }
    }
    else if(BanDisible == 1)
    {
        _loc5_ = "$021006".split("\n");
    }
    else
    {
        _loc5_ = "$021006\n$021004".split("\n");
    }
    if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
    {
        _loc5_.splice(_loc5_.length - 1,1);
    }
    var _loc3_ = 0;
    while(_loc3_ < _loc5_.length)
    {
        var _loc2_ = newPopUP.attachMovie("line","line" + _loc3_,newPopUP.getNextHighestDepth());
        _loc2_._x = 0;
        if(partyRaidMaster == true)
        {
            lineH = 37;
            _loc2_._y = _loc3_ * lineH + 1.5;
        }
        else
        {
            _loc2_._y = _loc3_ * lineH;
        }
        _loc3_ = _loc3_ + 1;
    }
    _loc3_ = 0;
    while(_loc3_ < _loc5_.length)
    {
        _loc2_ = newPopUP["line" + _loc3_];
        if(_loc3_ > 3)
        {
            _loc2_.stat = _loc3_ + DismissDisible;
        }
        else
        {
            _loc2_.stat = _loc3_;
        }
        _loc2_.txt.text = _loc5_[_loc3_];
        var _loc8_ = new TextFormat();
        if(_loc2_.txt.maxscroll > 1)
        {
            _loc8_.size = 14;
            _loc2_.txt.setTextFormat(_loc8_);
        }
        _loc2_.txt.verticalAlign = "center";
        _loc2_.txt.textAutoSize = "shrink";
        _loc2_.index = _loc3_;
        _loc2_.hit.clickArea = true;
        if(_loc2_.stat == 4 && partyRaidMaster == true && partyMemberSplit_array.length > 4)
        {
            _loc2_.txt.textColor = 8224125;
        }
        _loc2_.hit.onRollOver = function()
        {
            UI.spopUpMc.removeMovieClip();
            myListener.partyMemberOverStat = this._parent.stat;
            partyRaidMenuSelect = myListener.partyMemberOverStat;
            if(this._parent.stat == 1 || this._parent.stat == 2 || this._parent.stat == 6 || this._parent.stat == 7)
            {
                var _loc2_ = creatsPopup(this._parent.stat);
                _loc2_._x = newPopUP._x + newPopUP._width;
                var _loc3_ = newPopUP._y + lineH * this._parent.stat;
                if(_loc2_._height > 720)
                {
                    _loc2_._xscale = 80;
                    _loc2_._yscale = 80;
                }
                else
                {
                    _loc2_._xscale = 100;
                    _loc2_._yscale = 100;
                }
                var _loc5_ = UI._y + _loc3_;
                var _loc4_ = _loc2_._height;
                if(_loc4_ + _loc5_ > 1080)
                {
                    _loc3_ = 1080 - UI._y - _loc4_;
                }
                _loc2_._y = _loc3_;
            }
            else
            {
                UI.subpopUpMc.removeMovieClip();
            }
            if(!(this._parent.stat == 4 && partyRaidMaster == true && partyMemberSplit_array.length > 4))
            {
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
            }
            popupClosingCancel();
        };
        _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
        {
            if(!(this._parent.stat == 4 && partyRaidMaster == true && partyMemberSplit_array.length > 4))
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
            }
            popupClosing();
        };
        _loc2_.hit.onPress = function()
        {
            if(!(this._parent.stat == 4 && partyRaidMaster == true && partyMemberSplit_array.length > 4))
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            }
        };
        _loc2_.hit.onRelease = function()
        {
            if(!(this._parent.stat == 4 && partyRaidMaster == true && partyMemberSplit_array.length > 4))
            {
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
            }
            if(this._parent.stat == 0)
            {
                if(type == 2 || type == 4)
                {
                    ToGame_CharacterWindow_OpenPartyLootingSetting();
                }
                else
                {
                    ToGameLeaveParty();
                }
            }
            else if(this._parent.stat == 3)
            {
                ToGameLeaveParty();
            }
            else if(this._parent.stat == 4)
            {
                if(!(partyRaidMaster == true && partyMemberSplit_array.length > 4))
                {
                    ToGameDismissParty();
                }
            }
            else if(this._parent.stat == 5)
            {
                if(partyRaidMaster == true)
                {
                    ToGame_CharacterWindow_ReadyWar();
                }
                else
                {
                    ToGame_CharacterWindow_InitDungeon();
                }
            }
            popupClosing(1);
        };
        _loc3_ = _loc3_ + 1;
    }
    newPopUP.bg._height = _loc5_.length * lineH + 18;
    popupClosing();
    return newPopUP;
}
function creatsPopup(type)
{
    var _loc5_ = UI.attachMovie("popUpMc","spopUpMc",UI.getNextHighestDepth());
    var arrayType;
    if(type == 6)
    {
        arrayType = partyMemberSplit_invitepermission_array;
    }
    else if(type == 7)
    {
        arrayType = partyMemberSplit_invitepermission_array2;
    }
    else
    {
        arrayType = partyMemberSplit_array;
    }
    var _loc3_ = 0;
    while(_loc3_ < arrayType.length)
    {
        var _loc2_ = _loc5_.attachMovie("line","line" + _loc3_,_loc5_.getNextHighestDepth());
        _loc2_._x = 0;
        _loc2_._y = _loc3_ * lineH;
        _loc2_.hit.clickArea = true;
        _loc2_.stat = _loc3_;
        _loc2_.txt.text = arrayType[_loc2_.stat][1];
        var _loc4_ = new TextFormat();
        if(_loc2_.txt.maxscroll > 1)
        {
            _loc4_.size = 14;
            _loc2_.txt.setTextFormat(_loc4_);
        }
        _loc2_.txt.verticalAlign = "center";
        _loc2_.txt.textAutoSize = "shrink";
        _loc2_.index = _loc3_;
        _loc2_.hit.onRollOver = function()
        {
            cntKeep = true;
            this._parent.gotoAndStop(2);
            this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
            this._parent.txt.shadowColor = 16777215;
            popupClosingCancel();
        };
        _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
        {
            cntKeep = false;
            this._parent.gotoAndStop(1);
            this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
            this._parent.txt.shadowColor = 0;
            popupClosing();
        };
        _loc2_.hit.onPress = function()
        {
            this._parent.gotoAndStop(3);
            this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
            this._parent.txt.shadowColor = 0;
        };
        _loc2_.hit.onRelease = function()
        {
            this._parent.gotoAndStop(2);
            this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
            this._parent.txt.shadowColor = 0;
            if(myListener.partyMemberOverStat == 0)
            {
                if(type < 6)
                {
                    ToGame_CharacterWindow_PartyDistributionSet(arrayType[this._parent.stat][0]);
                }
                else if(this._parent.stat == 0)
                {
                    ToGameParyMemberRandomDistributionPolicy(true);
                }
                else if(this._parent.stat == 1)
                {
                    ToGameParyMemberRandomDistributionPolicy(false);
                }
            }
            else if(myListener.partyMemberOverStat == 1)
            {
                ToGameBanPartyMember(arrayType[this._parent.stat][0]);
            }
            else if(myListener.partyMemberOverStat == 2)
            {
                ToGameDelegatePartyMember(arrayType[this._parent.stat][0]);
            }
            else if(myListener.partyMemberOverStat == 6)
            {
                ToGame_CharacterWindow_PartyInvite(arrayType[this._parent.stat][0],1);
            }
            else if(myListener.partyMemberOverStat == 7)
            {
                ToGame_CharacterWindow_PartyInvite(arrayType[this._parent.stat][0],0);
            }
            popupClosing(1);
            privateAdminOut();
        };
        _loc3_ = _loc3_ + 1;
    }
    if(arrayType.length == 0)
    {
        _loc5_.bg._height = 0;
    }
    else
    {
        _loc5_.bg._height = arrayType.length * lineH + 18;
    }
    return _loc5_;
}
function popupClosing(rightNow)
{
    clearInterval(popUpInterval);
    UI.popUpMc.cnt = 0;
    if(rightNow)
    {
        popUpClose();
    }
    popUpInterval = setInterval(this,"closeEvent",1000);
}
function closeEvent()
{
    UI.popUpMc.cnt++;
    if(UI.popUpMc.cnt >= 2)
    {
        UI.popUpMc.cnt = 0;
        popUpClose();
    }
}
function popUpClose()
{
    UI.popUpMc.removeMovieClip();
    UI.spopUpMc.removeMovieClip();
    statMc_BtnInit();
    clearInterval(popUpInterval);
}
function popupClosingCancel()
{
    UI.popUpMc.cnt = 0;
    clearInterval(popUpInterval);
}
function test()
{
    this._visible = true;
    myListener.OnGame_CharacterWindow_AchievementRating(5);
}
function SetGage(num, bDisable)
{
    var _loc2_ = 0;
    var _loc3_ = 1;
    if(stackCount == num)
    {
        return undefined;
    }
    stackCount = num;
    _loc3_ = !bDisable?3:2;
    var _loc4_ = container_mc.stMc;
    _loc2_ = 0;
    for(; _loc2_ < stackTotal; _loc2_ = _loc2_ + 1)
    {
        var _loc1_ = _loc4_["stack" + _loc2_];
        _loc1_._alpha = 100;
        if(_loc2_ < stackCount)
        {
            gs.TweenLite.killTweensOf(_loc1_,false);
            _loc1_.gotoAndStop(_loc3_);
            if(10 == stackCount && _loc2_ < 9)
            {
                _loc1_.ball.gotoAndPlay(FULL_EFFECT);
                continue;
            }
            if(_loc2_ < stackCount - 1)
            {
                _loc1_.ball.gotoAndStop(NONE_EFFECT);
            }
            else
            {
                _loc1_.ball.gotoAndPlay(1);
            }
        }
        else
        {
            _loc1_.gotoAndStop(1);
        }
        _loc1_._alpha = 100;
    }
    if(stackCount == 0)
    {
    }
}
function EffectOn()
{
    var _loc1_ = container_mc.stMc;
    gs.TweenLite.to(_loc1_.effectMc,effectSpeed,{_alpha:effectTargetAlpha,ease:Strong.easeIn,onComplete:EffectOn});
    if(effectTargetAlpha == 100)
    {
        effectTargetAlpha = 0;
    }
    else
    {
        effectTargetAlpha = 100;
    }
}
function EffectOff()
{
    var _loc1_ = container_mc.stMc;
    _loc1_.effectMc._alpha = 0;
    effectTargetAlpha = 100;
    gs.TweenLite.killTweensOf(_loc1_.effectMc,false);
}
function DangerEvent()
{
    EffectOff();
    var _loc3_ = container_mc.stMc;
    var _loc1_ = 0;
    _loc1_ = 0;
    while(_loc1_ < stackCount)
    {
        var _loc2_ = _loc3_["stack" + _loc1_];
        _loc2_.ball.gotoAndPlay(WARNING_EFFECT);
        _loc1_ = _loc1_ + 1;
    }
}
function ClearDangerEvent()
{
    EffectOff();
    var _loc3_ = container_mc.stMc;
    var _loc1_ = 0;
    _loc1_ = 0;
    while(_loc1_ < stackCount)
    {
        var _loc2_ = _loc3_["stack" + _loc1_];
        _loc2_.ball.gotoAndStop(NONE_EFFECT);
        _loc1_ = _loc1_ + 1;
    }
}
function ClearEvent()
{
    EffectOff();
    var _loc9_ = container_mc.stMc;
    var _loc1_ = 0;
    _loc1_ = 0;
    while(_loc1_ < stackCount)
    {
        var _loc2_ = _loc9_["stack" + _loc1_];
        var _loc3_ = (10 - _loc1_) / 20;
        _loc2_.ball.gotoAndStop(CLEAR_EFFECT);
        gs.TweenLite.to(_loc2_,effectSpeed2,{delay:_loc3_,_alpha:0,ease:Strong.easeOut,onComplete:ClearEnd,onCompleteParams:[_loc2_]});
        _loc1_ = _loc1_ + 1;
    }
    stackCount = 0;
}
function ClearEnd(mc)
{
}
if(_global.EventBroadCaster)
{
    _global.EventBroadCaster.addListener(myListener);
}
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.UIDrager.adjustDragLimit(0,0,-11,-11);
container_mc.UIDrager.onPress2 = function()
{
    this.onEnterFrame = function()
    {
        checkAndResetUIPositionTransform();
    };
};
container_mc.UIDrager.onRelease2 = function()
{
    delete container_mc.onEnterFrame;
    if(container_mc.UIDrager.pos_state == "false")
    {
        if(EnergyOption_Flag == false)
        {
            myListener.OnGame_CharacterWindow_EnergyOption("1");
        }
        else if(EnergyOption_Flag == true)
        {
            myListener.OnGame_CharacterWindow_EnergyOption("0");
        }
    }
};
container_mc.hpNor.hpGlow_mc._alpha = 0;
container_mc.hpNor.hpWarning_mc._alpha = 0;
container_mc.hpDown._visible = false;
container_mc.hpUp._visible = false;
container_mc.mpDown._visible = false;
container_mc.mpUp._visible = false;
container_mc.mp2Down._visible = false;
container_mc.mp2Up._visible = false;
container_mc.mp2Nor._visible = false;
container_mc.stUp._visible = false;
container_mc.stNor._visible = false;
var diceMc_Position = 64;
var rad = 0.017453292519943295;
var radius = 150;
var obj_Angle = new Object();
var sArc = 0;
container_mc.statMc.Stack_Bar._visible = false;
var EnergyOption_Flag = false;
var lvStr = lib.util.UIString.getUIString("$021010");
var partyStr = lib.util.UIString.getUIString("$021034");
var menuOutFrame = 50;
var textAlpha = 80;
container_mc.hp_txt._alpha = textAlpha;
container_mc.mp_txt._alpha = textAlpha;
container_mc.st_txt._alpha = textAlpha;
var baseWidth = 490;
var relaxNum = 0;
var randomPolicy = false;
var toolTipStr = [];
var inParty = false;
var partyMaster = false;
var partyRaidMaster = false;
var partyRaidDistributionMaster = false;
var partyRaidMenuSelect = "0";
var class_name = "";
var class_name_Array = "";
var class_st_PlusY = 0;
var DiceMc_StatEnd = 7;
var DiceMc_Stat2End = 30;
var DiceMc_Stat3End = 45;
var DiceMcDiceMc_StatEnd = 15;
var DiceMcDiceMc_Stat2End = 30;
var temp_ST = 1000;
var temp_MP = 1000;
container_mc.sizeOption_btn._visible = false;
lib.manager.ToolTip.add(container_mc.sizeOption_btn,lib.util.UIString.getUIString("$021014"),1);
var sizeState = 2;
var sizeOption_btn = new lib.util.TxtBtn(container_mc.sizeOption_btn);
sizeOption_btn.setRelease(function()
{
    sizeState++;
    if(sizeState == 4)
    {
        sizeState = 1;
    }
    myListener.OnGame_CharacterWindow_SetSizeOption(sizeState);
}
);
var aniSpeed = 10;
var demageSpeed = 25;
container_mc.achievementMc.hitTestDiable = true;
container_mc.stMc.hitTestDiable = true;
container_mc.imgMc.hitTestDiable = true;
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
    if(_UIName.toLowerCase() == UIname.toLowerCase())
    {
        checkAndResetUIPositionTransform();
    }
};
myListener.OnGame_ResetUIPosition = function()
{
    checkAndResetUIPositionTransform();
};
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = bShow;
        UI._visible = bShow;
        checkAndResetUIPositionTransform();
        var _loc2_ = new lib.controls.CustomScaleEvent();
        _loc2_.CustomScaleEventCheck(UI,UIname);
        if(bShow)
        {
            myListener.OnGameEventChangeUIMode(_global.gbUIMode);
        }
    }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
    if(!_global.gbUIMode)
    {
        container_mc.menu_mc.clickMe._visible = false;
        container_mc.menu_mc2.clickMe._visible = false;
    }
    else
    {
        container_mc.statMc.menu_mc.clickMe._visible = true;
        container_mc.clickMe._visible = true;
    }
};
var StrObject = new Object();
StrObject.CLASS_0 = "$102015";
StrObject.CLASS_1 = "$102016";
StrObject.CLASS_2 = "$102017";
StrObject.CLASS_3 = "$102018";
StrObject.CLASS_4 = "$102019";
StrObject.CLASS_5 = "$102020";
StrObject.CLASS_6 = "$102021";
StrObject.CLASS_7 = "$102022";
StrObject.CLASS_8 = "$102273";
StrObject.CLASS_9 = "$013159";
StrObject.CLASS_10 = "$013179";
StrObject.CLASS_11 = "$013191";
StrObject.CLASS_20 = "$102267";
StrObject.CLASS_21 = "$102268";
StrObject.CLASS_22 = "$102269";
var gageMode = -1;
myListener.OnGame_CharacterWindow_SetClass = function(Class, gageType, position)
{
    Class = Number(Class);
    container_mc.classMc.gotoAndStop(Class + 1);
    var _loc2_ = StrObject["CLASS_" + Class];
    lib.manager.ToolTip.add(container_mc.classTooltip,_loc2_,1);
    setAddGage(Number(gageType));
    checkAndResetUIPositionTransform();
};
var gBg0 = flash.display.BitmapData.loadBitmap("groupBgL");
var gBg1 = flash.display.BitmapData.loadBitmap("groupBgR");
myListener.OnGame_CharacterWindow_SetGroup = function(index, bTrue)
{
    var _loc1_ = container_mc.groupMc;
    var _loc4_ = Boolean(Number(bTrue));
    _loc1_.clear();
    if(!_loc4_)
    {
        _loc1_.removeMovieClip();
    }
    else
    {
        if(!_loc1_)
        {
            _loc1_ = container_mc.attachMovie("groupMc","groupMc",container_mc.getNextHighestDepth());
        }
        _loc1_._x = 87;
        _loc1_._y = 95 + class_st_PlusY;
        _loc1_.txt.text = partyStr + index;
        var _loc2_ = _loc1_.txt.textWidth;
        var _loc3_ = _loc2_ + 16;
        _loc1_.bg._width = _loc2_;
        lib.display.DrawBitmapData.draw(_loc1_,gBg0,0,0,0,0,16,32);
        lib.display.DrawBitmapData.draw(_loc1_,gBg1,_loc3_,0,0,0,16,32);
    }
};
myListener.OnGameEventUpdateUserName = function(Name)
{
    container_mc.name_txt.text = Name;
    container_mc.name_txt._x = container_mc.lv_txt._x + container_mc.lv_txt.textWidth + 10;
    container_mc.name_txt._width = container_mc.name_txt.textWidth + 12;
    container_mc.statMc._x = container_mc.name_txt._x + container_mc.name_txt._width;
};
myListener.OnGameEventUpdateUserLevel = function(Level)
{
    container_mc.lv_txt.text = lvStr + " " + Level;
    container_mc.name_txt._x = container_mc.lv_txt._x + container_mc.lv_txt.textWidth + 10;
    container_mc.statMc._x = container_mc.name_txt._x + container_mc.name_txt._width;
    _root.MyLevel = Number(Level);
};
var saveHp = [0,0,0];
var saveHpFrame100 = 0;
var isWarning = false;
var isDebuffState = false;
myListener.OnGameEventUpdateHP = function(hp, maxHp, maxHpAdd)
{
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
    hp = Number(hp);
    maxHp = Number(maxHp);
    maxHpAdd = Number(maxHpAdd);
    var _loc5_ = hp / maxHp * 100;
    var _loc4_ = maxHpAdd / maxHp * 100;
    if(hp == 0 && maxHp == 0 && maxHpAdd == 0)
    {
        _loc5_ = 0;
        _loc4_ = 0;
    }
    if(saveHpFrame100 > _loc4_)
    {
        frameTrans("ADDHPDEMAGE",_loc4_,hp == saveHp[0] && maxHp != saveHp[1] && maxHpAdd == saveHp[2]);
    }
    else
    {
        frameTrans("ADDHPHEAL",_loc4_,hp == saveHp[0] && maxHp != saveHp[1] && maxHpAdd == saveHp[2]);
    }
    saveHpFrame = maxHpAdd;
    saveHpFrame100 = _loc4_;
    if(maxHpAdd != 0)
    {
        if(maxHpAdd > 0)
        {
            hpStrN = hp + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxHp + "<FONT ALPHA=\'#66\' COLOR=\'#FFFFFF\'>" + "   +" + maxHpAdd + "</FONT>";
        }
        else
        {
            hpStrN = hp + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxHp + "<FONT ALPHA=\'#66\' COLOR=\'#FFFFFF\'>" + "   " + maxHpAdd + "</FONT>";
        }
    }
    else
    {
        hpStrN = hp + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxHp;
    }
    if(_loc5_ <= 25)
    {
        animateHpWarning(true,_loc5_);
        isWarning = true;
    }
    else
    {
        animateHpWarning(false,_loc5_);
        isWarning = false;
    }
    saveHp[0] = hp;
    saveHp[1] = maxHp;
    saveHp[2] = maxHpAdd;
    drawBar(0,hp,maxHp,maxHpAdd);
    CharacterWindow_EnergyOption_HP(hp,maxHp,maxHpAdd);
    EnergySetting();
};
var WarningLevel = 1;
var saveMp = [0,0,0];
var saveMpFrame100 = 0;
var isMpHealing = false;
var isMpAddHealing = false;
container_mc.mpHeal_mc._visible = false;
mpMinusGage.value = 0;
myListener.OnGameEventUpdateMP = function(mp, maxMp, maxMpAdd)
{
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
    mp = Number(mp);
    maxMp = Number(maxMp);
    maxMpAdd = Number(maxMpAdd);
    mp100 = mp / maxMp * 100;
    mpFrame100 = maxMpAdd / maxMp * 100;
    if(mp == 0 && maxMp == 0 && maxMpAdd == 0)
    {
        mp100 = 0;
        mpFrame100 = 0;
    }
    if(saveMpFrame100 > mpFrame100)
    {
        frameTrans("ADDMPDEMAGE",mpFrame100,mp == saveMp[0] && maxMp != saveMp[1] && maxMpAdd == saveMp[2]);
    }
    else
    {
        frameTrans("ADDMPHEAL",mpFrame100,mp == saveMp[0] && maxMp != saveMp[1] && maxMpAdd == saveMp[2]);
    }
    saveMpFrame = maxMpAdd;
    saveMpFrame100 = mpFrame100;
    if(maxMpAdd != 0)
    {
        if(maxMpAdd > 0)
        {
            mpStrN = mp + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxMp + "<FONT ALPHA=\'#66\' COLOR=\'#FFFFFF\'>" + "   +" + maxMpAdd + "</FONT>";
        }
        else
        {
            mpStrN = mp + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxMp + "<FONT ALPHA=\'#66\' COLOR=\'#FFFFFF\'>" + "   " + maxMpAdd + "</FONT>";
        }
    }
    else
    {
        mpStrN = mp + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxMp;
    }
    saveMp[0] = mp;
    saveMp[1] = maxMp;
    saveMp[2] = maxMpAdd;
    if(mp100 < 0)
    {
        container_mc.mpNor._visible = false;
        container_mc.mp2Nor._visible = true;
        mp = - mp;
        drawBar(3,mp,maxMp,maxMpAdd);
    }
    else
    {
        container_mc.mpNor._visible = true;
        container_mc.mp2Nor._visible = false;
        drawBar(1,mp,maxMp,maxMpAdd);
    }
    CharacterWindow_EnergyOption_MP(mp,maxMp,maxMpAdd);
    EnergySetting();
};
var saveSt = [0,0,0];
var saveStFrame100 = 0;
stGage.onMotionDown = function()
{
    container_mc.stMc._visible = false;
    container_mc.stHeal_mc._visible = false;
};
stGage.onMotionUpFinished = function()
{
    container_mc.stMc._visible = true;
    container_mc.stHeal_mc._visible = true;
};
stGage.onMotionDownFinished = function()
{
    container_mc.stMc._visible = true;
    container_mc.stHeal_mc._visible = true;
};
var prevFever = 0;
var feverWid = 550;
var angerWid = 491;
var stackWid = 290;
container_mc.stMc._visible = false;
myListener.OnGameEventUpdateST = function(st, maxSt, str, maxStr, time)
{
    if(!container_mc.stMc._visible)
    {
        return undefined;
    }
    time = !(undefined == time || "undefined" == time || "" == time)?Number(time):0.3;
    if(gageMode == 2)
    {
        feverGage(st,maxSt);
        stStrN = str + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxStr;
        EnergySetting();
        return undefined;
    }
    if(gageMode == 3 || gageMode == 4)
    {
        stStrN = str + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxStr;
        angerGage(st,maxSt,time);
        EnergySetting();
        return undefined;
    }
    var _loc1_ = 0;
    if(isNaN(st))
    {
        st = 0;
    }
    if(isNaN(maxSt))
    {
        maxSt = 0;
    }
    if(isNaN(_loc1_))
    {
        _loc1_ = 0;
    }
    st = Number(st);
    maxSt = Number(maxSt);
    _loc1_ = Number(_loc1_);
    var _loc8_ = st / maxSt * 100;
    var _loc4_ = _loc1_ / maxSt * 100;
    if(st == 0 && maxSt == 0 && _loc1_ == 0)
    {
        _loc8_ = 0;
        stAdd100 = 0;
        _loc4_ = 0;
    }
    if(saveStFrame100 > _loc4_)
    {
        frameTrans("ADDSTDEMAGE",_loc4_,st == saveSt[0] && maxSt != saveSt[1] && _loc1_ == saveSt[2]);
    }
    else
    {
        frameTrans("ADDSTHEAL",_loc4_,st == saveSt[0] && maxSt != saveSt[1] && _loc1_ == saveSt[2]);
    }
    saveStFrame = _loc1_;
    saveStFrame100 = _loc4_;
    stStrN = str + " <img src=\'slash\' width=\'12\' height=\'16\' vspace=\'-2\'>" + maxStr;
    saveSt[0] = st;
    saveSt[1] = maxSt;
    saveSt[2] = _loc1_;
    drawBar(2,st,maxSt,_loc1_);
    CharacterWindow_EnergyOption_ST(str,maxStr,_loc1_);
    EnergySetting();
};
myListener.OnGameEventUpdateBattleState = function(bTrue)
{
    bTrue = Number(bTrue);
    if(bTrue)
    {
        lib.manager.ToolTip.add(container_mc.statMc.BattleIcon,lib.info.ToolTipStr.WAR,1);
        container_mc.statMc.BattleIcon.gotoAndStop(1);
    }
    else
    {
        lib.manager.ToolTip.remove(container_mc.statMc.BattleIcon);
        container_mc.statMc.BattleIcon.gotoAndStop(2);
    }
};
myListener.OnGame_Gage_SetRelax = function(relaxValue, relaxState, show)
{
    return undefined;
};
myListener.OnGameEventCharacterWindowUpdatePartyMember = function(memberList)
{
    partyMemberNotSplit_array = [];
    partyMemberSplit_array = [];
    partyMemberNotSplit_invitepermission_array = [];
    partyMemberSplit_invitepermission_array = [];
    partyMemberNotSplit_invitepermission_array2 = [];
    partyMemberSplit_invitepermission_array2 = [];
    partyMemberNotSplit_array = memberList.split("\n");
    partyMemberNotSplit_invitepermission_array = memberList.split("\n");
    partyMemberNotSplit_invitepermission_array2 = memberList.split("\n");
    var _loc1_ = 0;
    while(_loc1_ < partyMemberNotSplit_array.length)
    {
        var _loc2_ = new Array();
        _loc2_ = partyMemberNotSplit_array[_loc1_].split("\t");
        partyMemberSplit_array[_loc1_] = _loc2_;
        _loc1_ = _loc1_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < partyMemberNotSplit_invitepermission_array.length)
    {
        _loc2_ = new Array();
        _loc2_ = partyMemberNotSplit_invitepermission_array[_loc1_].split("\t");
        partyMemberSplit_invitepermission_array[_loc1_] = _loc2_;
        _loc1_ = _loc1_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < partyMemberNotSplit_invitepermission_array2.length)
    {
        _loc2_ = new Array();
        _loc2_ = partyMemberNotSplit_invitepermission_array2[_loc1_].split("\t");
        partyMemberSplit_invitepermission_array2[_loc1_] = _loc2_;
        _loc1_ = _loc1_ + 1;
    }
    if(partyMemberSplit_array[partyMemberSplit_array.length - 1][0] == "" && partyMemberSplit_array[partyMemberSplit_array.length - 1][1] == undefined)
    {
        partyMemberSplit_array.pop();
    }
    var _loc4_ = [];
    var _loc3_ = [];
    _loc1_ = 0;
    while(_loc1_ < partyMemberSplit_array.length)
    {
        if(partyMemberSplit_invitepermission_array[_loc1_][2] != "1")
        {
            _loc4_.push(partyMemberSplit_invitepermission_array[_loc1_]);
        }
        _loc1_ = _loc1_ + 1;
    }
    _loc1_ = 0;
    while(_loc1_ < partyMemberSplit_array.length)
    {
        if(partyMemberSplit_invitepermission_array2[_loc1_][2] != "2")
        {
            _loc3_.push(partyMemberSplit_invitepermission_array2[_loc1_]);
        }
        _loc1_ = _loc1_ + 1;
    }
    partyMemberSplit_invitepermission_array = [];
    partyMemberSplit_invitepermission_array2 = [];
    partyMemberSplit_invitepermission_array = _loc4_;
    partyMemberSplit_invitepermission_array2 = _loc3_;
};
var gradeColor = ["#ffffff","#009900","#00bfff","#ffa500"];
myListener.OnGameEventDistributionPolicy = function(bTrue, orderDist, bloot)
{
    bTrue = Number(bTrue);
    randomPolicy = !bTrue;
    var _loc5_ = "";
    if(Number(bloot) == 1)
    {
        _loc5_ = "<br><br><font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$195019") + "</font>";
    }
    if(!bTrue)
    {
        container_mc.statMc.ico_division.gotoAndStop(2);
        container_mc.statMc.ico_division.text_divisionNumber.text = "$021011";
        var _loc9_ = lib.util.UIString.getUIString(lib.info.ToolTipStr.DISTRIBUTIONPOLICY_RANDOM) + _loc5_;
        lib.manager.ToolTip.add(container_mc.statMc.ico_division,_loc9_,1);
    }
    else
    {
        container_mc.statMc.ico_division.gotoAndStop(1);
        var _loc1_ = lib.util.ExtString.split(orderDist,"\t");
        toolTipStr = [];
        toolTipStr.push(lib.util.UIString.getUIString(lib.info.ToolTipStr.DISTRIBUTIONPOLICY_ROTATE));
        var _loc8_ = lib.util.UIString.getUIString("$195020") + "<br>     " + lib.util.UIString.getUIString("$195021") + " ";
        var _loc6_ = "<br>     " + lib.util.UIString.getUIString("$195022") + " ";
        var _loc2_ = "#" + lib.info.TextColor.GENERAL_EQUIPPED.toString(16);
        var _loc4_ = gradeColor[Number(_loc1_[0])];
        var _loc3_ = "";
        if(Number(_loc1_[0]) == 1)
        {
            _loc3_ = "<font color=\'" + _loc4_ + "\'>" + lib.util.UIString.getUIString("$321085") + "</font>";
        }
        else if(Number(_loc1_[0]) == 2)
        {
            _loc3_ = "<font color=\'" + _loc4_ + "\'>" + lib.util.UIString.getUIString("$321086") + "</font>";
        }
        else if(Number(_loc1_[0]) == 2)
        {
            _loc3_ = "<font color=\'" + _loc4_ + "\'>" + lib.util.UIString.getUIString("$321087") + "</font>";
        }
        toolTipStr.push("<br>- " + _loc8_ + lib.util.UIString.getUIString("$195037","grade",_loc3_));
        if(Number(_loc1_[0]) > 0)
        {
            if(Number(_loc1_[1]) == 1)
            {
                toolTipStr.push(_loc6_ + "<font color=\'" + _loc2_ + "\'>" + lib.util.UIString.getUIString("$195012") + "</font>");
            }
            else if(Number(_loc1_[1]) == 2)
            {
                toolTipStr.push(_loc6_ + "<font color=\'" + _loc2_ + "\'>" + lib.util.UIString.getUIString("$195013") + "</font>");
            }
            else if(Number(_loc1_[1]) == 0)
            {
                toolTipStr.push(_loc6_ + "<font color=\'" + _loc2_ + "\'>" + lib.util.UIString.getUIString("$195011") + "</font>");
            }
        }
        if(Number(_loc1_[2]))
        {
            toolTipStr.push("<br>- " + lib.util.UIString.getUIString("$195014"));
        }
        if(Number(_loc1_[3]))
        {
            toolTipStr.push("<br>- " + lib.util.UIString.getUIString("$195006"));
        }
        if(Number(_loc1_[4]) == 0)
        {
            toolTipStr.push("<br>- " + lib.util.UIString.getUIString("$195016") + " <font color=\'" + _loc2_ + "\'>" + lib.util.UIString.getUIString("$195017") + "</font>");
        }
        else if(Number(_loc1_[4]) == 1)
        {
            toolTipStr.push("<br>- " + lib.util.UIString.getUIString("$195016") + " <font color=\'" + _loc2_ + "\'>" + lib.util.UIString.getUIString("$195018") + "</font>");
        }
        toolTipStr.push(_loc5_);
        lib.manager.ToolTip.remove(container_mc.statMc.ico_division);
        lib.manager.ToolTip.add(container_mc.statMc.ico_division,toolTipStr.join(""),1);
    }
};
myListener.OnGameEventCharacterWindowUpdateDistributionSequence = function(SequenceNum)
{
    if(inParty)
    {
        if(!randomPolicy)
        {
            container_mc.statMc.ico_division.text_divisionNumber.text = SequenceNum;
            toolTipStr[0] = lib.util.UIString.getUIString(lib.info.ToolTipStr.DISTRIBUTIONPOLICY_ROTATE) + "(" + lib.util.UIString.getUIString("$021012","order",SequenceNum) + ")";
            lib.manager.ToolTip.add(container_mc.statMc.ico_division,toolTipStr.join(""),1);
        }
    }
};
myListener.OnGameEventUpdateInParty = function(bTrue)
{
    privateAdminOut();
    popupClosing(1);
    bTrue = Number(bTrue);
    inParty = false;
    inParty = bTrue;
    if(bTrue)
    {
        partyMaster = false;
        container_mc.statMc.menu_mc._visible = true;
        container_mc.statMc.menu_mc.gotoAndStop(3);
        container_mc.statMc.ico_division._visible = true;
        if(_global.gbUIMode)
        {
            container_mc.statMc.menu_mc.clickMe._visible = true;
            container_mc.statMc.menu_mc2.clickMe._visible = true;
        }
        else
        {
            container_mc.statMc.menu_mc.clickMe._visible = false;
            container_mc.statMc.menu_mc2.clickMe._visible = false;
        }
    }
    else
    {
        container_mc.statMc.menu_mc._visible = false;
        container_mc.statMc.menu_mc2._visible = false;
        container_mc.statMc.ico_division._visible = false;
        container_mc.statMc.menu_mc.gotoAndStop(1);
        container_mc.statMc.menu_mc2.gotoAndStop(1);
    }
    setPosition();
};
myListener.OnGameEventAmIPartyMaster = function(bTrue)
{
    if(!container_mc.statMc.menu_mc)
    {
        container_mc.statMc.attachMovie("masterMc","menu_mc",container_mc.statMc.getNextHighestDepth());
        container_mc.statMc.menu_mc.btn.clickArea = true;
        container_mc.statMc.menu_mc.btn.onRollOver = function()
        {
            if(this._parent._currentframe != 1)
            {
                buttonTween(this._parent.effect,100);
            }
            this._parent.clickMe.gotoAndStop(2);
        };
        container_mc.statMc.menu_mc.btn.onRollOut = container_mc.statMc.menu_mc.btn.onReleaseOutside = function()
        {
            if(this._parent._currentframe != 1)
            {
                buttonTween(this._parent.effect,0);
            }
            this._parent.clickMe.gotoAndStop(1);
        };
        container_mc.statMc.menu_mc.btn.onPress = function()
        {
            if(this._parent._currentframe != 1)
            {
                this._parent.effect._alpha = 100;
            }
            this._parent.clickMe.gotoAndStop(3);
        };
        container_mc.statMc.menu_mc.btn.onRelease = function()
        {
            this._parent.clickMe.gotoAndStop(2);
            popUpClose();
            var _loc4_ = creatPopup(this._parent._currentframe);
            var _loc3_ = new Object();
            _loc3_.x = _root._xmouse;
            _loc3_.y = _root._ymouse;
            UI.globalToLocal(_loc3_);
            _loc4_.swapDepths(container_mc.getNextHighestDepth());
            if(80 < lib.info.AlignInfo.xPixelToRatio(_root._xmouse))
            {
                _loc4_._x = _loc3_.x - _loc4_._width - 10 * lib.info.AlignInfo.scaleRatio;
            }
            else
            {
                _loc4_._x = _loc3_.x + 10;
            }
            if(80 < lib.info.AlignInfo.yPixelToRatio(_root._ymouse))
            {
                _loc4_._y = _loc3_.y - _loc4_._height - 10 * lib.info.AlignInfo.scaleRatio;
            }
            else
            {
                _loc4_._y = _loc3_.y + 10;
            }
        };
    }
    bTrue = Number(bTrue);
    partyMaster = false;
    partyRaidMaster = false;
    partyRaidDistributionMaster = false;
    lib.manager.ToolTip.remove(ontainer_mc.statMc.menu_mc);
    if(inParty)
    {
        if(bTrue == 1)
        {
            lib.manager.ToolTip.add(container_mc.statMc.menu_mc,lib.info.ToolTipStr.PARTYMANAGE,1);
            container_mc.statMc.menu_mc.gotoAndStop(2);
            partyMaster = true;
        }
        else if(bTrue == 2)
        {
            lib.manager.ToolTip.add(container_mc.statMc.menu_mc,lib.info.ToolTipStr.PARTYRAIDMANAGE,1);
            container_mc.statMc.menu_mc.gotoAndStop(4);
            partyRaidMaster = true;
        }
        else if(bTrue == 3)
        {
            lib.manager.ToolTip.add(container_mc.statMc.menu_mc,lib.info.ToolTipStr.PRIVATERAIDMANAGE,1);
            container_mc.statMc.menu_mc.gotoAndStop(5);
        }
        else if(bTrue == 4)
        {
            lib.manager.ToolTip.add(container_mc.statMc.menu_mc,lib.info.ToolTipStr.PRIVATERAIDDISTRIBUTIONMANAGE,1);
            container_mc.statMc.menu_mc.gotoAndStop(6);
            partyRaidDistributionMaster = true;
        }
        else
        {
            lib.manager.ToolTip.add(container_mc.statMc.menu_mc,lib.info.ToolTipStr.PRIVATEMANAGE,1);
            container_mc.statMc.menu_mc.gotoAndStop(3);
        }
    }
    else
    {
        container_mc.statMc.menu_mc.gotoAndStop(1);
        a;
    }
    setPosition();
};
myListener.OnGameEventAmIPartyRaidDistributionMaster = function(bTrue)
{
    if(!container_mc.statMc.menu_mc2)
    {
        container_mc.statMc.attachMovie("masterMc","menu_mc2",container_mc.statMc.getNextHighestDepth());
        container_mc.statMc.menu_mc2.btn.clickArea = true;
        container_mc.stMc.menu_mc2.btn.onRelease = function()
        {
            this._parent.clickMe.gotoAndStop(2);
        };
    }
    bTrue = Number(bTrue);
    partyRaidDistributionMaster = false;
    lib.manager.ToolTip.remove(ontainer_mc.statMc.menu_mc2);
    if(inParty)
    {
        if(bTrue == 1)
        {
            container_mc.statMc.menu_mc2._visible = true;
            lib.manager.ToolTip.add(container_mc.statMc.menu_mc2,lib.info.ToolTipStr.PRIVATERAIDDISTRIBUTIONMANAGE,1);
            container_mc.statMc.menu_mc2.gotoAndStop(6);
            partyRaidDistributionMaster = true;
        }
        else
        {
            container_mc.statMc.menu_mc2.gotoAndStop(1);
            partyRaidDistributionMaster = false;
        }
    }
    else
    {
        container_mc.statMc.menu_mc2._visible = false;
        container_mc.statMc.menu_mc2.gotoAndStop(1);
    }
    setPosition();
};
var PetImgUrl = "";
var GuideText = "";
var currentEnergy = 0;
var maxEnergy = 0;
container_mc.statMc.petIcon._visible = false;
myListener.OnGame_CharacterWindow_UpdatePet = function(_flag, _img, _guide, _current, _max)
{
    if(!container_mc.statMc.petIcon)
    {
        container_mc.statMc.attachMovie("petMc","petIcon",container_mc.statMc.getNextHighestDepth());
    }
    var _loc4_ = _petInfo[0];
    var _loc3_ = _petInfo[1];
    if(GuideText != _guide)
    {
        GuideText = _guide;
        lib.manager.ToolTip.remove(container_mc.statMc.petIcon);
        lib.manager.ToolTip.add(container_mc.statMc.petIcon,_guide,1);
    }
    currentEnergy = Number(_current);
    maxEnergy = Number(_max);
    container_mc.statMc.petIcon.enduranceMask_mc._xscale = currentEnergy / maxEnergy * 100;
    if(_flag == 0)
    {
        container_mc.statMc.petIcon.removeMovieClip();
    }
    else
    {
        container_mc.statMc.petIcon.btn.onRollOver = function()
        {
            buttonTween(this._parent.effect,100);
        };
        container_mc.statMc.petIcon.btn.onRollOut = container_mc.statMc.petIcon.btn.onReleaseOutside = function()
        {
            buttonTween(this._parent.effect,0);
        };
        container_mc.statMc.petIcon.btn.onRelease = function()
        {
            ToGame_CharacterWindow_PetClick();
        };
    }
    setPosition();
};
myListener.OnGame_CharacterWindow_SetEquipmentLevel = function(num)
{
    lib.manager.ToolTip.remove(container_mc.statMc.levelMc);
    if(num == 0)
    {
        container_mc.statMc.equipmentIcon.removeMovieClip();
        container_mc.statMc.ico_division._x = 112;
        return undefined;
    }
    container_mc.statMc.ico_division._x = 164;
    if(!container_mc.statMc.equipmentIcon)
    {
        container_mc.statMc.attachMovie("equipmentMc","equipmentIcon",container_mc.statMc.getNextHighestDepth());
        container_mc.statMc.equipmentIcon.btn.clickArea = false;
        container_mc.statMc.equipmentIcon._x = 112;
    }
    container_mc.statMc.equipmentIcon.txt.text = num;
    var _loc1_ = " <font size=\'16\' color=\'#FFFFFF\'>" + lib.util.UIString.getUIString("$021035") + "</font>";
    _loc1_ = _loc1_ + (" <font size=\'16\' color=\'#80E71C\'>" + num + "</font><br>");
    _loc1_ = _loc1_ + "<img src=\'lineBitmap\'/><br>";
    _loc1_ = _loc1_ + lib.util.UIString.getUIString("$021036");
    lib.manager.ToolTip.add(container_mc.statMc.equipmentIcon,_loc1_,1);
    setPosition();
};
container_mc.statMc.durabilityIcon._visible = false;
myListener.OnGame_CharacterWindow_SetDurability = function(type)
{
    var _loc1_ = Number(type) + 1;
    if(container_mc.statMc.durabilityIcon._currentframe == _loc1_)
    {
        return undefined;
    }
    if(type == 3)
    {
        container_mc.statMc.durabilityIcon.removeMovieClip();
    }
    else
    {
        if(!container_mc.statMc.durabilityIcon)
        {
            container_mc.statMc.attachMovie("durabilityMc","durabilityIcon",container_mc.statMc.getNextHighestDepth());
            container_mc.statMc.durabilityIcon.btn.clickArea = true;
        }
        lib.manager.ToolTip.remove(container_mc.statMc.durabilityIcon);
        lib.manager.ToolTip.add(container_mc.statMc.durabilityIcon,"durability",6);
        playChangeEffect(_loc1_);
    }
    container_mc.statMc.durabilityIcon.btn.onRelease = function()
    {
        ToGame_CharacterWindow_DurabilityClick();
    };
    setPosition();
};
var iconArray = ["menu_mc","menu_mc2","petIcon","Stack_Bar","durabilityIcon"];
myListener.OnGame_LogOut = function()
{
    clearInterval(popUpInterval);
    saveHp = 0;
    saveMaxHp = 0;
    saveHpAdd = 0;
    saveHpFrame = 0;
    saveHp100 = 0;
    saveAddHp100 = 0;
    saveHpFrame100 = 0;
    saveMp = 0;
    saveMaxMp = 0;
    saveMpAdd = 0;
    saveMpFrame = 0;
    saveMp100 = 0;
    saveAddMp100 = 0;
    saveMpFrame100 = 0;
    saveSt = 0;
    saveMaxSt = 0;
    saveStAdd = 0;
    saveStFrame = 0;
    saveSt100 = 0;
    saveAddSt100 = 0;
    saveStFrame100 = 0;
    myListener.OnGameEventUpdateHP(0,0,0);
    myListener.OnGameEventUpdateMP(0,0,0);
    myListener.OnGameEventUpdateST(0,0,0);
};
var hpStrN = "";
var hpStrP = "";
var mpStrN = "";
var mpStrP = "";
var stStrN = "";
var stStrP = "";
myListener.OnGame_CharacterWindow_EnergyOption = function(flag)
{
    if(flag == "0")
    {
        EnergyOption_Flag = false;
    }
    else if(flag == "1")
    {
        EnergyOption_Flag = true;
    }
    EnergySetting();
};
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.CHARACTERWINDOW_PERCENT_BOOLEAN,this,"hpmpHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var DistributionType = 0;
myListener.OnGame_CharacterWindow_DiceDistributionStart = function(_type)
{
    var mc = container_mc;
    if(_type == 1)
    {
        mc.DiceMc._visible = false;
        DistributionType = 1;
    }
    else
    {
        mc.DiceMc._visible = true;
        DistributionType = 0;
    }
    mc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.MaskMc.gotoAndStop(1);
    mc.DiceMc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.mc.gotoAndStop(1);
    mc.onEnterFrame = null;
    mc.onEnterFrame = function()
    {
        if(mc.DiceMc._currentframe == DiceMc_StatEnd)
        {
            if(mc.DiceMc.DiceMc._currentframe == DiceMcDiceMc_StatEnd)
            {
                mc.onEnterFrame = null;
                ToGame_CharacterWindow_DiceDistributionStart_End();
            }
        }
    };
};
myListener.OnGame_CharacterWindow_DiceDistributionData = function(_data, flag)
{
    var mc = container_mc;
    if(DistributionType == 1)
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
                    ToGame_CharacterWindow_DiceDistributionData_End();
                }
            };
        }
    }
};
myListener.OnGame_CharacterWindow_DiceDistributionIcon = function(_data)
{
    var mc = container_mc;
    if(DistributionType == 1)
    {
        mc.DiceMc._visible = false;
    }
    else
    {
        mc.DiceMc._visible = true;
    }
    if(mc.DiceMc._currentframe <= 200)
    {
        lib.util.DrawBitmap.draw(mc.DiceMc.IconMc.IconMc,_data,50,50);
        mc.DiceMc.IconMc.IconMc.draw(teamList[0]);
        mc.DiceMc.IconMc.IconMc.grade = teamList[1];
        mc.DiceMc.IconMc.IconMc.sealType = teamList[2];
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
                ToGame_CharacterWindow_DiceDistributionIcon_End();
            }
        };
    }
};
myListener.OnGame_CharacterWindow_DiceDistributionEnd = function()
{
    var _loc1_ = container_mc;
    _loc1_.DiceMc.IconMc.IconMc.clear();
    _loc1_.DiceMc.IconMc._visible = false;
    if(DistributionType == 1)
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
myListener.OnGame_CharacterWindow_GoldDistributionStart = function()
{
    var mc = container_mc;
    mc.DiceMc._visible = true;
    mc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.MaskMc.gotoAndStop(2);
    mc.DiceMc.DiceMc.gotoAndPlay("start");
    mc.DiceMc.DiceMc.mc.gotoAndStop(2);
    mc.onEnterFrame = null;
    mc.onEnterFrame = function()
    {
        if(mc.DiceMc._currentframe == DiceMc_StatEnd)
        {
            if(mc.DiceMc.DiceMc._currentframe == DiceMcDiceMc_StatEnd)
            {
                mc.onEnterFrame = null;
                ToGame_CharacterWindow_GoldDistributionStart_End();
            }
        }
    };
};
myListener.OnGame_CharacterWindow_GoldDistributionData = function(flag)
{
    var mc = container_mc;
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
                    ToGame_CharacterWindow_GoldDistributionData_End();
                }
            };
        }
    }
};
myListener.OnGame_CharacterWindow_GoldDistributionIcon = function(_data)
{
    var mc = container_mc;
    if(!mc.DiceMc)
    {
        mc.attachMovie("DiceSlotMc","DiceMc",mc.getNextHighestDepth());
    }
    mc.DiceMc._x = 615;
    mc.DiceMc._y = diceMc_Position;
    mc.DiceMc._visible = true;
    if(mc.DiceMc._currentframe <= 200)
    {
        lib.util.DrawBitmap.draw(mc.DiceMc.IconMc.IconMc,_data,50,50);
        mc.DiceMc.IconMc._visible = true;
        mc.DiceMc.gotoAndPlay("start2");
        mc.DiceMc.onEnterFrame = function()
        {
            if(mc.DiceMc._currentframe == DiceMc_Stat2End)
            {
                mc.DiceMc.onEnterFrame = null;
                ToGame_CharacterWindow_GoldDistributionIcon_End();
            }
        };
    }
};
myListener.OnGame_CharacterWindow_GoldDistributionEnd = function()
{
    var _loc1_ = container_mc;
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
var WARRIOR_ST_FRAME_NUMBER = 5;
myListener.OnGame_CharacterWindow_UpdateStack = function(stackNum, switchs, bDisable)
{
    if(WARRIOR_ST_FRAME_NUMBER != container_mc.stMc._currentframe)
    {
        return undefined;
    }
    ClearDangerEvent();
    stackNum = Number(stackNum);
    var _loc2_ = 0 == stackNum && 0 != stackCount;
    if(_loc2_)
    {
        ClearEvent();
        return undefined;
    }
    SetGage(stackNum,bDisable);
    if(Boolean(Number(switchs)))
    {
        DangerEvent();
    }
};
myListener.OnGame_CharacterWindow_SetDismissDisible = function(flag)
{
    DismissDisible = flag;
};
myListener.OnGame_CharacterWindow_SetBanDisible = function(flag)
{
    BanDisible = flag;
};
myListener.OnGame_CharacterWindow_AchievementRating = function(nGrade)
{
    container_mc.achievementMc.gotoAndStop(nGrade + 1);
};
var HP_ColorTrns = new flash.geom.Transform(container_mc.hpNor);
var debuffColor = new flash.geom.ColorTransform(0.3,0.3,0.3,1,41,0,176,0);
var normalColor = lib.info.ColorTrans.enableTrans();
var s = HP_ColorTrns.colorTransform;
myListener.OnGame_CharacterWindow_DebuffState = function(debuff)
{
    isDebuffState = Number(debuff);
    if(isDebuffState)
    {
        HP_ColorTrns.colorTransform = debuffColor;
        animateHpWarning(true,0);
    }
    else
    {
        HP_ColorTrns.colorTransform = normalColor;
        animateHpWarning(isWarning,0);
    }
};
container_mc.statMc.attachMovie("divisionMc","ico_division",container_mc.statMc.getNextHighestDepth());
container_mc.statMc.ico_division._x = 112;
container_mc.statMc.ico_division._visible = false;
container_mc.statMc.attachMovie("combatMc","BattleIcon",container_mc.statMc.getNextHighestDepth());
container_mc.statMc.BattleIcon._x = 54;
container_mc.statMc.BattleIcon.btn.clickArea = true;
container_mc.statMc.ico_division.btn.clickArea = true;
container_mc.statMc.ico_division.btn.onRollOver = function()
{
    buttonTween(this._parent.effect,100);
};
container_mc.statMc.ico_division.btn.onRollOut = container_mc.statMc.ico_division.btn.onReleaseOutside = function()
{
    buttonTween(this._parent.effect,0);
};
container_mc.statMc.BattleIcon.btn.onRollOver = function()
{
    buttonTween(this._parent.effect,100);
};
container_mc.statMc.BattleIcon.btn.onRollOut = container_mc.statMc.BattleIcon.btn.onReleaseOutside = function()
{
    buttonTween(this._parent.effect,0);
};
var gageData0 = {};
var gageData1 = {};
var gageData2 = {};
var gageData3 = {};
var gageN;
var gageU;
var gageD;
var gageLine;
myListener.OnGame_MouseDown = function(button, target)
{
    if(Number(button) == 2 && target && target._name == "boundingBox")
    {
        if(target._parent._parent._parent.UIname == "CharacterWindow")
        {
            popUpClose();
            var _loc5_ = 0;
            var _loc2_ = undefined;
            if(partyMaster && inParty)
            {
                _loc2_ = creatPopup(2);
            }
            else if(partyRaidMaster && inParty)
            {
                _loc2_ = creatPopup(4);
            }
            else if(inParty)
            {
                _loc2_ = creatPopup(3);
            }
            var _loc3_ = new Object();
            _loc3_.x = _root._xmouse;
            _loc3_.y = _root._ymouse;
            UI.globalToLocal(_loc3_);
            _loc2_.swapDepths(container_mc.getNextHighestDepth());
            if(80 < lib.info.AlignInfo.xPixelToRatio(_root._xmouse))
            {
                _loc2_._x = _loc3_.x - _loc2_._width - 10 * lib.info.AlignInfo.scaleRatio;
            }
            else
            {
                _loc2_._x = _loc3_.x + 10;
            }
            if(80 < lib.info.AlignInfo.yPixelToRatio(_root._ymouse))
            {
                _loc2_._y = _loc3_.y - _loc2_._height - 10 * lib.info.AlignInfo.scaleRatio;
            }
            else
            {
                _loc2_._y = _loc3_.y + 10;
            }
        }
    }
};
var popUpInterval;
var lineH = 36;
var lineW = 220;
var partyMemberNotSplit_array = new Array();
var partyMemberSplit_array = new Array();
var partyMemberNotSplit_invitepermission_array = new Array();
var partyMemberSplit_invitepermission_array = new Array();
var partyMemberNotSplit_invitepermission_array2 = new Array();
var partyMemberSplit_invitepermission_array2 = new Array();
myListener.partyMemberOverStat = null;
myListener.OnGameEventUpdateHP(0,0,0);
myListener.OnGameEventUpdateMP(0,0,0);
myListener.OnGameEventUpdateST(0,0,0);
myListener.OnGameEventUpdateBattleState(0);
myListener.OnGame_CharacterWindow_EnergyOption(0);
fscommand("ToGame_Character_Init");
var stackTotal = 10;
var stackCount = 0;
var effectSpeed = 1;
var effectSpeed2 = 0.3;
var effectTargetAlpha = 100;
var NONE_EFFECT = 26;
var FULL_EFFECT = 30;
var WARNING_EFFECT = 60;
var CLEAR_EFFECT = 67;
