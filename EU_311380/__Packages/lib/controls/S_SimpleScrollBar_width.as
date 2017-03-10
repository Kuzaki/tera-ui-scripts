class lib.controls.S_SimpleScrollBar_width extends MovieClip
{
    var PRESSINTERVAL = 0.4;
    var _scroll = 0;
    var _direction = "h";
    var showAllaways = true;
    var wheelDelta = 1;
    var defaultBarSizeRatio = 1;
    var SCROLL_BTN = lib.manager.UISound.SCROLL_BTN;
    var SCROLL_MOVE = lib.manager.UISound.SCROLL_MOVE;
    function S_SimpleScrollBar_width()
    {
        super();
        this._mouseListener = {};
        this._mouseListener.id = random(200000);
        this._dragmouseListener = {};
        this.init();
    }
    function init()
    {
        this.resize();
        var _this = this;
        this._dragmouseListener.onMouseMove = function()
        {
            _this.draging(_this.barBtn._x);
            _this.barBtnEf._x = _this.barBtn._x;
        };
        this.donwBtn.onPress = function()
        {
            lib.manager.UISound.play(_this.SCROLL_BTN);
            this.gotoAndStop("down");
            _this.barBtn.gotoAndStop("down");
            _this.barBtnEf.gotoAndStop("down");
            this.sp = -1;
            _this.scroll = _this.scroll + 1;
            delete this.onEnterFrame;
            this.onEnterFrame = function()
            {
                this.sp = this.sp + _this.PRESSINTERVAL;
                if(this.sp >= 1)
                {
                    var _loc2_ = _this.barBtn._x + _this._scrollSize;
                    _loc2_ = Math.min(_loc2_,_this._maxScrollPosition);
                    _this.barBtnEf._x = _this.barBtn._x = _loc2_;
                    _this.draging(_loc2_);
                    this.sp = 0;
                }
            };
        };
        this.donwBtn.onRelease = function()
        {
            delete this.onEnterFrame;
            this.gotoAndStop("over");
            _this.barBtn.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.donwBtn.onReleaseOutside = function()
        {
            delete this.onEnterFrame;
            this.gotoAndStop("up");
            _this.barBtn.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
        this.donwBtn.onRollOver = function()
        {
            this.gotoAndStop("over");
            _this.barBtn.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.donwBtn.onRollOut = function()
        {
            this.gotoAndStop("up");
            _this.barBtn.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
        this.upBtn.onPress = function()
        {
            lib.manager.UISound.play(_this.SCROLL_BTN);
            this.gotoAndStop("down");
            _this.barBtn.gotoAndStop("down");
            _this.barBtnEf.gotoAndStop("down");
            this.sp = -1;
            _this.scroll = _this.scroll - 1;
            delete this.onEnterFrame;
            this.onEnterFrame = function()
            {
                this.sp = this.sp + _this.PRESSINTERVAL;
                if(this.sp >= 1)
                {
                    var _loc2_ = _this.barBtn._x - _this._scrollSize;
                    _loc2_ = Math.max(_loc2_,_this._minScrollPosition);
                    _this.barBtnEf._x = _this.barBtn._x = _loc2_;
                    _this.draging(_loc2_);
                    this.sp = 0;
                }
            };
        };
        this.upBtn.onRollOver = function()
        {
            this.gotoAndStop("over");
            _this.barBtn.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.upBtn.onRelease = function()
        {
            delete this.onEnterFrame;
            this.gotoAndStop("over");
            _this.barBtn.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.upBtn.onReleaseOutside = function()
        {
            delete this.onEnterFrame;
            this.gotoAndStop("up");
            _this.barBtn.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
        this.upBtn.onRollOut = function()
        {
            this.gotoAndStop("up");
            _this.barBtn.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
        this.barBtn.onPress = function()
        {
            lib.manager.UISound.play(_this.SCROLL_BTN);
            this.gotoAndStop("down");
            _this.barBtnEf.gotoAndStop("down");
            Mouse.addListener(_this._dragmouseListener);
            this.startDrag(false,_this._minScrollPosition,this._y,_this._maxScrollPosition,this._y);
        };
        this.barBtn.onRelease = function()
        {
            Mouse.removeListener(_this._dragmouseListener);
            this.stopDrag();
            this.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.barBtn.onReleaseOutside = function()
        {
            Mouse.removeListener(_this._dragmouseListener);
            this.stopDrag();
            this.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
        this.barBtn.onRollOver = function()
        {
            this.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.barBtn.onRollOut = function()
        {
            this.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
        this.barMc.onPress = function()
        {
            lib.manager.UISound.play(_this.SCROLL_BTN);
            _this.positionToScroll(_this._xmouse);
            _this.barBtn.gotoAndStop("down");
            _this.barBtnEf.gotoAndStop("down");
        };
        this.barMc.onRollOver = function()
        {
            _this.barBtn.gotoAndStop("over");
            _this.barBtnEf.gotoAndStop("over");
        };
        this.barMc.onRollOut = this.barMc.onRelease = this.barMc.onReleaseOutside = function()
        {
            _this.barBtn.gotoAndStop("up");
            _this.barBtnEf.gotoAndStop("up");
        };
    }
    function display()
    {
        this._xscale = this._yscale = 100;
        this.upBtn._x = 0;
        this.upBtn._y = 0;
        this._barBtnW = this.barBtn._width;
        this._barBtnH = this.barBtn._height;
        this.barBtn.hitArea = this.barBtn.hitAreaMc;
        this.barMc._height = this._h - this.upBtn.hitAreaMc._height * 2;
        this.barMc._x = this.upBtn._x + this.upBtn.hitAreaMc._width / 2 - this.barMc._width / 2;
        this.barMc._y = this.upBtn._y + this.upBtn.hitAreaMc._height;
        this.donwBtn._x = this.upBtn._x;
        this.donwBtn._y = this.barMc._y + this.barMc._height;
        this.barBtn._x = this.barMc._x + this.barMc._width / 2 - this._barBtnW / 2;
        this.barBtnEf._x = this.barBtn._x + 3.5;
        this.barBtn._y = this.barMc._y;
        this.barBtnEf._y = this.barBtn._y;
    }
    function draw()
    {
        if(this._pageSize == undefined || this._displaySize == undefined || this._rowHeight == undefined)
        {
            return undefined;
        }
        this._displayRows = int(this._displaySize / this._rowHeight);
        var _loc2_ = this._scrollMax;
        this._scrollMax = Math.max(0,Math.ceil((this._pageSize - this._displaySize) / this._rowHeight));
        this.setScrollSize((this.barMc._width - this.barBtn._width) / this._scrollMax);
        this.__set__active(this._scrollMax > 0);
        if(this._displayRows == _loc2_ && this.__get__scroll() != 0)
        {
            this.__set__scroll(this._scrollMax);
        }
        else if(this.__get__scroll() < this._scrollMax)
        {
            this.__set__scroll(this.scroll);
        }
        else if(this._scrollMax < - this.__get__scroll())
        {
            this.__set__scroll(- this._scrollMax);
        }
        else
        {
            this.__set__scroll(0);
        }
    }
    function setScrollSize(pscrollSize)
    {
        this._scrollSize = pscrollSize;
        this._minScrollPosition = this.barMc._x - 2;
        this._maxScrollPosition = this._minScrollPosition + this.barMc._width - this._barBtnW + 4;
    }
    function positionToScroll(pos)
    {
        var _loc2_ = pos - this._minScrollPosition;
        if(_loc2_ > this.barBtn._x)
        {
            _loc2_ = pos - this._minScrollPosition - this._barBtnH;
        }
        var _loc3_ = Math.round(_loc2_ / this._scrollSize);
        this.__set__scroll(_loc3_);
    }
    function draging(tgy)
    {
        var _loc4_ = tgy - this._minScrollPosition;
        var _loc3_ = Math.round(_loc4_ / this._scrollSize);
        if(_loc3_ != this._scroll)
        {
            lib.manager.UISound.play(this.SCROLL_MOVE);
        }
        this._scroll = _loc3_;
        if(this._scroll <= 0)
        {
            this.upBtn.onRelease();
            this.upBtn.gotoAndStop("disable");
            this.barBtn.gotoAndStop("up");
            this.upBtn.enabled = false;
            this.barBtnEf.upMask._yscale = 0;
        }
        else if(!this.upBtn.enabled)
        {
            this.upBtn.gotoAndStop("up");
            this.upBtn.enabled = true;
            this.barBtnEf.upMask._yscale = 100;
        }
        if(this._scroll >= this._scrollMax)
        {
            this.donwBtn.onRelease();
            this.donwBtn.gotoAndStop("disable");
            this.barBtn.gotoAndStop("up");
            this.donwBtn.enabled = false;
            this.barBtnEf.downMask._yscale = 0;
        }
        else if(!this.donwBtn.enabled)
        {
            this.donwBtn.gotoAndStop("up");
            this.donwBtn.enabled = true;
            this.barBtnEf.downMask._yscale = 100;
        }
        var _loc2_ = Math.min(this._scroll * this._rowHeight,this._pageSize - this._displaySize);
        if(this.__get__scroll() == 0)
        {
            _loc2_ = this._scroll * this._rowHeight;
        }
        this._listener.onScroll2(_loc2_,this._scroll);
    }
    function setPosition()
    {
        this.barBtnEf._x = this.barBtn._x = this.barMc._x + this._scrollSize * this._scroll - 2;
    }
    function __set__scroll(pscroll)
    {
        if(pscroll > 0)
        {
            pscroll = Math.max(0,pscroll);
            this._scroll = Math.min(this._scrollMax,pscroll);
        }
        else
        {
            pscroll = Math.max(0,- pscroll);
            this._scroll = - Math.min(this._scrollMax,pscroll);
        }
        var _loc3_ = Math.min(this._rowHeight * this.__get__scroll(),this._pageSize - this._displaySize);
        if(this.__get__scroll() == 0)
        {
            _loc3_ = this._rowHeight * this.__get__scroll();
        }
        this._listener.onScroll2(_loc3_,this.__get__scroll());
        if(this._scroll <= 0)
        {
            this.upBtn.gotoAndStop("disable");
            this.barBtn.gotoAndStop("up");
            this.barBtnEf.upMask._yscale = 0;
        }
        else if(!this.upBtn.enabled)
        {
            this.upBtn.gotoAndStop("up");
            this.barBtnEf.upMask._yscale = 100;
        }
        if(this._scroll >= this._scrollMax)
        {
            this.barBtn.gotoAndStop("up");
            this.donwBtn.gotoAndStop("disable");
            this.barBtnEf.downMask._yscale = 0;
        }
        else if(!this.donwBtn.enabled)
        {
            this.donwBtn.gotoAndStop("up");
            this.barBtnEf.downMask._yscale = 100;
        }
        this.barBtn.enabled = this._scrollMax > 0;
        this.upBtn.enabled = this._scroll > 0;
        this.donwBtn.enabled = this._scroll < this._scrollMax;
        this.setPosition();
        return this.__get__scroll();
    }
    function __get__scroll()
    {
        return this._scroll;
    }
    function __set__rowHeight(prowHeight)
    {
        if(prowHeight > 50)
        {
            prowHeight = 20;
        }
        this._rowHeight = prowHeight;
        this.draw();
        return this.__get__rowHeight();
    }
    function __set__pageSize(ppageSize)
    {
        this._pageSize = ppageSize;
        this.draw();
        return this.__get__pageSize();
    }
    function __set__displaySize(pdisplaySize)
    {
        this._displaySize = pdisplaySize;
        this.draw();
        return this.__get__displaySize();
    }
    function __set__active(pactive)
    {
        this._active = pactive && this.showAllaways;
        this.barBtn._visible = pactive;
        this.barMc._visible = pactive;
        return this.__get__active();
    }
    function __get__active()
    {
        return this._active;
    }
    function __set__show(pshow)
    {
        if(this._active)
        {
            this._visible = pshow;
        }
        return this.__get__show();
    }
    function setVisible(pshow)
    {
        this.showAllaways = pshow;
        this._visible = this._scrollMax > 0 && pshow;
    }
    function __set__direction(pdirection)
    {
        this._direction = pdirection;
        this.resize();
        return this.__get__direction();
    }
    function __get__scrollMax()
    {
        return this._scrollMax;
    }
    function addListener(plistener)
    {
        this._listener = plistener;
        this._listener.onScroll2("addListener");
    }
    function removeListener()
    {
        this._listener = null;
    }
    function resize(size)
    {
        if(size != undefined)
        {
            this._h = size;
        }
        else
        {
            this._h = this._direction != "w"?this._width:this._height;
        }
        this.display();
    }
    function setWheel(target)
    {
        var scTg = target;
        var _loc4_ = {x:target._x,y:target._y};
        target.localToGlobal(_loc4_);
        var tgY = _loc4_.y;
        var _this = this;
        var _loc9_ = false;
        this._mouseListener.onMouseWheel = function(delta, scrollTarget)
        {
            var _loc3_ = String(scTg).split(".");
            var _loc1_ = _loc3_.length - 1;
            var _loc2_ = String(scrollTarget).split(".").slice(0,_loc1_ + 1).join(".");
            var _loc4_ = String(scrollTarget).split(".").slice(0,_loc1_).join(".");
            if(_loc2_ == String(scTg))
            {
                _this.wheel(delta);
            }
            else if(_loc4_ == String(scTg._parent))
            {
                if(scTg.hitTest(_level0._xmouse,_level0._ymouse,false))
                {
                    if(_level0._xmouse > tgY && _level0._xmouse < tgY + _this._displaySize)
                    {
                        _this.wheel(delta);
                    }
                }
            }
        };
        Mouse.addListener(this._mouseListener);
    }
    function onUnload()
    {
        this.kill();
    }
    function wheel(delta)
    {
        if(!this._visible)
        {
            return undefined;
        }
        var _loc3_ = delta / 3;
        _loc3_ = _loc3_ * this.wheelDelta;
        var _loc2_ = this.barBtn._x - _loc3_ * this._scrollSize;
        if(_loc3_ < 0)
        {
            _loc2_ = Math.min(_loc2_,this._maxScrollPosition);
        }
        else
        {
            _loc2_ = Math.max(_loc2_,this._minScrollPosition);
        }
        this.barBtnEf._x = this.barBtn._x = _loc2_;
        this.draging(_loc2_);
    }
    function kill()
    {
        Mouse.removeListener(this._mouseListener);
        Mouse.removeListener(this._dragmouseListener);
    }
    function setScrollPosition(py)
    {
        this.__set__scroll(int(py / this._rowHeight));
    }
}
