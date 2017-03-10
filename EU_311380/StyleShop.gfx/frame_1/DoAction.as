function setPostion()
{
    var _loc2_ = rightMc.productBox;
    var _loc3_ = 0;
    if(_loc2_.benefitMc)
    {
        _loc3_ = 98;
    }
    var _loc1_ = 0;
    while(_loc1_ < productLen)
    {
        _loc2_["slotMc" + _loc1_]._y = _loc3_ + _loc1_ * 98;
        _loc1_ = _loc1_ + 1;
    }
    scrollBar1.pageSize = _loc2_._height;
    scrollBar1.scroll = 0;
}
function ToGame_StyleShop_Init()
{
    fscommand("ToGame_StyleShop_Init");
}
function ToGame_StyleShop_Close()
{
    fscommand("ToGame_StyleShop_Close");
}
function ToGame_StyleShop_Coupon()
{
    fscommand("ToGame_StyleShop_Coupon");
}
function ToGame_StyleShop_ScreenShot()
{
    fscommand("ToGame_StyleShop_ScreenShot");
}
function ToGame_StyleShop_SlotAllClear()
{
    fscommand("ToGame_StyleShop_SlotAllClear");
}
function ToGame_StyleShop_CateGoryClick(idx)
{
    getURL("FSCommand:ToGame_StyleShop_CateGoryClick",idx);
}
function ToGame_StyleShop_ItemClick(id, type)
{
    getURL("FSCommand:ToGame_StyleShop_ItemClick",id + "\t" + type);
}
function ToGame_StyleShop_ProductClick(id, type)
{
    getURL("FSCommand:ToGame_StyleShop_ProductClick",id + "\t" + type);
}
function ToGame_StyleShop_SocialClick(id)
{
    getURL("FSCommand:ToGame_StyleShop_SocialClick",id);
}
function ToGame_StyleShop_SlotClick(id)
{
    getURL("FSCommand:ToGame_StyleShop_SlotClick",id);
}
function ToGame_StyleShop_FilterCheck(type)
{
    getURL("FSCommand:ToGame_StyleShop_FilterCheck",type);
}
function ToGame_StyleShop_Benefit()
{
    fscommand("ToGame_StyleShop_Benefit");
}
function socialBtn(btnMc, disable)
{
    if(!disable)
    {
        btnMc.gotoAndStop(4);
        btnMc.onRollOver = btnMc.onRollOut = btnMc.onRelease = btnMc.onReleaseOutside = function()
        {
        };
        return undefined;
    }
    btnMc.gotoAndStop(1);
    btnMc.onRollOver = function()
    {
        this.gotoAndStop(2);
    };
    btnMc.onRollOut = btnMc.onReleaseOutside = function()
    {
        this.gotoAndStop(1);
    };
    btnMc.onPress = function()
    {
        this.gotoAndStop(3);
    };
    btnMc.onRelease = function()
    {
        this.gotoAndStop(1);
        socialMotion(this.moveNum);
    };
}
function socialMotion(num)
{
    socialBoxCount = socialBoxCount + num * 5;
    if(socialBoxCount <= 0)
    {
        socialBoxCount = 0;
        socialBtn(btmMc.preBtn,false);
        socialBtn(btmMc.nextBtn,true);
    }
    else if(socialBoxCount >= socialBoxMax)
    {
        socialBoxCount = socialBoxMax;
        socialBtn(btmMc.preBtn,true);
        socialBtn(btmMc.nextBtn,false);
    }
    else
    {
        socialBtn(btmMc.preBtn,true);
        socialBtn(btmMc.nextBtn,true);
    }
    var _loc1_ = socialBoxCount * -56 - 140;
    gs.TweenLite.killTweensOf(btmMc.socialBox);
    gs.TweenLite.to(btmMc.socialBox,0.3,{_x:_loc1_,ease:gs.easing.Strong.easeOut});
}
function listClear(pMc)
{
    for(var _loc2_ in pMc)
    {
        if(typeof pMc[_loc2_] == "movieclip")
        {
            pMc[_loc2_].removeMovieClip();
        }
    }
}
function hideEvent(bHide)
{
    _root.container_logout_mc._visible = !bHide;
    _root.container_mainmenu_mc._visible = !bHide;
    _root.container_question_mc._visible = !bHide;
    _root.container_villager_mc._visible = !bHide;
    _root.container_battleUp_mc._visible = !bHide;
    _root.container_normal_mc._visible = !bHide;
    _root.container_battle_mc._visible = !bHide;
    _root.container_overlayMap_mc._visible = !bHide;
    _root.container_chat_mc._visible = !bHide;
    _root.container_inGameMovie_mc._visible = !bHide;
}
var UI = this;
UI._visible = false;
var UIname = "StyleShop";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
goldMc.bg.hitTestDisable = true;
goldMc.closeBtn.txt.setText("$500067");
var close_Btn = new lib.util.TxtBtn(goldMc.closeBtn.btn,goldMc.closeBtn.txt);
close_Btn.setRelease(ToGame_StyleShop_Close);
goldMc.couponBtn.txt.setText("$500068");
var Coupon_Btn = new lib.util.TxtBtn(goldMc.couponBtn.btn,goldMc.couponBtn.txt);
Coupon_Btn.setRelease(ToGame_StyleShop_Coupon);
var CAMERA_TOOLTIP = lib.util.UIString.getUIString("$500081");
var camera_btn = new lib.util.TxtBtn(btmMc.cameraBtn);
camera_btn.setRelease(ToGame_StyleShop_ScreenShot);
lib.manager.ToolTip.add(btmMc.cameraBtn,CAMERA_TOOLTIP,1);
var clear_btn = new lib.util.TxtBtn(paperDollMc.clearBtn);
clear_btn.setRelease(ToGame_StyleShop_SlotAllClear);
var cateTooltip = ["$500069","$500070","$500071","$500072","$500073","$500074","$500075","$500076","$500077"];
goldMc.coin0._visible = false;
goldMc.coin1._visible = false;
goldMc.coin2._visible = false;
goldMc.tag._visible = false;
goldMc.coin0.txt0.textAutoSize = "shrink";
goldMc.coin1.txt0.textAutoSize = "shrink";
goldMc.coin2.txt0.textAutoSize = "shrink";
var cateLen = 9;
var cateFocus = 0;
var cateChange = true;
leftMc.cate0.gotoAndStop(3);
var k = 0;
while(k < 8)
{
    var mc = paperDollMc["slot" + k];
    mc.clear();
    lib.manager.ToolTip.remove(mc);
    k++;
}
var i = 0;
while(i < cateLen)
{
    var cateBtn = leftMc["cate" + i];
    var frameNum = i * 3 + 1;
    cateBtn.idx = i;
    cateBtn.nor = frameNum;
    cateBtn.ove = frameNum + 1;
    cateBtn.pre = frameNum + 2;
    cateBtn.scrollSave = 0;
    cateBtn.gotoAndStop(frameNum);
    lib.manager.ToolTip.add(cateBtn.hit,cateTooltip[i],1);
    cateBtn.onRelease = function()
    {
        var _loc2_ = this.idx;
        if(cateFocus == _loc2_)
        {
            return undefined;
        }
        var _loc3_ = leftMc["cate" + cateFocus];
        _loc3_.gotoAndStop(_loc3_.nor);
        _loc3_.scrollSave = scrollBar0.scroll;
        cateFocus = _loc2_;
        cateChange = true;
        this.gotoAndStop(this.pre);
        ToGame_StyleShop_CateGoryClick(_loc2_);
    };
    cateBtn.onRollOver = function()
    {
        if(cateFocus == this.idx)
        {
            return undefined;
        }
        this.gotoAndStop(this.ove);
    };
    cateBtn.onRollOut = menuMc.onReleaseOutside = function()
    {
        if(cateFocus == this.idx)
        {
            return undefined;
        }
        this.gotoAndStop(this.nor);
    };
    i++;
}
var listY0 = leftMc.itemBox._y;
var scrollBar0 = leftMc.scroll0;
scrollBar0.addListener(leftMc.itemBox);
leftMc.itemBox.onScroll = function()
{
    fscommand("ToGame_StyleShop_ScrollLock");
    leftMc.itemBox._y = listY0 - arguments[0];
};
scrollBar0.setWheel(leftMc.maskMc);
scrollBar0.wheelDelta = 1;
scrollBar0.pageSize = 0;
scrollBar0.displaySize = leftMc.maskMc._height;
scrollBar0.defaultBarSizeRatio = 0.3333333333333333;
scrollBar0.rowHeight = 64;
scrollBar0.scroll = 0;
var listY1 = rightMc.productBox._y;
var scrollBar1 = rightMc.scroll1;
scrollBar1.addListener(rightMc.productBox);
rightMc.productBox.onScroll = function()
{
    fscommand("ToGame_StyleShop_ScrollLock");
    rightMc.productBox._y = listY1 - arguments[0];
};
scrollBar1.setWheel(rightMc.maskMc);
scrollBar1.wheelDelta = 1;
scrollBar1.pageSize = 0;
scrollBar1.displaySize = rightMc.maskMc._height;
scrollBar1.defaultBarSizeRatio = 0.3333333333333333;
scrollBar1.rowHeight = 64;
scrollBar1.scroll = 0;
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
    if(_WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = _bShow;
        if(_global.gbUIMode && bWindowOpen)
        {
            UI._visible = true;
            hideEvent(true);
        }
        else
        {
            UI._visible = false;
            hideEvent(false);
        }
    }
};
myListener.OnGame_ChangeStageSize = function()
{
    var _loc2_ = lib.info.AlignInfo.xRatioToPixel(100);
    var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
    var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
    goldMc._x = _loc2_;
    goldMc._y = _loc3_;
    paperDollMc._x = 0;
    paperDollMc._y = _loc3_;
    rightMc._x = _loc2_;
    rightMc._y = _loc1_ - 500;
    leftMc._y = _loc1_ - 500;
    btmMc._y = _loc1_;
    btmMc._x = _loc2_ / 2;
};
myListener.OnGame_StyleShop_CouponTag = function(count)
{
    if(count > 0)
    {
        goldMc.tag.txt.text = count;
        goldMc.tag._visible = true;
    }
    else
    {
        goldMc.tag._visible = false;
    }
};
myListener.OnGame_StyleShop_Point = function(gold, tcat, repute, goldType)
{
    var _loc1_ = 130;
    if(gold != undefined && gold != "")
    {
        goldMc.coin0._visible = true;
        goldMc.coin0.txt1.htmlText = gold;
        goldMc.coin0._y = _loc1_;
        _loc1_ = _loc1_ + 40;
        goldMc.coin0.gotoAndStop(Number(goldType) + 1);
    }
    if(tcat != undefined && tcat != "")
    {
        goldMc.coin1._visible = true;
        goldMc.coin1.txt1.htmlText = tcat;
        goldMc.coin1._y = _loc1_;
        _loc1_ = _loc1_ + 40;
    }
    if(repute != undefined && repute != "")
    {
        goldMc.coin2._visible = true;
        goldMc.coin2.txt1.htmlText = repute;
        goldMc.coin2._y = _loc1_;
        _loc1_ = _loc1_ + 40;
    }
};
myListener.OnGame_StyleShop_CategoryFocus = function(idx)
{
    var _loc1_ = leftMc["cate" + cateFocus];
    var _loc2_ = leftMc["cate" + idx];
    _loc1_.scrollSave = scrollBar0.scroll;
    _loc1_.gotoAndStop(_loc1_.nor);
    _loc2_.gotoAndStop(_loc2_.pre);
    cateFocus = idx;
};
myListener.OnGame_StyleShop_SetPaperDoll = function(index)
{
    paperDollMc.gotoAndStop(Number(index) + 1);
};
myListener.OnGame_StyleShop_PaperDollSlot = function(index, dataList)
{
    var _loc1_ = paperDollMc["slot" + index];
    _loc1_.clear();
    lib.manager.ToolTip.remove(_loc1_);
    if(dataList == "-1")
    {
        return undefined;
    }
    var _loc2_ = lib.util.ExtString.split(dataList,"\t");
    _loc1_.id = _loc2_[0];
    _loc1_.clickEvent = true;
    lib.manager.ToolTip.add(_loc1_,_loc2_[0] + "\t0",6);
    lib.display.DrawBitmapData.draw(_loc1_,_loc2_[1],0,0,0,0,42,42,0.65625);
};
myListener.OnGame_StyleShop_ItemListUpDate = function(id, dataList)
{
    var _loc4_ = leftMc.itemBox;
    for(var _loc7_ in _loc4_)
    {
        var _loc1_ = _loc4_[_loc7_];
        if(typeof _loc1_ == "movieclip")
        {
            if(_loc1_.id == id)
            {
                var _loc2_ = lib.util.ExtString.split(dataList,"\t");
                var _loc3_ = Boolean(Number(_loc2_[0]));
                _loc1_.checkMode = _loc3_;
                if(_loc3_)
                {
                    _loc1_.gotoAndStop(3);
                }
                if(_loc2_[1] == "1")
                {
                    _loc1_.disable._visible = false;
                }
                else
                {
                    _loc1_.disable._visible = true;
                }
            }
        }
    }
};
myListener.OnGame_StyleShop_ItemList = function(dataList)
{
    var _loc6_ = leftMc.itemBox;
    listClear(_loc6_);
    var _loc7_ = lib.util.ExtString.split(dataList,"\n");
    var _loc8_ = _loc7_.length;
    var _loc3_ = 0;
    while(_loc3_ < _loc8_)
    {
        var _loc4_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
        var _loc2_ = _loc6_.attachMovie("slotMc","slotMc" + _loc3_,_loc6_.getNextHighestDepth());
        _loc2_.id = _loc4_[0];
        _loc2_.clickEvent = true;
        lib.manager.ToolTip.add(_loc2_,_loc2_.id + "\t0",6);
        lib.display.DrawBitmapData.draw(_loc2_.img,_loc4_[1],0,0,0,0,48,48,0.75);
        lib.display.DrawBitmapData.draw(_loc2_.img,_loc4_[2],0,0,0,0,36,36,0.5625);
        _loc2_._x = _loc3_ % 5 * 55 + 2;
        _loc2_._y = int(_loc3_ / 5) * 55 + 2;
        var _loc5_ = Boolean(Number(_loc4_[3]));
        _loc2_.checkMode = _loc5_;
        if(_loc5_)
        {
            _loc2_.gotoAndStop(3);
        }
        else
        {
            _loc2_.gotoAndStop(1);
        }
        if(_loc4_[4] == "1")
        {
            _loc2_.disable._visible = false;
        }
        _loc2_.onRelease = function()
        {
            if(this.disable._visible)
            {
                return undefined;
            }
            if(this.checkMode)
            {
                this.checkMode = false;
                this.gotoAndStop(1);
            }
            else
            {
                this.checkMode = true;
                this.gotoAndStop(3);
            }
            ToGame_StyleShop_ItemClick(this.id,this.checkMode);
        };
        _loc2_.onRollOver = function()
        {
            if(this.disable._visible)
            {
                return undefined;
            }
            if(this.checkMode)
            {
                return undefined;
            }
            this.gotoAndStop(2);
        };
        _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
        {
            if(this.disable._visible)
            {
                return undefined;
            }
            if(this.checkMode)
            {
                return undefined;
            }
            this.gotoAndStop(1);
        };
        _loc3_ = _loc3_ + 1;
    }
    if(cateChange)
    {
        var _loc9_ = leftMc["cate" + cateFocus];
        scrollBar0.pageSize = _loc6_._height;
        cateChange = false;
        scrollBar0.scroll = _loc9_.scrollSave;
    }
};
var BENEFIT_BTN_STR = lib.util.UIString.getUIString("$500115");
var btnTxt = ["$500078","$500079","$500114"];
var productLen = 0;
myListener.OnGame_StyleShop_ProductList = function(dataList)
{
    var _loc7_ = rightMc.productBox;
    listClear(_loc7_);
    var _loc8_ = lib.util.ExtString.split(dataList,"\n");
    productLen = _loc8_.length;
    var _loc5_ = 0;
    while(_loc5_ < productLen)
    {
        var _loc4_ = lib.util.ExtString.split(_loc8_[_loc5_],"\t");
        var _loc2_ = _loc7_.attachMovie("slotMc2","slotMc" + _loc5_,_loc7_.getNextHighestDepth());
        _loc2_.id = _loc4_[0];
        _loc2_.itemType = _loc4_[6];
        _loc2_._y = _loc5_ * 98;
        lib.display.DrawBitmapData.draw(_loc2_.img,_loc4_[1],0,0,0,0,48,48,0.75);
        if(_loc4_[2])
        {
            lib.display.DrawBitmapData.draw(_loc2_.img,_loc4_[2],0,0,0,0,36,36,0.5625);
        }
        lib.manager.ToolTip.add(_loc2_,_loc2_.id + "\t0",6);
        _loc2_.nameTxt.htmlText = _loc4_[3];
        _loc2_.priceTxt.htmlText = _loc4_[4];
        var _loc3_ = _loc2_.btn.btn;
        _loc2_.btn.txt.text = btnTxt[Number(_loc2_.itemType)];
        if(_loc4_[5] == "1")
        {
            _loc2_.disable._visible = false;
            _loc3_.onPress = function()
            {
                this.gotoAndStop(3);
            };
            _loc3_.onRelease = function()
            {
                this.gotoAndStop(1);
                var _loc2_ = this._parent._parent;
                ToGame_StyleShop_ProductClick(_loc2_.id,_loc2_.itemType);
            };
            _loc3_.onRollOver = function()
            {
                this.gotoAndStop(2);
            };
            _loc3_.onRollOut = _loc3_.onReleaseOutside = function()
            {
                this.gotoAndStop(1);
            };
        }
        else
        {
            _loc2_.disable._visible = true;
            _loc3_.onPress = _loc3_.onRelease = _loc3_.onRollOver = _loc3_.onRollOut = _loc3_.onReleaseOutside = function()
            {
            };
        }
        _loc5_ = _loc5_ + 1;
    }
    scrollBar1.pageSize = _loc2_._height;
    scrollBar1.scroll = 0;
};
myListener.OnGame_StyleShop_Benefit = function(bool, str, type, tooltip)
{
    var _loc1_ = rightMc.benefitMc;
    if(bool == "0")
    {
        _loc1_._visible = false;
        return undefined;
    }
    _loc1_._visible = true;
    var _loc2_ = new lib.util.TxtBtn(_loc1_.btn,_loc1_.txt);
    _loc2_.setRelease(ToGame_StyleShop_Benefit);
    _loc2_.setTextColor("0xcccccc","0xffffff","0xcccccc","0x999999");
    _loc1_.txt.text = BENEFIT_BTN_STR;
    if(str != undefined && str != "")
    {
    }
    if(tooltip != undefined && tooltip != "")
    {
        lib.manager.ToolTip.add(_loc1_.txt,tooltip,1);
    }
    else
    {
        lib.manager.ToolTip.remove(_loc1_.btn);
    }
    _loc2_.setEnabled(Boolean(Number(type)));
};
rightMc.benefitMc._visible = false;
myListener.OnGame_StyleShop_ProductMode = function(bool)
{
    var _loc1_ = Boolean(Number(bool));
    rightMc.productBg._visible = _loc1_;
    rightMc.productBtn._visible = _loc1_;
    rightMc.scroll1._visible = _loc1_;
    rightMc.tcatTxt0._visible = _loc1_;
    rightMc.tcatTxt1._visible = _loc1_;
    rightMc.productBox._visible = _loc1_;
};
var socialFocus = null;
myListener.OnGame_StyleShop_SocialList = function(dataList)
{
    var _loc6_ = btmMc.socialBox;
    listClear(_loc6_);
    var _loc8_ = lib.util.ExtString.split(dataList,"\n");
    var _loc7_ = _loc8_.length;
    socialBoxMax = _loc7_ - 5;
    if(_loc7_ > 5)
    {
        socialBtn(btmMc.nextBtn,true);
    }
    var _loc3_ = 0;
    while(_loc3_ < _loc7_)
    {
        var _loc4_ = lib.util.ExtString.split(_loc8_[_loc3_],"\t");
        var _loc2_ = _loc6_.attachMovie("slotMc3","slotMc" + _loc3_,_loc6_.getNextHighestDepth());
        _loc2_.id = _loc4_[0];
        _loc2_.idx = _loc3_;
        lib.manager.ToolTip.add(_loc2_.SLOT,_loc4_[3],1);
        lib.display.DrawBitmapData.draw(_loc2_.img,_loc4_[1],0,0,0,0,52,52,0.8125);
        _loc2_._x = _loc3_ * 56;
        var _loc5_ = _loc4_[2];
        if(_loc5_ == 1)
        {
            btmMc.socialBox["slotMc" + socialFocus].gotoAndStop(1);
            socialFocus = _loc3_;
            _loc2_.gotoAndStop(3);
        }
        if(_loc5_ == -1)
        {
            _loc2_.disable._visible = true;
        }
        else
        {
            _loc2_.disable._visible = false;
        }
        _loc2_.onRelease = function()
        {
            if(this.disable._visible)
            {
                return undefined;
            }
            if(socialFocus == this.idx)
            {
                socialFocus = null;
                this.gotoAndStop(1);
            }
            else
            {
                btmMc.socialBox["slotMc" + socialFocus].gotoAndStop(1);
                socialFocus = this.idx;
                this.gotoAndStop(3);
            }
            ToGame_StyleShop_SocialClick(this.id);
        };
        _loc2_.onRollOver = function()
        {
            if(this.disable._visible)
            {
                return undefined;
            }
            if(socialFocus == this.idx)
            {
                this.gotoAndStop(3);
            }
            else
            {
                this.gotoAndStop(2);
            }
        };
        _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
        {
            if(this.disable._visible)
            {
                return undefined;
            }
            if(socialFocus == this.idx)
            {
                this.gotoAndStop(3);
            }
            else
            {
                this.gotoAndStop(1);
            }
        };
        _loc3_ = _loc3_ + 1;
    }
};
var disableMode = false;
myListener.OnGame_StyleShop_Disable = function(mode)
{
    disableMode = Boolean(Number(mode));
    _root.setDisableUI(paperDollMc,disableMode);
    _root.setDisableUI(goldMc,disableMode);
    _root.setDisableUI(rightMc,disableMode);
    _root.setDisableUI(leftMc,disableMode);
    _root.setDisableUI(btmMc,disableMode);
};
myListener.OnGame_StyleShop_FilterCheck = function(mode)
{
    btmMc.checkBox.checked = Boolean(Number(mode));
};
var socialBoxCount = 0;
var socialBoxMax = 5;
btmMc.preBtn.moveNum = -1;
btmMc.nextBtn.moveNum = 1;
socialBtn(btmMc.preBtn,false);
socialBtn(btmMc.nextBtn,false);
myListener.OnGame_MouseDown = function(button, target)
{
    if(disableMode)
    {
        return undefined;
    }
    if(button == 2 && target._name == "SLOT")
    {
        var _loc1_ = target._parent;
        if(_loc1_.id != undefined && _loc1_.clickEvent)
        {
            if(_loc1_.checkMode == undefined)
            {
                ToGame_StyleShop_SlotClick(_loc1_.id);
            }
            else if(_loc1_.checkMode == true)
            {
                _loc1_.checkMode = false;
                _loc1_.gotoAndStop(1);
                ToGame_StyleShop_ItemClick(_loc1_.id,_loc1_.checkMode);
            }
            else
            {
                _loc1_.checkMode = true;
                _loc1_.gotoAndStop(3);
                ToGame_StyleShop_ItemClick(_loc1_.id,_loc1_.checkMode);
            }
        }
    }
};
btmMc.checkBox.onChanged = function(checked)
{
    ToGame_StyleShop_FilterCheck(Number(checked));
};
myListener.OnGame_ChangeStageSize();
ToGame_StyleShop_Init();
myListener.OnGame_StyleShop_CategoryFocus(0);
