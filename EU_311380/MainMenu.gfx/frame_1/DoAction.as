function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN)
    {
        var _loc1_ = Boolean(Number(event.value));
        if(_loc1_)
        {
            ViewAlways = false;
            container_mc.guideMc._visible = false;
        }
        else
        {
            ViewAlways = true;
            container_mc.guideMc._visible = true;
        }
    }
}
function iconDraw(pMc, img)
{
    if(pMc.iconMc)
    {
        pMc.iconMc.removeMovieClip();
    }
    var _loc3_ = flash.display.BitmapData.loadBitmap(img);
    var _loc1_ = pMc.createEmptyMovieClip("iconMc",ICONDEPTH);
    _loc1_.attachBitmap(_loc3_,1);
    _loc1_.hitTestDisable = true;
    _loc1_._xscale = 75;
    _loc1_._yscale = 75;
    _loc1_._x = iconY;
    _loc1_._y = iconY;
}
function createMainMenu()
{
    var _loc15_ = meunStorage.length;
    var _loc10_ = 0;
    var _loc12_ = 0;
    while(_loc12_ < _loc15_)
    {
        var _loc11_ = meunStorage[_loc12_];
        var _loc13_ = _loc11_.length;
        var _loc5_ = 0;
        while(_loc5_ < _loc13_)
        {
            var _loc3_ = _loc11_[_loc5_];
            var _loc7_ = _loc3_[0];
            var _loc14_ = _loc3_[1];
            var _loc6_ = _loc3_[2];
            var _loc2_ = _loc3_[3];
            var _loc1_ = container_mc.attachMovie("menuMc","menu_" + _loc7_,MAIN_DEPTH);
            MAIN_DEPTH++;
            _loc1_.id = _loc7_;
            _loc1_.nameTxt = _loc2_;
            _loc1_.img = _loc6_;
            _loc1_.subTip._visible = false;
            var _loc9_ = "<font size=\'18\'>" + _loc2_ + "</font>";
            lib.manager.ToolTip.add(_loc1_.hit,_loc9_,1);
            var _loc8_ = _loc2_.length;
            if(_loc8_ > 4)
            {
                _loc2_ = _loc2_ + "  ";
            }
            _loc1_.nTxt.setText(_loc2_);
            _loc1_.disable = false;
            _loc1_._x = MAINMENUSTARTX + _loc10_;
            _loc1_._y = MAINMENUSTARTY;
            _loc10_ = _loc10_ + ICONDSPACE;
            iconDraw(_loc1_,_loc6_);
            createTextFd(_loc1_);
            var _loc4_ = SetKey(_loc1_.txt,_loc3_[4]);
            if(_loc4_ == undefined)
            {
                _loc4_ = "";
            }
            _loc1_.txt.setText(_loc4_);
            setButton(_loc1_);
            _loc5_ = _loc5_ + 1;
        }
        _loc10_ = _loc10_ + GROUPSPACE;
        _loc12_ = _loc12_ + 1;
    }
    container_mc.bgMc._width = _loc10_ + 400;
    container_mc.UIDrager._width = _loc10_ + 200;
    container_mc.bgMc._x = 684;
    container_mc.UIDrager._x = -100;
    container_mc._x = - _loc10_ / 2;
    container_mc.guideMc._x = _loc10_;
    container_mc.UIDrager.setData(UIname,UI,null);
    container_mc.UIDrager.adjustDragLimit(750,750,50,46);
}
function menuClick(mc)
{
    gs.TweenLite.killTweensOf(mc,true);
    gs.TweenLite.to(mc,0.2,{_y:iconY,ease:gs.easing.Strong.easeOut});
    var _loc2_ = mc._parent;
    var _loc3_ = _loc2_.img + "_press";
    focusMc = mc;
    iconDraw(_loc2_,_loc3_);
}
function menuOver(mc)
{
    gs.TweenLite.killTweensOf(mc,true);
    gs.TweenLite.to(mc,0.3,{_y:iconOverY,ease:gs.easing.Strong.easeOut});
    var _loc1_ = mc._parent;
    var _loc3_ = _loc1_.img + "_over";
    iconDraw(_loc1_,_loc3_);
}
function menuOut(mc)
{
    gs.TweenLite.killTweensOf(mc,true);
    if(mc._y == iconOverY)
    {
        gs.TweenLite.to(mc,0.5,{_y:iconY,ease:gs.easing.Strong.easeOut});
    }
    else
    {
        gs.TweenLite.to(mc,0.2,{_y:iconY,ease:gs.easing.Strong.easeOut});
    }
    mc.subTip._visible = true;
    var _loc2_ = mc._parent;
    var _loc3_ = _loc2_.img;
    iconDraw(_loc2_,_loc3_);
}
function setButton(menuMc)
{
    menuMc.hit.onRelease = function()
    {
        lib.manager.UISound.play("1192");
        var _loc2_ = this._parent;
        menuClick(_loc2_.iconMc);
        if(_loc2_.disable)
        {
            ToGame_MainMenu_RequestDisableUI(_loc2_.id);
            return undefined;
        }
        var _loc3_ = container_mc["subContainer_" + _loc2_.id];
        if(_loc3_._visible)
        {
            menuOut(_loc2_.iconMc);
            closeSubMenu(_loc2_.id);
        }
        else
        {
            openSubMenu(_loc2_.id);
        }
        if(!_loc3_)
        {
            ToGame_MainMenu_RequestShowUI(_loc2_.id);
        }
        else
        {
            _loc2_.subTip._visible = false;
        }
    };
    menuMc.hit.onRollOver = function()
    {
        var _loc2_ = this._parent;
        if(_loc2_.disable)
        {
            return undefined;
        }
        var _loc3_ = container_mc["subContainer_" + _loc2_.id];
        if(_loc3_)
        {
            if(_loc3_._visible)
            {
                delete register3.onEnterFrame;
                return undefined;
            }
            _loc2_.subTip._visible = true;
        }
        menuOver(_loc2_.iconMc);
    };
    menuMc.hit.onRollOut = menuMc.hit.onReleaseOutside = function()
    {
        var _loc2_ = this._parent;
        if(_loc2_.disable)
        {
            return undefined;
        }
        var _loc3_ = container_mc["subContainer_" + _loc2_.id];
        if(_loc3_._visible)
        {
            openSubMenu(_loc2_.id,true);
        }
        else
        {
            menuOut(_loc2_.iconMc);
        }
        _loc2_.subTip._visible = false;
    };
}
function createSubMenu(posX, posY, mainId, menu)
{
    var _loc9_ = container_mc["menu_" + mainId];
    var _loc2_ = container_mc["subContainer_" + mainId];
    var _loc4_ = _loc2_.subBtmBg;
    if(_loc2_ == undefined)
    {
        _loc2_ = container_mc.createEmptyMovieClip("subContainer_" + mainId,SUB_DEPTH);
        SUB_DEPTH++;
        topBg = _loc2_.attachMovie("subT","subTopBg",_loc2_.getNextHighestDepth());
        _loc4_ = _loc2_.attachMovie("subB","subBtmBg",_loc2_.getNextHighestDepth());
        topBg._y = -5;
        _loc2_.count = 0;
    }
    var _loc8_ = _loc2_.count * SUBMEHIG;
    _loc2_.count = _loc2_.count + 1;
    var subMenuMc = _loc2_.attachMovie("subMenuBg","menu_" + menu[1],_loc2_.getNextHighestDepth());
    subMenuMc.id = menu[1];
    subMenuMc.mid = menu[0];
    subMenuMc._y = _loc8_;
    subMenuMc.bg._alpha = 0;
    if(menu[4])
    {
        lib.display.DrawBitmapData.draw(subMenuMc.iconBox,"img://__S1UIRES_Emblem.ico_" + menu[4],20,5,0,0,32,32);
    }
    var _loc5_ = "";
    if(menu[3] != undefined && menu[3] != "")
    {
        _loc5_ = "(" + menu[3] + ")";
    }
    subMenuMc.txt.setText(menu[2] + _loc5_);
    subMenuMc.onPress = function()
    {
        lib.manager.UISound.play("1192");
        subMenuMc.txt.textColor = SUBCOROL[0];
        submenuClick(this);
        ToGame_MainMenu_RequestShowUI(this.id);
        closeSubMenu(this.mid);
    };
    subMenuMc.onRollOver = function()
    {
        subMenuMc.txt.textColor = SUBCOROL[1];
        delete this._parent.onEnterFrame;
        submenuOver(this);
    };
    subMenuMc.onRollOut = subMenuMc.onReleaseOutside = function()
    {
        subMenuMc.txt.textColor = SUBCOROL[0];
        var _loc2_ = container_mc["subContainer_" + this.mid];
        if(_loc2_._visible)
        {
            openSubMenu(this.mid,false);
        }
        submenuOut(this);
    };
    var _loc6_ = posX - _loc2_._width / 2 + SUBMENURM;
    _loc2_._x = _loc6_;
    _loc2_._y = _loc2_.posY = posY - _loc2_._height - SUBMENUBM;
    _loc2_.posYO = _loc2_.posY;
    _loc2_.posYC = _loc2_.posY + 40;
    _loc2_._visible = false;
    _loc4_._y = _loc2_.count * SUBMEHIG;
}
function createSubMenu2(pMc, posX, posY, menu)
{
    var _loc4_ = pMc["subContainer2_" + menu[1]];
    if(_loc4_ == undefined)
    {
        _loc4_ = pMc.createEmptyMovieClip("subContainer2_" + menu[1],pMc.getNextHighestDepth());
    }
    var _loc7_ = _loc4_._height;
    var _loc2_ = _loc4_.attachMovie("subMenuBg","menu_" + menu[2],_loc4_.getNextHighestDepth());
    _loc2_.id = menu[2];
    _loc2_.mid = menu[0];
    _loc2_.sid = menu[1];
    _loc2_.posX = posX;
    _loc2_._y = _loc7_;
    _loc2_.bg._alpha = 0;
    var _loc5_ = "";
    if(menu[4] != undefined && menu[4] != "")
    {
        _loc5_ = "(" + menu[4] + ")";
    }
    _loc2_.txt.setText(menu[3] + _loc5_);
    _loc2_.onPress = function()
    {
        lib.manager.UISound.play("1192");
        submenuClick(this);
        ToGame_MainMenu_RequestShowUI(this.id);
        closeSubMenu(this.mid);
    };
    _loc2_.onRollOver = function()
    {
        delete this._parent._parent.onEnterFrame;
        delete this._parent.onEnterFrame;
        submenuOver(this,true);
    };
    _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
    {
        var _loc2_ = container_mc["subContainer_" + this.mid];
        if(_loc2_._visible)
        {
            openSubMenu(this.mid,false);
        }
        submenuOut(this);
    };
    _loc4_._x = posX;
    _loc4_._y = posY;
    _loc4_._visible = false;
}
function openSubMenu(mainId, bvisible)
{
    var _loc2_ = container_mc["subContainer_" + mainId];
    var iconMc = container_mc["menu_" + mainId].iconMc;
    if(_loc2_ == undefined)
    {
        return undefined;
    }
    if(!_loc2_._visible)
    {
        _loc2_._visible = true;
        gs.TweenLite.killTweensOf(_loc2_,true);
        _loc2_._alpha = 0;
        _loc2_._y = _loc2_.posYC;
        gs.TweenLite.to(_loc2_,0.2,{_y:_loc2_.posYO,_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
    }
    delete register2.onEnterFrame;
    if(bvisible == undefined)
    {
        return undefined;
    }
    _loc2_.deleay = !bvisible?4:10;
    _loc2_.onEnterFrame = function()
    {
        if(this.deleay-- < 0)
        {
            prevSub._visible = false;
            prevSub.bg._alpha = 0;
            this._visible = false;
            menuOut(iconMc);
            delete this.onEnterFrame;
        }
    };
}
function closeSubMenu(mainId)
{
    var subMenuMc = container_mc["subContainer_" + mainId];
    var _loc1_ = container_mc["menu_" + mainId].iconMc;
    if(subMenuMc == undefined)
    {
        return undefined;
    }
    delete subMenuMc.onEnterFrame;
    menuOut(_loc1_);
    if(subMenuMc._visible)
    {
        gs.TweenLite.killTweensOf(subMenuMc,true);
        gs.TweenLite.to(subMenuMc,0.2,{_y:subMenuMc.posYC,_alpha:0,ease:gs.easing.Strong.easeOut,onComplete:function()
        {
            subMenuMc._visible = false;
        }});
    }
}
function submenuClick(subMenuMc)
{
    if(subMenuMc == undefined)
    {
        return undefined;
    }
    subMenuMc.bg._alpha = 0;
}
function submenuOver(subMenuMc, type)
{
    if(subMenuMc == undefined)
    {
        return undefined;
    }
    gs.TweenLite.to(subMenuMc.bg,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
    this.txt.shadowColor = 5742335;
    this.txt.shadowStrength = 1;
    this.txt.shadowBlurX = this.txt.shadowBlurY = 10;
    if(!type)
    {
        prevSub._visible = false;
    }
    var _loc3_ = subMenuMc._parent;
    if(subMenuMc._currentframe == 2)
    {
        prevSub = _loc3_["subContainer2_" + subMenuMc.id];
        prevSub._visible = true;
        if(prevSub._alpha = 100)
        {
            return undefined;
        }
        TweenLite.killTweensOf(prevSub,true);
        gs.TweenLite.to(prevSub,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
    }
}
function submenuOut(subMenuMc)
{
    if(subMenuMc == undefined)
    {
        return undefined;
    }
    TweenLite.killTweensOf(subMenuMc.bg,true);
    gs.TweenLite.to(subMenuMc.bg,0.2,{_alpha:0,ease:gs.easing.Strong.easeOut,overwrite:1});
    this.txt.shadowColor = 0;
    this.txt.shadowStrength = 2;
    this.txt.shadowBlurX = this.txt.shadowBlurY = 5;
}
function findMenu(id)
{
    var _loc10_ = meunStorage.length;
    var _loc6_ = 0;
    while(_loc6_ < _loc10_)
    {
        var _loc4_ = meunStorage[_loc6_];
        var _loc1_ = 0;
        while(_loc1_ < _loc4_.length)
        {
            if(id == _loc4_[_loc1_][0])
            {
                var _loc7_ = container_mc["menu_" + id];
                return _loc7_;
            }
            _loc1_ = _loc1_ + 1;
        }
        _loc6_ = _loc6_ + 1;
    }
    var _loc9_ = submeunStorage.length;
    var _loc5_ = 0;
    while(_loc5_ < _loc9_)
    {
        if(id == submeunStorage[_loc5_][1])
        {
            _loc7_ = container_mc["subContainer_" + submeunStorage[_loc5_][0]]["menu_" + id];
            return _loc7_;
        }
        _loc5_ = _loc5_ + 1;
    }
    var _loc8_ = submeunStorage2.length;
    var _loc3_ = 0;
    while(_loc3_ < _loc8_)
    {
        if(id == submeunStorage2[_loc3_][2])
        {
            _loc7_ = container_mc["subContainer_" + submeunStorage2[_loc3_][0]]["subContainer2_" + submeunStorage2[_loc3_][1]]["menu_" + id];
            return _loc7_;
        }
        _loc3_ = _loc3_ + 1;
    }
}
function ToGame_MainMenu_Init()
{
    fscommand("ToGame_MainMenu_Init");
}
function ToGame_MainMenu_RequestShowUI(id)
{
    lib.Debuger.trace("ToGame_MainMenu_RequestShowUI" + id);
    getURL("FSCommand:ToGame_MainMenu_RequestShowUI",id);
}
function ToGame_MainMenu_RequestDisableUI(id)
{
    getURL("FSCommand:ToGame_MainMenu_RequestDisableUI",id);
}
function checkAndResetUIPositionTransform()
{
    var _loc1_ = meunStorage.length;
    if(_loc1_ <= 0)
    {
        return undefined;
    }
    if(lib.info.AlignInfo.yPixelToRatio(UI._y) > 20)
    {
        if(subMenuPosition != "top")
        {
            subMenuPosition = "top";
            reverseTotal();
        }
    }
    else if(subMenuPosition != "bottom")
    {
        subMenuPosition = "bottom";
        reverseTotal();
    }
}
function reversePosition(menuY, subY, tip)
{
    var _loc11_ = meunStorage.length;
    var _loc7_ = 0;
    while(_loc7_ < _loc11_)
    {
        var _loc6_ = meunStorage[_loc7_];
        var _loc9_ = _loc6_.length;
        var _loc1_ = 0;
        while(_loc1_ < _loc9_)
        {
            var _loc5_ = _loc6_[_loc1_];
            var _loc3_ = _loc5_[0];
            var _loc2_ = container_mc["menu_" + _loc3_];
            _loc2_._y = MAINMENUSTARTY + menuY;
            var _loc4_ = container_mc["subContainer_" + _loc3_];
            if(_loc4_)
            {
                _loc2_.subTip.gotoAndStop(tip);
                reverseSub(_loc4_,tip);
            }
            _loc1_ = _loc1_ + 1;
        }
        _loc7_ = _loc7_ + 1;
    }
}
function reverseSub(subMc, tip)
{
    var _loc5_ = 0;
    var _loc4_ = 0;
    var _loc6_ = SUBMEHIG;
    if(tip == 1)
    {
        subMc._y = subMc.posYO = subMc.posY;
        subMc.posYC = subMc.posY + 40;
        subMc.subTopBg._y = -4;
        subMc.subBtmBg._y = subMc.count * SUBMEHIG;
        subMc.subTopBg.gotoAndStop(1);
        subMc.subBtmBg.gotoAndStop(1);
    }
    else
    {
        subMc._y = subMc.posYO = 60;
        subMc.posYC = 20;
        subMc.subTopBg._y = subMc.count * SUBMEHIG;
        subMc.subBtmBg._y = -107;
        subMc.subTopBg.gotoAndStop(2);
        subMc.subBtmBg.gotoAndStop(2);
        _loc5_ = subMc.subBtmBg._y + 107;
    }
    for(line in subMc)
    {
        var _loc1_ = subMc[line];
        if(typeof _loc1_ == "movieclip")
        {
            if(_loc1_.txt && _loc1_._x == 0)
            {
                _loc1_._y = _loc5_ + _loc6_ * _loc4_;
                _loc4_ = _loc4_ + 1;
                _loc1_.swapDepths(20 - _loc1_.getDepth());
                if(_loc1_._currentframe == 2)
                {
                    var _loc3_ = _loc1_._parent;
                    _loc3_["subContainer2_" + _loc1_.id]._y = _loc1_._y;
                }
            }
        }
    }
}
function reverseTotal()
{
    if(subMenuPosition == "top")
    {
        container_mc.bgMc._rotation = 0;
        reversePosition(0,0,1);
    }
    else if(subMenuPosition == "bottom")
    {
        container_mc.bgMc._rotation = 180;
        reversePosition(30,0,2);
    }
}
function createTextFd(targetMc)
{
    textFd = targetMc.createTextField("txt",ICONDEPTH + 4,-11,22,45,16);
    textFd.hitTestDisable = true;
    textFd.border = false;
    textFd.background = false;
    textFd.selectable = false;
    textFd.wordWrap = false;
    textFd.type = "dynamic";
    textFd.multiline = false;
    textFd.antiAliasType = "normal";
    textFd.setNewTextFormat(keyTextFormat);
    textFd.shadowColor = 0;
    textFd.shadowBlurX = 2;
    textFd.shadowBlurY = 2;
    textFd.shadowStrength = 100;
    textFd.shadowDistance = 0;
    textFd.shadowQuality = 2;
}
function SetDisable(targetMc, bTrue)
{
    targetMc.disable = bTrue;
    if(bTrue)
    {
        var _loc1_ = new flash.geom.Transform(targetMc);
        _loc1_.colorTransform = lib.info.ColorTrans.popupDisableTrans();
    }
    else
    {
        _loc1_ = new flash.geom.Transform(targetMc);
        _loc1_.colorTransform = enableTrans;
    }
}
function SetKey(txtMc, keyCode)
{
    var _loc1_ = keyCode;
    if("LeftMouseButton" == keyCode)
    {
        _loc1_ = "L-Click";
    }
    if("RightMouseButton" == keyCode)
    {
        _loc1_ = "R-Click";
    }
    if(lib.util.ExtString.isOverLenght(txtMc,_loc1_))
    {
        _loc1_ = "";
    }
    return _loc1_;
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "MainMenu";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.bgMc.hitTestDisable = true;
var subMenuPosition = "top";
var prevSub;
var focusMc = null;
var MAINMENUSTARTX = 0;
var MAINMENUSTARTY = -49;
var GROUPSPACE = 80;
var ICONSIZE = 128;
var ICONDEPTH = 10;
var ICONDSPACE = 66;
var MAIN_DEPTH = 200;
var SUB_DEPTH = 100;
var enableTrans = lib.info.ColorTrans.enableTrans();
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN,this,"mainmenuChangeHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var ViewAlways = true;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWidgetOpen = bShow == 1;
        checkAndResetUIPositionTransform();
        bWidgetOpen = bShow == 1;
        UI._visible = bWidgetOpen;
        myListener.OnGame_ScaleUI();
    }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
    bShow = Number(bShow);
    if(!bWidgetOpen)
    {
        return undefined;
    }
    menuOut(focusMc);
    closeSubMenu(focusMc._parent.id);
    focusMc = null;
    var _loc1_ = 1;
    if(bShow)
    {
        _loc1_ = 2;
    }
    container_mc.guideMc.gotoAndStop(_loc1_);
    gs.TweenLite.killTweensOf(container_mc,true);
    if(bShow)
    {
        container_mc._visible = true;
        if(ViewAlways)
        {
            gs.TweenLite.to(container_mc.bgMc,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
        }
        else
        {
            gs.TweenLite.to(container_mc,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
        }
    }
    else if(ViewAlways)
    {
        gs.TweenLite.to(container_mc.bgMc,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut,overwrite:1});
    }
    else
    {
        gs.TweenLite.to(container_mc,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut,overwrite:1,onComplete:function()
        {
            container_mc._visible = false;
        }});
    }
};
var checkScale = 100;
myListener.OnGame_ScaleUI = function()
{
    checkScale = UI._xscale;
    if(checkScale > 100)
    {
        checkScale = 100 + (checkScale - 100) * 2 / 5;
    }
    UI._xscale = checkScale;
    UI._yscale = checkScale;
};
var meunStorage = [];
myListener.OnGame_MainMenu_SetMenu = function(mainMenus)
{
    var _loc4_ = lib.util.ExtString.split(mainMenus,"\n");
    var _loc5_ = _loc4_.length;
    var _loc2_ = 0;
    while(_loc2_ < _loc5_)
    {
        var _loc3_ = lib.util.ExtString.split(_loc4_[_loc2_],"\t");
        var _loc1_ = _loc3_[1];
        if(meunStorage[_loc1_] == undefined)
        {
            meunStorage[_loc1_] = [];
        }
        meunStorage[_loc1_].push(_loc3_);
        _loc2_ = _loc2_ + 1;
    }
    createMainMenu();
};
myListener.OnGame_MainMenu_UpDateMenu = function(id, datas)
{
    var _loc1_ = findMenu(id);
    if(!_loc1_)
    {
        return undefined;
    }
    var _loc2_ = lib.util.ExtString.split(datas,"\t");
    var _loc3_ = SetKey(_loc1_.txt,_loc2_[2]);
    _loc1_.nameTxt = _loc2_[1];
    _loc1_.disable = false;
    if(_loc3_ == undefined)
    {
        _loc3_ = "";
    }
    _loc1_.txt.setText(_loc3_);
    var _loc4_ = "<font size=\'18\'>" + _loc2_[1] + "</font>";
    lib.manager.ToolTip.remove(_loc1_);
    lib.manager.ToolTip.add(_loc1_,_loc4_,1);
    iconDraw(_loc1_,_loc2_[0]);
    setButton(_loc1_);
};
var iconY = -38;
var iconOverY = -43;
var submeunStorage = [];
myListener.OnGame_MainMenu_SetSubMenu = function(mainId, submenus)
{
    var _loc6_ = container_mc["menu_" + mainId]._x;
    var _loc5_ = container_mc["menu_" + mainId]._y;
    var _loc3_ = lib.util.ExtString.split(submenus,"\n");
    var _loc2_ = 0;
    while(_loc2_ < _loc3_.length)
    {
        var _loc1_ = lib.util.ExtString.split(_loc3_[_loc2_],"\t");
        _loc1_.unshift(mainId);
        submeunStorage.push(_loc1_);
        createSubMenu(_loc6_,_loc5_,mainId,_loc1_);
        _loc2_ = _loc2_ + 1;
    }
};
var submeunStorage2 = [];
myListener.OnGame_MainMenu_SetSecondSubMenu = function(mainId, subId, submenus)
{
    var _loc7_ = container_mc["subContainer_" + mainId]["menu_" + subId];
    _loc7_.gotoAndStop(2);
    _loc7_.bg._alpha = 0;
    var _loc6_ = _loc7_._x + _loc7_._width - 20;
    var _loc5_ = _loc7_._y;
    var _loc3_ = lib.util.ExtString.split(submenus,"\n");
    var _loc2_ = 0;
    while(_loc2_ < _loc3_.length)
    {
        var _loc1_ = lib.util.ExtString.split(_loc3_[_loc2_],"\t");
        _loc1_.unshift(subId);
        _loc1_.unshift(mainId);
        submeunStorage2.push(_loc1_);
        createSubMenu2(container_mc["subContainer_" + mainId],_loc6_,_loc5_,_loc1_);
        _loc2_ = _loc2_ + 1;
    }
};
myListener.OnGame_MainMenu_UpDateSub = function(id, submenus)
{
    var _loc4_ = findMenu(id);
    var _loc5_ = "";
    var _loc1_ = lib.util.ExtString.split(submenus,"\t");
    var _loc7_ = submeunStorage.length;
    var _loc3_ = 0;
    while(_loc3_ < _loc7_)
    {
        if(id == submeunStorage[_loc3_][1])
        {
            _loc1_.unshift(id);
            _loc1_.unshift(_loc4_.mid);
            submeunStorage[_loc3_] = _loc1_;
            if(_loc1_[3] != undefined && _loc1_[3] != "")
            {
                _loc5_ = "(" + _loc1_[3] + ")";
            }
            _loc4_.txt.setText(_loc1_[2] + _loc5_);
            return undefined;
        }
        _loc3_ = _loc3_ + 1;
    }
    l2 = submeunStorage2.length;
    var _loc2_ = 0;
    while(_loc2_ < l2)
    {
        if(id == submeunStorage2[_loc2_][2])
        {
            _loc1_.unshift(id);
            _loc1_.unshift(_loc4_.sid);
            _loc1_.unshift(_loc4_.mid);
            submeunStorage2[_loc2_] = _loc1_;
            if(_loc1_[4] != undefined && _loc1_[4] != "")
            {
                _loc5_ = "(" + _loc1_[4] + ")";
            }
            _loc4_.txt.setText(_loc1_[3] + _loc5_);
            return undefined;
        }
        _loc2_ = _loc2_ + 1;
    }
};
var SUBMEHIG = 42;
var SUBMENURM = 50;
var SUBMENUBM = -20;
var SUBCOROL = ["0xc8c8c8","0xffffff"];
myListener.OnGame_MainMenu_Disable = function(menuId, disable)
{
    var _loc1_ = findMenu(menuId);
    var _loc2_ = !Boolean(Number(disable));
    SetDisable(_loc1_,_loc2_);
};
myListener.OnGame_MainMenu_Tag = function(menuId, tag)
{
    var _loc3_ = findMenu(menuId);
    var _loc1_ = _loc3_["countMc" + menuId];
    if(tag == "0" || tag == undefined)
    {
        if(_loc1_)
        {
            _loc1_.removeMovieClip();
        }
        return undefined;
    }
    if(!_loc1_)
    {
        _loc1_ = _loc3_.attachMovie("countMc","countMc" + menuId,ICONDEPTH + 2);
        _loc1_._xscale = 120;
        _loc1_._yscale = 120;
    }
    _loc1_.txt.htmlText = tag;
    var _loc2_ = _loc1_.txt.textWidth + 12;
    if(_loc2_ < 17)
    {
        _loc2_ = 17;
    }
    _loc1_.txt._width = _loc2_;
    _loc1_.bg._width = _loc2_;
    if(_loc3_.iconMc)
    {
        _loc1_._x = 38 - _loc2_;
        _loc1_._y = -13;
    }
    else
    {
        _loc1_._x = 35 - _loc2_;
        _loc1_._y = 11;
    }
};
var prevEffect = null;
myListener.OnGame_MainMenu_Effect = function(menuId, sType)
{
    var _loc2_ = findMenu(menuId);
    var _loc1_ = _loc2_["effectMc" + menuId];
    if(_loc1_)
    {
        _loc1_.removeMovieClip();
    }
    if(sType == "0" || sType == undefined)
    {
        return undefined;
    }
    if(sType == "3")
    {
        _loc1_ = _loc2_.attachMovie("effect_3","effectMc" + menuId,ICONDEPTH + 10);
    }
    else if(sType == "2")
    {
        _loc1_ = _loc2_.attachMovie("effect_2","effectMc" + menuId,ICONDEPTH + 1);
    }
    else if(sType == "1")
    {
        _loc1_ = _loc2_.attachMovie("effect_1","effectMc" + menuId,ICONDEPTH + 1);
    }
    if(prevEffect)
    {
        prevEffect.gotoAndPlay(1);
    }
    prevEffect = _loc1_;
    _loc1_._x = 16;
    _loc1_._y = 18;
};
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
};
myListener.OnGame_ResetUIPosition = function()
{
    var _loc1_ = false;
    _loc1_ = subMenuPosition != "top";
    subMenuPosition = "top";
    if(_loc1_)
    {
        reverseTotal();
    }
};
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
    if(_UIName.toLowerCase() == UIname.toLowerCase())
    {
        checkAndResetUIPositionTransform();
        var _loc3_ = container_mc._x - 50;
        var _loc1_ = {x:_loc3_,y:0};
        UI.localToGlobal(_loc1_);
        var _loc2_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
        if(_loc1_.x < _loc2_)
        {
            UI._x = UI._x + (_loc2_ - _loc1_.x);
        }
    }
};
var keyTextFormat = new TextFormat("$NormalFont",12,14145495,false,false,false,null,null,"right",0,0,0,0);
initTimer();
myListener.OnGame_ChangeStageSize();
ToGame_MainMenu_Init();
