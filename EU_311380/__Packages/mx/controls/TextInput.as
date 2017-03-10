if(!_global.mx)
{
    _global.mx = new Object();
}
§§pop();
if(!_global.mx.controls)
{
    _global.mx.controls = new Object();
}
§§pop();
if(!mx.controls.TextInput)
{
    mx.controls.TextInput.prototype = new mx.core.UIComponent().addEventListener = function(event, handler)
    {
        if(event == "enter")
        {
            this.addEnterEvents();
        }
        super.addEventListener(event,handler);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().enterOnKeyDown = function()
    {
        if(Key.getAscii() == 13)
        {
            this.owner.dispatchEvent({type:"enter"});
        }
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().addEnterEvents = function()
    {
        if(this.enterListener == undefined)
        {
            this.enterListener = new Object();
            this.enterListener.owner = this;
            this.enterListener.onKeyDown = this.enterOnKeyDown;
        }
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().init = function(Void)
    {
        super.init();
        this.label.styleName = this;
        this.tabChildren = true;
        this.tabEnabled = false;
        this.focusTextField = this.label;
        this._color = mx.core.UIObject.textColorList;
        this.label.onSetFocus = function()
        {
            this._parent.onSetFocus();
        };
        this.label.onKillFocus = function(n)
        {
            this._parent.onKillFocus(n);
        };
        this.label.drawFocus = function(b)
        {
            this._parent.drawFocus(b);
        };
        this.label.onChanged = this.onLabelChanged;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().setFocus = function()
    {
        Selection.setFocus(this.label);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().onLabelChanged = function(Void)
    {
        this._parent.dispatchEvent({type:"change"});
        this._parent.dispatchValueChangedEvent(this.__get__text());
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().createChildren = function(Void)
    {
        super.createChildren();
        if(this.border_mc == undefined)
        {
            this.createClassObject(_global.styles.rectBorderClass,"border_mc",0,{styleName:this});
        }
        this.border_mc.swapDepths(this.label);
        this.label.autoSize = "none";
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__html = function()
    {
        return this.getHtml();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__html = function(value)
    {
        this.setHtml(value);
        return this.__get__html();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().getHtml = function()
    {
        return this.label.html;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().setHtml = function(value)
    {
        if(value != this.label.html)
        {
            this.label.html = value;
        }
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__text = function()
    {
        return this.getText();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__text = function(t)
    {
        this.setText(t);
        return this.__get__text();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().getText = function()
    {
        if(this.initializing)
        {
            return this.initText;
        }
        if(this.label.html == true)
        {
            return this.label.htmlText;
        }
        return this.label.text;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().setText = function(t)
    {
        if(this.initializing)
        {
            this.initText = t;
        }
        else
        {
            var _loc2_ = this.label;
            if(_loc2_.html == true)
            {
                _loc2_.htmlText = t;
            }
            else
            {
                _loc2_.text = t;
            }
        }
        this.dispatchValueChangedEvent(t);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().size = function(Void)
    {
        this.border_mc.setSize(this.__get__width(),this.__get__height());
        var _loc2_ = this.border_mc.__get__borderMetrics();
        var _loc6_ = _loc2_.left + _loc2_.right;
        var _loc3_ = _loc2_.top + _loc2_.bottom;
        var _loc5_ = _loc2_.left;
        var _loc4_ = _loc2_.top;
        this.tfx = _loc5_;
        this.tfy = _loc4_;
        this.tfw = this.__get__width() - _loc6_;
        this.tfh = this.__get__height() - _loc3_;
        this.label.move(this.tfx,this.tfy);
        this.label.setSize(this.tfw,this.tfh + 1);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().setEnabled = function(enable)
    {
        this.label.type = !(this.__editable == true || enable == false)?"dynamic":"input";
        this.label.selectable = enable;
        var _loc2_ = this.getStyle(!enable?"disabledColor":"color");
        if(_loc2_ == undefined)
        {
            _loc2_ = !enable?8947848:0;
        }
        this.setColor(_loc2_);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().setColor = function(col)
    {
        this.label.textColor = col;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().onKillFocus = function(newFocus)
    {
        if(this.enterListener != undefined)
        {
            Key.removeListener(this.enterListener);
        }
        if(this.bind != undefined)
        {
            this.updateModel(this.__get__text());
        }
        super.onKillFocus(newFocus);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().onSetFocus = function(oldFocus)
    {
        var f = Selection.getFocus();
        var o = eval(f);
        if(o != this.label)
        {
            Selection.setFocus(this.label);
            return undefined;
        }
        if(this.enterListener != undefined)
        {
            Key.addListener(this.enterListener);
        }
        super.onSetFocus(oldFocus);
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().draw = function(Void)
    {
        var _loc2_ = this.label;
        var _loc4_ = this.getText();
        if(this.initializing)
        {
            this.initializing = false;
            delete this.initText;
        }
        var _loc3_ = this._getTextFormat();
        _loc2_.embedFonts = _loc3_.embedFonts == true;
        if(_loc3_ != undefined)
        {
            _loc2_.setTextFormat(_loc3_);
            _loc2_.setNewTextFormat(_loc3_);
        }
        _loc2_.multiline = false;
        _loc2_.wordWrap = false;
        if(_loc2_.html == true)
        {
            _loc2_.setTextFormat(_loc3_);
            _loc2_.htmlText = _loc4_;
        }
        else
        {
            _loc2_.text = _loc4_;
        }
        _loc2_.type = !(this.__editable == true || this.enabled == false)?"dynamic":"input";
        this.size();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().setEditable = function(s)
    {
        this.__editable = s;
        this.label.type = !s?"dynamic":"input";
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__maxChars = function()
    {
        return this.label.maxChars;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__maxChars = function(w)
    {
        this.label.maxChars = w;
        return this.__get__maxChars();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__length = function()
    {
        return this.label.length;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__restrict = function()
    {
        return this.label.restrict;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__restrict = function(w)
    {
        this.label.restrict = w != ""?w:null;
        return this.__get__restrict();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__hPosition = function()
    {
        return this.label.hscroll;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__hPosition = function(w)
    {
        this.label.hscroll = w;
        return this.__get__hPosition();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__maxHPosition = function()
    {
        return this.label.maxhscroll;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__editable = function()
    {
        return this.__editable;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__editable = function(w)
    {
        this.setEditable(w);
        return this.__get__editable();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__password = function()
    {
        return this.label.password;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__password = function(w)
    {
        this.label.password = w;
        return this.__get__password();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__tabIndex = function()
    {
        return this.label.tabIndex;
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__tabIndex = function(w)
    {
        this.label.tabIndex = w;
        return this.__get__tabIndex();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__set___accProps = function(val)
    {
        this.label._accProps = val;
        return this.__get___accProps();
    };
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__get___accProps = function()
    {
        return this.label._accProps;
    };
    mx.controls.TextInput = function()
    {
        super();
    }.symbolName = "TextInput";
    mx.controls.TextInput = function()
    {
        super();
    }.symbolOwner = mx.controls.TextInput;
    mx.controls.TextInput = function()
    {
        super();
    }.version = "2.0.2.127";
    mx.controls.TextInput.prototype = new mx.core.UIComponent().className = "TextInput";
    mx.controls.TextInput.prototype = new mx.core.UIComponent().initializing = true;
    mx.controls.TextInput.prototype = new mx.core.UIComponent().clipParameters = {text:1,editable:1,password:1,maxChars:1,restrict:1};
    mx.controls.TextInput = function()
    {
        super();
    }.mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.controls.TextInput.prototype.clipParameters,mx.core.UIComponent.prototype.clipParameters);
    mx.controls.TextInput.prototype = new mx.core.UIComponent()._maxWidth = mx.core.UIComponent.kStretch;
    mx.controls.TextInput.prototype = new mx.core.UIComponent().__editable = true;
    mx.controls.TextInput.prototype = new mx.core.UIComponent().initText = "";
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("_accProps",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get___accProps,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set___accProps));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("editable",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__editable,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__editable));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("hPosition",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__hPosition,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__hPosition));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("html",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__html,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__html));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("length",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__length,function()
    {
    }
    ));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("maxChars",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__maxChars,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__maxChars));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("maxHPosition",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__maxHPosition,function()
    {
    }
    ));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("password",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__password,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__password));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("restrict",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__restrict,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__restrict));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("tabIndex",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__tabIndex,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__tabIndex));
    §§push((mx.controls.TextInput.prototype = new mx.core.UIComponent()).addProperty("text",mx.controls.TextInput.prototype = new mx.core.UIComponent().__get__text,mx.controls.TextInput.prototype = new mx.core.UIComponent().__set__text));
    §§push(ASSetPropFlags(mx.controls.TextInput.prototype,null,1));
}
§§pop();
