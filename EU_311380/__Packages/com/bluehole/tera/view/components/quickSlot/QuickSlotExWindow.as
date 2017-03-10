class com.bluehole.tera.view.components.quickSlot.QuickSlotExWindow extends com.bluehole.tera.view.components.quickSlot.BaseQuickSlot
{
    var elementsPositionChanged = false;
    function QuickSlotExWindow()
    {
        super();
        this.UI.UIname = "ExtShortCut";
    }
    function toString()
    {
        return "[com.bluehole.tera.view.components.quickSlot.QuickSlotExWindow " + this._name + "]";
    }
    function configUI()
    {
        this.UI.listCtrl = this.listCtrl;
        this.listCtrl.addEventListener("itemPress",this,"listCtrl_itemPressHandler");
        this.listCtrl.addEventListener("itemClick",this,"listCtrl_itemClickHandler");
        super.configUI();
    }
    function draw()
    {
        super.draw();
        if(this.elementsPositionChanged)
        {
            this.elementsPositionChanged = false;
            this.reflowElements(this.sUIRotate);
        }
    }
    function getDragRight()
    {
        var _loc3_ = undefined;
        var _loc2_ = this.getUIParentLeftTop();
        _loc3_ = Stage.visibleRect.bottomRight.x - _loc2_.x - 137 * this.UI._xscale * 0.01;
        return _loc3_;
    }
    function checkDragArea(bool)
    {
        super.checkDragArea;
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
    function configEvents()
    {
        super.configEvents();
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
                _loc1_.titleBtn._visible = true;
            }
            else
            {
                _loc1_.titleBtn._visible = false;
            }
        };
        this.UI.myListener.OnGame_LockBtn_Clicked = function(lockBtn)
        {
            var _loc2_ = 0;
            while(_loc2_ < 24)
            {
                this.listCtrl.getItemAt(_loc2_).dragEnabled = !lockBtn.__get__selected();
                _loc2_ = _loc2_ + 1;
            }
        };
        this.UI.myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
        {
            if(_UIName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
            {
                setInterval(thisObject,"setTransform",10);
            }
        };
    }
    function setTransform()
    {
        var _loc7_ = Stage.visibleRect.width;
        var _loc9_ = Stage.visibleRect.height;
        var _loc6_ = this.titleBtn._x;
        var _loc5_ = this.titleBtn._y;
        var _loc4_ = Stage.visibleRect.x + 137 >> 1;
        var _loc8_ = Stage.visibleRect.x + _loc7_ - _loc4_ * 4;
        var _loc3_ = {x:_loc6_,y:_loc5_};
        this.localToGlobal(_loc3_);
        var _loc2_ = undefined;
        if(_loc3_.x < _loc4_)
        {
            _loc2_ = "TO_THE_LEFT";
        }
        else if(_loc3_.x > _loc8_)
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
        var _loc3_ = undefined;
        if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
        {
        }
        this.invalidateUIElementsPosition();
    }
    function invalidateUIElementsPosition()
    {
        this.elementsPositionChanged = true;
        this.invalidate();
    }
    function reflowElements(sPosition)
    {
        var _loc3_ = 55;
        var _loc5_ = undefined;
        var _loc4_ = undefined;
        if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
        {
            this.background.gotoAndStop(2);
            this.listCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL);
            this.titleBtn._width = 138;
            this.titleBtn._height = 710;
            this.listCtrl._x = 11;
            this.listCtrl._y = 17;
        }
        else
        {
            this.background.gotoAndStop(1);
            this.listCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL);
            this.titleBtn._width = 710;
            this.titleBtn._height = 138;
            this.listCtrl._x = 17;
            this.listCtrl._y = 11;
        }
    }
    function setElementPosition(sPosition)
    {
        var _loc3_ = 56;
        var _loc5_ = undefined;
        var _loc4_ = undefined;
        if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
        {
            this.titleBtn._width = 115;
            this.titleBtn._height = 70;
            this.listCtrl._x = 0;
            this.listCtrl._y = 75;
        }
        else
        {
            this.titleBtn._width = 65;
            this.titleBtn._height = 110;
            this.listCtrl._x = 70;
            this.listCtrl._y = 0;
        }
    }
    function listCtrl_itemPressHandler(event)
    {
        flash.external.ExternalInterface.call(gfx.events.EventTypes.PRESS,Number(event.index + 50));
    }
    function listCtrl_itemClickHandler(event)
    {
        flash.external.ExternalInterface.call(gfx.events.EventTypes.CLICK,Number(event.index + 50));
    }
}
