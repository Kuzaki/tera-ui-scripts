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
if(!mx.controls.Button)
{
    mx.controls.Button.prototype = new mx.controls.SimpleButton().init = function(Void)
    {
        super.init();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().draw = function()
    {
        if(this.initializing)
        {
            this.labelPath.visible = true;
        }
        super.draw();
        if(this.initIcon != undefined)
        {
            this._setIcon(this.initIcon);
        }
        delete this.initIcon;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().onRelease = function(Void)
    {
        super.onRelease();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().createChildren = function(Void)
    {
        super.createChildren();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setSkin = function(tag, linkageName, initobj)
    {
        return super.setSkin(tag,linkageName,initobj);
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().viewSkin = function(varName)
    {
        var _loc3_ = !this.getState()?"false":"true";
        _loc3_ = _loc3_ + (!this.enabled?"disabled":this.phase);
        super.viewSkin(varName,{styleName:this,borderStyle:_loc3_});
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().invalidateStyle = function(c)
    {
        this.labelPath.invalidateStyle(c);
        super.invalidateStyle(c);
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setColor = function(c)
    {
        var _loc2_ = 0;
        while(_loc2_ < 8)
        {
            this[this.idNames[_loc2_]].redraw(true);
            _loc2_ = _loc2_ + 1;
        }
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setEnabled = function(enable)
    {
        this.labelPath.enabled = enable;
        super.setEnabled(enable);
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().calcSize = function(tag, ref)
    {
        if(this.__width == undefined || this.__height == undefined)
        {
            return undefined;
        }
        if(tag < 7)
        {
            ref.setSize(this.__width,this.__height,true);
        }
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().size = function(Void)
    {
        this.setState(this.getState());
        this.setHitArea(this.__width,this.__height);
        var _loc3_ = 0;
        while(_loc3_ < 8)
        {
            var _loc4_ = this.idNames[_loc3_];
            if(typeof this[_loc4_] == "movieclip")
            {
                this[_loc4_].setSize(this.__width,this.__height,true);
            }
            _loc3_ = _loc3_ + 1;
        }
        super.size();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__set__labelPlacement = function(val)
    {
        this.__labelPlacement = val;
        this.invalidate();
        return this.__get__labelPlacement();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__get__labelPlacement = function()
    {
        return this.__labelPlacement;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().getLabelPlacement = function(Void)
    {
        return this.__labelPlacement;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setLabelPlacement = function(val)
    {
        this.__labelPlacement = val;
        this.invalidate();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().getBtnOffset = function(Void)
    {
        if(this.getState())
        {
            var _loc2_ = this.btnOffset;
        }
        else if(this.phase == "down")
        {
            _loc2_ = this.btnOffset;
        }
        else
        {
            _loc2_ = 0;
        }
        return _loc2_;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setView = function(offset)
    {
        var _loc16_ = !offset?0:this.btnOffset;
        var _loc12_ = this.getLabelPlacement();
        var _loc7_ = 0;
        var _loc6_ = 0;
        var _loc9_ = 0;
        var _loc8_ = 0;
        var _loc5_ = 0;
        var _loc4_ = 0;
        var _loc3_ = this.labelPath;
        var _loc2_ = this.iconName;
        var _loc15_ = _loc3_.textWidth;
        var _loc14_ = _loc3_.textHeight;
        var _loc10_ = this.__width - this.borderW - this.borderW;
        var _loc11_ = this.__height - this.borderW - this.borderW;
        if(_loc2_ != undefined)
        {
            _loc7_ = _loc2_._width;
            _loc6_ = _loc2_._height;
        }
        if(_loc12_ == "left" || _loc12_ == "right")
        {
            if(_loc3_ != undefined)
            {
                _loc3_._width = _loc9_ = Math.min(_loc10_ - _loc7_,_loc15_ + 5);
                _loc3_._height = _loc8_ = Math.min(_loc11_,_loc14_ + 5);
            }
            if(_loc12_ == "right")
            {
                _loc5_ = _loc7_;
                if(this.centerContent)
                {
                    _loc5_ = _loc5_ + (_loc10_ - _loc9_ - _loc7_) / 2;
                }
                _loc2_._x = _loc5_ - _loc7_;
            }
            else
            {
                _loc5_ = _loc10_ - _loc9_ - _loc7_;
                if(this.centerContent)
                {
                    _loc5_ = _loc5_ / 2;
                }
                _loc2_._x = _loc5_ + _loc9_;
            }
            _loc2_._y = _loc4_ = 0;
            if(this.centerContent)
            {
                _loc2_._y = (_loc11_ - _loc6_) / 2;
                _loc4_ = (_loc11_ - _loc8_) / 2;
            }
            if(!this.centerContent)
            {
                _loc2_._y = _loc2_._y + Math.max(0,(_loc8_ - _loc6_) / 2);
            }
        }
        else
        {
            if(_loc3_ != undefined)
            {
                _loc3_._width = _loc9_ = Math.min(_loc10_,_loc15_ + 5);
                _loc3_._height = _loc8_ = Math.min(_loc11_ - _loc6_,_loc14_ + 5);
            }
            _loc5_ = (_loc10_ - _loc9_) / 2;
            _loc2_._x = (_loc10_ - _loc7_) / 2;
            if(_loc12_ == "top")
            {
                _loc4_ = _loc11_ - _loc8_ - _loc6_;
                if(this.centerContent)
                {
                    _loc4_ = _loc4_ / 2;
                }
                _loc2_._y = _loc4_ + _loc8_;
            }
            else
            {
                _loc4_ = _loc6_;
                if(this.centerContent)
                {
                    _loc4_ = _loc4_ + (_loc11_ - _loc8_ - _loc6_) / 2;
                }
                _loc2_._y = _loc4_ - _loc6_;
            }
        }
        var _loc13_ = this.borderW + _loc16_;
        _loc3_._x = _loc5_ + _loc13_;
        _loc3_._y = _loc4_ + _loc13_;
        _loc2_._x = _loc2_._x + _loc13_;
        _loc2_._y = _loc2_._y + _loc13_;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__set__label = function(lbl)
    {
        this.setLabel(lbl);
        return this.__get__label();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setLabel = function(label)
    {
        if(label == "")
        {
            this.labelPath.removeTextField();
            this.refresh();
            return undefined;
        }
        if(this.labelPath == undefined)
        {
            var _loc2_ = this.createLabel("labelPath",200,label);
            _loc2_._width = _loc2_.textWidth + 5;
            _loc2_._height = _loc2_.textHeight + 5;
            if(this.initializing)
            {
                _loc2_.visible = false;
            }
        }
        else
        {
            delete this.labelPath.__text;
            this.labelPath.text = label;
            this.refresh();
        }
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().getLabel = function(Void)
    {
        return this.labelPath.__text == undefined?this.labelPath.text:this.labelPath.__text;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__get__label = function()
    {
        return this.getLabel();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton()._getIcon = function(Void)
    {
        return this._iconLinkageName;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__get__icon = function()
    {
        if(this.initializing)
        {
            return this.initIcon;
        }
        return this._iconLinkageName;
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton()._setIcon = function(linkage)
    {
        if(this.initializing)
        {
            if(linkage == "")
            {
                return undefined;
            }
            this.initIcon = linkage;
        }
        else
        {
            if(linkage == "")
            {
                this.removeIcons();
                return undefined;
            }
            super.changeIcon(0,linkage);
            super.changeIcon(1,linkage);
            super.changeIcon(3,linkage);
            super.changeIcon(4,linkage);
            super.changeIcon(5,linkage);
            this._iconLinkageName = linkage;
            this.refresh();
        }
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__set__icon = function(linkage)
    {
        this._setIcon(linkage);
        return this.__get__icon();
    };
    mx.controls.Button.prototype = new mx.controls.SimpleButton().setHitArea = function(w, h)
    {
        if(this.hitArea_mc == undefined)
        {
            this.createEmptyObject("hitArea_mc",100);
        }
        var _loc2_ = this.hitArea_mc;
        _loc2_.clear();
        _loc2_.beginFill(16711680);
        _loc2_.drawRect(0,0,w,h);
        _loc2_.endFill();
        _loc2_.setVisible(false);
    };
    mx.controls.Button = function()
    {
        super();
    }.symbolName = "Button";
    mx.controls.Button = function()
    {
        super();
    }.symbolOwner = mx.controls.Button;
    mx.controls.Button.prototype = new mx.controls.SimpleButton().className = "Button";
    mx.controls.Button = function()
    {
        super();
    }.version = "2.0.2.127";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().btnOffset = 0;
    mx.controls.Button.prototype = new mx.controls.SimpleButton()._color = "buttonColor";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__label = "default value";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().__labelPlacement = "right";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseUpSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseDownSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseOverSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseDisabledSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueUpSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueDownSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueOverSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueDisabledSkin = "ButtonSkin";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseUpIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseDownIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseOverIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().falseDisabledIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueUpIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueDownIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueOverIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().trueDisabledIcon = "";
    mx.controls.Button.prototype = new mx.controls.SimpleButton().clipParameters = {labelPlacement:1,icon:1,toggle:1,selected:1,label:1};
    mx.controls.Button = function()
    {
        super();
    }.mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.controls.Button.prototype.clipParameters,mx.controls.SimpleButton.prototype.clipParameters);
    mx.controls.Button.prototype = new mx.controls.SimpleButton().centerContent = true;
    mx.controls.Button.prototype = new mx.controls.SimpleButton().borderW = 1;
    §§push((mx.controls.Button.prototype = new mx.controls.SimpleButton()).addProperty("icon",mx.controls.Button.prototype = new mx.controls.SimpleButton().__get__icon,mx.controls.Button.prototype = new mx.controls.SimpleButton().__set__icon));
    §§push((mx.controls.Button.prototype = new mx.controls.SimpleButton()).addProperty("label",mx.controls.Button.prototype = new mx.controls.SimpleButton().__get__label,mx.controls.Button.prototype = new mx.controls.SimpleButton().__set__label));
    §§push((mx.controls.Button.prototype = new mx.controls.SimpleButton()).addProperty("labelPlacement",mx.controls.Button.prototype = new mx.controls.SimpleButton().__get__labelPlacement,mx.controls.Button.prototype = new mx.controls.SimpleButton().__set__labelPlacement));
    §§push(ASSetPropFlags(mx.controls.Button.prototype,null,1));
}
§§pop();
