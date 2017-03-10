class com.bluehole.tera.view.core.SlotButton extends gfx.controls.Button
{
    var _effect = false;
    var _active = false;
    var _impossible = false;
    var _playCoolTime = 0;
    var _black = false;
    static var COOL_TIME_TOTAL_FRAME = 362;
    function SlotButton()
    {
        super();
    }
    function __get__effect()
    {
        return this._effect;
    }
    function __set__effect(value)
    {
        if(this._effect == value)
        {
            return undefined;
        }
        this._effect = value;
        this.effectMc._visible = value;
        if(value)
        {
            this.effectMc.play();
        }
        else
        {
            this.effectMc.stop();
        }
        return this.__get__effect();
    }
    function __get__active()
    {
        return this._active;
    }
    function __set__active(value)
    {
        if(this._active == value)
        {
            return undefined;
        }
        this._active = value;
        this.activeMc._visible = value;
        if(value)
        {
            this.activeMc.play();
        }
        else
        {
            this.activeMc.stop();
        }
        return this.__get__active();
    }
    function __get__impossible()
    {
        return this._impossible;
    }
    function __set__impossible(value)
    {
        if(this._impossible == value)
        {
            return undefined;
        }
        this._impossible = value;
        this.impossibleMc._visible = value;
        return this.__get__impossible();
    }
    function __get__playCoolTime()
    {
        return this._playCoolTime;
    }
    function __set__playCoolTime(value)
    {
        if(this._playCoolTime == value)
        {
            return undefined;
        }
        this._playCoolTime = value;
        this.coolTimeMc._visible = value > 0;
        this.coolTimeMc.gotoAndStop(Math.floor(com.bluehole.tera.view.core.SlotButton.COOL_TIME_TOTAL_FRAME * value / 100));
        return this.__get__playCoolTime();
    }
    function __get__black()
    {
        return this._black;
    }
    function __set__black(value)
    {
        this._black = value;
        this.__set__disabled(value);
        return this.__get__black();
    }
    function toString()
    {
        return "[com.bluehole.tera.view.core.SlotButton " + this._name + "]";
    }
    function configUI()
    {
        super.configUI();
        this.scale9Grid = new flash.geom.Rectangle(0,0,this.__get__width(),this.__get__height());
        this.trackAsMenu = true;
        this.coolTimeMc._visible = false;
        this.coolTimeMc.hitTestDisable = true;
        this.effectMc._visible = false;
        this.effectMc.hitTestDisable = true;
        this.effectMc.stop();
        this.activeMc._visible = false;
        this.activeMc.hitTestDisable = true;
        this.activeMc.stop();
        this.impossibleMc._visible = false;
        this.impossibleMc.hitTestDisable = true;
        var thisObject = this;
        var _loc3_ = new Object();
        _loc3_.onMouseDown = function(button, target, mouseIndex)
        {
            if(button == 2 && target == targetPath(thisObject))
            {
                thisObject.handleMousePress(mouseIndex,button);
            }
        };
        _loc3_.onMouseUp = function(button, target, mouseIndex)
        {
            if(button == 2 && target == targetPath(thisObject))
            {
                thisObject.handleMouseRelease(mouseIndex,button);
            }
        };
        Mouse.addListener(_loc3_);
    }
    function handleMousePress(mouseIndex, button)
    {
        if(this._disabled && !this._black)
        {
            return undefined;
        }
        if(this._black)
        {
            this.dispatchEvent({type:"press",mouseIndex:mouseIndex,button:button});
        }
        else
        {
            if(!this._disableFocus)
            {
                Selection.setFocus(this);
            }
            this.dispatchEvent({type:"press",mouseIndex:mouseIndex,button:button});
            if(this.autoRepeat)
            {
                this.buttonRepeatInterval = setInterval(this,"beginButtonRepeat",this.buttonRepeatDelay,mouseIndex,button);
            }
        }
    }
    function handleMouseRelease(mouseIndex, button)
    {
        if(this._disabled && !this._black)
        {
            return undefined;
        }
        clearInterval(this.buttonRepeatInterval);
        delete this.buttonRepeatInterval;
        if(this.doubleClickEnabled)
        {
            if(this.doubleClickInterval == null)
            {
                this.doubleClickInterval = setInterval(this,"doubleClickExpired",this.doubleClickDuration);
            }
            else
            {
                this.doubleClickExpired();
                this.dispatchEvent({type:"doubleClick",mouseIndex:mouseIndex,button:button});
                if(!this._disabled)
                {
                    this.setState("release");
                }
                return undefined;
            }
        }
        if(!this._disabled)
        {
            this.setState("release");
        }
        this.handleClick(mouseIndex,button);
    }
}
