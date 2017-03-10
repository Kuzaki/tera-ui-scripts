function OnGameEvent(EventName, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, Param9, Param10, Param11, Param12, Param13, Param14, Param15, Param16, Param17, Param18, Param19, Param20, Param21, Param22, Param23, Param24, Param25, Param26, Param27, Param28, Param29, Param30, Param31, Param32)
{
    _global.EventBroadCaster.broadcastMessage(EventName,Param1,Param2,Param3,Param4,Param5,Param6,Param7,Param8,Param9,Param10,Param11,Param12,Param13,Param14,Param15,Param16,Param17,Param18,Param19,Param20,Param21,Param22,Param23,Param24,Param25,Param26,Param27,Param28,Param29,Param30,Param31,Param32);
}
function rescaleUI(UIname, exception)
{
    if(UIname == "" || UIname == undefined || UIname == null)
    {
        var _loc10_ = gUIList.length;
        var _loc3_ = 0;
        while(_loc3_ < _loc10_)
        {
            var _loc1_ = gUIList[_loc3_];
            var _loc8_ = GetRegisterUIData(_loc1_._name);
            var _loc9_ = _loc1_._name.toLowerCase();
            if(_loc9_ != exception.toLowerCase())
            {
                var _loc11_ = _loc8_.GROUP;
                if(_loc8_.SA == 1)
                {
                    axis._xreg = 0;
                    axis._yreg = 0;
                }
                else if(_loc8_.SA == 2)
                {
                    axis._xreg = _loc1_.hit._width / 2;
                    axis._yreg = 0;
                }
                else if(_loc8_.SA == 3)
                {
                    axis._xreg = _loc1_.hit._width;
                    axis._yreg = 0;
                }
                else if(_loc8_.SA == 4)
                {
                    axis._xreg = 0;
                    axis._yreg = _loc1_.hit._height / 2;
                }
                else if(_loc8_.SA == 5)
                {
                    axis._xreg = _loc1_.hit._width / 2;
                    axis._yreg = _loc1_.hit._height / 2;
                }
                else if(_loc8_.SA == 6)
                {
                    axis._xreg = _loc1_.hit._width;
                    axis._yreg = _loc1_.hit._height / 2;
                }
                else if(_loc8_.SA == 7)
                {
                    axis._xreg = 0;
                    axis._yreg = _loc1_.hit._height;
                }
                else if(_loc8_.SA == 8)
                {
                    axis._xreg = _loc1_.hit._width / 2;
                    axis._yreg = _loc1_.hit._height;
                }
                else if(_loc8_.SA == 9)
                {
                    axis._xreg = _loc1_.hit._width;
                    axis._yreg = _loc1_.hit._height;
                }
                if(_loc11_ != 61)
                {
                    if(_loc11_ < 50 && _loc9_ != "expbar" && _loc9_ != "awesomeframe" && _loc9_ != "playguide")
                    {
                        if(_loc9_ == "shortcut")
                        {
                        }
                        var _loc7_ = lib.info.AlignInfo.uiScale(_loc1_._name,_loc1_);
                        var _loc4_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
                        axis.setXscale(_loc1_,_loc4_ * 100);
                        axis.setYscale(_loc1_,_loc4_ * 100);
                    }
                    else if(_loc11_ != 58 && _loc9_ != "expbar" && _loc11_ != 55 && _loc9_ != "awesomeframe" && _loc9_ != "playguide")
                    {
                        for(mc in _loc1_)
                        {
                            var _loc2_ = _loc1_[mc];
                            var _loc6_ = _loc2_._parent._parent;
                            var _loc5_ = _loc2_._parent._parent._parent;
                            if(typeof _loc2_ == "movieclip" && _loc2_ != _loc1_ && _loc2_ != container_chat_mc.Chat2 && _loc1_ != _loc6_ && _loc1_ != _loc5_)
                            {
                                _loc7_ = lib.info.AlignInfo.uiScale(_loc1_._name,_loc1_);
                                _loc4_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
                                _loc2_._yscale = _loc0_ = _loc4_ * 100;
                                _loc2_._xscale = _loc0_;
                            }
                        }
                    }
                }
            }
            _loc3_ = _loc3_ + 1;
        }
        resetUIALign(2);
    }
    else
    {
        _loc1_ = GetLoadedUI(UIname);
        _loc8_ = GetRegisterUIData(UIname);
        _loc9_ = UIname.toLowerCase();
        _loc11_ = _loc8_.GROUP;
        if(_loc8_.SA == 1)
        {
            axis._xreg = 0;
            axis._yreg = 0;
        }
        else if(_loc8_.SA == 2)
        {
            axis._xreg = _loc1_.hit._width / 2;
            axis._yreg = 0;
        }
        else if(_loc8_.SA == 3)
        {
            axis._xreg = _loc1_.hit._width;
            axis._yreg = 0;
        }
        else if(_loc8_.SA == 4)
        {
            axis._xreg = 0;
            axis._yreg = _loc1_.hit._height / 2;
        }
        else if(_loc8_.SA == 5)
        {
            axis._xreg = _loc1_.hit._width / 2;
            axis._yreg = _loc1_.hit._height / 2;
        }
        else if(_loc8_.SA == 6)
        {
            axis._xreg = _loc1_.hit._width;
            axis._yreg = _loc1_.hit._height / 2;
        }
        else if(_loc8_.SA == 7)
        {
            axis._xreg = 0;
            axis._yreg = _loc1_.hit._height;
        }
        else if(_loc8_.SA == 8)
        {
            axis._xreg = _loc1_.hit._width / 2;
            axis._yreg = _loc1_.hit._height;
        }
        else if(_loc8_.SA == 9)
        {
            axis._xreg = _loc1_.hit._width;
            axis._yreg = _loc1_.hit._height;
        }
        if(_loc11_ != 61)
        {
            if(_loc11_ < 50 && _loc9_ != "expbar" && _loc9_ != "awesomeframe" && _loc9_ != "playguide")
            {
                if(_loc9_ == "shortcut")
                {
                }
                _loc7_ = lib.info.AlignInfo.uiScale(_loc1_._name,_loc1_);
                _loc4_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
                axis.setXscale(_loc1_,_loc4_ * 100);
                axis.setYscale(_loc1_,_loc4_ * 100);
            }
            else if(_loc11_ != 58 && _loc9_ != "expbar" && _loc11_ != 55 && _loc9_ != "awesomeframe" && _loc9_ != "playguide")
            {
                for(mc in _loc1_)
                {
                    _loc2_ = _loc1_[mc];
                    _loc6_ = _loc2_._parent._parent;
                    _loc5_ = _loc2_._parent._parent._parent;
                    if(typeof _loc2_ == "movieclip" && _loc2_ != _loc1_ && _loc2_ != container_chat_mc.Chat2 && _loc1_ != _loc6_ && _loc1_ != _loc5_)
                    {
                        _loc7_ = lib.info.AlignInfo.uiScale(_loc1_._name,_loc1_);
                        _loc4_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
                        _loc2_._yscale = _loc0_ = _loc4_ * 100;
                        _loc2_._xscale = _loc0_;
                    }
                }
            }
        }
    }
}
function resetUIPosition()
{
    _root.OnGameEvent("OnGame_ResetUIPosition");
    var _loc5_ = gUIList.length;
    var _loc3_ = 0;
    while(_loc3_ < _loc5_)
    {
        var _loc4_ = gUIList[_loc3_];
        var _loc2_ = GetRegisterUIData(_loc4_._name);
        if(_loc2_.GROUP == 1)
        {
            _loc2_.locked = false;
        }
        _loc4_.container_mc.lock_mc.lock(false);
        _loc2_.moved = 0;
        if(_loc2_.GROUP != 1)
        {
            OnGameEvent("OnGame_SetUIPosition",_loc2_.locked,_loc2_.Name,_loc2_.xRatio,_loc2_.yRatio);
        }
        else
        {
            HideUI(_loc2_.Name);
        }
        _loc3_ = _loc3_ + 1;
    }
    _loc5_ = gRegisterUIDataList.length;
    _loc3_ = 0;
    while(_loc3_ < _loc5_)
    {
        _loc2_ = gRegisterUIDataList[_loc3_];
        if(_loc2_.GROUP == 1)
        {
            _loc2_.locked = false;
            _loc2_.moved = 0;
        }
        ToGame_SaveUIPosition(_loc2_.locked,_loc2_.Name,_loc2_.xRatio,_loc2_.yRatio);
        _loc3_ = _loc3_ + 1;
    }
    _root.GetLoadedUI("chat2").container_mc.optionMenu_mc.line3.hit.onRelease();
    resetUIALign(2);
}
function RegisterUI(Name, Path, x, y, bAlwaysLoaded, Group, ifLogOutClose, soundData, addDataList)
{
    Group = Number(Group);
    var _loc2_ = new Object();
    _loc2_.Name = Name;
    _loc2_.Path = Path;
    _loc2_.bAlwaysLoaded = Number(bAlwaysLoaded);
    _loc2_.GROUP = Group;
    _loc2_.ifLogOutClose = Number(ifLogOutClose);
    _loc2_.xRatio = x;
    _loc2_.yRatio = y;
    var _loc4_ = addDataList.split(",");
    var _loc3_ = 0;
    while(_loc3_ < _loc4_.length)
    {
        var _loc1_ = _loc4_[_loc3_].split(":");
        if(_loc1_[0] == "PA")
        {
            _loc2_.PA = Number(_loc1_[1]);
        }
        else if(_loc1_[0] == "SA")
        {
            _loc2_.SA = Number(_loc1_[1]);
        }
        else if(_loc1_[0] == "battleModeClose")
        {
            _loc2_.battleModeClose = Number(_loc1_[1]);
        }
        else if(_loc1_[0] == "scaleCustom")
        {
            _loc2_.ScaleCustom = Number(_loc1_[1]);
        }
        _loc3_ = _loc3_ + 1;
    }
    _loc2_.soundData = soundData;
    _loc2_.addDataList = addDataList;
    if(Group != 1)
    {
        _loc2_.locked = 1;
    }
    else
    {
        _loc2_.locked = null;
    }
    _loc2_.moved = 0;
    if(GetRegisterUIData(Name).Name == Name)
    {
        return undefined;
    }
    lib.manager.UISound.addOnSound(Name,soundData);
    gRegisterUIDataList.push(_loc2_);
    var _loc7_ = Name.toLowerCase();
    readyToPositions[_loc7_] = {name:_loc7_,lstate:undefined,expandOption:expandOption,cancelPosition:false};
    if(_loc2_.bAlwaysLoaded)
    {
        LoadUI(Name,Path,true,_loc2_.GROUP,_loc2_.ifLogOutClose);
    }
}
function lockRegisterUI(Name, locked)
{
    var _loc1_ = GetRegisterUIData(Name);
    _loc1_.locked = locked;
}
function LoadUI(Name, Path, bAlwaysLoaded, group, ifLogOutClose, expandOption)
{
    var _loc1_ = undefined;
    var makeUI;
    var UIdata = GetRegisterUIData(Name);
    var name = Name.toLowerCase();
    switch(group)
    {
        case 1:
            _loc1_ = container_normal_mc;
            break;
        case 2:
            _loc1_ = container_battle_mc;
            break;
        case 3:
            _loc1_ = container_normal_mc;
            break;
        case 10:
            _loc1_ = container_battleUp_mc;
            break;
        case 11:
            _loc1_ = container_logout_mc;
            break;
        case 12:
            _loc1_ = container_overlayMap_mc;
            break;
        case 13:
            _loc1_ = container_halfPopup_mc;
            break;
        case 14:
            _loc1_ = container_mainmenuUpside_mc;
            break;
        case 49:
            _loc1_ = container_highDepth_mc;
            break;
        case 50:
            _loc1_ = container_balloon_mc;
            break;
        case 51:
            _loc1_ = container_sysPopup_mc;
            break;
        case 52:
            _loc1_ = container_interPopup_mc;
            break;
        case 53:
            _loc1_ = container_norPopup_mc;
            break;
        case 54:
            _loc1_ = container_question_mc;
            break;
        case 55:
            _loc1_ = container_tooltip_mc;
            break;
        case 56:
            _loc1_ = container_chat_mc;
            break;
        case 57:
            _loc1_ = container_alwaysVisible_mc;
            break;
        case 58:
            _loc1_ = container_inGameMovie_mc;
            break;
        case 59:
            _loc1_ = container_message_mc;
            break;
        case 60:
            _loc1_ = container_battle_mc;
            break;
        case 61:
            _loc1_ = container_lobby_mc;
            break;
        case 48:
            _loc1_ = container_mainmenu_mc;
            break;
        default:
            _loc1_ = container_battle_mc;
    }
    _loc1_.gDepth = _loc1_.getNextHighestDepth();
    makeUI = _loc1_.createEmptyMovieClip(Name,_loc1_.gDepth);
    var _loc3_ = new MovieClipLoader();
    waitingShowUI[name] = {lstate:true,expandOption:undefined};
    var _loc2_ = new Object();
    _loc2_.onLoadInit = function(target)
    {
        target.info = UIdata;
        if(waitingShowUI[name].lstate == false)
        {
            var _loc5_ = waitingShowUI[name].expandOption;
            waitingShowUI[name].lstate = undefined;
            OnGameEvent("OnGameEventShowUI",Name,false,_loc5_);
            return undefined;
        }
        waitingShowUI[name].lstate = undefined;
        target.swapDepths(target._parent.getNextHighestDepth());
        if(target._parent == container_normal_mc || target._parent == container_battleUp_mc)
        {
            var _loc4_ = container_normal_mc.getDepth();
            var _loc3_ = container_battleUp_mc.getDepth();
            var _loc2_ = Math.max(_loc4_,_loc3_);
            target._parent.swapDepths(_loc2_);
        }
        target.group = group;
        gUIList.push(target);
        rescaleUI(Name);
        if(checkDisableUI(Name) != null)
        {
            setDisableUI(target,1);
        }
        var _loc6_ = GetRegisterUIData(target._name);
        if(_loc6_.locked == 0)
        {
            target.lock_mc.setEnabled(false);
        }
        else
        {
            target.lock_mc.setEnabled(true);
        }
        if(!bAlwaysLoaded)
        {
            readyToPositions[name].lstate = true;
            readyToPositions[name].expandOption = expandOption;
            readyToPositions[name].cancelPosition = false;
            ToGame_RequestSetUIPosition(name);
            if(name == "selectserver")
            {
                OnGameEvent("OnGameEventShowWindow",Name,true);
            }
            lib.manager.UISound.showUI(name,true);
            lib.manager.UISkin.instance(target);
        }
        if(name == "progressbar" || name == "gagebar")
        {
            makeUI.hitTestDisable = true;
        }
        if(name != "crosshair" && name != "partywindow")
        {
            var _loc7_ = lib.manager.CustomScaleManger.getInstance();
            _loc7_.addCustomScale(target,name);
        }
    };
    _loc3_.addListener(_loc2_);
    _loc3_.loadClip(Path,makeUI);
}
function UnLoadUI(Name)
{
    removeListenerIndex = null;
    removeUIListIndex = null;
    removeTarget = null;
    var _loc5_ = false;
    var _loc4_ = 0;
    while(_loc4_ < gUIList.length)
    {
        var _loc3_ = gUIList[_loc4_];
        if(_loc3_._name.toLowerCase() == Name.toLowerCase())
        {
            var _loc2_ = 0;
            while(_loc2_ < _global.EventBroadCaster._listeners.length)
            {
                if(_loc3_.myListener == _global.EventBroadCaster._listeners[_loc2_])
                {
                    removeListenerIndex = _loc2_;
                    removeUIListIndex = _loc4_;
                    removeTarget = _loc3_;
                    _loc5_ = true;
                    break;
                }
                _loc2_ = _loc2_ + 1;
            }
            if(_loc5_)
            {
                break;
            }
        }
        _loc4_ = _loc4_ + 1;
    }
    var _loc7_ = lib.manager.CustomScaleManger.getInstance();
    _loc7_.removeCustomScale(_loc3_,Name);
    RemoveEventListener();
}
function RemoveEventListener()
{
    if(removeListenerIndex != null)
    {
        gUIList.splice(removeUIListIndex,1);
    }
    if(removeUIListIndex != null)
    {
        _global.EventBroadCaster.removeListener(_global.EventBroadCaster._listeners[removeListenerIndex]);
    }
    if(removeTarget != null)
    {
        removeTarget.removeMovieClip();
    }
    removeListenerIndex = null;
    removeUIListIndex = null;
    removeTarget = null;
}
function GetLoadedUI(Name)
{
    var _loc3_ = gUIList.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        var _loc2_ = gUIList[_loc1_];
        if(_loc2_._name.toUpperCase() == Name.toUpperCase())
        {
            return _loc2_;
        }
        _loc1_ = _loc1_ + 1;
    }
    return null;
}
function GetRegisterUIData(Name)
{
    var _loc3_ = gRegisterUIDataList.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        var _loc2_ = gRegisterUIDataList[_loc1_];
        if(_loc2_.Name.toUpperCase() == Name.toUpperCase())
        {
            return _loc2_;
        }
        _loc1_ = _loc1_ + 1;
    }
    return null;
}
function GetAlignUI(UIName)
{
    var _loc3_ = alignGroup_array.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        var _loc2_ = alignGroup_array[_loc1_];
        if(_loc2_._name.toLowerCase() == UIName.toLowerCase())
        {
            return _loc2_;
        }
        _loc1_ = _loc1_ + 1;
    }
    return null;
}
function removeUIInAlignGroup(UIName)
{
    var _loc2_ = null;
    var _loc1_ = 0;
    while(_loc1_ < alignGroup_array.length)
    {
        if(alignGroup_array[_loc1_]._name.toLowerCase() == UIName.toLowerCase())
        {
            _loc2_ = _loc1_;
            break;
        }
        _loc1_ = _loc1_ + 1;
    }
    if(_loc2_ != null)
    {
        alignGroup_array.splice(_loc2_,1);
    }
}
function ShowUI(Name, expandOption)
{
    var _loc1_ = GetLoadedUI(Name);
    if(_loc1_._visible != true)
    {
        UIData = GetRegisterUIData(Name);
        if(_loc1_ == null || _loc1_ == undefined)
        {
            if(UIData == null || UIData == undefined)
            {
                return undefined;
            }
            if(waitingShowUI[name].lstate != undefined)
            {
                return undefined;
            }
            LoadUI(UIData.Name,UIData.Path,UIData.bAlwaysLoaded,UIData.GROUP,UIData.ifLogOutClose,expandOption);
        }
        else
        {
            var name = Name.toLowerCase();
            lib.manager.UISound.showUI(name,true);
            if(UIData.GROUP != 2 && UIData.GROUP < 54)
            {
                lib.manager.UISkin.instance(_loc1_);
            }
            _loc1_.container_mc.UIDrager.moved = false;
            _loc1_.swapDepths(_loc1_._parent.getNextHighestDepth());
            if(_loc1_._parent == container_normal_mc || _loc1_._parent == container_battleUp_mc)
            {
                var _loc5_ = container_normal_mc.getDepth();
                var _loc4_ = container_battleUp_mc.getDepth();
                var _loc3_ = Math.max(_loc5_,_loc4_);
                _loc1_._parent.swapDepths(_loc3_);
            }
            ToGame_RequestSetUIPosition(Name);
        }
        if(UIData.GROUP < 50)
        {
            openingAni2(_loc1_);
        }
        else
        {
            openingAni2(_loc1_);
        }
        OnGameEvent("OnGameEventShowWindow",Name,true,expandOption);
        if(Name.toLowerCase() == "SenatorRegistration".toLowerCase())
        {
            BaseUIListener.OnGame_DisableUI("SenatorMap",true);
        }
    }
}
function HideUI(Name, doNotAlign, expandOption)
{
    UIData = GetRegisterUIData(Name);
    var _loc3_ = GetLoadedUI(Name);
    var _loc4_ = _loc3_.container_mc.lock_mc.locked;
    if(UIData == null)
    {
        return undefined;
    }
    var _loc2_ = Name.toLowerCase();
    lib.manager.UISound.showUI(_loc2_,false);
    lib.controls.ScaleCustomEvent.delScaleCustom(Name);
    if(lib.manager.Focus.modalUI == _loc3_)
    {
        Selection.setFocus(null);
        lib.manager.Focus.stop();
    }
    if(_loc2_ == "SenatorRegistration".toLowerCase())
    {
        BaseUIListener.OnGame_DisableUI("SenatorMap",0);
    }
    OnGameEvent("OnGameEventShowWindow",Name,false,expandOption);
    if(!UIData.bAlwaysLoaded)
    {
        UnLoadUI(Name);
    }
    removeUIInAlignGroup(Name);
    if(doNotAlign != 1)
    {
        resetUIALign(2);
    }
    ToGame_DestroyUI(Name);
}
function openingAni(target)
{
    var _loc2_ = target._xscale - 2.2;
    var _loc3_ = target._xscale;
    target._alpha = 0;
    target._xscale = _loc2_;
    target._yscale = _loc2_;
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,0.3,{_xscale:_loc3_,_yscale:_loc3_,_alpha:100,ease:Regular.easeOut});
}
function openingAni2(target)
{
    target._alpha = 0;
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,0.3,{_alpha:100,ease:Regular.easeOut});
}
function checkDisableUI(Name)
{
    var _loc1_ = 0;
    while(_loc1_ < disableUIName_array.length)
    {
        if(disableUIName_array[_loc1_].toLowerCase() == Name.toLowerCase())
        {
            return _loc1_;
        }
        _loc1_ = _loc1_ + 1;
    }
    return null;
}
function setDisableUI(ui, bTrue)
{
    if(bTrue)
    {
        var _loc2_ = new flash.geom.Transform(ui);
        _loc2_.colorTransform = lib.info.ColorTrans.popupDisableTrans();
        ui.onRelease = function()
        {
        };
    }
    else
    {
        _loc2_ = new flash.geom.Transform(ui);
        _loc2_.colorTransform = enableTrans;
        delete ui.onRelease;
    }
}
function freezeGame(bTrue)
{
    _global.freezeGame = bTrue;
    mouseClicked = false;
}
function lockUI(bTrue)
{
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_NORMAL",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_HALFPOPUP",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","MainMenu",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","WorldMap",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_BATTLEUP",bTrue);
    OnGameEvent("OnGame_DisableUIMode",bTrue);
}
function lockNormalPopup(bTrue)
{
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_POPUP_NORMAL",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","DicePopup",bTrue);
}
function lockInteractionPopup(bTrue)
{
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_POPUP_INTERACTION",bTrue);
}
function lockBattleUI(bTrue)
{
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_BATTLE",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_BATTLEUP",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","CONTAINER_LOBBY",bTrue);
}
function resetUIALign(sortMode)
{
    if(sortMode != 0)
    {
        if(sortMode == 1)
        {
            var _loc1_ = new Array();
            var _loc13_ = null;
            var _loc11_ = alignGroup_array.length;
            var _loc2_ = 0;
            while(_loc2_ < _loc11_)
            {
                var _loc4_ = GetRegisterUIData(alignGroup_array[_loc2_]._name);
                var _loc3_ = GetLoadedUI(alignGroup_array[_loc2_]._name);
                if(_loc4_.GROUP == 1 && _loc4_.locked == 0)
                {
                    _loc3_.container_mc.lock_mc.setEnabled(false);
                    _loc1_.push(_loc3_);
                }
                _loc2_ = _loc2_ + 1;
            }
            var _loc8_ = 0;
            var _loc7_ = 0;
            _loc2_ = _loc1_.length;
            while(_loc2_ >= 0)
            {
                var _loc6_ = lib.info.AlignInfo.uiScale(_loc1_[_loc2_ - 1]._name,_loc1_[_loc2_ - 1]);
                var _loc5_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc6_);
                _loc8_ = _loc8_ + (_loc1_[_loc2_ - 1].hit._width * _loc5_ + eachUIGap);
                if(_loc8_ > Stage.width)
                {
                    _loc7_ = _loc2_;
                    break;
                }
                _loc2_ = _loc2_ - 1;
            }
            if(_loc7_ > 0)
            {
                var _loc10_ = new Array();
                _loc2_ = 0;
                while(_loc2_ < _loc1_.length)
                {
                    if(_loc2_ >= _loc7_)
                    {
                        _loc10_.push(_loc1_[_loc2_]);
                    }
                    else if(doNotAlign)
                    {
                        HideUI(_loc1_[_loc2_]._name,1);
                    }
                    else
                    {
                        HideUI(_loc1_[_loc2_]._name);
                    }
                    _loc2_ = _loc2_ + 1;
                }
                _loc1_ = _loc10_;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
                _loc6_ = lib.info.AlignInfo.uiScale(_loc1_[_loc2_ - 1]._name,_loc1_[_loc2_ - 1]);
                _loc5_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc6_);
                if(_loc2_ == 0)
                {
                    _loc1_[_loc2_]._x = lib.info.AlignInfo.xRatioToPixel(0) + eachUIGap;
                }
                else
                {
                    _loc1_[_loc2_]._x = _loc1_[_loc2_ - 1]._x + _loc1_[_loc2_ - 1].hit._width * _loc5_ + eachUIGap;
                }
                _loc1_[_loc2_]._y = lib.info.AlignInfo.ALIGN_YPOS;
                _loc2_ = _loc2_ + 1;
            }
            alignGroup_array = _loc1_;
        }
        else if(sortMode == 2)
        {
            _loc1_ = new Array();
            var _loc9_ = new Array();
            _loc13_ = null;
            _loc11_ = alignGroup_array.length;
            _loc2_ = 0;
            while(_loc2_ < _loc11_)
            {
                _loc4_ = GetRegisterUIData(alignGroup_array[_loc2_]._name);
                _loc3_ = GetLoadedUI(alignGroup_array[_loc2_]._name);
                if(_loc4_.GROUP == 1 && _loc4_.locked == 0 && _loc3_.container_mc.UIDrager.moved == false)
                {
                    _loc3_.container_mc.lock_mc.setEnabled(false);
                    _loc1_.push(_loc3_);
                }
                else if(_loc4_.GROUP == 1 && _loc4_.locked == 0 && _loc3_.container_mc.UIDrager.moved == true)
                {
                    _loc3_.container_mc.lock_mc.setEnabled(true);
                    _loc9_.push(_loc3_);
                }
                _loc2_ = _loc2_ + 1;
            }
            _loc8_ = 0;
            _loc7_ = 0;
            _loc2_ = _loc1_.length;
            while(_loc2_ >= 0)
            {
                _loc6_ = lib.info.AlignInfo.uiScale(_loc1_[_loc2_ - 1]._name,_loc1_[_loc2_ - 1]);
                _loc5_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc6_);
                _loc8_ = _loc8_ + (_loc1_[_loc2_ - 1].hit._width * _loc5_ + eachUIGap);
                if(_loc8_ > Stage.width)
                {
                    _loc7_ = _loc2_;
                    break;
                }
                _loc2_ = _loc2_ - 1;
            }
            if(_loc7_ > 0)
            {
                _loc10_ = new Array();
                _loc2_ = 0;
                while(_loc2_ < _loc1_.length)
                {
                    if(_loc2_ >= _loc7_)
                    {
                        _loc10_.push(_loc1_[_loc2_]);
                    }
                    else if(doNotAlign)
                    {
                        HideUI(_loc1_[_loc2_]._name,1);
                    }
                    else
                    {
                        HideUI(_loc1_[_loc2_]._name);
                    }
                    _loc2_ = _loc2_ + 1;
                }
                _loc1_ = _loc10_;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
                _loc6_ = lib.info.AlignInfo.uiScale(_loc1_[_loc2_ - 1]._name,_loc1_[_loc2_ - 1]);
                _loc5_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc6_);
                if(_loc2_ == 0)
                {
                    _loc1_[_loc2_]._x = lib.info.AlignInfo.xRatioToPixel(0) + eachUIGap;
                }
                else
                {
                    _loc1_[_loc2_]._x = _loc1_[_loc2_ - 1]._x + _loc1_[_loc2_ - 1].hit._width * _loc5_ + eachUIGap;
                }
                _loc1_[_loc2_]._y = lib.info.AlignInfo.ALIGN_YPOS;
                _loc2_ = _loc2_ + 1;
            }
            alignGroup_array = _loc1_.concat(_loc9_);
        }
    }
}
function repositionLockedUI()
{
    for(index in container_normal_mc)
    {
        if(typeof container_normal_mc[index] == "movieclip")
        {
            var _loc1_ = container_normal_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_battle_mc)
    {
        if(typeof container_battle_mc[index] == "movieclip")
        {
            _loc1_ = container_battle_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_battleUp_mc)
    {
        if(typeof container_battleUp_mc[index] == "movieclip")
        {
            _loc1_ = container_battleUp_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_overlayMap_mc)
    {
        if(typeof container_overlayMap_mc[index] == "movieclip")
        {
            _loc1_ = container_overlayMap_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_chat_mc)
    {
        if(typeof container_chat_mc[index] == "movieclip")
        {
            _loc1_ = container_chat_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_halfPopup_mc)
    {
        if(typeof container_halfPopup_mc[index] == "movieclip")
        {
            _loc1_ = container_halfPopup_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_mainmenu_mc)
    {
        if(typeof container_mainmenu_mc[index] == "movieclip")
        {
            _loc1_ = container_mainmenu_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
    for(index in container_mainmenuUpside_mc)
    {
        if(typeof container_mainmenuUpside_mc[index] == "movieclip")
        {
            _loc1_ = container_mainmenuUpside_mc[index];
            if(GetRegisterUIData(_loc1_._name).locked || GetRegisterUIData(_loc1_._name).GROUP != 1)
            {
                ToGame_RequestSetUIPosition(_loc1_._name);
            }
        }
    }
}
function ToGame_DestroyUI(UIName)
{
    getURL("FSCommand:ToGame_DestroyUI",UIName);
}
function ToGame_RequestSetUIPosition(UIName, locked, xRatio, yRatio)
{
    if(locked == undefined || locked == "" || locked == null)
    {
        getURL("FSCommand:ToGame_RequestSetUIPosition",UIName);
    }
    if(locked != undefined || xRatio != undefined || yRatio != undefined)
    {
        layoutManager.setPosition(UIName,locked,xRatio,yRatio,1);
    }
}
function ToGame_SaveUIPosition(bLocked, UIName, posXRatio, posYRatio)
{
    if(bLocked == undefined || bLocked == "undefined" || bLocked == null || bLocked == "null")
    {
        bLocked = 1;
    }
    if(bLocked == 0)
    {
        var _loc2_ = GetLoadedUI(UIName);
        if(_loc2_.container_mc.UIDrager.moved == true)
        {
            _loc2_.container_mc.lock_mc.setEnabled(true);
        }
        else
        {
            _loc2_.container_mc.lock_mc.setEnabled(false);
        }
    }
    var _loc3_ = UIName.toLowerCase();
    getURL("FSCommand:ToGame_SaveUIPosition",bLocked + "\t" + _loc3_ + "\t" + posXRatio + "\t" + posYRatio);
}
function ToGame_PlaySound(id)
{
    getURL("FSCommand:ToGame_PlaySound",id);
}
function ToGame_CTRLMouseDown(type, info)
{
    if(GetLoadedUI(type)._visible)
    {
        getURL("FSCommand:ToGame_CTRLMouseDown",type + "\t" + info);
    }
}
function ProductionProgressDisable(bTrue)
{
    _root.OnGameEvent("OnGame_DisableUI","Production",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Shortcut",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","StoreWindow",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","ParcelPost",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Errand",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Loan",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Inventory",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","WarehouseWindow",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","PandoraBox",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","TradeWindow",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","HomunManager",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","HomunIncubator",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","QuestJournal",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","PaperDoll",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","SkillWindow",bTrue);
}
function groupDuelDisable(bTrue)
{
    _root.OnGameEvent("OnGame_DisableUI","Production",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Shortcut",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","StoreWindow",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","ParcelPost",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Errand",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Loan",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","Inventory",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","WarehouseWindow",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","PandoraBox",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","TradeWindow",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","HomunManager",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","HomunIncubator",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","QuestJournal",bTrue);
    _root.OnGameEvent("OnGame_DisableUI","PaperDoll",bTrue);
}
function ProcessWindowDepth(targetContainer)
{
    var _loc3_ = null;
    var _loc4_ = undefined;
    var _loc6_ = false;
    var _loc7_ = new Array();
    for(var _loc8_ in targetContainer)
    {
        var _loc2_ = targetContainer[_loc8_];
        if(typeof _loc2_ == "movieclip" && _loc2_.hit.hitTest(_root._xmouse,_root._ymouse,true) && _loc2_._visible == true)
        {
            _loc6_ = true;
            _loc7_.push(_loc2_);
            if(_loc3_ == null)
            {
                _loc3_ = _loc2_.getDepth();
                _loc4_ = _loc2_;
            }
            else if(_loc2_.getDepth() > _loc3_)
            {
                _loc3_ = _loc2_.getDepth();
                _loc4_ = _loc2_;
            }
        }
    }
    if(targetContainer == container_normal_mc)
    {
        var _loc10_ = clickedAlignUI;
        var _loc9_ = _loc4_;
        var _loc12_ = GetRegisterUIData(clickedAlignUI._name);
        var _loc11_ = GetRegisterUIData(_loc4_._name);
        if(clickedAlignUI != _loc4_)
        {
            clickedAlignUI = _loc9_;
        }
    }
    _loc4_.swapDepths(targetContainer.getNextHighestDepth());
    currentUI = _loc4_;
    return _loc6_;
}
function IsGameScreen(dropTargetMc)
{
    var _loc2_ = {x:_xmouse,y:_ymouse};
    this.localToGlobal(_loc2_);
    for(var _loc4_ in gUIList)
    {
        win = gUIList[_loc4_];
        if(win._visible && win.hitTest(_loc2_.x,_loc2_.y,true))
        {
            if(dropTargetMc._visible && dropTargetMc._parent._alpha != 0)
            {
                return false;
            }
        }
    }
    return true;
}
function checkStartDrag(started, target, Icon)
{
    if(started && !_root.die)
    {
        dragingMc = target;
        dragingIcon = Icon;
        var fX = _root._xmouse;
        var fY = _root._ymouse;
        target.onEnterFrame = function()
        {
            if(Math.abs(fX - _root._xmouse) > 15 || Math.abs(fY - _root._ymouse) > 15)
            {
                _global.StartIconDrag(target,Icon.TEX);
                target.dragging = true;
                var _loc3_ = new flash.geom.Transform(Icon);
                _loc3_.colorTransform = disableTrans;
                delete target.onEnterFrame;
            }
        };
    }
    else
    {
        dragingMc.dragging = false;
        var _loc3_ = new flash.geom.Transform(dragingIcon);
        if(Icon._parent.impossible)
        {
            _loc3_.colorTransform = lib.info.ColorTrans.slotImpossibleTrans();
        }
        else if(Icon._parent.disable)
        {
            _loc3_.colorTransform = lib.info.ColorTrans.slotDisableTrans();
        }
        else
        {
            _loc3_.colorTransform = enableTrans;
        }
        var _loc4_ = Icon._parent.durability;
        if(_loc4_)
        {
            Icon._parent.durability = _loc4_;
        }
        delete dragingMc.onEnterFrame;
        dragingMc.FX_PRESS._visible = false;
        dragingMc = null;
        dragingIcon = null;
    }
}
function CreateDraggedIcon(slot)
{
    dragSlot_mc._visible = true;
    dragSlot_mc.swapDepths(_root.getNextHighestDepth());
    dragSlot_mc.draw(slot.TEX,40,40);
    dragSlot_mc.grade = slot.grade;
    dragSlot_mc.sealType.gotoAndStop(slot.sealType + 1);
    return dragSlot_mc;
}
function dragManager_dragEndHandler(e)
{
    checkStartDrag(false);
    EndIconDrag();
}
function EndIconDrag(target)
{
    Mouse.show();
    gbDraggedIcon._visible = false;
    if(gbDraggingTile == false)
    {
        return false;
    }
    var dt = null;
    if(target == undefined)
    {
        dt = gbDraggedIcon._droptarget;
        var dtmc = eval(dt);
        var UIName = dt.split("/")[3];
        if(dt != undefined)
        {
            if(dtmc.GetName() != undefined)
            {
                debug2.text = dtmc.GetName();
                ToGameEndDrag(dtmc.GetName() + "\t" + UIName);
                debug.text = dtmc.GetName();
            }
            else if(IsGameScreen(dtmc))
            {
                ToGameEndDrag("GameScreen\t" + UIName);
            }
            else if(UIName.toLowerCase() != "overlaymap2" && UIName.toLowerCase() != "questtaskinfo")
            {
                ToGameEndDrag("InvalidUI\t" + UIName);
            }
            else
            {
                ToGameEndDrag("GameScreen\t" + UIName);
            }
        }
        else
        {
            ToGameEndDrag("GameScreen\t" + undefined);
        }
    }
    else
    {
        ToGameEndDrag(target);
    }
    stopDrag();
    gbDraggingTile = false;
    return true;
}
function doubleClickCheck(target)
{
    doubleClickCheckCnt++;
    if(doubleClickCheckCnt >= 5)
    {
        clearInterval(doubleClickInterval[0]);
        doubleClickInterval.shift();
        doubleClickInterval[0] = 1;
        doubleClickCheckCnt = 0;
        clickCnt = 0;
    }
    else if(clickCnt == 2)
    {
        OnGameEvent("OnGame_DoubleClick",target);
        clickCnt = 0;
        clearInterval(doubleClickInterval[0]);
        doubleClickInterval.shift();
        doubleClickInterval[0] = 1;
        doubleClickCheckCnt = 0;
    }
}
function AddKeyListener()
{
    if(!bKeyListening)
    {
        Key.addListener(KeyListener);
    }
    bKeyListening = true;
}
function RemoveKeyListener()
{
    if(bKeyListening)
    {
        Key.removeListener(KeyListener);
    }
    bKeyListening = false;
}
function changedUICustomizeHandler(event)
{
    switch(event.key)
    {
        case lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT:
            OnGameEvent("OnGame_ScaleUI",event.value);
            break;
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_UI_BOOLEAN:
            bUsedBattleMode = Boolean(Number(event.value));
            break;
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOW_BOOLEAN:
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOWRAIDINFO_BOOLEAN:
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MINIMAP_BOOLEAN:
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_QUESTTASKINFO_BOOLEAN:
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MAINMENU_BOOLEAN:
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_OVERLAY_BOOLEAN:
        case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_CHAT_BOOLEAN:
            changedBattleModeUIHandler(event.key,!Boolean(Number(event.value)));
    }
}
function isChangedVisible(searchedName)
{
    var _loc3_ = selectedBattleModeUIName.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        var _loc2_ = selectedBattleModeUIName[_loc1_];
        if(searchedName == _loc2_)
        {
            return true;
        }
        _loc1_ = _loc1_ + 1;
    }
    return false;
}
function changedBattleModeUIHandler(key, bVisible)
{
    if(bVisible)
    {
        if(isChangedVisible(battleModeObj[key]))
        {
            return undefined;
        }
        selectedBattleModeUIName.push(battleModeObj[key]);
        var _loc6_ = selectedBattleModeUIName.length - 1;
    }
    else
    {
        var _loc4_ = battleModeObj[key];
        var _loc3_ = selectedBattleModeUIName.length;
        var _loc1_ = 0;
        while(_loc1_ < _loc3_)
        {
            var _loc2_ = selectedBattleModeUIName[_loc1_];
            if(_loc2_ == _loc4_)
            {
                selectedBattleModeUIName.splice(_loc1_,1);
                break;
            }
            _loc1_ = _loc1_ + 1;
        }
    }
}
_global.EventBroadCaster = new Object();
AsBroadcaster.initialize(_global.EventBroadCaster);
_global.gfxExtensions = true;
Stage.scaleMode = "showAll";
TextField.prototype.setText = function(str, flag)
{
    var _loc2_ = false;
    if(flag != undefined)
    {
        _loc2_ = lib.util.ExtString.textCut(this,str);
    }
    else
    {
        _loc2_ = lib.util.ExtString.textCut(this,str,1);
    }
    return _loc2_;
};
var BaseUI = this;
var UImadeWidth = AlignInfo.UI_WIDTH;
var UImadeHeight = AlignInfo.UI_HEIGHT;
var verticalSpace = AlignInfo.getVerticalSpace();
var horizontalSpace = AlignInfo.getHorizontalSpace();
var gRegisterUIDataList = new Array();
var gUIList = new Array();
var disableUIName_array = new Array();
var eachUIGap = 5;
var gbDraggingTile = false;
var gbDraggedIcon = undefined;
var gDepth = 1;
var resolutionX = null;
var resilutionY = null;
var currentUI = null;
var removeListenerIndex = null;
var removeUIListIndex = null;
var removeTarget = null;
var dragingMc = null;
var dragingIcon = null;
_global.freezeGame = false;
_global.inputing = false;
_global.chating = false;
_global.gbUIMode = false;
_global.control = false;
_global.shift = false;
_global.modal = false;
_global.gbBattleMode = false;
var bUsedBattleMode = false;
var clickedAlignUI = null;
var bClickWindow = null;
var mouseClicked = false;
var doubleClickInterval = new Array();
doubleClickInterval[0] = 1;
var clickCnt = 0;
var doubleClickCheckCnt = 0;
var showLoadingSymbols = false;
var currentOver = null;
var axis = new lib.util.AxisResetter();
var BaseUIListener = new Object();
_global.EventBroadCaster.addListener(BaseUIListener);
var layoutManager = com.bluehole.tera.managers.LayoutManager.__get__instance();
var die = false;
var MyLevel = 0;
var bTelePorting = false;
var bSelectSlotMode = false;
var inLobby = true;
var readyToPosition = null;
var ExpandOption = null;
var waitingShowUI = {};
var readyToPositions = {};
dragSlot_mc._visible = false;
mouseHere_mc._visible = false;
mouseHere_mc.hitTestDisable = true;
dragSlot_mc.hitTestDisable = true;
var dragManager = gfx.managers.DragManager.__get__instance();
dragManager.addEventListener("dragEnd",this,"dragManager_dragEndHandler");
var bbb1 = lib.manager.UISound.UI_OPEN;
var bbb2 = lib.manager.Focus.bone();
var a1 = lib.info.TextColor.SLOT_NUMBER;
var a2 = lib.info.AlignInfo.xRatioToPixel(100);
var a3 = lib.info.ToolTipStr.CLOSE;
var aa4 = lib.info.LoadURL.SERVER_SELECT_BG;
var enableTrans = lib.info.ColorTrans.enableTrans();
var disableTrans = lib.info.ColorTrans.slotDragTrans();
var aa5 = lib.info.KeyMap.getKey(48);
var a4 = new lib.util.AxisResetter();
var a5 = new lib.util.TxtBtn();
var a6 = new lib.util.TxtAniBtn();
var a7 = new lib.util.TabBtn();
var a8 = new lib.util.McMaker();
var a9 = new lib.util.ExtTextField();
var a10 = lib.util.CurrencyFormat.makeComma("123");
var a11 = lib.util.ExtString.trimChar("abc123");
var a12 = lib.util.DrawBitmap.draw(s1.Icon,"img://__Icon_Skills.Jump_TEX",50,50);
var a12 = lib.util.DrawBitmap.draw(s1.Icon,"img://__Icon_Items.blackdagger_TEX",50,50);
var a13 = lib.util.FrameSeeker.seek(s1,1,1);
var a14 = new lib.util.LbTxtBtn();
var aa15 = lib.util.UIString.getUIString();
var aa16 = new lib.util.List();
var aaa1 = new lib.util.CoolTime(1,1);
var aaa2 = new lib.util.Warning.init();
var aaa3 = lib.util.ColorUtil.RGBToHex(255,255,255);
var aaa4 = lib.util.ObjAlign.align();
var aaa5 = lib.util.GeneralTabBtn.test;
var aaa6 = lib.util.LockBtn.test;
var aaa7 = new lib.util.Slot3();
var aaa8 = lib.util.StrByteLen.getLenth2("aaa");
var aaa9 = lib.util.RGBColor.RGBToHexdecimal(255,0,0);
var aaa10 = new lib.util.Slot2.test();
var aaa11 = lib.util.AnimationGage.test;
var aaa12 = lib.util.Aligner.preLoadVar;
var aaa13 = lib.util.SlotInnerAttacher.preLoadVar;
var aaa13 = new lib.controls.S_SortBtn();
lib.util.Snapper;
lib.util.SnapperGroup;
lib.util.InteractionGroup;
lib.gamedata.GameData;
lib.gamedata.GameDataCollection;
lib.gamedata.GameDataCollectionImpl;
lib.gamedata.GameDataCoolTimeable;
lib.gamedata.CustomizedUIData;
lib.gamedata.CustomizedUIDataKey;
lib.gamedata.CustomizedUIDataCollection.getInstance();
lib.gamedata.Item;
lib.gamedata.ItemCollection_MyInventory.getInstance();
lib.gamedata.Skill;
lib.gamedata.SkillCollection_MySkills.getInstance();
lib.gamedata.MapMarker;
lib.gamedata.MapMarkerCollection.getInstance();
lib.gamedata.QuestTaskData;
lib.gamedata.QuestTaskSubData;
lib.gamedata.QuestTaskDataCollection;
lib.gamedata.DefaultData;
lib.gamedata.HistoryData;
lib.src.QuestTaskMc;
lib.src.QuestTaskPartyMc;
lib.util.TextFieldFormatter;
lib.controls.S_NumberSteper2;
var a16 = new lib.controls.S_SimpleScrollBar();
var a18 = new lib.controls.S_SimpleComboBox();
var a19 = new lib.controls.S_CheckBox();
var a20 = new lib.controls.S_NumberSteper();
var a21 = new lib.controls.S_TextScrollBar();
var a21 = new lib.controls.S_Slider();
var a22 = lib.controls.S_UIDrager.test;
var a23 = lib.controls.AutoBuilder.test;
var a24 = lib.controls.S_2DepthList2.preLoadVar;
var a25 = lib.controls.S_2DepthList.preLoadVar;
var a26 = lib.controls.S_2DepthList_ForQuest.preLoadVar;
var a27 = new lib.controls.S_SimpleScrollBar_width();
var a28_1 = new lib.controls.CustomScaleEvent();
var a29 = lib.controls.S_DragScale.test;
var a30 = lib.controls.S_2DepthList_Help.preLoadVar;
var a31 = lib.controls.S_GoldCurrency.test;
var a32 = lib.util.GoldCurrency.test;
var a33 = lib.controls.S_GoldCurrencyInput.test;
var a34 = lib.net.NetConnect.test;
var a35 = new lib.src.ClipBoardSrc(BaseUI);
var a36 = new lib.controls.S_TxtBtn2();
var aCoolTimeInstance = new lib.util.CoolTimeInstance();
var aCoolTimeManger = lib.util.CoolTimeManger.getInstance();
unloadMovie(s1);
unloadMovie(s2);
var stageResizeObject = new Object();
stageResizeObject.onResize = function()
{
    var _loc3_ = Stage.width;
    var _loc2_ = Stage.height;
    lib.info.AlignInfo.horizontalSpace = (_loc3_ - lib.info.AlignInfo.UI_WIDTH) / 2;
    lib.info.AlignInfo.verticalSpace = (_loc2_ - lib.info.AlignInfo.UI_HEIGHT) / 2;
    lib.info.AlignInfo.zeroPointX = - lib.info.AlignInfo.horizontalSpace;
    lib.info.AlignInfo.zeroPointY = - lib.info.AlignInfo.verticalSpace;
    lib.info.AlignInfo.onePercentPixelW = _loc3_ / 100;
    lib.info.AlignInfo.onePercentPixelH = _loc2_ / 100;
    lib.info.AlignInfo.onePixelPercentW = 100 / _loc3_;
    lib.info.AlignInfo.onePixelPercentH = 100 / _loc2_;
    _root.OnGameEvent("OnGame_ChangeStageSize",_loc3_,_loc2_);
};
Stage.addListener(stageResizeObject);
MouseDown = function(button, target)
{
    var targetMc = eval(target);
    var splited = target.split(".");
    var depthProcessTargetContainer = BaseUI[splited[1]];
    if(depthProcessTargetContainer == container_battleUp_mc || depthProcessTargetContainer == container_normal_mc)
    {
        var top = null;
        var depth1 = container_battleUp_mc.getDepth();
        var depth2 = container_normal_mc.getDepth();
        if(depth1 > depth2)
        {
            top = depth1;
        }
        else
        {
            top = depth2;
        }
        depthProcessTargetContainer.swapDepths(top);
    }
    else if(depthProcessTargetContainer == container_chat_mc)
    {
        depthProcessTargetContainer[splited[2]][splited[3]].swapDepths(depthProcessTargetContainer[splited[2]].getNextHighestDepth());
    }
    if(!mouseClicked)
    {
        if(!targetMc.clickArea)
        {
            bClickWindow = ProcessWindowDepth(depthProcessTargetContainer);
        }
        if(checkDisableUI(splited[2]) == null)
        {
            OnGameEvent("OnGame_MouseDown",button,targetMc,target);
        }
        else if(depthProcessTargetContainer[splited[2]].container_mc.x_mc.hitTest(_root._xmouse,_root._ymouse,true))
        {
            depthProcessTargetContainer[splited[2]].container_mc.x_mc.onRelease();
        }
    }
    clickCnt++;
    if(clickCnt == 1)
    {
        doubleClickInterval[0] = setInterval(doubleClickCheck,50,targetMc);
    }
    mouseClicked = true;
};
MouseUp = function(button, target)
{
    mouseClicked = false;
    bDragging = EndIconDrag();
    OnGameEvent("OnGame_MouseUp",button,eval(target));
};
MouseMove = function()
{
    if(_global.gbUIMode)
    {
        var _loc3_ = Mouse.getTopMostEntity(false);
        var _loc4_ = Mouse.getTopMostEntity();
        if(_loc3_._name.substr(0,4) == "SLOT" && _loc3_._parent.effect != false)
        {
            if(currentOver != _loc3_._parent.FX_OVER)
            {
                currentOver._visible = false;
            }
            _loc3_._parent.FX_OVER._visible = true;
            currentOver = _loc3_._parent.FX_OVER;
        }
        else
        {
            currentOver._visible = false;
            currentOver = null;
        }
        if(mouseHere_mc._visible)
        {
            mouseHere_mc._x = _root._xmouse;
            mouseHere_mc._y = _root._ymouse;
        }
        OnGameEvent("OnGame_MouseMove",_loc4_);
    }
};
MouseWheel = function(Delta, target)
{
    OnGameEvent("OnGame_MouseWheel",Delta,target);
};
var MouseListener = new Object();
MouseListener.onMouseUp = function(button, target)
{
    if(_global.freezeGame == false)
    {
        MouseUp(button,target);
    }
};
MouseListener.onMouseDown = function(button, target)
{
    if(_global.freezeGame == false)
    {
        MouseDown(button,target);
    }
    else if(eval(target)._name == "x_mc")
    {
        eval(target).onRelease();
    }
};
MouseListener.onMouseMove = function(mouseIdx, x, y)
{
    MouseMove();
};
MouseListener.onMouseWheel = function(delta, target)
{
    MouseWheel(delta,target);
};
Mouse.addListener(MouseListener);
_global.StartIconDrag = function(slot, IconName, x, y, xo, yo)
{
    if(_global.freezeGame)
    {
        return undefined;
    }
    var _loc5_ = slot._name;
    gbDraggingTile = false;
    if(IconName != "")
    {
        gbDraggingTile = true;
        gbDraggedIcon = CreateDraggedIcon(slot);
        Mouse.hide();
        gbDraggedIcon._x = _root._xmouse;
        gbDraggedIcon._y = _root._ymouse;
        gbDraggedIcon.startDrag(false);
        ToGameStartDrag(_loc5_);
        var _loc3_ = {};
        _loc3_.TEX = IconName;
        _loc3_.iconWidth = 50;
        _loc3_.iconHeight = 50;
        dragManager.startGhostDrag(_loc3_,slot);
    }
};
ToGameStartDrag = function(slotName)
{
    getURL("FSCommand:ToGameStartDrag",slotName);
};
ToGameEndDrag = function(slotName)
{
    getURL("FSCommand:toGameEndDrag",slotName);
};
KeyDown = function()
{
};
KeyUp = function()
{
};
var KeyListener = new Object();
KeyListener.onKeyDown = function()
{
    var _loc2_ = Key.getCode();
    if(_global.chating == false && _global.inputing == false && _global.modal == false)
    {
        KeyDown();
        OnGameEvent("OnGame_KeyDown",_loc2_);
    }
};
KeyListener.onKeyUp = function()
{
    var _loc2_ = Key.getCode();
    if(_global.chating == false && _global.inputing == false && _global.modal == false)
    {
        KeyUp();
        OnGameEvent("OnGame_KeyUp",_loc2_);
    }
};
var bKeyListening = false;
AddKeyListener();
BaseUIListener.OnGame_SelectSlotMode = function(bTrue)
{
    bTrue = Number(bTrue);
    bSelectSlotMode = bTrue;
};
BaseUIListener.OnGameEventUpdateUserLevel = function(Level)
{
    _root.MyLevel = Number(Level);
};
BaseUIListener.OnGame_MouseMove = function()
{
};
BaseUIListener.OnGame_MouseDown = function()
{
};
BaseUIListener.OnGame_MouseUp = function()
{
};
BaseUIListener.OnGame_MouseWheel = function()
{
};
BaseUIListener.OnGame_KeyUp = function()
{
};
BaseUIListener.OnGame_KeyUp = function()
{
};
BaseUIListener.OnGame_KeyDown = function(code)
{
};
BaseUIListener.OnGame_Popup_Create = function()
{
    lib.manager.UISound.play(lib.manager.UISound.UI_OPEN);
};
BaseUIListener.OnGame_Popup_Remove = function()
{
    lib.manager.UISound.play(lib.manager.UISound.UI_CLOSE);
};
BaseUIListener.OnGame_ScaleUI = function(value, exception)
{
    lib.info.AlignInfo.scaleRatio = value / 100;
    rescaleUI("",exception);
};
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"changedUICustomizeHandler");
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOW_BOOLEAN] = "PartyWindow";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOWRAIDINFO_BOOLEAN] = "PartyWindowRaidInfo";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MINIMAP_BOOLEAN] = "MiniMap";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_QUESTTASKINFO_BOOLEAN] = "QuestTaskInfo";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MAINMENU_BOOLEAN] = "MainMenu";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_OVERLAY_BOOLEAN] = "OverlayMap2";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_CHAT_BOOLEAN] = "Chat2";
BaseUIListener.OnGameEventRegisterUI = function(Name, Path, x, y, bAlwaysLoaded, group, ifLogoutClose, soundData, addData)
{
    RegisterUI(Name,Path,x,y,bAlwaysLoaded,group,ifLogoutClose,soundData,addData);
};
BaseUIListener.OnGame_RegisterLoadUIData = function(Name, Path, x, y, bAlwaysLoaded, group, ifLogoutClose, soundData, addData)
{
    RegisterUI(Name,Path,x,y,bAlwaysLoaded,group,ifLogoutClose,soundData,addData);
};
var battleModeUIName = ["CharacterWindow","SkillHotKey","ShortCut","ExtShortCut","Abnormality","TargetInfo","GageBar","GageBoss","GageBossTeamA","GageBossTeamB","Crosshair","Message","DungeonEventGage","CoolTimeAlim2","Debuger"];
var selectedBattleModeUIName = new Array();
var changedVisibleForBattleMode = [];
var battleModeObj = new Object();
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOW_BOOLEAN] = "PartyWindow";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOWRAIDINFO_BOOLEAN] = "PartyWindowRaidInfo";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MINIMAP_BOOLEAN] = "MiniMap";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_QUESTTASKINFO_BOOLEAN] = "QuestTaskInfo";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MAINMENU_BOOLEAN] = "MainMenu";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_OVERLAY_BOOLEAN] = "OverlayMap2";
battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_CHAT_BOOLEAN] = "Chat2";
BaseUIListener.OnGameEventUpdateBattleState = function(bMode)
{
    if(false == bUsedBattleMode)
    {
        return undefined;
    }
    bMode = Number(bMode);
    _global.gbBattleMode = bMode;
    if(bMode && _global.gbUIMode)
    {
        BaseUIListener.OnGameEventChangeUIMode("0");
    }
    if(bMode)
    {
        var _loc10_ = gUIList.length;
        var _loc4_ = 0;
        while(_loc4_ < _loc10_)
        {
            var _loc2_ = gUIList[_loc4_];
            var _loc6_ = GetRegisterUIData(_loc2_._name);
            if(_loc2_ && _loc6_)
            {
                if(undefined == _loc2_.bWidgetOpen && undefined == _loc2_.bWindowOpen)
                {
                    changedVisibleForBattleMode.push(_loc2_);
                }
                else if(_loc2_.bWidgetOpen || _loc2_.bWindowOpen)
                {
                    changedVisibleForBattleMode.push(_loc2_);
                }
                _loc2_._visible = false;
            }
            _loc4_ = _loc4_ + 1;
        }
        var _loc7_ = battleModeUIName.length;
        _loc4_ = 0;
        while(_loc4_ < _loc7_)
        {
            var _loc5_ = battleModeUIName[_loc4_];
            _loc2_ = GetLoadedUI(_loc5_);
            _loc6_ = GetRegisterUIData(_loc5_);
            if(_loc2_ && _loc6_)
            {
                var _loc3_ = false;
                if(undefined == _loc2_.bWidgetOpen && undefined == _loc2_.bWindowOpen)
                {
                    _loc3_ = true;
                }
                else if(_loc2_.bWidgetOpen || _loc2_.bWindowOpen)
                {
                    _loc3_ = true;
                }
                _loc2_._visible = _loc3_;
            }
            _loc4_ = _loc4_ + 1;
        }
        var _loc9_ = selectedBattleModeUIName.length;
        _loc4_ = 0;
        while(_loc4_ < _loc9_)
        {
            _loc5_ = selectedBattleModeUIName[_loc4_];
            _loc2_ = GetLoadedUI(_loc5_);
            _loc6_ = GetRegisterUIData(_loc5_);
            if(_loc2_ && _loc6_)
            {
                _loc3_ = false;
                if(undefined == _loc2_.bWidgetOpen && undefined == _loc2_.bWindowOpen)
                {
                    _loc3_ = true;
                }
                else if(_loc2_.bWidgetOpen || _loc2_.bWindowOpen)
                {
                    _loc3_ = true;
                }
                _loc2_._visible = _loc3_;
            }
            _loc4_ = _loc4_ + 1;
        }
    }
    else
    {
        var _loc8_ = changedVisibleForBattleMode.length;
        _loc4_ = 0;
        while(_loc4_ < _loc8_)
        {
            _loc2_ = changedVisibleForBattleMode[_loc4_];
            if(_loc2_)
            {
                _loc3_ = false;
                if(undefined == _loc2_.bWidgetOpen && undefined == _loc2_.bWindowOpen)
                {
                    _loc3_ = true;
                }
                else if(_loc2_.bWidgetOpen || _loc2_.bWindowOpen)
                {
                    _loc3_ = true;
                }
                _loc2_._visible = _loc3_;
            }
            _loc4_ = _loc4_ + 1;
        }
        changedVisibleForBattleMode = [];
    }
};
BaseUIListener.OnGameEventChangeUIMode = function(bMode)
{
    bMode = Number(bMode);
    _global.gbUIMode = bMode;
    if(bMode == 0)
    {
        mouseHere_mc.gotoAndStop(1);
        mouseHere_mc._visible = false;
        if(!lib.manager.Focus.bFocused)
        {
            Selection.setFocus(null);
        }
        _global.inputing = false;
        _global.chating = false;
        if(gbDraggingTile)
        {
            dragSlot_mc._visible = false;
        }
        EndIconDrag("InvalidUI");
        checkStartDrag(false);
        dragManager.stopDrag();
        var _loc6_ = new Array();
        var _loc8_ = gUIList.length;
        var _loc4_ = 0;
        while(_loc4_ < _loc8_)
        {
            var _loc3_ = gUIList[_loc4_];
            if(_loc3_.info.battleModeClose == 1)
            {
                if(_loc3_._visible)
                {
                    _loc6_.push(_loc3_);
                }
            }
            _loc4_ = _loc4_ + 1;
        }
        var _loc9_ = _loc6_.length;
        _loc4_ = 0;
        while(_loc4_ < _loc9_)
        {
            HideUI(_loc6_[_loc4_]._name,1);
            _loc4_ = _loc4_ + 1;
        }
        layoutManager.reflowAutoLayoutUIs(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNLOCKED_UI);
        if(_global.gbBattleMode)
        {
            BaseUIListener.OnGameEventUpdateBattleState(1);
        }
    }
    else
    {
        if(_global.gbBattleMode)
        {
            var _loc7_ = changedVisibleForBattleMode.length;
            _loc4_ = 0;
            while(_loc4_ < _loc7_)
            {
                var _loc5_ = changedVisibleForBattleMode[_loc4_];
                if(_loc5_)
                {
                    _loc5_._visible = true;
                }
                _loc4_ = _loc4_ + 1;
            }
        }
        if(gbDraggingTile)
        {
            dragSlot_mc._visible = true;
        }
        mouseHere_mc._x = _root._xmouse;
        mouseHere_mc._y = _root._ymouse;
        if(!inLobby)
        {
            mouseHere_mc.gotoAndPlay(2);
            mouseHere_mc._visible = true;
        }
    }
};
BaseUIListener.OnGameEventShowUI = function(Name, bShow, expandOption)
{
    stopDrag();
    if(gbDraggingTile)
    {
        dragSlot_mc._visible = false;
        EndIconDrag("InvalidUI");
        checkStartDrag(false);
    }
    bShow = Number(bShow);
    var _loc1_ = Name.toLowerCase();
    readyToPositions[_loc1_].cancelPosition = !bShow;
    if(bShow)
    {
        if(_loc1_ == "productionprogress")
        {
            ProductionProgressDisable(1);
        }
        else if(_loc1_ == "selectcharacter")
        {
            inLobby = true;
            mouseHere_mc._visible = false;
        }
        ShowUI(Name,expandOption);
        fscommand("ToGame_EventShowUIComplete");
    }
    else
    {
        if(waitingShowUI[_loc1_].lstate != undefined)
        {
            waitingShowUI[_loc1_].lstate = false;
            waitingShowUI[_loc1_].expandOption = expandOption;
            readyToPositions[_loc1_].lstate = false;
            return undefined;
        }
        if(_loc1_ == "productionprogress")
        {
            ProductionProgressDisable(0);
        }
        else if(_loc1_ == "selectcharacter")
        {
            inLobby = false;
        }
        else if(_loc1_ == "systemoption")
        {
            ToGame_DestroyUI("AutoQualitySet");
        }
        HideUI(Name,undefined,expandOption);
    }
};
BaseUIListener.OnGame_OnlyShowUI = function(bTrue, Name)
{
    bTrue = Number(bTrue);
    var _loc5_ = GetLoadedUI(Name);
    if(bTrue)
    {
        if(_loc5_ == null)
        {
            BaseUIListener.OnGameEventShowUI(Name,1);
        }
        var _loc2_ = 0;
        while(_loc2_ < gUIList.length)
        {
            var _loc1_ = gUIList[_loc2_];
            if(_loc1_._visible)
            {
                if(_loc1_._name.toLowerCase() == Name.toLowerCase())
                {
                    _loc1_._visible = true;
                    _loc1_.OnlyShowUIMode = "yes";
                }
                else if(_loc1_._name.toLowerCase() != "canthidemsg")
                {
                    _loc1_._visible = false;
                    _loc1_.OnlyShowUIMode = "no";
                }
            }
            _loc2_ = _loc2_ + 1;
        }
    }
    else
    {
        _loc2_ = 0;
        while(_loc2_ < gUIList.length)
        {
            _loc1_ = gUIList[_loc2_];
            if(_loc1_.OnlyShowUIMode != undefined)
            {
                _loc1_._visible = true;
                _loc1_.OnlyShowUIMode = undefined;
            }
            _loc2_ = _loc2_ + 1;
        }
    }
};
BaseUIListener.OnGame_LogOut = function()
{
    inLobby = true;
    var _loc9_ = disableUIName_array.length;
    var _loc10_ = disableUIName_array.concat();
    var _loc2_ = 0;
    while(_loc2_ < _loc9_)
    {
        _root.OnGameEvent("OnGame_DisableUI",_loc10_[_loc2_],0);
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < gRegisterUIDataList.length)
    {
        var _loc5_ = gRegisterUIDataList[_loc2_];
        if(_loc5_.Name.toUpperCase() == Name.toUpperCase())
        {
            return _loc5_;
        }
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < gRegisterUIDataList.length)
    {
        var _loc4_ = gRegisterUIDataList[_loc2_];
        var _loc7_ = _loc4_.ifLogOutClose;
        var _loc6_ = _loc4_.Name;
        if(_loc7_)
        {
            OnGameEvent("OnGameEventShowUI",_loc6_,0);
        }
        _loc2_ = _loc2_ + 1;
    }
    var _loc3_ = lib.manager.PopupManager.getArray("",1);
    if(_loc3_.length >= 1)
    {
        var _loc8_ = _loc3_.length;
        _loc2_ = 0;
        while(_loc2_ < _loc8_)
        {
            if(_loc3_[_loc2_].type == 0)
            {
                _loc3_.push(_loc3_.splice(_loc2_,1));
            }
            _loc2_ = _loc2_ + 1;
        }
        _loc2_ = 0;
        while(_loc2_ < _loc8_)
        {
            _root.OnGameEvent("OnGame_Popup_Remove",_loc3_[_loc2_].id);
            getURL("FSCommand:ToGame_Popup_RemoveUISide",_loc3_[_loc2_].id);
            _loc2_ = _loc2_ + 1;
        }
    }
    aCoolTimeManger.clearCoolTimer();
    lib.gamedata.HistoryData.deleteAllHistoryData();
    disableUIName_array = [];
};
BaseUIListener.OnGame_ChangeStageSize = function(w, h)
{
    resetUIALign(1);
    repositionLockedUI();
};
BaseUIListener.OnGame_ChangeResolution = function(w, h)
{
    resolutionX = w;
    resolutionY = h;
};
BaseUIListener.OnGame_SetUIPosition = function(bLocked, UIName, posXRatio, posYRatio, notRatio)
{
    var _loc4_ = UIName.toLowerCase();
    if(readyToPositions[_loc4_].cancelPosition)
    {
        return undefined;
    }
    var _loc2_ = GetRegisterUIData(UIName);
    var _loc6_ = _loc2_.GROUP;
    var _loc1_ = GetLoadedUI(UIName);
    _loc2_.locked = Number(bLocked);
    if(_loc1_ == undefined || _loc1_ == "")
    {
        return undefined;
    }
    if(posXRatio == "" || posXRatio == undefined || posYRatio == "" || posYRatio == undefined)
    {
        posXRatio = _loc2_.xRatio;
        posYRatio = _loc2_.yRatio;
        ToGame_SaveUIPosition(bLocked,UIName,posXRatio,posYRatio);
    }
    if(UIName.toLowerCase() == "tradepopup")
    {
        if(readyToPositions[_loc4_].lstate == true)
        {
            if(_loc6_ < 50)
            {
                openingAni2(_loc1_);
            }
            else
            {
                openingAni2(_loc1_);
            }
            OnGameEvent("OnGameEventShowWindow",UIName,true,readyToPositions[_loc4_].expandOption);
        }
        return undefined;
    }
    var _loc11_ = lib.info.AlignInfo.uiScale(UIName,_loc1_);
    var _loc3_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc11_);
    if(_loc2_.locked)
    {
        _loc1_.container_mc.lock_mc.stat = 1;
        _loc1_.container_mc.lock_mc.lock(true);
        if(notRatio == 1)
        {
            _loc1_._x = posXRatio;
            _loc1_._y = posYRatio;
        }
        else if(_loc6_ >= 1 && _loc6_ < 50)
        {
            _loc1_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
            _loc1_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
            if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY - 50)
            {
                _loc1_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                _loc1_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
            }
            if(_loc2_.PA == 1)
            {
            }
            if(_loc2_.PA == 2)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width / 2 * _loc3_;
            }
            if(_loc2_.PA == 3)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
            }
            if(_loc2_.PA == 4)
            {
                _loc1_._y = _loc1_._y - _loc1_.hit._height / 2 * _loc3_;
                if(_loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    var _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    var _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height / 2 * _loc3_;
                }
            }
            else if(_loc2_.PA == 5)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width / 2 * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height / 2 * _loc3_;
                if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width / 2 * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height / 2 * _loc3_;
                }
            }
            else if(_loc2_.PA == 6)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height / 2 * _loc3_;
                if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height / 2 * _loc3_;
                }
            }
            else if(_loc2_.PA == 7)
            {
                _loc1_._y = _loc1_._y - _loc1_.hit._height * _loc3_;
                if(_loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height * _loc3_;
                }
            }
            else if(_loc2_.PA == 8)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width / 2 * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height * _loc3_;
                if(_loc4_ != "mainmenu" && (_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY))
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width / 2 * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height * _loc3_;
                }
            }
            else if(_loc2_.PA == 9)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height * _loc3_;
                if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height * _loc3_;
                }
            }
        }
        else
        {
            _loc1_._x = 0;
            _loc1_._y = 0;
        }
    }
    else
    {
        _loc1_.container_mc.lock_mc.stat = 0;
        _loc1_.container_mc.lock_mc.lock(false);
        if(_loc6_ == 1)
        {
            if(notRatio)
            {
                _loc1_._x = posXRatio;
                _loc1_._y = posYRatio;
                resetUIALign(2);
            }
            else if(GetAlignUI(UIName) == null)
            {
                _loc1_._y = lib.info.AlignInfo.ALIGN_YPOS;
                if(_loc4_ == "inventory")
                {
                    posXRatio = 100;
                    posYRatio = 12.5;
                    _loc1_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
                    _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
                    _loc1_.container_mc.lock_mc.setEnabled(false);
                }
                else
                {
                    alignGroup_array.push(_loc1_);
                    resetUIALign(2);
                }
            }
        }
        else if(_loc6_ > 1 && _loc6_ < 50)
        {
            _loc1_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
            _loc1_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
            if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY - 50)
            {
                _loc1_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                _loc1_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
            }
            if(_loc2_.PA == 1)
            {
            }
            if(_loc2_.PA == 2)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width / 2 * _loc3_;
            }
            if(_loc2_.PA == 3)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
            }
            if(_loc2_.PA == 4)
            {
                _loc1_._y = _loc1_._y - _loc1_.hit._height / 2 * _loc3_;
                if(_loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height / 2 * _loc3_;
                }
            }
            else if(_loc2_.PA == 5)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width / 2 * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height / 2 * _loc3_;
                if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < Y)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width / 2 * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height / 2 * _loc3_;
                }
            }
            else if(_loc2_.PA == 6)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height / 2 * _loc3_;
                if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height / 2 * _loc3_;
                }
            }
            else if(_loc2_.PA == 7)
            {
                _loc1_._y = _loc1_._y - _loc1_.hit._height * _loc3_;
                if(_loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height * _loc3_;
                }
            }
            else if(_loc2_.PA == 8)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width / 2 * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height * _loc3_;
                if(_loc4_ != "mainmenu" && (_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY))
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width / 2 * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height * _loc3_;
                }
            }
            else if(_loc2_.PA == 9)
            {
                _loc1_._x = _loc1_._x - _loc1_.hit._width * _loc3_;
                _loc1_._y = _loc1_._y - _loc1_.hit._height * _loc3_;
                if(_loc1_._x < lib.info.AlignInfo.zeroPointX || _loc1_._y < lib.info.AlignInfo.zeroPointY)
                {
                    _loc13_ = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc2_.xRatio;
                    _loc12_ = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc2_.yRatio;
                    _loc1_._x = _loc13_ - _loc1_.hit._width * _loc3_;
                    _loc1_._y = _loc12_ - _loc1_.hit._height * _loc3_;
                }
            }
        }
        else
        {
            _loc1_._x = 0;
            _loc1_._y = 0;
        }
    }
    var _loc10_ = lib.info.AlignInfo.horizontalSpace + _loc1_._x;
    var _loc9_ = lib.info.AlignInfo.verticalSpace + _loc1_._y;
    if(_loc2_.PA == 1)
    {
    }
    if(_loc2_.PA == 2)
    {
        _loc10_ = _loc10_ + _loc1_.hit._width / 2 * _loc3_;
    }
    if(_loc2_.PA == 3)
    {
        _loc10_ = _loc10_ + _loc1_.hit._width * _loc3_;
    }
    if(_loc2_.PA == 4)
    {
        _loc9_ = _loc9_ + _loc1_.hit._height / 2 * _loc3_;
    }
    else if(_loc2_.PA == 5)
    {
        _loc10_ = _loc10_ + _loc1_.hit._width / 2 * _loc3_;
        _loc9_ = _loc9_ + _loc1_.hit._height / 2 * _loc3_;
    }
    else if(_loc2_.PA == 6)
    {
        _loc10_ = _loc10_ + _loc1_.hit._width * _loc3_;
        _loc9_ = _loc9_ + _loc1_.hit._height / 2 * _loc3_;
    }
    else if(_loc2_.PA == 7)
    {
        _loc9_ = _loc9_ + _loc1_.hit._height * _loc3_;
    }
    else if(_loc2_.PA == 8)
    {
        _loc10_ = _loc10_ + _loc1_.hit._width / 2 * _loc3_;
        _loc9_ = _loc9_ + _loc1_.hit._height * _loc3_;
    }
    else if(_loc2_.PA == 9)
    {
        _loc10_ = _loc10_ + _loc1_.hit._width * _loc3_;
        _loc9_ = _loc9_ + _loc1_.hit._height * _loc3_;
    }
    _loc10_ = _loc10_ * lib.info.AlignInfo.onePixelPercentW;
    _loc9_ = _loc9_ * lib.info.AlignInfo.onePixelPercentH;
    if(readyToPositions[_loc4_].lstate == true)
    {
        if(_loc6_ < 50)
        {
            openingAni2(_loc1_);
        }
        else
        {
            openingAni2(_loc1_);
        }
        OnGameEvent("OnGameEventShowWindow",UIName,true,readyToPositions[_loc4_].expandOption);
    }
};
BaseUIListener.OnGame_HideAllUI = function(bHide)
{
    bHide = Number(bHide);
    OnGameEvent("OnGame_CantHideMsg_ShowLogo",bHide);
    container_sysPopup_mc._visible = !bHide;
    container_logout_mc._visible = !bHide;
    container_interPopup_mc._visible = !bHide;
    container_norPopup_mc._visible = !bHide;
    container_mainmenu_mc._visible = !bHide;
    container_question_mc._visible = !bHide;
    container_villager_mc._visible = !bHide;
    container_battleUp_mc._visible = !bHide;
    container_normal_mc._visible = !bHide;
    container_battle_mc._visible = !bHide;
    container_overlayMap_mc._visible = !bHide;
    container_chat_mc._visible = !bHide;
    container_halfPopup_mc._visible = !bHide;
    container_message_mc._visible = !bHide;
    container_inGameMovie_mc._visible = !bHide;
    container_lobby_mc._visible = !bHide;
    container_mainmenuUpside_mc._visible = !bHide;
    container_highDepth_mc._visible = !bHide;
};
BaseUIListener.OnGame_HideAllUIForCaption = function(bHide)
{
    bHide = Number(bHide);
    container_sysPopup_mc._visible = !bHide;
    container_logout_mc._visible = !bHide;
    container_interPopup_mc._visible = !bHide;
    container_norPopup_mc._visible = !bHide;
    container_tooltip_mc._visible = !bHide;
    container_mainmenu_mc._visible = !bHide;
    container_question_mc._visible = !bHide;
    container_villager_mc._visible = !bHide;
    container_battleUp_mc._visible = !bHide;
    container_normal_mc._visible = !bHide;
    container_battle_mc._visible = !bHide;
    container_overlayMap_mc._visible = !bHide;
    container_chat_mc._visible = !bHide;
    container_halfPopup_mc._visible = !bHide;
    container_message_mc._visible = true;
    container_inGameMovie_mc._visible = !bHide;
    container_lobby_mc._visible = !bHide;
    container_mainmenuUpside_mc._visible = !bHide;
    container_highDepth_mc._visible = !bHide;
};
var whenTeleportRecoverUI = new Array();
var whenTeleportRecoverUI2 = new Array();
var whenTeleportRecoverUI3 = new Array();
BaseUIListener.OnGame_StartTelePort = function()
{
    bTelePorting = true;
    OnGameEvent("OnGame_CantHideMsg_ShowLogo",false);
    container_sysPopup_mc._visible = false;
    container_logout_mc._visible = false;
    container_interPopup_mc._visible = false;
    container_norPopup_mc._visible = false;
    container_tooltip_mc._visible = false;
    container_mainmenu_mc._visible = false;
    container_question_mc._visible = false;
    container_villager_mc._visible = false;
    for(mc in container_normal_mc)
    {
        var _loc2_ = container_normal_mc[mc];
        if(typeof _loc2_ == "movieclip")
        {
            if(_loc2_._name.toLowerCase() != "learnkeyusage")
            {
                if(_loc2_._visible)
                {
                    whenTeleportRecoverUI.push(_loc2_._name);
                }
                _root.OnGameEvent("OnGameEventShowUI",_loc2_._name,0);
            }
        }
    }
    for(mc in container_battle_mc)
    {
        _loc2_ = container_battle_mc[mc];
        if(typeof _loc2_ == "movieclip")
        {
            if(_loc2_._name.toLowerCase() != "loadingprogress")
            {
                if(_loc2_._visible)
                {
                    whenTeleportRecoverUI2.push(_loc2_);
                }
                _loc2_._visible = false;
            }
        }
    }
    container_overlayMap_mc._visible = false;
    container_chat_mc._visible = false;
    container_balloon_mc._visible = false;
    container_halfPopup_mc._visible = false;
    container_inGameMovie_mc._visible = false;
    container_lobby_mc._visible = false;
    container_mainmenuUpside_mc._visible = false;
    for(mc in container_battleUp_mc)
    {
        _loc2_ = container_battleUp_mc[mc];
        if(typeof _loc2_ == "movieclip")
        {
            if(_loc2_._name.toLowerCase() != "updatenotification")
            {
                if(_loc2_._visible)
                {
                    whenTeleportRecoverUI3.push(_loc2_);
                }
                _loc2_._visible = false;
            }
        }
    }
};
BaseUIListener.OnGame_EndTelePort = function()
{
    bTelePorting = false;
    container_sysPopup_mc._visible = true;
    container_logout_mc._visible = true;
    container_interPopup_mc._visible = true;
    container_norPopup_mc._visible = true;
    container_tooltip_mc._visible = true;
    container_mainmenu_mc._visible = true;
    container_question_mc._visible = true;
    container_villager_mc._visible = true;
    container_battleUp_mc._visible = true;
    var _loc2_ = 0;
    while(_loc2_ < whenTeleportRecoverUI.length)
    {
        _root.OnGameEvent("OnGameEventShowUI",whenTeleportRecoverUI[_loc2_],1);
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < whenTeleportRecoverUI2.length)
    {
        whenTeleportRecoverUI2[_loc2_]._visible = true;
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < whenTeleportRecoverUI3.length)
    {
        whenTeleportRecoverUI3[_loc2_]._visible = true;
        _loc2_ = _loc2_ + 1;
    }
    whenTeleportRecoverUI = [];
    whenTeleportRecoverUI2 = [];
    whenTeleportRecoverUI3 = [];
    container_battle_mc._visible = true;
    container_overlayMap_mc._visible = true;
    container_chat_mc._visible = true;
    container_balloon_mc._visible = true;
    container_halfPopup_mc._visible = true;
    container_inGameMovie_mc._visible = true;
    container_lobby_mc._visible = true;
    container_mainmenuUpside_mc._visible = true;
};
BaseUIListener.OnGame_DisableUI = function(Name, bTrue)
{
    bTrue = Number(bTrue);
    if(Name == "CONTAINER_NORMAL")
    {
        setDisableUI(container_normal_mc,bTrue);
    }
    else if(Name == "CONTAINER_BATTLE")
    {
        setDisableUI(container_battle_mc,bTrue);
        setDisableUI(container_overlayMap_mc,bTrue);
        setDisableUI(container_chat_mc,bTrue);
    }
    else if(Name == "CONTAINER_BATTLEUP")
    {
        setDisableUI(container_battleUp_mc,bTrue);
    }
    else if(Name == "CONTAINER_HALFPOPUP")
    {
        setDisableUI(container_halfPopup_mc,bTrue);
    }
    else if(Name == "CONTAINER_ALL")
    {
        setDisableUI(BaseUI,bTrue);
    }
    else if(Name == "CONTAINER_POPUP_NORMAL")
    {
        setDisableUI(container_norPopup_mc,bTrue);
    }
    else if(Name == "CONTAINER_POPUP_INTERACTION")
    {
        setDisableUI(container_interPopup_mc,bTrue);
    }
    else if(Name == "CONTAINER_POPUP_SYSTEM")
    {
        setDisableUI(container_sysPopup_mc,bTrue);
    }
    else if(Name == "CONTAINER_LOBBY")
    {
        setDisableUI(container_lobby_mc,bTrue);
    }
    else if(Name == "CONTAINER_MAINMENUUPSIDE")
    {
        setDisableUI(container_mainmenuUpside_mc,bTrue);
    }
    else if(Name == "CONTAINER_TOOLTIP")
    {
        setDisableUI(container_tooltip_mc,bTrue);
    }
    else
    {
        var _loc4_ = GetLoadedUI(Name);
        var _loc3_ = checkDisableUI(Name);
        if(bTrue)
        {
            if(_loc3_ == null)
            {
                disableUIName_array.push(Name);
            }
            setDisableUI(_loc4_,1);
        }
        else
        {
            if(_loc3_ != null)
            {
                disableUIName_array.splice(_loc3_,1);
            }
            setDisableUI(_loc4_,0);
        }
    }
};
BaseUIListener.OnGame_PlaySound = function(num)
{
    getURL("FSCommand:ToGame_PlaySound",num);
};
BaseUIListener.OnGame_SetDefaultData = function(_defaultName, _param0, _param1)
{
    lib.gamedata.DefaultData.AddDefaultUIData(_defaultName,_param0,_param1);
    if(_defaultName == "uiscale")
    {
        customizeData.updateDefaultDatas(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,Number(_param0));
        customizeData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,Number(_param0));
    }
    if(_defaultName == "minimapmode")
    {
        customizeData.updateDefaultDatas(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,Number(_param0));
        customizeData.saveData(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,Number(_param0));
    }
};
var aaa18 = lib.manager.PopupManager.getPopup(12345);
var a15 = lib.manager.ToolTip.clear();
var startCount = 0;
this.onEnterFrame = function()
{
    startCount++;
    if(startCount >= 30)
    {
        stageResizeObject.onResize();
        BaseUIListener.OnGame_ChangeStageSize();
        _root.OnGameEvent("OnGame_ChangeStageSize",Stage.width,Stage.height);
        delete this.onEnterFrame;
    }
};
stop();
