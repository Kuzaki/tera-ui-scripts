function ToGame_TargetInfo_ChangeLock(bLock)
{
    getURL("FSCommand:ToGame_TargetInfo_ChangeLock",bLock);
}
function showHp(bTrue)
{
    container_mc.Hp_Bar._visible = bTrue;
    container_mc.text_Hp_left._visible = bTrue;
    container_mc.text_Hp_right._visible = bTrue;
    container_mc.slash1._visible = bTrue;
    container_mc.hpPercent_txt._visible = bTrue;
}
function showMp(bTrue)
{
    container_mc.Mp_Bar._visible = bTrue;
    container_mc.text_Mp_left._visible = bTrue;
    container_mc.text_Mp_right._visible = bTrue;
    container_mc.slash2._visible = bTrue;
    container_mc.mpPercent_txt._visible = bTrue;
}
function showSt(bTrue)
{
    container_mc.St_Bar._visible = bTrue;
    container_mc.text_St_left._visible = bTrue;
    container_mc.text_St_right._visible = bTrue;
    container_mc.slash3._visible = bTrue;
    container_mc.stPercent_txt._visible = bTrue;
}
function closing(rightNow)
{
    popUp_mc.cnt = 0;
    if(rightNow)
    {
        fade(container_mc,0,0.1);
        delete this.onEnterFrame;
    }
    else
    {
        popUp_mc.onEnterFrame = function()
        {
            popUp_mc.cnt++;
            if(popUp_mc.cnt > 24)
            {
                fade(popUp_mc,0,0.5,function()
                {
                    popUp_mc._visible = false;
                }
                );
                delete this.onEnterFrame;
            }
        };
    }
}
function resetClosing()
{
    delete popUp_mc.onEnterFrame;
    fade(popUp_mc,100,0.2);
}
function fade(target, opacity, time, finishFunction)
{
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,time,{_alpha:opacity,onComplete:finishFunction});
}
function ToGame_TargetInfo_SelectMenu(id)
{
    getURL("FSCommand:ToGame_TargetInfo_SelectMenu",id);
    trace("ToGame_TargetInfo_SelectMenu: " + id);
}
function TargetInfo_UpdateClass()
{
    if(class_st == true)
    {
        showSt(1);
    }
    else
    {
        showSt(0);
    }
}
function searchBuff(id, type, remove)
{
    var _loc1_ = container_mc;
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
function align()
{
    var _loc1_ = container_mc;
    var _loc5_ = new Array();
    var _loc12_ = new Array();
    var _loc7_ = new Array();
    var _loc10_ = new Array();
    var _loc2_ = 0;
    while(_loc2_ < _loc1_.buff_array.length)
    {
        if(_loc1_.buff_array[_loc2_].bRelaxMerit)
        {
            _loc10_.push(_loc1_.buff_array[_loc2_]);
        }
        else
        {
            _loc7_.push(_loc1_.buff_array[_loc2_]);
        }
        _loc2_ = _loc2_ + 1;
    }
    _loc12_ = _loc7_.concat(_loc10_);
    var _loc13_ = new Array();
    var _loc9_ = new Array();
    var _loc8_ = new Array();
    _loc2_ = 0;
    while(_loc2_ < _loc1_.debuff_array.length)
    {
        if(_loc1_.debuff_array[_loc2_].bRelaxMerit)
        {
            _loc8_.push(_loc1_.debuff_array[_loc2_]);
        }
        else
        {
            _loc9_.push(_loc1_.debuff_array[_loc2_]);
        }
        _loc2_ = _loc2_ + 1;
    }
    _loc13_ = _loc9_.concat(_loc8_);
    var _loc14_ = _loc12_.length - 1;
    _loc5_ = _loc12_.concat(_loc13_);
    var _loc11_ = _loc5_.length;
    var _loc6_ = 1;
    var _loc3_ = 0;
    _loc2_ = 0;
    while(_loc2_ < _loc11_)
    {
        var _loc4_ = _loc3_ * (buffGap + buffWidth);
        _loc5_[_loc2_]._x = _loc4_;
        _loc5_[_loc2_]._y = _loc6_ * (buffGap + 60) - (buffGap + 60);
        _loc3_ = _loc3_ + 1;
        if(_loc3_ == maxNumInOneLine)
        {
            _loc6_ = _loc6_ + 1;
            _loc3_ = 0;
        }
        _loc2_ = _loc2_ + 1;
    }
}
function ToGame_TargetInfo_CloseUI()
{
    fscommand("ToGame_TargetInfo_CloseUI");
    trace("ToGame_TargetInfo_CloseUI");
}
function ToGame_TargetInfo_CallMenu()
{
    fscommand("ToGame_TargetInfo_CallMenu");
    trace("ToGame_TargetInfo_CallMenu");
}
function ToGame_TargetInfo_RequestQuest()
{
    fscommand("ToGame_TargetInfo_RequestQuest");
    lib.Debuger.trace("ToGame_TargetInfo_RequestQuest");
}
var UI = this;
UI._visible = false;
var UIname = "TargetInfo";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
lib.util.ExtString.textCut(container_mc.partyMon_mc.partyMon_txt,lib.util.UIString.getUIString("$005002"),1);
var bWindowOpen = true;
showHp(0);
showMp(0);
showSt(0);
container_mc.class_mc._visible = false;
container_mc.partyMon_mc._visible = false;
container_mc.firstAttack_mc._visible = false;
container_mc.level_txt._visible = false;
container_mc.freeNamed_mc._visible = false;
container_mc.freeNamedIcon_mc._visible = false;
container_mc.darkIcon_mc._visible = false;
container_mc.itemLevel_mc._visible = false;
container_mc.itemLevel_txt._visible = false;
var itemLevelStartX = container_mc.itemLevel_txt._x + container_mc.itemLevel_txt._width;
container_mc.Stack_Bar._visible = false;
popUp_mc._visible = false;
var LVSTR = lib.util.UIString.getUIString("$021010");
var Y_freeNamedIcon = 44.4;
var Y_freeNamedIconOnly = 9.8;
var class_name = "";
container_mc.name_txt.textAutoSize = "shrink";
lib.manager.ToolTip.add(container_mc.targetLock_mc,lib.util.UIString.getUIString("$342002"),1);
lib.manager.ToolTip.add(container_mc.x_mc,lib.util.UIString.getUIString("$342003"),1);
lib.manager.ToolTip.add(container_mc.partyMon_mc,lib.util.UIString.getUIString("$342004"),1);
lib.manager.ToolTip.add(container_mc.freeNamedIcon_mc,lib.util.UIString.getUIString("$342006"),1);
lib.manager.ToolTip.add(container_mc.darkIcon_mc,lib.util.UIString.getUIString("$342007"),1);
lib.manager.ToolTip.add(container_mc.firstAttack_mc,lib.util.UIString.getUIString("$342005"),1);
var aniSpeed = 15;
var bg_height = 0;
var class_name_Array = "";
var class_st = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGame_TargetInfo_LockTarget = function(bLock)
{
    bLock = Number(bLock);
    container_mc.targetLock_mc.gotoAndStop(bLock + 1);
    if(bLock)
    {
        lib.manager.ToolTip.add(container_mc.targetLock_mc,lib.util.UIString.getUIString("$342002"),1);
    }
    else
    {
        lib.manager.ToolTip.add(container_mc.targetLock_mc,lib.util.UIString.getUIString("$342001"),1);
    }
};
container_mc.targetLock_mc.onRelease = function()
{
    if(this._currentframe == 1)
    {
        this.gotoAndStop(2);
        ToGame_TargetInfo_ChangeLock(1);
        lib.manager.ToolTip.add(container_mc.targetLock_mc,lib.util.UIString.getUIString("$342002"),1);
    }
    else if(this._currentframe == 2)
    {
        this.gotoAndStop(1);
        ToGame_TargetInfo_ChangeLock(0);
        lib.manager.ToolTip.add(container_mc.targetLock_mc,lib.util.UIString.getUIString("$342001"),1);
    }
    this.mc.gotoAndStop(2);
};
container_mc.targetLock_mc.onRollOver = function()
{
    this.mc.gotoAndStop(2);
};
container_mc.targetLock_mc.onRollOut = container_mc.targetLock_mc.onReleaseOutside = function()
{
    this.mc.gotoAndStop(1);
};
container_mc.targetLock_mc.onPress = function()
{
    lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
    this.mc.gotoAndStop(3);
};
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
    if(WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = Number(bShow);
        UI._visible = bShow;
        if(_global.gbUIMode)
        {
            container_mc.targetLock_mc._visible = true;
            x_btn.setVisible(true);
        }
        else
        {
            container_mc.targetLock_mc._visible = false;
            x_btn.setVisible(false);
        }
    }
};
myListener.OnGameEventChangeUIMode = function()
{
    if(_global.gbUIMode)
    {
        container_mc.targetLock_mc._visible = true;
        x_btn.setVisible(true);
    }
    else
    {
        container_mc.targetLock_mc._visible = false;
        x_btn.setVisible(false);
    }
};
myListener.OnGame_MouseDown = function(button, target)
{
    var target_hit = eval(target);
    if(button == 2 && target_hit && target_hit._name == "box")
    {
        if(target_hit._parent._parent._parent.UIname == "TargetInfo")
        {
            popUp_mc._x = UI._xmouse;
            popUp_mc._y = UI._ymouse;
            ToGame_TargetInfo_CallMenu();
        }
    }
};
var lineH = 50;
var lineW = 220;
myListener.OnGame_TargetInfo_OpenMenu = function(dataList)
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
            _loc2_.txt.textAutoSize = "shrink";
            _loc2_.index = _loc3_;
            _loc2_.hit.onRollOver = function()
            {
                delete popUp_mc.onEnterFrame;
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
                if(popUp_mc._visible)
                {
                    resetClosing();
                }
            };
            _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
                closing();
            };
            _loc2_.hit.onPress = function()
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            };
            _loc2_.hit.onRelease = function()
            {
                ToGame_TargetInfo_SelectMenu(this._parent.index);
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
                popUp_mc._visible = false;
            };
            _loc3_ = _loc3_ + 1;
        }
        popUp_mc.bg._height = _loc4_.length * lineH;
        closing();
    }
    else
    {
        delete popUp_mc.onEnterFrame;
    }
    popUp_mc._visible = true;
};
var targetTypeNum = null;
myListener.OnGame_TargetInfo_SetData = function(targetType, targetInfo, nameColorInfo, bFreeNamed, bFirstAttackMonster, questType, questName, itemLevel, ClassData)
{
    targetType = Number(targetType);
    bFreeNamed = Number(bFreeNamed);
    bFirstAttackMonster = Number(bFirstAttackMonster);
    targetTypeNum = targetType;
    var _loc10_ = "0xffffff";
    if(nameColorInfo != undefined && nameColorInfo != "")
    {
        var _loc9_ = nameColorInfo.split("\t");
        var _loc6_ = Number(_loc9_[0]).toString(16);
        if(_loc6_.length < 2)
        {
            _loc6_ = "0" + _loc6_;
        }
        var _loc7_ = Number(_loc9_[1]).toString(16);
        if(_loc7_.length < 2)
        {
            _loc7_ = "0" + _loc7_;
        }
        var _loc5_ = Number(_loc9_[2]).toString(16);
        if(_loc5_.length < 2)
        {
            _loc5_ = "0" + _loc5_;
        }
        _loc10_ = "0x" + _loc6_ + _loc7_ + _loc5_;
    }
    if(targetType != -1)
    {
        showHp(0);
        showMp(0);
        showSt(0);
        container_mc.class_mc._visible = false;
        container_mc.partyMon_mc._visible = false;
        container_mc.darkIcon_mc._visible = false;
        container_mc.firstAttack_mc._visible = false;
        container_mc.level_txt._visible = false;
        container_mc.freeNamed_mc._visible = false;
        container_mc.freeNamedIcon_mc._visible = false;
        container_mc.darkIcon_mc._visible = false;
        if(targetType != 1 && targetType != 5)
        {
            container_mc.level_txt._visible = true;
        }
        lib.Debuger.trace("targetInfo : " + targetInfo);
        var _loc2_ = targetInfo.split("\t");
        class_name = _loc2_[2];
        class_name_Array = ClassData.split("\t");
        class_st = false;
        var _loc1_ = 0;
        while(_loc1_ < class_name_Array.length)
        {
            if(class_name_Array[_loc1_] == class_name)
            {
                class_st = true;
            }
            _loc1_ = _loc1_ + 1;
        }
        if(targetType == 0)
        {
            showHp(1);
            showMp(1);
            TargetInfo_UpdateClass();
            container_mc.name_txt.text = _loc2_[0];
            container_mc.level_txt.text = LVSTR + " " + _loc2_[1];
            container_mc.class_mc._visible = true;
            container_mc.class_mc.gotoAndStop(Number(_loc2_[2]) + 1);
        }
        else if(targetType == 1)
        {
            showHp(1);
            showMp(0);
            showSt(0);
            container_mc.name_txt.text = _loc2_[0];
        }
        else if(targetType == 2)
        {
            showHp(1);
            showMp(1);
            TargetInfo_UpdateClass();
            container_mc.name_txt.text = _loc2_[0];
            container_mc.level_txt.text = LVSTR + " " + _loc2_[1];
            container_mc.class_mc._visible = true;
            container_mc.class_mc.gotoAndStop(Number(_loc2_[2]) + 1);
        }
        else if(targetType == 3)
        {
            showHp(1);
            showMp(0);
            showSt(0);
            container_mc.name_txt.text = _loc2_[0];
            container_mc.level_txt.text = LVSTR + " " + _loc2_[1];
        }
        else if(targetType == 4)
        {
            showHp(1);
            showMp(0);
            showSt(0);
            container_mc.name_txt.text = _loc2_[0];
            container_mc.level_txt.text = LVSTR + " " + _loc2_[1];
            container_mc.partyMon_mc._visible = true;
        }
        else if(targetType == 5)
        {
            showHp(0);
            showMp(0);
            showSt(0);
            container_mc.name_txt.text = _loc2_[0];
        }
        else if(targetType == 6)
        {
            showHp(1);
            showMp(0);
            showSt(0);
            container_mc.name_txt.text = _loc2_[0];
            container_mc.level_txt.text = LVSTR + " " + _loc2_[1];
            container_mc.darkIcon_mc._visible = true;
        }
        if(bFreeNamed == 1)
        {
            container_mc.freeNamed_mc._visible = true;
            container_mc.freeNamedIcon_mc._visible = true;
            container_mc.bg_mc._visible = false;
            if(targetType == 4)
            {
                container_mc.freeNamedIcon_mc._y = Y_freeNamedIcon;
            }
            else
            {
                container_mc.freeNamedIcon_mc._y = Y_freeNamedIconOnly;
            }
        }
        else
        {
            container_mc.freeNamed_mc._visible = false;
            container_mc.freeNamedIcon_mc._visible = false;
            container_mc.bg_mc._visible = true;
        }
        if(bFirstAttackMonster)
        {
            container_mc.firstAttack_mc._visible = true;
        }
        else
        {
            container_mc.firstAttack_mc._visible = false;
        }
        container_mc.name_txt.textColor = _loc10_;
        if(questType != undefined && questType != "")
        {
            container_mc.quest_mc._visible = true;
            container_mc.quest_txt._visible = true;
            container_mc.quest_mc.gotoAndStop(Number(questType) + 1);
            var _loc15_ = "<a href=\'asfunction:_parent.ToGame_TargetInfo_RequestQuest\'>" + questName + "</a>";
            container_mc.quest_txt.setText(_loc15_);
            if(Number(questType) == 0 || Number(questType) % 10 == 0)
            {
                container_mc.quest_txt.textColor = lib.info.TextColor.UI_QUESTINFO_NAME;
            }
            if(Number(questType) == 1 || Number(questType) % 10 == 1)
            {
                container_mc.quest_txt.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_MISSION;
            }
            if(Number(questType) == 2 || Number(questType) % 10 == 2)
            {
                container_mc.quest_txt.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_GUILD;
            }
            if(Number(questType) == 3 || Number(questType) % 10 == 3)
            {
                container_mc.quest_txt.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_DAILYQUEST;
            }
            if(Number(questType) == 4 || Number(questType) % 10 == 4)
            {
                container_mc.quest_txt.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_UNIONQUEST;
            }
        }
        else
        {
            container_mc.quest_mc._visible = false;
            container_mc.quest_txt._visible = false;
        }
        var _loc8_ = itemLevel != undefined && itemLevel != "";
        container_mc.itemLevel_mc._visible = _loc8_;
        container_mc.itemLevel_txt._visible = _loc8_;
        if(_loc8_)
        {
            container_mc.itemLevel_txt.text = itemLevel;
            container_mc.itemLevel_txt._width = container_mc.itemLevel_txt.textWidth + 3;
            container_mc.itemLevel_txt._x = itemLevelStartX - container_mc.itemLevel_txt._width;
            container_mc.itemLevel_mc._x = container_mc.itemLevel_txt._x - container_mc.itemLevel_mc._width + 2;
            container_mc.firstAttack_mc._x = container_mc.itemLevel_mc._x - container_mc.firstAttack_mc._width;
            lib.manager.ToolTip.add(container_mc.itemLevel_mc,lib.util.UIString.getUIString("$221071") + " " + itemLevel,1);
        }
        else
        {
            container_mc.firstAttack_mc._x = itemLevelStartX - container_mc.firstAttack_mc._width;
        }
    }
};
myListener.OnGame_TargetInfo_UpdateLevel = function(value)
{
    container_mc.level_txt.text = LVSTR + " " + value;
};
myListener.OnGame_TargetInfo_UpdateHP = function(hp)
{
    hp = Number(hp);
    container_mc.Hp_Bar.Hp_Bar1._xscale = hp;
    if(hp < 0)
    {
        container_mc.Hp_Bar.Hp_Bar1._xscale = 0;
    }
    else if(hp >= 100)
    {
        container_mc.Hp_Bar.Hp_Bar1._xscale = 100;
    }
    container_mc.hpPercent_txt.text = hp + " %";
    if(container_mc.bg_mc._currentframe == 1 || container_mc.frame_mc._currentframe == 1)
    {
        container_mc.buff_container._y = 89.9;
    }
    else if(container_mc.bg_mc._currentframe == 2 || container_mc.frame_mc._currentframe == 2)
    {
        container_mc.buff_container._y = 103.9;
    }
    else if(container_mc.bg_mc._currentframe == 3 || container_mc.frame_mc._currentframe == 3)
    {
        container_mc.buff_container._y = 115.9;
    }
};
myListener.OnGame_TargetInfo_UpdateMP = function(mp)
{
    mp = Number(mp);
    container_mc.Mp_Bar.Mp_Bar1._xscale = mp;
    if(mp < 0)
    {
        container_mc.Mp_Bar.Mp_Bar1._xscale = 0;
    }
    else if(mp >= 100)
    {
        container_mc.Mp_Bar.Mp_Bar1._xscale = 100;
    }
    container_mc.mpPercent_txt.text = mp + " %";
};
myListener.OnGame_TargetInfo_UpdateST = function(st)
{
    st = Number(st);
    container_mc.St_Bar.St_Bar1._xscale = st;
    if(st < 0)
    {
        container_mc.St_Bar.St_Bar1._xscale = 0;
    }
    else if(st >= 100)
    {
        container_mc.St_Bar.St_Bar1._xscale = 100;
    }
    container_mc.stPercent_txt.text = st + " %";
    if(container_mc.Hp_Bar._visible == true && container_mc.Mp_Bar._visible == true && container_mc.St_Bar._visible == true)
    {
        container_mc.freeNamed_mc.gotoAndStop(3);
        container_mc.bg_mc.gotoAndStop(3);
        container_mc.Stack_Bar._y = container_mc.St_Bar._y + container_mc.St_Bar._height;
    }
    else if(container_mc.Hp_Bar._visible == true && container_mc.Mp_Bar._visible == true)
    {
        container_mc.freeNamed_mc.gotoAndStop(2);
        container_mc.bg_mc.gotoAndStop(2);
        container_mc.Stack_Bar._y = container_mc.Mp_Bar._y + container_mc.Mp_Bar._height / 2;
    }
    else if(container_mc.Hp_Bar._visible == true)
    {
        container_mc.freeNamed_mc.gotoAndStop(1);
        container_mc.bg_mc.gotoAndStop(1);
        container_mc.Stack_Bar._y = container_mc.Hp_Bar._y + container_mc.Hp_Bar._height;
    }
    if(container_mc.bg_mc._currentframe == 1 || container_mc.frame_mc._currentframe == 1)
    {
        container_mc.buff_container._y = 89.9;
    }
    else if(container_mc.bg_mc._currentframe == 2 || container_mc.frame_mc._currentframe == 2)
    {
        container_mc.buff_container._y = 103.9;
    }
    else if(container_mc.bg_mc._currentframe == 3 || container_mc.frame_mc._currentframe == 3)
    {
        container_mc.buff_container._y = 115.9;
    }
};
myListener.OnGame_TargetInfo_UpdateStack = function(flag, StacBar, StackNum, switchs, StackMin)
{
    if(flag == "1")
    {
        container_mc.Stack_Bar._visible = true;
    }
    else
    {
        container_mc.Stack_Bar._visible = false;
    }
    if(switchs == "1")
    {
        container_mc.Stack_Bar.gotoAndStop(1);
    }
    else
    {
        container_mc.Stack_Bar.gotoAndPlay(2);
    }
    if(container_mc.Hp_Bar._visible == true && container_mc.Mp_Bar._visible == true && container_mc.St_Bar._visible == true)
    {
        container_mc.freeNamed_mc.gotoAndStop(3);
        container_mc.bg_mc.gotoAndStop(3);
        container_mc.Stack_Bar._y = container_mc.St_Bar._y + container_mc.St_Bar._height;
    }
    else if(container_mc.Hp_Bar._visible == true && container_mc.Mp_Bar._visible == true)
    {
        container_mc.freeNamed_mc.gotoAndStop(2);
        container_mc.bg_mc.gotoAndStop(2);
        container_mc.Stack_Bar._y = container_mc.Mp_Bar._y + container_mc.Mp_Bar._height / 2;
    }
    else if(container_mc.Hp_Bar._visible == true)
    {
        container_mc.freeNamed_mc.gotoAndStop(1);
        container_mc.bg_mc.gotoAndStop(1);
        container_mc.Stack_Bar._y = container_mc.Hp_Bar._y + container_mc.Hp_Bar._height;
    }
    container_mc.Stack_Bar.Stack_Bar.gage_stack_mask._width = StacBar / 100 * 137;
    if(StackMin == 0)
    {
        var _loc1_ = 0;
        while(_loc1_ < 10)
        {
            container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_1._visible = false;
            if(StacBar / 100 == 1)
            {
                container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_2._visible = false;
                container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_3._visible = true;
            }
            else
            {
                container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_2._visible = true;
                container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_3._visible = false;
            }
            _loc1_ = _loc1_ + 1;
        }
    }
    else
    {
        _loc1_ = 0;
        while(_loc1_ < 10)
        {
            container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_1._visible = true;
            container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_2._visible = false;
            container_mc.Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_3._visible = false;
            _loc1_ = _loc1_ + 1;
        }
    }
    lib.Debuger.trace("container_mc.Stack_Bar.Stack_Bar.gage_stack_mask._width : " + container_mc.Stack_Bar.Stack_Bar.gage_stack_mask._width);
    container_mc.Stack_Bar.Stack_Bar.txt.text = StackNum;
    if(StacBar / 100 == 1)
    {
        container_mc.Stack_Bar.Stack_Bar.gage_stack_bg._alpha = 100;
    }
    else
    {
        container_mc.Stack_Bar.Stack_Bar.gage_stack_bg._alpha = 0;
    }
    if(container_mc.bg_mc._currentframe == 1 || container_mc.frame_mc._currentframe == 1)
    {
        container_mc.buff_container._y = 89.9;
    }
    else if(container_mc.bg_mc._currentframe == 2 || container_mc.frame_mc._currentframe == 2)
    {
        container_mc.buff_container._y = 103.9;
    }
    else if(container_mc.bg_mc._currentframe == 3 || container_mc.frame_mc._currentframe == 3)
    {
        container_mc.buff_container._y = 115.9;
    }
};
var buffGap = 3;
var buffWidth = 30;
var i = 0;
while(i < 1)
{
    var mc = container_mc;
    mc.buff_array = new Array();
    mc.debuff_array = new Array();
    mc.merit_array = new Array();
    mc.buff_array.cnt = 0;
    mc.debuff_array.cnt = 0;
    mc.merit_array.cnt = 0;
    i++;
}
var cnt = 0;
myListener.OnGame_TargetInfo_AddBuff = function(id, stackCnt, type, bRelaxMerit, img, remain, total)
{
    cnt++;
    type = Number(type);
    remain = Math.abs(Number(remain));
    total = Math.abs(Number(total));
    stackCnt = Number(stackCnt);
    bRelaxMerit = Number(bRelaxMerit);
    var _loc5_ = container_mc;
    var _loc11_ = null;
    var _loc7_ = null;
    var _loc12_ = null;
    var _loc3_ = null;
    if(type == 0)
    {
        _loc11_ = _loc5_.buff_container;
        _loc3_ = _loc5_.buff_array;
        _loc12_ = _loc3_.length;
        _loc7_ = "buff_";
    }
    else
    {
        _loc11_ = _loc5_.buff_container;
        _loc3_ = _loc5_.debuff_array;
        _loc12_ = _loc3_.length;
        _loc7_ = "debuff_";
    }
    var _loc16_ = searchBuff(id,type);
    if(_loc16_ == null)
    {
        var _loc13_ = "Slot_link";
        var maked = _loc11_.attachMovie(_loc13_,_loc7_ + id,cnt);
        if(type == 0)
        {
            maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
            maked.frame_mc.gotoAndStop(1);
        }
        else if(type == 1)
        {
            maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF;
            maked.frame_mc.gotoAndStop(1);
        }
        else if(type == 2)
        {
            maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_WEAK;
            maked.frame_mc.gotoAndStop(3);
        }
        else if(type == 3)
        {
            maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_TICK;
            maked.frame_mc.gotoAndStop(4);
        }
        else if(type == 4)
        {
            maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_STUN;
            maked.frame_mc.gotoAndStop(5);
        }
        maked.warn = false;
        if(stackCnt > 1 || stackCnt < 0)
        {
            maked.stack.text = stackCnt;
            if(stackCnt < 0)
            {
                maked.stack.textColor = 13369345;
            }
            else
            {
                maked.stack.textColor = 16777215;
            }
        }
        else
        {
            maked.stack.text = "";
        }
        _loc3_.push(maked);
        _loc3_.cnt++;
        if(bRelaxMerit != 1)
        {
            if(total == 0)
            {
                maked.cool.remove();
                delete maked.cool;
                maked.Count._visible = false;
                maked.CoolTime._visible = false;
                delete maked.timer.onEnterFrame;
            }
            else
            {
                maked.CoolTime._visible = true;
                maked.Count._visible = true;
                maked.cool = new lib.util.CoolTime(remain,total);
                if(remain <= 0)
                {
                    maked.cool.remove();
                    delete maked.cool;
                    myListener.OnGame_TargetInfo_RemoveBuff(id);
                }
                else
                {
                    maked.cool.onTick = function()
                    {
                        maked.Count.txt.text = this.getCountText();
                        if(this.getSecond() <= 3 && maked.warn == false)
                        {
                            lib.util.Warning.add(maked);
                            maked.warn = true;
                        }
                        lib.util.CoolTime.draw(maked.CoolTime,28,28,this.getDgree(),0,45,true);
                    };
                    maked.cool.onFinished = function()
                    {
                        delete maked.cool;
                        myListener.OnGame_TargetInfo_RemoveBuff(id);
                    };
                }
            }
        }
        else
        {
            maked.remain = remain;
            maked.total = total;
            disableTrans = lib.info.ColorTrans.disableTrans();
            var _loc15_ = new flash.geom.Transform(maked.Icon);
            _loc15_.colorTransform = disableTrans;
        }
        maked.id = id;
        maked.type = type;
        maked.bRelaxMerit = bRelaxMerit;
        maked.img = img;
        maked.draw(img,28,28);
        maked.drag = false;
        maked.effect = false;
        maked.Count._alpha = 100;
        maked.Count.txt.textAutoSize = "fit";
        if(bRelaxMerit)
        {
            var _loc17_ = img.substring(19,img.length);
            lib.manager.ToolTip.add(maked.SLOT,_loc17_,5,maked.Icon);
        }
        else
        {
            var _loc14_ = img.substring(20,img.length);
            lib.manager.ToolTip.add(maked.SLOT,_loc14_,4,maked.Icon);
        }
    }
    align();
    if(container_mc.bg_mc._currentframe == 1 || container_mc.frame_mc._currentframe == 1)
    {
        container_mc.buff_container._y = 89.9;
    }
    else if(container_mc.bg_mc._currentframe == 2 || container_mc.frame_mc._currentframe == 2)
    {
        container_mc.buff_container._y = 103.9;
    }
    else if(container_mc.bg_mc._currentframe == 3 || container_mc.frame_mc._currentframe == 3)
    {
        container_mc.buff_container._y = 115.9;
    }
};
myListener.OnGame_TargetInfo_UpdateBuff = function(id, stackCnt, useRelaxMerit, img, remain, total)
{
    remain = Number(remain);
    total = Number(total);
    stackCnt = Number(stackCnt);
    useRelaxMerit = Number(useRelaxMerit);
    var searched = searchBuff(id);
    if(img != undefined && img != "null" && img != "")
    {
        if(searched.TEX != img)
        {
            searched.draw(img,28,28);
        }
    }
    if(stackCnt > 1 || stackCnt < 0)
    {
        searched.stack.text = stackCnt;
        if(stackCnt < 0)
        {
            searched.stack.textColor = 13369345;
        }
        else
        {
            searched.stack.textColor = 16777215;
        }
    }
    else
    {
        searched.stack.text = "";
    }
    if(searched.bRelaxMerit == 1 && useRelaxMerit != undefined && useRelaxMerit != "")
    {
        if(!useRelaxMerit)
        {
            searched.cool.remove();
            delete searched.cool;
            searched.Count._alpha = 0;
            disableTrans = lib.info.ColorTrans.disableTrans();
            var _loc7_ = new flash.geom.Transform(searched.Icon);
            _loc7_.colorTransform = disableTrans;
        }
        else
        {
            searched.Count._alpha = 100;
            enableTrans = lib.info.ColorTrans.enableTrans();
            _loc7_ = new flash.geom.Transform(searched.Icon);
            _loc7_.colorTransform = enableTrans;
            if(isNaN(remain))
            {
                remain = searched.remain;
            }
            if(isNaN(total))
            {
                total = searched.total;
            }
        }
    }
    if(searched.bRelaxMerit == 1 && !useRelaxMerit)
    {
        return undefined;
    }
    if(total == 0)
    {
        lib.util.Warning.remove(searched);
        searched.warn = false;
        searched.cool.remove();
        delete searched.cool;
        searched.Count._visible = false;
        searched.CoolTime._visible = false;
        delete searched.timer.onEnterFrame;
        return undefined;
    }
    searched.Count._visible = true;
    searched.CoolTime._visible = true;
    if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
    {
        searched.cool.remove();
        delete searched.cool;
        searched.cool = new lib.util.CoolTime(remain,total);
        searched.cool.reverse = true;
        lib.util.Warning.remove(searched,true);
        searched._alpha = 100;
        searched.warn = false;
        if(remain <= 0)
        {
            searched.cool.remove();
            delete searched.cool;
            myListener.OnGame_TargetInfo_RemoveBuff(id);
        }
        else
        {
            searched.cool.onTick = function()
            {
                searched.Count.txt.text = this.getCountText();
                if(this.getSecond() <= 3 && searched.warn == false)
                {
                    lib.util.Warning.add(searched);
                    searched.warn = true;
                }
                lib.util.CoolTime.draw(searched.CoolTime,28,28,this.getDgree(),0,45,true);
            };
            searched.cool.onFinished = function()
            {
                delete searched.cool;
                myListener.OnGame_TargetInfo_RemoveBuff(id);
            };
        }
    }
};
myListener.OnGame_TargetInfo_RemoveBuff = function(id)
{
    var _loc2_ = container_mc;
    var _loc1_ = searchBuff(id,null,1);
    var _loc4_ = undefined;
    var _loc3_ = _loc1_.type;
    if(_loc3_ == 0)
    {
        _loc4_ = _loc2_.buff_array;
    }
    else if(_loc3_ >= 1)
    {
        _loc4_ = _loc2_.debuff_array;
    }
    lib.util.Warning.remove(_loc1_);
    _loc1_.cool.remove();
    removeMovieClip(_loc1_);
    align();
};
myListener.OnGame_TargetInfo_ClearBuff = function(type)
{
    var _loc4_ = container_mc;
    type = Number(type);
    if(isNaN(type))
    {
        var _loc2_ = _loc4_.buff_array.concat();
        var _loc3_ = _loc4_.debuff_array.concat();
        var _loc1_ = 0;
        while(_loc1_ < _loc2_.length)
        {
            myListener.OnGame_TargetInfo_RemoveBuff(_loc2_[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
        _loc1_ = 0;
        while(_loc1_ < _loc3_.length)
        {
            myListener.OnGame_TargetInfo_RemoveBuff(_loc3_[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
        return undefined;
    }
    var _loc6_ = undefined;
    if(type == 0)
    {
        imsi_arrray = _loc4_.buff_array.concat();
        _loc1_ = 0;
        while(_loc1_ < imsi_arrray.length)
        {
            myListener.OnGame_TargetInfo_RemoveBuff(imsi_arrray[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
    }
    else if(type >= 1)
    {
        imsi_arrray = _loc4_.debuff_array.concat();
        _loc1_ = 0;
        while(_loc1_ < imsi_arrray.length)
        {
            myListener.OnGame_TargetInfo_RemoveBuff(imsi_arrray[_loc1_].id);
            _loc1_ = _loc1_ + 1;
        }
    }
};
myListener.OnGame_TargetInfo_HoldBuff = function(id)
{
    var _loc1_ = searchBuff(id);
    if(_loc1_ != null)
    {
        _loc1_.cool.remove();
        delete register1.cool;
    }
};
myListener.OnGameEvent_TargetInfo_EnableRelaxMerit = function(id, bEnable)
{
    var _loc5_ = container_mc;
    bEnable = Number(bEnable);
    var _loc1_ = searchBuff(id);
    if(bEnable)
    {
        _loc1_.Icon._visible = false;
        _loc1_.coolTimeMask._visible = true;
        enableTrans = lib.info.ColorTrans.enableTrans();
        var _loc3_ = new flash.geom.Transform(_loc1_.Icon);
        _loc3_.colorTransform = enableTrans;
        myListener.OnGame_TargetInfo_UpdateBuff(id,"",_loc1_.coolTime,_loc1_.coolTimeTotal);
    }
    else
    {
        delete _loc1_.timer.onEnterFrame;
        _loc1_.Icon._visible = true;
        _loc1_.coolTimeMask._visible = false;
        disableTrans = lib.info.ColorTrans.disableTrans();
        _loc3_ = new flash.geom.Transform(_loc1_.Icon);
        _loc3_.colorTransform = disableTrans;
    }
};
container_mc.quest_mc.onRelease = ToGame_TargetInfo_RequestQuest;
container_mc.quest_mc._visible = false;
container_mc.quest_txt._visible = false;
fscommand("ToGame_TargetInfo_Init");
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_TargetInfo_CloseUI);
