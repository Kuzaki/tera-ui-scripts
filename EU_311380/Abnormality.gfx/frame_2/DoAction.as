function searchBuff(id)
{
    if(isNaN(type))
    {
        var _loc3_ = buffList.getIterator();
        while(_loc3_.hasNext())
        {
            var _loc2_ = _loc3_.next();
            if(_loc2_.id == id)
            {
                return _loc2_;
            }
        }
        _loc3_ = debuffList.getIterator();
        while(_loc3_.hasNext())
        {
            _loc2_ = _loc3_.next();
            if(_loc2_.id == id)
            {
                return _loc2_;
            }
        }
        return null;
    }
    if(type == 0)
    {
        _loc3_ = buffList.getIterator();
        while(_loc3_.hasNext())
        {
            _loc2_ = _loc3_.next();
            if(_loc2_.id == id)
            {
                return _loc2_;
            }
        }
        return null;
    }
    if(type >= 1)
    {
        _loc3_ = debuffList.getIterator();
        while(_loc3_.hasNext())
        {
            _loc2_ = _loc3_.next();
            if(_loc2_.id == id)
            {
                return _loc2_;
            }
        }
        return null;
    }
}
function resetContainerPos()
{
    if(alignType == 0 || alignType == 1)
    {
        container_mc.abnormality_debuff._x = container_mc.abnormality._x;
        container_mc.abnormality_debuff._y = container_mc.abnormality._y + buffWidth + buffVerticalGap;
    }
    else if(alignType == 2 || alignType == 3)
    {
        container_mc.abnormality_debuff._x = container_mc.abnormality._x + buffWidth + buffVerticalGap;
        container_mc.abnormality_debuff._y = container_mc.abnormality._y;
    }
    resetRetainPos();
}
function alignTypeHandler(value)
{
    if(value != null)
    {
        alignType = value;
        resetContainerPos();
        if(value == 0)
        {
            buffList.xGap = buffGap;
            debuffList.xGap = buffGap;
            RetainList.xGap = buffGap;
            buffList.setAlignDirection("L");
            debuffList.setAlignDirection("L");
            RetainList.setAlignDirection("L");
        }
        else if(value == 1)
        {
            buffList.xGap = buffGap;
            debuffList.xGap = buffGap;
            RetainList.xGap = buffGap;
            buffList.setAlignDirection("R");
            debuffa.setAlignDirection("R");
            RetainList.setAlignDirection("R");
        }
        else if(value == 2)
        {
            buffList.yGap = buffVerticalGap;
            debuffList.yGap = buffVerticalGap;
            RetainList.yGap = buffVerticalGap;
            buffList.setAlignDirection("T");
            debuffList.setAlignDirection("T");
            RetainList.setAlignDirection("T");
        }
        else if(value == 3)
        {
            buffList.yGap = buffVerticalGap;
            debuffList.yGap = buffVerticalGap;
            RetainList.yGap = buffVerticalGap;
            buffList.setAlignDirection("B");
            debuffList.setAlignDirection("B");
            RetainList.setAlignDirection("B");
        }
    }
}
function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE)
    {
        alignTypeHandler(event.value);
    }
}
function searchRetainBuff(id)
{
    var _loc2_ = RetainList.getIterator();
    while(_loc2_.hasNext())
    {
        var _loc1_ = _loc2_.next();
        if(_loc1_.id == id)
        {
            return _loc1_;
        }
    }
    return null;
}
function resetRetainPos()
{
    switch(Number(alignType))
    {
        case 0:
            container_mc.abnormality_retain._x = - container_mc.abnormality._x + (buffWidth + buffGap) * buffList.length;
            container_mc.abnormality_retain._y = container_mc.abnormality._y;
            break;
        case 1:
            container_mc.abnormality_retain._x = container_mc.abnormality._x + (buffWidth + buffGap) * buffList.length;
            container_mc.abnormality_retain._y = container_mc.abnormality._y;
            break;
        case 2:
            container_mc.abnormality_retain._x = container_mc.abnormality._x;
            container_mc.abnormality_retain._y = - container_mc.abnormality._y + (buffWidth + buffVerticalGap) * buffList.length;
            break;
        case 3:
            container_mc.abnormality_retain._x = container_mc.abnormality._x;
            container_mc.abnormality_retain._y = container_mc.abnormality._y + (buffWidth + buffVerticalGap) * buffList.length;
    }
}
var UI = this;
UI._visible = false;
var UIname = "Abnormality";
var bWindowOpen = true;
container_mc.UIDrager._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var alignType = 0;
var buffGap = 12;
var buffWidth = 40;
var buffVerticalGap = 26;
var buffList = new lib.util.List(container_mc.abnormality,"buff_");
var debuffList = new lib.util.List(container_mc.abnormality_debuff,"debuff_");
var RetainList = new lib.util.List(container_mc.abnormality_retain,"retain_");
buffList.setAlignDirection("L");
buffList.setAddAlign(false);
buffList.xGap = buffGap;
buffList.yGap = buffGap;
buffList.columnWidth = buffWidth;
buffList.rowHeight = buffWidth;
debuffList.setAlignDirection("L");
debuffList.setAddAlign(false);
debuffList.xGap = buffGap;
debuffList.yGap = buffGap;
debuffList.columnWidth = buffWidth;
debuffList.rowHeight = buffWidth;
RetainList.setAlignDirection("L");
RetainList.setAddAlign(false);
RetainList.xGap = buffGap;
RetainList.yGap = buffGap;
RetainList.columnWidth = buffWidth;
RetainList.rowHeight = buffWidth;
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
    if(_global.gbUIMode)
    {
        if(array.length >= 1)
        {
            container_mc.UIDrager._visible = true;
        }
    }
    else
    {
        container_mc.UIDrager._visible = false;
    }
};
myListener.OnGame_Abnormality_AddBuff = function(id, stackCnt, type, bRelaxMerit, img, remain, total)
{
    type = Number(type);
    remain = Math.abs(Number(remain));
    total = Math.abs(Number(total));
    stackCnt = Number(stackCnt);
    bRelaxMerit = Number(bRelaxMerit);
    var _loc18_ = null;
    var _loc15_ = null;
    var _loc16_ = null;
    var _loc17_ = null;
    if(type == 0)
    {
        list = buffList;
    }
    else
    {
        list = debuffList;
    }
    var _loc12_ = searchBuff(id);
    if(_loc12_ == null)
    {
        var maked = list.add(id,"Slot_link");
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
        if(bRelaxMerit != 1)
        {
            if(total == 0)
            {
                maked.Count._visible = false;
                maked.CoolTime._visible = false;
            }
            else
            {
                maked.CoolTime._visible = true;
                maked.Count._visible = true;
                maked.cool = new lib.util.CoolTime(remain,total);
                var _loc9_ = random(1000000);
                maked.cool.tempCount = _loc9_;
                if(remain <= 0)
                {
                    maked.cool.remove();
                    delete maked.cool;
                    myListener.OnGame_Abnormality_RemoveBuff(id);
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
                        lib.util.CoolTime.draw(maked.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
                    };
                    maked.cool.onFinished = function()
                    {
                        delete maked.cool;
                        myListener.OnGame_Abnormality_RemoveBuff(id);
                    };
                }
            }
        }
        else
        {
            maked.remain = remain;
            maked.total = total;
            disableTrans = lib.info.ColorTrans.disableTrans();
            var _loc11_ = new flash.geom.Transform(maked.Icon);
            _loc11_.colorTransform = disableTrans;
        }
        maked.id = id;
        maked._xscale = maked._yscale = 75;
        maked.type = type;
        maked.bRelaxMerit = bRelaxMerit;
        maked.img = img;
        maked.draw(img,58.7,58.7);
        maked.drag = false;
        maked.effect = false;
        maked.Count._alpha = 100;
        maked.Count.txt.textAutoSize = "fit";
        if(bRelaxMerit)
        {
            var _loc14_ = img.substring(19,img.length);
            lib.manager.ToolTip.add(maked.SLOT,_loc14_,5,maked.Icon);
        }
        else
        {
            var _loc10_ = img.substring(20,img.length);
            lib.manager.ToolTip.add(maked.SLOT,_loc10_,4,maked.Icon);
        }
        maked.onUnload = function()
        {
            UI.stopDrag();
            lib.util.Warning.remove(this);
            this.cool.remove();
        };
        maked.onPress2 = function()
        {
            var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
            var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
            UI.startDrag(false,-10,_loc2_ - 15,Stage.width - 30,_loc1_ - 50);
        };
        maked.onRelease2 = function()
        {
            lib.info.AlignInfo.savePos(UI,true);
            UI.stopDrag();
        };
    }
    list.sortOn(["bRelaxMerit","type"],[Array.DESCENDING,Array.DESCENDING]);
    resetRetainPos();
};
myListener.OnGame_Abnormality_UpdateBuff = function(id, stackCnt, useRelaxMerit, img, remain, total)
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
            searched.draw(img,58.7,58.7);
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
            lib.util.Warning.remove(searched,true);
            searched.warn = false;
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
        lib.util.Warning.remove(searched,true);
        searched.warn = false;
        searched.cool.remove();
        delete searched.cool;
        searched.Count._visible = false;
        searched.CoolTime._visible = false;
        return undefined;
    }
    searched.Count._visible = true;
    searched.CoolTime._visible = true;
    if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
    {
        searched.cool.remove();
        delete searched.cool;
        lib.util.Warning.remove(searched,true);
        searched.warn = false;
        searched._alpha = 100;
        searched.cool = new lib.util.CoolTime(remain,total);
        searched.cool.reverse = true;
        searched.cool.onTick = function()
        {
            searched.Count.txt.text = this.getCountText();
            if(this.getSecond() <= 3 && searched.warn == false)
            {
                lib.util.Warning.add(searched);
                searched.warn = true;
            }
            lib.util.CoolTime.draw(searched.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
        };
        searched.cool.onFinished = function()
        {
            delete searched.cool;
            myListener.OnGame_Abnormality_RemoveBuff(id);
        };
    }
};
myListener.OnGame_Abnormality_RemoveBuff = function(id)
{
    var _loc4_ = true;
    var _loc1_ = undefined;
    var _loc2_ = false;
    _loc1_ = buffList.getItem(id);
    _loc1_.cool.remove();
    delete register1.cool;
    _loc2_ = buffList.remove(id);
    resetRetainPos();
    if(_loc2_ == false)
    {
        _loc1_ = debuffList.getItem(id);
        _loc1_.cool.remove();
        delete register1.cool;
        _loc2_ = debuffList.remove(id);
        _loc4_ = false;
    }
    resetRetainPos();
};
myListener.OnGame_Abnormality_ClearBuff = function(type)
{
    type = Number(type);
    if(isNaN(type))
    {
        buffList.clear();
        debuffList.clear();
        resetRetainPos();
        return undefined;
    }
    if(type == 0)
    {
        buffList.clear();
    }
    else if(type >= 1)
    {
        debuffList.clear();
    }
    resetRetainPos();
};
myListener.OnGame_abnormality_HoldBuff = function(id)
{
    var _loc1_ = searchBuff(id);
    if(_loc1_ != null)
    {
        _loc1_.cool.remove();
        delete register1.cool;
    }
};
myListener.OnGameEventEnableRelaxMeritIcon = function(id, bEnable)
{
    bEnable = Number(bEnable);
    var _loc1_ = searchBuff(id);
    if(bEnable)
    {
        _loc1_.Count._alpha = 100;
        enableTrans = lib.info.ColorTrans.enableTrans();
        var _loc3_ = new flash.geom.Transform(_loc1_.Icon);
        _loc3_.colorTransform = enableTrans;
        myListener.OnGame_Abnormality_UpdateBuff(id,"",_loc1_.remain,_loc1_.total);
    }
    else
    {
        _loc1_.cool.remove();
        delete register1.cool;
        _loc1_.Count._alpha = 0;
        disableTrans = lib.info.ColorTrans.disableTrans();
        _loc3_ = new flash.geom.Transform(_loc1_.Icon);
        _loc3_.colorTransform = disableTrans;
    }
};
myListener.OnGame_Abnormality_AddRetainBuff = function(id, index, stackCnt, bRelaxMerit, img, remain, total)
{
    remain = Math.abs(Number(remain));
    total = Math.abs(Number(total));
    stackCnt = Number(stackCnt);
    bRelaxMerit = Number(bRelaxMerit);
    var _loc12_ = searchRetainBuff(String(id + "_" + index));
    list = RetainList;
    if(_loc12_ == null)
    {
        var maked = RetainList.add(String(id + "_" + index),"Slot_link");
        maked.disable = true;
        maked.attachMovie("retainBg","bg",maked.getNextHighestDepth());
        maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
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
        if(bRelaxMerit != 1)
        {
            if(total == 0)
            {
                maked.Count._visible = false;
                maked.CoolTime._visible = false;
            }
            else
            {
                maked.CoolTime._visible = true;
                maked.Count._visible = true;
                maked.cool = new lib.util.CoolTime(remain,total);
                maked.cool.onTick = function()
                {
                    maked.Count.txt.text = this.getCountText();
                    lib.util.CoolTime.draw(maked.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
                    this.remove();
                    false;
                };
            }
        }
        else
        {
            maked.remain = remain;
            maked.total = total;
            disableTrans = lib.info.ColorTrans.disableTrans();
            var _loc10_ = new flash.geom.Transform(maked.Icon);
            _loc10_.colorTransform = disableTrans;
        }
        maked.id = String(id + "_" + index);
        maked._xscale = maked._yscale = 75;
        maked.bRelaxMerit = bRelaxMerit;
        maked.img = img;
        maked.draw(img,58.7,58.7);
        maked.drag = false;
        maked.effect = false;
        maked.Count._alpha = 100;
        maked.Count.txt.textAutoSize = "fit";
        if(bRelaxMerit)
        {
            var _loc14_ = img.substring(19,img.length);
            lib.manager.ToolTip.add(maked.SLOT,_loc14_,5,maked.Icon);
        }
        else
        {
            var _loc9_ = img.substring(20,img.length);
            lib.manager.ToolTip.add(maked.SLOT,_loc9_,4,maked.Icon);
        }
        maked.onUnload = function()
        {
            UI.stopDrag();
            lib.util.Warning.remove(this);
            this.cool.remove();
        };
        maked.onPress2 = function()
        {
            var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
            var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
            UI.startDrag(false,-10,_loc2_ - 15,Stage.width - 30,_loc1_ - 50);
        };
        maked.onRelease2 = function()
        {
            lib.info.AlignInfo.savePos(UI,true);
            UI.stopDrag();
        };
    }
    list.sortOn(["bRelaxMerit","type"],[Array.DESCENDING,Array.DESCENDING]);
    resetRetainPos();
};
myListener.OnGame_Abnormality_RemoveRetainBuff = function(id, index)
{
    var _loc1_ = RetainList.getItem(String(id + "_" + index));
    _loc1_.cool.remove();
    delete register1.cool;
    RetainList.remove(String(id + "_" + index));
    resetRetainPos();
};
myListener.OnGame_Abnormality_ClearRetainBuff = function()
{
    RetainList.clear();
    resetRetainPos();
};
resetContainerPos();
