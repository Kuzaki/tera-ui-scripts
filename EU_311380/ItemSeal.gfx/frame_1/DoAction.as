var UI = this;
UI._visible = false;
var UIname = "ItemSeal";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var checkIndex;
var ListTotal = 0;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_ItemSeal_CloseUI);
var n_btn = container_mc.newOption_btn.txtBtn;
n_btn.setRelease(ToGame_ItemSeal_RequestNewOption);
n_btn.setEnabled(false);
var o_btn = container_mc.optionGuide_btn.txtBtn;
o_btn.setRelease(ToGame_ItemSeal_OptionGuide);
o_btn.setEnabled(true);
var list_mcY = container_mc.list_mc._y;
var scrollbar0 = container_mc.scrollbar0;
scrollbar0.addListener(container_mc.list_mc);
container_mc.list_mc.onScroll = function()
{
    container_mc.list_mc._y = list_mcY - arguments[0];
};
scrollbar0.setWheel(container_mc.list_mc);
scrollbar0.wheelDelta = 1;
scrollbar0.pageSize = 0;
scrollbar0.displaySize = container_mc.mask_mc0._height;
scrollbar0.defaultBarSizeRatio = 0.3333333333333333;
scrollbar0.rowHeight = 30;
scrollbar0.scroll = 0;
var list1_mcY = container_mc.tipBox._y;
var scrollBar1 = container_mc.scrollbar1;
scrollBar1.addListener(container_mc.tipBox);
container_mc.tipBox.onScroll = function()
{
    container_mc.tipBox._y = list1_mcY - arguments[0];
};
scrollBar1.setWheel(container_mc.tipBox);
scrollBar1.wheelDelta = 1;
scrollBar1.displaySize = container_mc.mask_mc1._height;
scrollBar1.defaultBarSizeRatio = 0.3333333333333333;
scrollBar1.rowHeight = 30;
scrollBar1.scroll = 0;
container_mc.title_box.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.title_box.verticalAlign = "center";
container_mc.rowTxt0.textAutoSize = "shrink";
container_mc.rowTxt1.textAutoSize = "shrink";
container_mc.guideTxt.verticalAlign = "center";
container_mc.guideTxt.htmlText = lib.util.UIString.getUIString("$640008");
container_mc.topIcon.hitTestDisable = true;
container_mc.effect.hitTestDisable = true;
var BG_WIDTH = 461;
var BG_START_X = 5.5;
var tipMessage = lib.util.UIString.getUIString("$102217");
container_mc.tipBox.txt.htmlText = tipMessage;
var tiplan = container_mc.tipBox.txt.textHeight + 10;
container_mc.tipBox.hitBox._height = tiplan;
container_mc.tipBox.txt._height = tiplan;
function ToGame_ItemSeal_Init()
{
    fscommand("ToGame_ItemSeal_Init");
}
function ToGame_ItemSeal_CloseUI()
{
    fscommand("ToGame_ItemSeal_CloseUI");
}
function ToGame_ItemSeal_LockCheck(_index, _check)
{
    checkIndex = _index;
    getURL("FSCommand:ToGame_ItemSeal_LockCheck",_index + "\t" + _check);
}
function ToGame_ItemSeal_ReSealing()
{
    fscommand("ToGame_ItemSeal_ReSealing");
}
function ToGame_ItemSeal_RequestNewOption()
{
    fscommand("ToGame_ItemSeal_RequestNewOption");
}
function ToGame_ItemSeal_RequestResetOption()
{
    fscommand("ToGame_ItemSeal_RequestResetOption");
}
function ToGame_ItemSeal_OptionGuide()
{
    fscommand("ToGame_ItemSeal_OptionGuide");
}
function listReset(_lineMc)
{
    var _loc1_ = _lineMc;
    for(var _loc2_ in _loc1_)
    {
        if(typeof _loc1_[_loc2_] == "movieclip")
        {
            _loc1_[_loc2_].removeMovieClip();
        }
    }
}
if(tiplan <= 105)
{
    scrollBar1._visible = false;
}
else
{
    scrollBar1.pageSize = container_mc.tipBox._height;
}
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
    if(_WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = _bShow;
        if(_global.gbUIMode && bWindowOpen)
        {
            UI._visible = true;
        }
        else
        {
            UI._visible = false;
        }
    }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
    if(_global.gbUIMode && bWindowOpen)
    {
        UI._visible = true;
    }
    else
    {
        UI._visible = false;
    }
};
myListener.OnGame_ItemSeal_SetItemLevel = function(pLv, tLv, pExp, tExp)
{
    if(tLv > 0)
    {
        container_mc.txt0._visible = true;
        container_mc.txt1._visible = true;
        container_mc.gageMc._visible = true;
        var _loc1_ = int(pExp / tExp * 100);
        var _loc2_ = 72 * (_loc1_ / 100);
        container_mc.txt0.text = _loc1_ + "%";
        container_mc.txt1.htmlText = "Lv.<font size=\'14\' color=\'#0096ff\'>" + pLv + "</font>/" + tLv;
        container_mc.gageMc._width = _loc2_;
    }
    else
    {
        container_mc.txt0._visible = false;
        container_mc.txt1._visible = false;
        container_mc.gageMc._visible = false;
    }
};
myListener.OnGame_ItemSeal_SetTargetItemSlot = function(_dataList)
{
    var _loc2_ = lib.util.ExtString.split(_dataList,"\t");
    listReset(container_mc.itemListMc0);
    var _loc1_ = container_mc.itemListMc0.attachMovie("Slot_link","item0",container_mc.itemListMc0.getNextHighestDepth());
    _loc1_.index = _loc2_[0];
    _loc1_.draw(_loc2_[1]);
    _loc1_.SLOT.enabled = false;
    _loc1_.display = true;
    _loc1_.disable = Boolean(Number(_loc2_[3]));
    _loc1_.grade = _loc2_[4];
    _loc1_.sealType = _loc2_[5];
    _loc1_.masterpiece = _loc2_[6];
    container_mc.item_txt.setText(_loc2_[2]);
    if(_loc1_.grade == 0)
    {
        container_mc.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
    }
    else if(_loc1_.grade == 1)
    {
        container_mc.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
    }
    else if(_loc1_.grade == 2)
    {
        container_mc.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
    }
    else if(_loc1_.grade == 3)
    {
        container_mc.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
    }
    _loc1_.enchantFd.text = "";
    var _loc3_ = Number(_loc2_[7]);
    if(isNaN(_loc3_) == false && _loc3_ != -1 && _loc3_ != 0)
    {
        var _loc4_ = impossible <= 0?21433:3615811;
        if(_loc3_ > 11 && _loc3_ < 15)
        {
            _loc4_ = impossible <= 0?8915599:2299429;
        }
        else if(_loc3_ > 14)
        {
            _loc4_ = impossible <= 0?10624002:4074792;
        }
        container_mc.enchantFd.shadowColor = _loc4_;
        container_mc.enchantFd.textColor = impossible <= 0?14145495:7368816;
        container_mc.enchantFd.text = "+" + _loc3_;
    }
    _loc1_.disable != Boolean(Number(_loc2_[3]));
    lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
};
myListener.OnGame_ItemSeal_SetMaterialItemSlot = function(index, _dataList)
{
    var _loc4_ = Number(index) + 1;
    var _loc3_ = container_mc["itemListMc" + _loc4_];
    listReset(_loc3_);
    var _loc2_ = lib.util.ExtString.split(_dataList,"\t");
    var _loc1_ = _loc3_.attachMovie("Slot_link","item" + index,_loc3_.getNextHighestDepth());
    _loc1_.index = _loc2_[0];
    _loc1_.draw(_loc2_[1]);
    _loc1_.SLOT.enabled = false;
    _loc1_.display = true;
    _loc1_.disable = Boolean(Number(_loc2_[3]));
    _loc1_.grade = _loc2_[4];
    _loc1_.sealType = _loc2_[5];
    _loc1_.masterpiece = _loc2_[6];
    if(Number(_loc2_[2]))
    {
        _loc1_.num = _loc2_[2];
    }
    lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
};
myListener.OnGame_ItemSeal_SetFormulaItemSlot = function(_dataList)
{
    listReset(container_mc.itemListMc3);
    var _loc2_ = lib.util.ExtString.split(_dataList,"\t");
    var _loc1_ = container_mc.itemListMc3.attachMovie("Slot_link","item2",container_mc.itemListMc2.getNextHighestDepth());
    _loc1_.index = _loc2_[0];
    _loc1_.draw(_loc2_[1]);
    _loc1_.SLOT.enabled = false;
    _loc1_.display = true;
    _loc1_.disable = Boolean(Number(_loc2_[3]));
    _loc1_.grade = _loc2_[4];
    _loc1_.sealType = _loc2_[5];
    _loc1_.masterpiece = _loc2_[6];
    if(Number(_loc2_[2]))
    {
        _loc1_.num = _loc2_[2];
    }
    lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
};
myListener.OnGame_ItemSeal_SetList = function(_dataList)
{
    listReset(container_mc.list_mc);
    scrollbar0.pageSize = 0;
    scrollbar0.scroll = 0;
    var _loc10_ = lib.util.ExtString.split(_dataList,"\n");
    ListTotal = _loc10_.length;
    var _loc6_ = 0;
    var _loc9_ = 0;
    var _loc4_ = 0;
    while(_loc4_ < ListTotal)
    {
        var _loc3_ = lib.util.ExtString.split(_loc10_[_loc4_],"\t");
        var _loc5_ = Number(_loc3_[0]);
        var _loc2_ = undefined;
        if(_loc5_ == -1)
        {
            _loc2_ = container_mc.list_mc.attachMovie("Item_mc","item_Null",container_mc.list_mc.getNextHighestDepth());
            _loc2_._visible = false;
        }
        else
        {
            _loc2_ = container_mc.list_mc.attachMovie("Item_mc","item_" + _loc5_,container_mc.list_mc.getNextHighestDepth());
        }
        _loc2_.id = _loc5_;
        _loc2_._y = _loc6_;
        _loc2_.tc = Number(_loc3_[1]);
        _loc2_.ck = Boolean(Number(_loc3_[2]));
        _loc2_.tt = _loc3_[3];
        _loc2_.colorMode = _loc3_[5];
        _loc2_.checkTxt.htmlText = _loc3_[4];
        _loc9_ = _loc2_.checkTxt.textHeight;
        _loc2_.checkTxt._height = _loc9_ + 5;
        _loc6_ = _loc6_ + (_loc2_._height + 10);
        if(_loc4_ == 0)
        {
            var _loc8_ = container_mc.list_mc.attachMovie("cutLine","cutLine",container_mc.list_mc.getNextHighestDepth());
            _loc8_._y = _loc6_;
            _loc6_ = _loc6_ + 20;
        }
        _loc2_.onEnterFrame = function()
        {
            if(this.tc == 1)
            {
                if(this.colorMode == 1)
                {
                    this.checkTxt.textColor = 14397446;
                }
                else
                {
                    this.checkTxt.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
                }
            }
            else if(this.colorMode == 1)
            {
                this.checkTxt.textColor = 7035705;
            }
            else
            {
                this.checkTxt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            }
            var _index = this.id;
            this.checkBtn.checked = this.ck;
            this.checkBtn.onChanged = function(changed)
            {
                if(changed == true)
                {
                    ToGame_ItemSeal_LockCheck(_index,1);
                }
                else if(changed == false)
                {
                    ToGame_ItemSeal_LockCheck(_index,0);
                }
            };
            var _loc2_ = lib.util.UIString.getUIString("$102216","count",this.tt);
            if(this.ck)
            {
                lib.manager.ToolTip.remove(this.checkBtn,_loc2_,1);
            }
            else
            {
                lib.manager.ToolTip.add(this.checkBtn,_loc2_,1);
            }
            delete this.onEnterFrame;
        };
        _loc4_ = _loc4_ + 1;
    }
    scrollbar0.pageSize = container_mc.list_mc._height + 30;
};
myListener.OnGame_ItemSeal_SetBtnEnabled = function(_btnType, _bFlag, _sTooltip)
{
    _btnType = Number(_btnType);
    _bFlag = Number(_bFlag);
    var _loc1_ = s_btn;
    var _loc3_ = undefined;
    if(_btnType == 1)
    {
        _loc1_ = c_btn;
    }
    else if(_btnType == 2)
    {
        _loc1_ = n_btn;
        _loc3_ = container_mc.newOption_btn;
    }
    else if(_btnType == 3)
    {
        _loc1_ = r_btn;
    }
    else if(_btnType == 4)
    {
        _loc1_ = o_btn;
        _loc3_ = container_mc.optionGuide_btn;
    }
    _loc1_.setEnabled(_bFlag);
    if(_sTooltip)
    {
        lib.manager.ToolTip.add(_loc3_,_sTooltip,1);
    }
    else
    {
        lib.manager.ToolTip.remove(_loc3_);
    }
};
ToGame_ItemSeal_Init();
