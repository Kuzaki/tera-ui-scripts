class com.bluehole.tera.view.components.quickSlot.QuickSlotWindow extends com.bluehole.tera.view.components.quickSlot.BaseQuickSlot
{
    var sUIRotate = "DEFAULT";
    var NUM_SLOT = 27;
    var elementsPositionChanged = false;
    var tweenMove = false;
    function QuickSlotWindow()
    {
        super();
        this.UI.UIname = "ShortCut";
    }
    function toString()
    {
        return "[com.bluehole.tera.view.components.quickSlot.QuickSlotWindow " + this._name + "]";
    }
    function configUI()
    {
        this.pageUpBtn.__set__disableFocus(true);
        this.pageUpBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onPageHandler");
        this.pageDownBtn.__set__disableFocus(true);
        this.pageDownBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onPageHandler");
        this.extendShortcutBtn.__set__disableFocus(true);
        this.extendShortcutBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onExtendShortcutHandler");
        this.addShortcutBtn.__set__disableFocus(true);
        this.addShortcutBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onAddShortcutHandler");
        this.preShortcutBtn.__set__disableFocus(true);
        this.preShortcutBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onPremiumShortcutHandler");
        this.lockBtn.__set__disableFocus(true);
        this.lockBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onLockHandler");
        this.UI.listCtrl = this.listCtrl;
        this.listCtrl.__set__mode("small");
        this.listCtrl.addEventListener("modeChanged",this,"listCtrl_modeChangedHandler");
        this.listCtrl.addEventListener("itemPress",this,"listCtrl_itemPressHandler");
        this.listCtrl.addEventListener("itemClick",this,"listCtrl_itemClickHandler");
        this.shortCutListCtrl.addEventListener("itemPress",this,"shortCutListCtrl_itemPressHandler");
        this.shortCutListCtrl.addEventListener("itemClick",this,"shortCutListCtrl_itemClickHandler");
        this.registerTooltip(null);
        this.setTransform();
        super.configUI();
    }
    function draw()
    {
        super.draw();
        if(this.elementsPositionChanged)
        {
            this.elementsPositionChanged = false;
            this.extendShortcutBtn.__set__selected(this.listCtrl.__get__mode() == "big");
            this.reflowElements(this.sUIRotate);
        }
    }
    function checkDragArea(bool)
    {
        if(!bool)
        {
            delete this.onMouseMove;
        }
        else
        {
            this.onMouseMove = function()
            {
                this.setTransform();
            };
        }
    }
    function getDragRight()
    {
        var _loc3_ = undefined;
        var _loc2_ = this.getUIParentLeftTop();
        _loc3_ = Math.floor(Stage.visibleRect.bottomRight.x - _loc2_.x - (this.titleBtn._x + 110) * this.UI._xscale * 0.01);
        return _loc3_;
    }
    function configEvents()
    {
        super.configEvents();
        if(_root.BaseUI)
        {
            var _loc5_ = _root.GetRegisterUIData(this.UI.UIname);
        }
        var thisObject = this;
        this.UI.myListener.OnGameEventShowWindow = function(widgetName, bShow, expandOption)
        {
            if(widgetName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
            {
                thisObject.UI.bWidgetOpen = Number(bShow);
                thisObject.UI._visible = Boolean(bShow);
                thisObject.setTransform();
            }
        };
        this.UI.myListener.OnGameEventChangeUIMode = function(bShow)
        {
            var _loc1_ = thisObject.container;
            if(bShow)
            {
                _loc1_.background._visible = _loc1_.pageDownBtn._visible = _loc1_.pageUpBtn._visible = true;
                _loc1_.extendShortcutBtn._visible = _loc1_.addShortcutBtn._visible = _loc1_.preShortcutBtn._visible = _loc1_.lockBtn._visible = true;
                _loc1_.listCtrl._visible = _loc1_.shortCutListCtrl._visible = _loc1_.pageTF._visible = _loc1_.pageBG._visible = true;
            }
            else
            {
                _loc1_.background._visible = _loc1_.pageDownBtn._visible = _loc1_.pageUpBtn._visible = false;
                _loc1_.extendShortcutBtn._visible = _loc1_.addShortcutBtn._visible = _loc1_.preShortcutBtn._visible = _loc1_.lockBtn._visible = false;
            }
        };
        this.UI.myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
        {
            if(_UIName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
            {
                this.transformInterval = setInterval(thisObject,"setTransform",10);
            }
        };
        this.UI.myListener.OnGame_ShortCut_PremiumToggle = function(bShow, flag)
        {
            var _loc1_ = thisObject.container;
            _loc1_.preShortcutBtn._visible = Boolean(Number(bShow));
            lib.Debuger.trace("존재" + _loc1_.preShortcutBtn);
            lib.Debuger.trace("원래2 : " + _loc1_.preShortcutBtn.selected + " / " + _loc1_.extendShortcutBtn.selected);
            _loc1_.preShortcutBtn.selected = true;
            lib.Debuger.trace("뭐지2 : " + _loc1_.preShortcutBtn.selected);
        };
    }
    function setTransform()
    {
        if(this.transformInterval)
        {
            clearInterval(this.transformInterval);
        }
        var _loc2_ = undefined;
        if(this.UI._x < this.getDragLeft() + 30)
        {
            _loc2_ = "TO_THE_LEFT";
        }
        else if(this.UI._x > this.getDragRight() - 30)
        {
            _loc2_ = "TO_THE_RIGHT";
        }
        else
        {
            _loc2_ = "DEFAULT";
        }
        if(this.sUIRotate != _loc2_)
        {
            this.sUIRotate = _loc2_;
            this.setUIPosition(this.sUIRotate);
        }
    }
    function setUIPosition(sPosition)
    {
        var _loc2_ = undefined;
        if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
        {
            _loc2_ = 2;
            this.listCtrl.__set__type("transform");
        }
        else
        {
            this.listCtrl.__set__type("default");
        }
        this.invalidateUIElementsPosition();
    }
    function reflowElements(sPosition)
    {
        var _loc5_ = 55;
        var _loc2_ = undefined;
        var _loc3_ = undefined;
        if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
        {
            this.background.gotoAndStop(2);
            this.listCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL);
            this.shortCutListCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL);
            this.titleBtn._width = 110;
            this.titleBtn._height = 65;
            this.pageDownBtn._x = 35;
            this.pageDownBtn._y = 61;
            this.pageDownBtn._rotation = -90;
            this.pageUpBtn._x = 77;
            this.pageUpBtn._y = 61;
            this.pageUpBtn._rotation = -90;
            this.pageTF._x = 33;
            this.pageTF._y = 34;
            this.pageBG._x = this.pageTF._x + 10;
            this.pageBG._y = this.pageTF._y - 5;
            this.listCtrl._x = -1;
            this.listCtrl._y = 75;
            this.shortCutListCtrl._x = this.listCtrl._x;
            this.extendShortcutBtn._x = this.addShortcutBtn._x = this.preShortcutBtn._x = this.lockBtn._x = this.titleBtn._width - 36;
            _loc3_ = this.listCtrl.__get__mode() != "small"?760:425;
            this.shortCutListCtrl._y = _loc3_;
            this.extendShortcutBtn._y = _loc3_;
            this.addShortcutBtn._y = this.extendShortcutBtn._y + this.extendShortcutBtn._height;
            this.lockBtn._y = this.addShortcutBtn._y + this.addShortcutBtn._height;
            this.preShortcutBtn._y = this.lockBtn._y + this.lockBtn._height;
        }
        else
        {
            this.background.gotoAndStop(1);
            this.listCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL);
            this.shortCutListCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL);
            this.titleBtn._width = 65;
            this.titleBtn._height = 110;
            this.pageDownBtn._x = 61;
            this.pageDownBtn._y = 75;
            this.pageDownBtn._rotation = 180;
            this.pageUpBtn._x = 61;
            this.pageUpBtn._y = 37;
            this.pageUpBtn._rotation = 180;
            this.pageTF._x = 20;
            this.pageTF._y = 47;
            this.pageBG._x = this.pageTF._x + 10;
            this.pageBG._y = this.pageTF._y - 5;
            this.listCtrl._x = 75;
            this.listCtrl._y = 0;
            this.shortCutListCtrl._y = this.listCtrl._y + 56;
            this.preShortcutBtn._y = this.extendShortcutBtn._y = this.addShortcutBtn._y = this.lockBtn._y = 3;
            _loc2_ = this.listCtrl.__get__mode() != "small"?760:425;
            this.shortCutListCtrl._x = _loc2_;
            this.extendShortcutBtn._x = _loc2_;
            this.addShortcutBtn._x = _loc2_ + this.extendShortcutBtn._width;
            this.lockBtn._x = _loc2_ + this.extendShortcutBtn._width + this.addShortcutBtn._width;
            this.preShortcutBtn._x = _loc2_ + this.extendShortcutBtn._width + this.addShortcutBtn._width + this.lockBtn._width;
        }
    }
    function registerTooltip(targetMc)
    {
        var _loc5_ = !this.extendShortcutBtn.__get__selected()?lib.info.ToolTipStr.SHORTCUTOFF:lib.info.ToolTipStr.SHORTCUTFULL;
        var _loc2_ = !this.addShortcutBtn.__get__selected()?lib.info.ToolTipStr.SHORTEXTENABLE:lib.info.ToolTipStr.SHORTEXTDISABLE;
        var _loc3_ = !this.preShortcutBtn.__get__selected()?lib.info.ToolTipStr.SHORTPREENABLE:lib.info.ToolTipStr.SHORTPREDISABLE;
        var _loc4_ = !this.lockBtn.__get__selected()?lib.info.ToolTipStr.SHORTCUTUNLOCK:lib.info.ToolTipStr.SHORTCUTLOCK;
        lib.manager.ToolTip.add(this.extendShortcutBtn,_loc5_,1);
        lib.manager.ToolTip.add(this.addShortcutBtn,_loc2_,1);
        lib.manager.ToolTip.add(this.lockBtn,_loc4_,1);
        lib.manager.ToolTip.add(this.preShortcutBtn,_loc3_,1);
    }
    function invalidateUIElementsPosition(tweenMove)
    {
        this.tweenMove = tweenMove;
        this.elementsPositionChanged = true;
        this.invalidate();
    }
    function onPageHandler(e)
    {
        var _loc2_ = Number(this.pageTF.text);
        if(e.target == this.pageDownBtn)
        {
            _loc2_ = _loc2_ - 1;
        }
        else
        {
            _loc2_ = _loc2_ + 1;
        }
        _loc2_ = _loc2_ % 10;
        if(_loc2_ == 0)
        {
            _loc2_ = 10;
        }
        getURL("FSCommand:ToGameRequestShortCutPage",_loc2_);
    }
    function onExtendShortcutHandler(e)
    {
        var _loc2_ = (gfx.controls.Button)e.target;
        this.registerTooltip(e.target);
        this.listCtrl.__set__mode(!_loc2_.__get__selected()?"small":"big");
        flash.external.ExternalInterface.call("ToGameSetShortCutMode",_loc2_.__get__selected());
    }
    function onAddShortcutHandler(e)
    {
        var _loc2_ = (gfx.controls.Button)e.target;
        this.registerTooltip(e.target);
        getURL("FSCommand:ToGame_ShortCut_EnableExtShortCut",_loc2_.__get__selected());
    }
    function onPremiumShortcutHandler(e)
    {
        var _loc2_ = (gfx.controls.Button)e.target;
        this.registerTooltip(e.target);
        lib.Debuger.trace("결과 : " + _loc2_.__get__selected());
        getURL("FSCommand:ToGame_ShortCut_EnablePremiumShortCut",_loc2_.__get__selected());
    }
    function onLockHandler(e)
    {
        var _loc4_ = (gfx.controls.Button)e.target;
        this.registerTooltip(e.target);
        var _loc3_ = 0;
        while(_loc3_ < 24)
        {
            this.listCtrl.getItemAt(_loc3_).dragEnabled = !_loc4_.__get__selected();
            _loc3_ = _loc3_ + 1;
        }
        while(_loc3_ < 27)
        {
            this.shortCutListCtrl.getItemAt(_loc3_).dragEnabled = !_loc4_.__get__selected();
            _loc3_ = _loc3_ + 1;
        }
        _root.OnGameEvent("OnGame_LockBtn_Clicked",_loc4_);
        flash.external.ExternalInterface.call("ToGameSetShortCutLock",_loc4_.__get__selected());
    }
    function listCtrl_modeChangedHandler()
    {
        this.invalidateUIElementsPosition(false);
    }
    function listCtrl_itemPressHandler(event)
    {
        flash.external.ExternalInterface.call(gfx.events.EventTypes.PRESS,Number(event.index));
    }
    function listCtrl_itemClickHandler(event)
    {
        flash.external.ExternalInterface.call(gfx.events.EventTypes.CLICK,Number(event.index));
    }
    function shortCutListCtrl_itemPressHandler(event)
    {
        flash.external.ExternalInterface.call(gfx.events.EventTypes.PRESS,Number(event.index + 24));
    }
    function shortCutListCtrl_itemClickHandler(event)
    {
        flash.external.ExternalInterface.call(gfx.events.EventTypes.CLICK,Number(event.index + 24));
    }
}
