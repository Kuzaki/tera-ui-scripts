function closing(rightNow)
{
    popUp_mc.cnt = 0;
    if(rightNow)
    {
        UI._visible = false;
        popUp_mc._alpha = 100;
        popUp_mc.fade.stop();
        delete popUp_mc.onEnterFrame;
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
                    UI._visible = false;
                    popUp_mc._alpha = 100;
                    popUp_mc.fade.stop();
                    ToGame_InteractionMenu_CloseUI();
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
    target.fade.stop();
    target.fade = new mx.transitions.Tween(target,"_alpha",mx.transitions.easing.None.easeNone,target._alpha,opacity,time,true);
    target.fade.onMotionFinished = function()
    {
        finishFunction();
    };
}
function ToGame_InteractionMenu_Select(selectedMenuIndex)
{
    getURL("FSCommand:ToGame_InteractionMenu_Select",selectedMenuIndex);
}
function ToGame_InteractionMenu_CloseUI()
{
    dataIn = false;
    fscommand("ToGame_InteractionMenu_CloseUI");
}
var UI = this;
var UIname = "interactionmenu";
bWidgetOpen = true;
var dataIn = false;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
        bWidgetOpen = bShow;
        if(_global.gbUIMode && bWidgetOpen)
        {
            if(dataIn)
            {
                UI._visible = true;
            }
        }
        else
        {
            myListener.OnGame_InteractionMenu_Close(false);
        }
    }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
    if(_global.gbUIMode && bWidgetOpen)
    {
        if(dataIn)
        {
            UI._visible = true;
        }
    }
    else
    {
        myListener.OnGame_InteractionMenu_Close(false);
    }
};
var contentsXY = {x:popUp_mc.contents_mc._x,y:popUp_mc.contents_mc._y};
var lineH = 36;
var lineW = 219;
var gapH = container_mc.bg_mc._height - container_mc.mask_mc._height;
myListener.OnGame_InteractionMenu_Open = function(x, y, dataList)
{
    delete popUp_mc.onEnterFrame;
    popUp_mc.fade.stop();
    popUp_mc.fade.rewind();
    var _loc13_ = "0";
    var _loc4_ = 0;
    while(_loc4_ < 30)
    {
        popUp_mc["line" + _loc4_].removeMovieClip();
        _loc4_ = _loc4_ + 1;
    }
    var _loc5_ = dataList.split("\n");
    if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "" || _loc5_[_loc5_.length - 1] == " ")
    {
        _loc5_.pop();
    }
    if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "" || _loc5_[_loc5_.length - 1] == " ")
    {
        _loc5_.pop();
    }
    if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "" || _loc5_[_loc5_.length - 1] == " ")
    {
        _loc5_.pop();
    }
    if(dataList != undefined && dataList != null && dataList != "")
    {
        dataIn = true;
        var _loc9_ = popUp_mc.getNextHighestDepth() + _loc5_.length - 1;
        var _loc12_ = false;
        _loc4_ = 0;
        while(_loc4_ < _loc5_.length)
        {
            var _loc6_ = _loc5_[_loc4_].split("[");
            var _loc3_ = undefined;
            if(_loc6_[1] != undefined)
            {
                _loc12_ = true;
                var _loc11_ = _loc6_[0];
                var _loc10_ = "[" + _loc6_[1];
                _loc3_ = popUp_mc.attachMovie("line_name","line" + _loc4_,_loc9_);
                _loc3_.txt1.htmlText = _loc11_;
                _loc3_.txt2.htmlText = _loc10_;
                var _loc7_ = new TextFormat();
                var _loc8_ = new TextFormat();
                if(_loc3_.txt1.maxscroll > 1)
                {
                }
                if(_loc3_.txt2.maxscroll > 1)
                {
                    _loc8_.size = 18;
                    _loc3_.txt2.setTextFormat(_loc8_);
                }
                _loc3_.txt1.verticalAlign = "center";
                _loc3_.txt2.verticalAlign = "center";
                _loc3_._x = 3;
                _loc3_._y = _loc3_._y - 7;
                _loc13_ = "1";
            }
            else
            {
                _loc3_ = popUp_mc.attachMovie("line","line" + _loc4_,_loc9_);
                _loc3_._x = 0;
                _loc3_.txt.htmlText = _loc5_[_loc4_];
                _loc7_ = new TextFormat();
                if(_loc3_.txt.maxscroll > 1)
                {
                    _loc7_.size = 14;
                    _loc3_.txt.setTextFormat(_loc7_);
                }
                _loc3_.txt.verticalAlign = "center";
            }
            _loc9_ = _loc9_ - 1;
            if(_loc4_ > 0)
            {
                if(_loc12_)
                {
                    _loc3_._y = _loc4_ * lineH + 18;
                }
                else
                {
                    _loc3_._y = _loc4_ * lineH;
                }
            }
            _loc3_.index = _loc4_;
            _loc3_.hit.onRollOver = function()
            {
                delete popUp_mc.onEnterFrame;
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
                if(popUp_mc._visible)
                {
                    popUp_mc();
                }
            };
            _loc3_.hit.onRollOut = _loc3_.hit.onReleaseOutside = function()
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
                closing();
            };
            _loc3_.hit.onPress = function()
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            };
            _loc3_.hit.onRelease = function()
            {
                lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
                ToGame_InteractionMenu_Select(this._parent.index);
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
                closing(true);
            };
            _loc4_ = _loc4_ + 1;
        }
        if(_loc13_ == "1")
        {
            popUp_mc.bg._height = _loc5_.length * lineH + 36;
        }
        else
        {
            popUp_mc.bg._height = _loc5_.length * lineH + 20;
        }
        myListener.OnGame_InteractionMenu_UpdatePosition(x,y);
        UI._visible = true;
        closing();
    }
    else
    {
        _root.debug3.text = "[인터랙션메뉴] 빈데이터가 들어왓음\r" + _root.debug3.text;
        UI._visible = false;
        delete popUp_mc.onEnterFrame;
        ToGame_InteractionMenu_CloseUI();
    }
};
myListener.OnGame_InteractionMenu_Close = function()
{
    dataIn = false;
    closing(true);
};
myListener.OnGame_InteractionMenu_UpdatePosition = function(x, y)
{
    var _loc2_ = (x + 10) / resolutionX * 100;
    var _loc1_ = (y + 10) / resolutionY * 100;
    _loc2_ = lib.info.AlignInfo.xRatioToPixel(_loc2_);
    _loc1_ = lib.info.AlignInfo.yRatioToPixel(_loc1_);
    var _loc3_ = popUp_mc._height;
    var _loc4_ = lineW;
    if(_loc2_ + _loc4_ > 1920)
    {
        _loc2_ = _loc2_ - _loc4_ - 10 * lib.info.AlignInfo.scaleRatio;
    }
    if(_loc1_ + _loc3_ > 1080)
    {
        _loc1_ = _loc1_ - _loc3_ - 10 * lib.info.AlignInfo.scaleRatio;
    }
    popUp_mc._x = _loc2_;
    popUp_mc._y = _loc1_;
};
var resolutionX = 1920;
var resolutionY = 1080;
myListener.OnGame_ChangeResolution = function(w, h)
{
    resolutionX = w;
    resolutionY = h;
};
_global.EventBroadCaster.addListener(myListener);
myListener.OnGame_InteractionMenu_Open(0,0,"");
