function chatWhisperHandler(value)
{
    if(value != null)
    {
        bShowChatWhisper = Number(value);
    }
}
function messageType4Handler(value)
{
    if(value != null)
    {
        bShowType4 = Number(value);
        if(value == 0)
        {
            clearActionKeyMessage();
        }
    }
}
function messageType5Handler(value)
{
    if(value != null)
    {
        bShowType5 = Number(value);
        if(value == 0)
        {
            clearTutorialMessage();
        }
    }
}
function messageType6Handler(value)
{
    if(value != null)
    {
        bShowType6 = Number(value);
    }
}
function messageType9Handler(value)
{
    if(value != null)
    {
        bShowType9 = Number(value);
    }
}
function messageType11Handler(value)
{
    if(value != null)
    {
        bShowType11 = Number(value);
    }
}
function messageType18Handler(value)
{
    if(value != null)
    {
        bShowType18 = Number(value);
    }
}
function debuffMsgHandler(value)
{
    if(value != null)
    {
        bShowDebuffMsg = Number(value);
    }
}
function valueChangeHandler(event)
{
    if(event.key == lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE)
    {
        chatWhisperHandler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE)
    {
        messageType4Handler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE5_VISIBLE)
    {
        messageType5Handler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE)
    {
        messageType6Handler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE)
    {
        messageType9Handler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE)
    {
        messageType11Handler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEI_VISIBLE)
    {
        messageType18Handler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.ABNORMALITY_DEBUFFSHOW_BOOLEAN)
    {
        debuffMsgHandler(Number(event.value));
    }
    else if(event.key == lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN)
    {
        coolTimeAlimHandler(Number(event.value));
    }
}
function getMsg(id)
{
    var _loc2_ = totalMsg_array.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc2_)
    {
        if(totalMsg_array[_loc1_].id == id)
        {
            return totalMsg_array[_loc1_];
        }
        _loc1_ = _loc1_ + 1;
    }
    return null;
}
function getMsgMc(mc)
{
    var _loc2_ = totalMsg_array.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc2_)
    {
        if(totalMsg_array[_loc1_] == mc)
        {
            return totalMsg_array[_loc1_];
        }
        _loc1_ = _loc1_ + 1;
    }
    return null;
}
function removeMsg(id)
{
    var _loc3_ = totalMsg_array.length;
    var _loc2_ = null;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        if(totalMsg_array[_loc1_].id == id)
        {
            _loc2_ = _loc1_;
            break;
        }
        _loc1_ = _loc1_ + 1;
    }
    if(_loc2_ != null)
    {
        totalMsg_array.splice(_loc2_,1);
    }
}
function addCityWarMsg(msg, bgType)
{
    bgType = Number(bgType);
    var _loc1_ = new Object();
    _loc1_.msg = msg;
    _loc1_.bgType = bgType;
    cityWarMsgArray.push(_loc1_);
    checkCityWarMsg();
}
function clearCityWarMsg()
{
    cityWarMsgArray.shift();
    unloadMovie(bfMessageContainer);
    showCityWarMsg();
}
function clearAllCityWarMsg()
{
    unloadMovie(bfMessageContainer);
    bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
    cityWarMsgArray = [];
}
function showCityWarMsg()
{
    unloadMovie(bfMessageContainer);
    if(cityWarMsgArray.length <= 0)
    {
        bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(35);
        return undefined;
    }
    bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(21);
    loadMovie(lib.info.LoadURL.CITYWAR_MESSAGE,bfMessageContainer);
}
function checkCityWarMsg()
{
    if(cityWarMsgArray.length <= 0)
    {
        return undefined;
    }
    if(cityWarMsgArray.length <= 1)
    {
        showCityWarMsg();
    }
}
function keyString(str)
{
    tutorialMsgContainer.txtMc.txt._width = 1800 / lib.info.AlignInfo.scaleRatio;
    tutorialMsgContainer.txtMc.txt._height = 118 / lib.info.AlignInfo.scaleRatio;
    tutorialMsgContainer.txtMc.txt.verticalAlign = "center";
    tutorialMsgContainer.txtMc.txt.htmlText = str;
    var _loc10_ = tutorialMsgContainer.txtMc.txt.text;
    var _loc14_ = "  <font size=\'24\' color=\'#353535\'>";
    var _loc13_ = "</font>  ";
    var _loc2_ = [];
    var _loc3_ = 0;
    var _loc8_ = 0;
    while(_loc3_ != -1)
    {
        _loc3_ = _loc10_.indexOf("{",_loc3_);
        if(_loc3_ == -1 || _loc3_ == undefined)
        {
            break;
        }
        _loc2_.push(_loc3_ + 1 + _loc8_);
        _loc8_ = _loc8_ + 1;
        _loc3_ = _loc10_.indexOf("}",_loc3_);
        _loc2_.push(_loc3_ + 1 + _loc8_);
        _loc8_ = _loc8_ + 1;
    }
    if(_loc2_.length > 0)
    {
        str = lib.util.ExtString.replace(str,"{",_loc14_);
        str = lib.util.ExtString.replace(str,"}",_loc13_);
        tutorialMsgContainer.txtMc.txt.htmlText = str;
    }
    var _loc12_ = Math.min(1804 / lib.info.AlignInfo.scaleRatio,tutorialMsgContainer.txtMc.txt.textWidth + 10);
    var _loc11_ = tutorialMsgContainer.txtMc.txt.textHeight + 5;
    tutorialMsgContainer.txtMc.txt._width = _loc12_;
    tutorialMsgContainer.txtMc.txt._x = (- _loc12_) / 2;
    tutorialMsgContainer.txtMc.keyContainer._x = (- _loc12_) / 2;
    tutorialMsgContainer.txtMc.txt._height = _loc11_;
    tutorialMsgContainer.txtMc.txt._y = - _loc11_ / 2 - 4;
    tutorialMsgContainer.txtMc.keyContainer._y = - _loc11_ / 2 - 4;
    var _loc1_ = 0;
    while(_loc1_ < _loc2_.length)
    {
        str = tutorialMsgContainer.txtMc.txt.text;
        var _loc6_ = tutorialMsgContainer.txtMc.txt.getCharBoundaries(_loc2_[_loc1_]);
        var _loc9_ = tutorialMsgContainer.txtMc.txt.getCharBoundaries(_loc2_[_loc1_ + 1]);
        var _loc4_ = "keyBg";
        if(str.substring(_loc2_[_loc1_] + 1,_loc2_[_loc1_ + 1] - 1) == "MR")
        {
            _loc4_ = "mouseR";
            tutorialMsgContainer.txtMc.txt.replaceText(_loc2_[_loc1_] + 1,_loc2_[_loc1_ + 1] - 1,"  ");
        }
        else if(str.substring(_loc2_[_loc1_] + 1,_loc2_[_loc1_ + 1] - 1) == "ML")
        {
            _loc4_ = "mouseL";
            tutorialMsgContainer.txtMc.txt.replaceText(_loc2_[_loc1_] + 1,_loc2_[_loc1_ + 1] - 1,"  ");
        }
        else if(str.substring(_loc2_[_loc1_] + 1,_loc2_[_loc1_ + 1] - 1) == "MO")
        {
            _loc4_ = "mouseO";
            tutorialMsgContainer.txtMc.txt.replaceText(_loc2_[_loc1_] + 1,_loc2_[_loc1_ + 1] - 1,"  ");
        }
        var _loc5_ = tutorialMsgContainer.txtMc.keyContainer.attachMovie(_loc4_,"keyMc" + _loc1_,_loc1_);
        _loc5_._x = _loc6_.x;
        _loc5_._y = _loc6_.y - 4;
        if(_loc4_ != "mouseR" && _loc4_ != "mouseL" && _loc4_ != "mouseO")
        {
            _loc5_.bg0._width = _loc9_.x - _loc6_.x + 12;
            _loc5_.bg1._width = _loc9_.x - _loc6_.x + 12;
        }
        _loc1_ = _loc1_ + 2;
    }
}
function remakeContainer(target)
{
    var _loc8_ = target._x;
    var _loc6_ = target._y;
    var _loc3_ = target._name;
    var _loc5_ = target.getDepth();
    var _loc4_ = target._xscale;
    var _loc7_ = target._visible;
    var _loc1_ = target._parent.createEmptyMovieClip(_loc3_,_loc5_);
    _loc1_._x = _loc8_;
    _loc1_._y = _loc6_;
    _loc1_._xscale = _loc1_._yscale = _loc4_;
    _loc1_._visible = _loc7_;
    return _loc1_;
}
function clearSectionMessage()
{
    sectionNameMessageContainer.txt.text = 0;
    sectionNameMessageContainer.show = false;
    sectionNameMessageContainer._alpha = 0;
    sectionNameMessageContainer._visible = false;
    sectionNameMessageContainer.ani1.stop();
    sectionNameMessageContainer.ani2.stop();
    sectionNameMessageContainer.ani3.stop();
    sectionNameMessageContainer.ani4.stop();
}
function clearGuardNameMessage()
{
    guardNameMessageContainer.txt.text = 0;
    guardNameMessageContainer.txt2.text = 0;
    guardNameMessageContainer.show = false;
    guardNameMessageContainer._alpha = 0;
    guardNameMessageContainer._visible = false;
    guardNameMessageContainer.ani1.stop();
    guardNameMessageContainer.ani2.stop();
    guardNameMessageContainer.ani3.stop();
    guardNameMessageContainer.ani4.stop();
}
function clearActionKeyMessage()
{
    actionKeyMessageContainer._alpha = 0;
    actionKeyMessageContainer._visible = false;
    actionKeyMessageContainer.type = 4;
}
function clearTutorialMessage()
{
    tutorialMessageContainer.ani1.stop();
    tutorialMessageContainer.ani2.stop();
    tutorialMessageContainer.ani3.stop();
    tutorialMessageContainer.ani4.stop();
    tutorialMessageContainer._visible = false;
    tutorialMessageContainer.txt.text = "";
}
function clearMovieMessage()
{
    movieMessageContainer._alpha = 0;
    movieMessageContainer._visible = false;
    movieMessageContainer.type = 12;
    movieMessageContainer.ani1.stop();
    movieMessageContainer.ani2.stop();
    movieMessageContainer.txt.text = "";
}
function clearRootMessage()
{
    for(slot in rootMessageContainer)
    {
        var _loc1_ = rootMessageContainer[slot];
        if(typeof _loc1_ == "movieclip" && _loc1_ != rootMessageContainer)
        {
            _loc1_.ani1.stop();
            _loc1_.ani2.stop();
            _loc1_.ani3.stop();
            _loc1_.alpha1.stop();
            _loc1_.removeMovieClip();
        }
    }
}
function clearEmblemMessage()
{
    emblemMessageContainer.txt_mc._alpha = 0;
    emblemMessageContainer.emblem._alpha = 0;
    emblemMessageContainer.union._alpha = 0;
    emblemMessageContainer._alpha = 0;
    emblemMessageContainer._visible = false;
    emblemMessageContainer.emblemX = -305.6;
    emblemMessageContainer.emblemY = 95.4;
    emblemMessageContainer.txt_mc.ani1.stop();
    emblemMessageContainer.txt_mc.ani2.stop();
    emblemMessageContainer.txt_mc.ani3.stop();
    emblemMessageContainer.txt_mc.txt.htmlText = "";
    var _loc1_ = 0;
    while(_loc1_ < emblemMsg_array.length)
    {
        emblemMsg_array[_loc1_].mc.removeMovieClip();
        _loc1_ = _loc1_ + 1;
    }
    emblemMsg_array = [];
    emblemMessageContainer.emblem.scaleX1.stop();
    emblemMessageContainer.emblem.scaleX2.stop();
    emblemMessageContainer.emblem.scaleY1.stop();
    emblemMessageContainer.emblem.scaleY2.stop();
    emblemMessageContainer.emblem.ani1.stop();
    emblemMessageContainer.emblem.ani2.stop();
}
function clearLoadingMessage()
{
    loadingMessageContainer._visible = false;
    loadingMessageContainer.txt.text = "";
}
function clearShieldDefenceMessage()
{
    shieldDefenceMessageContainer._alpha = 0;
    shieldDefenceMessageContainer._visible = false;
}
function clearItemNeedMessage()
{
    itemNeedMessageContainer._alpha = 0;
    itemNeedMessageContainer._visible = false;
    itemNeedMessageContainer.type = 17;
}
function setLifeTime(target, lifeTime)
{
    target.cnt = 0;
    target.onEnterFrame = function()
    {
        this.cnt++;
        if(this.cnt >= 24 * lifeTime)
        {
            this._alpha = this._alpha - 3;
            if(this._alpha < 5)
            {
                delete this.onEnterFrame;
                target.removeMovieClip();
                currentNumOfMsg--;
            }
        }
    };
}
function pushedFadeOut(target)
{
    gs.TweenLite.to(target,pushedFadeOutTime,{_alpha:0,ease:Regular.easeOut,onComplete:pushedMotionFinished,onCompleteParams:[target]});
}
function pushedMotionFinished(target)
{
    target.removeMovieClip();
}
function pushMessage(container)
{
    for(mc in container)
    {
        var _loc1_ = container[mc];
        if(typeof container[mc] == "movieclip" && _loc1_ != container)
        {
            _loc1_.currentLine++;
            if(_loc1_.currentLine == 1)
            {
                gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_array[1],_alpha:100,ease:Regular.easeOut});
            }
            else if(_loc1_.currentLine == maxLine)
            {
                gs.TweenMax.to(_loc1_,pushTime,{_y:linesY_array[_loc1_.currentLine],ease:Regular.easeOut,onComplete:pushedFadeOut,onCompleteParams:[_loc1_]});
            }
            else if(_loc1_.currentLine > maxLine)
            {
                pushedMotionFinished(_loc1_);
            }
            else
            {
                gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_array[_loc1_.currentLine],ease:Regular.easeOut});
            }
        }
    }
}
function pushBFMessage(container)
{
    for(mc in container)
    {
        var _loc1_ = container[mc];
        if(typeof container[mc] == "movieclip" && _loc1_ != container)
        {
            _loc1_.currentLine++;
            if(_loc1_.currentLine == 1)
            {
                gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_BFarray[1],_alpha:100,ease:Regular.easeOut});
            }
            else if(_loc1_.currentLine > maxBFLine)
            {
                pushedMotionFinished(_loc1_);
            }
            else if(_loc1_.currentLine == maxBFLine)
            {
                gs.TweenMax.to(_loc1_,pushTime,{_y:linesY_BFarray[_loc1_.currentLine],ease:Regular.easeOut,onComplete:pushedFadeOut,onCompleteParams:[_loc1_]});
            }
            else
            {
                gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_BFarray[_loc1_.currentLine],ease:Regular.easeOut});
            }
        }
    }
}
function addStaticMsg(id, str, bBlink, size, color)
{
    var _loc8_ = staticMessageContainer.getNextHighestDepth();
    var _loc6_ = staticMessageContainer.attachMovie("staticMessage","staticMessage" + _loc8_,_loc8_);
    var _loc4_ = 0;
    while(_loc4_ < 2)
    {
        var _loc2_ = _loc6_["mc" + _loc4_];
        var _loc1_ = _loc2_.createTextField("txt",_loc8_,0,0,0,0);
        _loc1_.shadowStyle = "s{0,-1.5}{-1.4,1.2}{1.4,1.2}t{0,0}";
        _loc1_.shadowColor = 0;
        _loc1_.shadowBlurX = 2;
        _loc1_.shadowBlurY = 2;
        _loc1_.shadowStrength = 1;
        _loc1_.shadowDistance = 0.5;
        _loc1_.shadowAngle = 45;
        var _loc3_ = new TextFormat();
        _loc1_.embedFonts = true;
        _loc3_.align = "center";
        _loc3_.leading = 10;
        if(size != undefined && size != "")
        {
            _loc3_.size = Number(size);
        }
        else
        {
            _loc3_.size = 26;
        }
        _loc3_.color = Number(color);
        _loc3_.font = "$ChatFont";
        _loc1_.setNewTextFormat(_loc3_);
        _loc1_.selectable = false;
        _loc1_.wordWrap = true;
        _loc1_.type = "dynamic";
        _loc1_.multiline = true;
        _loc1_.html = true;
        _loc1_.antiAliasType = "normal";
        _loc1_._width = 1000;
        _loc1_.htmlText = str;
        _loc1_._height = _loc1_.textHeight + 10;
        if(_loc1_.numLines == 1)
        {
            _loc1_._width = _loc1_.textWidth + 5;
        }
        _loc2_.txt.htmlText = _loc2_.txt.htmlText = str;
        _loc2_.txt._height = _loc2_.txt.textHeight + 10;
        if(_loc2_.txt.numLines == 1)
        {
            _loc2_.txt._width = _loc2_.txt.textWidth + 5;
        }
        _loc2_.txt._x = (- _loc2_.txt._width) / 2;
        _loc4_ = _loc4_ + 1;
    }
    _loc6_.id = id;
    _loc6_.type = 3;
    _loc6_._alpha = 100;
    _loc6_.currentLine = 0;
    _loc6_.cnt = 0;
    if(bBlink == "1")
    {
        blink(_loc6_);
    }
    var _loc9_ = 0;
    _loc4_ = 0;
    while(_loc4_ < staticMsg_array.length)
    {
        _loc9_ = _loc9_ + staticMsg_array[_loc4_]._height;
        _loc4_ = _loc4_ + 1;
    }
    _loc6_._y = _loc9_;
    staticMsg_array.push(_loc6_);
    totalMsg_array.push(_loc6_);
    return _loc6_;
}
function blink(target)
{
    lib.util.Warning.add(target);
}
function removeStaticMsg(id)
{
    var _loc1_ = getMsg(id);
    var _loc5_ = Number(_loc1_._name.substr(7));
    var _loc2_ = _loc1_._height;
    gs.TweenLite.killTweensOf(_loc1_,false);
    gs.TweenLite.to(_loc1_,0.5,{_alpha:0,_y:_loc1_._y - 20,ease:Strong.easeOut,onComplete:msgFinished,onCompleteParams:[_loc1_,_loc2_]});
}
function msgFinished(target, height)
{
    for(mc in staticMessageContainer)
    {
        var _loc1_ = staticMessageContainer[mc];
        if(typeof _loc1_ == "movieclip")
        {
            if(_loc1_.getDepth() > depth)
            {
                gs.TweenLite.killTweensOf(_loc1_,false);
                gs.TweenLite.to(_loc1_,0.5,{_y:_loc1_._y - height,ease:Strong.easeOut});
            }
        }
    }
    var _loc5_ = null;
    var _loc2_ = 0;
    while(_loc2_ < staticMsg_array.length)
    {
        if(staticMsg_array[_loc2_] == target)
        {
            _loc5_ = _loc2_;
        }
        _loc2_ = _loc2_ + 1;
    }
    staticMsg_array.splice(_loc5_,1);
    lib.util.Warning.remove(target);
    target.removeMovieClip();
}
function aniFinished_1(target, fun)
{
    fun();
    gs.TweenLite.to(target,0.3,{_alpha:100,onComplete:aniFinished_2,onCompleteParams:[target]});
}
function aniFinished_2(target)
{
    gs.TweenLite.to(target,0.5,{delay:3,_alpha:0,onComplete:aniFinished_3,onCompleteParams:[target]});
}
function aniFinished_3(target)
{
    target.show = false;
    target._visible = false;
}
function aniFinished_4(target)
{
    target._visible = false;
}
function showOneLineMsg(target, bShow, fun)
{
    gs.TweenLite.killTweensOf(target,false);
    if(bShow)
    {
        target._visible = true;
        gs.TweenLite.to(target,0.3,{_alpha:0,onComplete:aniFinished_1,onCompleteParams:[target,fun]});
        target.show = true;
    }
    else
    {
        gs.TweenLite.to(target,0.5,{_alpha:0,onComplete:aniFinished_4,onCompleteParams:[target]});
        target.show = false;
    }
    return target;
}
function showFKey(bShow, msg, type, name)
{
    gs.TweenLite.killTweensOf(actionKeyMessageContainer,false);
    if(bShow)
    {
        actionKeyMessageContainer._visible = true;
        gs.TweenLite.to(actionKeyMessageContainer,0.3,{_alpha:0,onComplete:actionKeyMessageFinished,onCompleteParams:[msg]});
        if(getMsgMc(actionKeyMessageContainer) == null)
        {
            totalMsg_array.push(actionKeyMessageContainer);
        }
    }
    else
    {
        gs.TweenLite.to(actionKeyMessageContainer,0.3,{_alpha:0,onComplete:actionKeyMessageFinished2});
    }
    return actionKeyMessageContainer;
}
function actionKeyMessageFinished(msg)
{
    actionKeyMessageContainer.txt.htmlText = msg;
    actionKeyMessageContainer.txt._x = (- actionKeyMessageContainer.txt._width) / 2;
    actionKeyMessageContainer.name_txt._x = (- actionKeyMessageContainer.name_txt._width) / 2;
    gs.TweenLite.to(actionKeyMessageContainer,0.5,{_alpha:100});
}
function actionKeyMessageFinished2()
{
    actionKeyMessageContainer._visible = false;
}
function showTutorialMsg(bShow, msg, delay)
{
    gs.TweenLite.killTweensOf(tutorialMessageContainer,false);
    if(bShow)
    {
        if(delay == undefined)
        {
            delay = rewardEndTime;
        }
        tutorialMessageContainer._visible = true;
        gs.TweenLite.to(tutorialMessageContainer,0.2,{_alpha:0,onComplete:tutorialFinished1,onCompleteParams:[msg,delay]});
    }
    else
    {
        gs.TweenLite.to(tutorialMessageContainer,0.5,{_alpha:0,onComplete:tutorialFinished4});
    }
}
function tutorialFinished1(msg, delay)
{
    tutorialMessageContainer.txt.htmlText = msg;
    tutorialMessageContainer.txt._x = (- tutorialMessageContainer.txt.textWidth) / 2;
    tutorialMessageContainer.symbol._x = tutorialMessageContainer.txt._x - 50;
    tutorialMessageContainer.symbol._y = tutorialMessageContainer.txt._y - 5;
    tutorialMessageContainer.symbol.gotoAndPlay(2);
    gs.TweenLite.to(tutorialMessageContainer,0.5,{_alpha:100,onComplete:tutorialFinished2,onCompleteParams:[delay]});
}
function tutorialFinished2(delay)
{
    if(delay == undefined || delay == "")
    {
        delay = 3;
    }
    gs.TweenLite.to(tutorialMessageContainer,0.5,{delay:delay,_alpha:0,onComplete:tutorialFinished3});
}
function tutorialFinished3()
{
    tutorialMessageContainer._visible = false;
}
function tutorialFinished4()
{
    tutorialMessageContainer.symbol.gotoAndStop(1);
    tutorialMessageContainer._visible = false;
}
function addRootItem(id, img, enchantNum, itemName, quantity, grade, sealType, bMasterpiece)
{
    var _loc7_ = rootMessageContainer.getNextHighestDepth();
    var _loc3_ = rootMessageContainer.attachMovie("Slot3_link","root" + _loc7_,_loc7_);
    _loc3_.id = id;
    _loc3_.TEX = img;
    var _loc5_ = "";
    enchantNum = Number(enchantNum);
    quantity = Number(quantity);
    grade = Number(grade);
    _loc3_.draw(img);
    _loc3_.display = true;
    _loc3_.grade = grade;
    _loc3_.drag = fale;
    _loc3_.setLineNum(1);
    _loc3_.sealType = sealType;
    _loc3_.masterpiece = bMasterpiece;
    _loc3_.onEnterFrame = function()
    {
        if(this.TEX != undefined)
        {
            this.sealType = this.sealType;
            this.masterpiece = this.masterpiece;
            delete this.onEnterFrame;
        }
    };
    _loc3_.setDisableBg(true);
    if(enchantNum > 0)
    {
        _loc5_ = "+" + enchantNum + " ";
    }
    _loc5_ = _loc5_ + itemName;
    if(quantity > 1)
    {
        _loc5_ = _loc5_ + ("(" + quantity + ")");
    }
    _loc3_.upText = _loc5_;
    _loc3_._alpha = 0;
    _loc3_._y = _loc3_._y + 60;
    var _loc4_ = rootItem_array.length;
    var _loc2_ = 0;
    while(_loc2_ < _loc4_)
    {
        gs.TweenMax.to(rootItem_array[_loc2_],0.5,{_y:_loc2_ * -60 - 60,ease:Regular.easeOut});
        _loc2_ = _loc2_ + 1;
    }
    gs.TweenLite.killTweensOf(_loc3_,false);
    gs.TweenLite.to(_loc3_,0.5,{_y:_loc3_._y - 60,_alpha:100,ease:Regular.easeOut,onComplete:rootItemFinished1,onCompleteParams:[_loc3_]});
    rootItem_array.unshift(_loc3_);
}
function rootItemFinished1(target)
{
    gs.TweenMax.to(target,3,{delay:2,_alpha:0,ease:Regular.easeOut,onComplete:rootItemFinished2,onCompleteParams:[target]});
}
function rootItemFinished2(target)
{
    target.removeMovieClip();
    rootItem_array.pop();
}
function addEmblemMsg(bShow, msg, type, args)
{
    type = Number(type);
    if(bShow)
    {
        var _loc1_ = new Object();
        _loc1_.TYPE = type;
        _loc1_.MSG = msg;
        _loc1_.ARGS = args;
        emblemMsg_array.push(_loc1_);
        checkEmblemShow();
    }
}
function checkEmblemShow()
{
    var _loc5_ = emblemMsg_array.length;
    var _loc2_ = emblemMsg_array[_loc5_ - 1];
    if(_loc5_ <= 0)
    {
        gs.TweenMax.to(emblemMessageContainer,0.5,{_alpha:0,ease:Regular.easeOut,onComplete:emblemMessageFinished4});
    }
    else if(_loc5_ == 1)
    {
        if(_loc2_.TYPE == 25)
        {
            curType = 25;
            emblemMessageContainer.union._visible = true;
            emblemMessageContainer.emblem._visible = false;
            if(bAttach == false)
            {
                lib.util.DrawBitmap.draw(emblemMessageContainer.union,_loc2_.ARGS,100,100);
                bAttach = true;
            }
        }
        else
        {
            curType = _loc2_.TYPE;
            emblemMessageContainer.union._visible = false;
            emblemMessageContainer.emblem._visible = true;
        }
        emblemMessageContainer.alpha1.stop();
        emblemMessageContainer._visible = true;
        emblemMessageContainer.emblem._alpha = 0;
        emblemMessageContainer.union._alpha = 0;
        emblemMessageContainer.txt_mc._alpha = 0;
        gs.TweenMax.to(emblemMessageContainer,0.3,{_alpha:100,ease:Regular.easeOut});
        rotateEmblemMsg();
        rotateEmblem();
    }
    else
    {
        var _loc4_ = emblemMessageContainer.getNextHighestDepth();
        var _loc1_ = null;
        if(_loc2_.TYPE == 25)
        {
            _loc1_ = emblemMessageContainer.attachMovie("union","mini" + _loc4_,_loc4_);
            lib.util.DrawBitmap.draw(_loc1_,_loc2_.ARGS,100,100);
            if(bAttach == false)
            {
                lib.util.DrawBitmap.draw(emblemMessageContainer.union,_loc2_.ARGS,100,100);
                bAttach = true;
            }
        }
        else
        {
            _loc1_ = emblemMessageContainer.attachMovie("emblem","mini" + _loc4_,_loc4_);
        }
        var _loc3_ = _loc2_.TYPE;
        _loc2_.mc = _loc1_;
        if(_loc3_ == 8)
        {
            _loc1_.gotoAndStop(1);
        }
        else if(_loc3_ == 9)
        {
            _loc1_.gotoAndStop(4 + Number(_loc2_.ARGS));
        }
        else if(_loc3_ == 10)
        {
            _loc1_.gotoAndStop(2);
        }
        else if(_loc3_ == 13)
        {
            _loc1_.gotoAndStop(3);
        }
        else if(_loc3_ == 15)
        {
            _loc1_.gotoAndStop(7);
        }
        else if(_loc3_ == 24)
        {
            _loc1_.gotoAndStop(8);
        }
        _loc1_._alpha = 0;
        _loc1_._x = emblemMessageContainer.emblemX;
        _loc1_._y = emblemMessageContainer.emblemY;
    }
}
function rotateEmblemMsg()
{
    if(emblemMsg_array[0].TYPE == 15)
    {
        lib.manager.UISound.play(Number(emblemMsg_array[0].ARGS));
    }
    gs.TweenLite.to(emblemMessageContainer.txt_mc,0.2,{_alpha:0,onComplete:emblemMessageFinished});
}
function emblemMessageFinished()
{
    var _loc1_ = emblemMsg_array[0].MSG;
    if(!emblemMessageContainer.emblem._visible || emblemMessageContainer.emblem._currentframe > 13)
    {
        emblemMessageContainer.txt_mc.gotoAndStop(2);
    }
    else
    {
        emblemMessageContainer.txt_mc.gotoAndStop(1);
    }
    emblemMessageContainer.txt_mc.txt.verticalAlign = "center";
    emblemMessageContainer.txt_mc.txt.textAutoSize = "shrink";
    emblemMessageContainer.txt_mc.txt.setText(_loc1_);
    gs.TweenLite.to(emblemMessageContainer.txt_mc,0.3,{_alpha:100,onComplete:emblemMessageFinished2});
}
function emblemMessageFinished2()
{
    var _loc2_ = emblemMsg_array[0].TYPE;
    var _loc1_ = 2.5;
    if(_loc2_ == 8)
    {
        _loc1_ = 5;
    }
    gs.TweenLite.to(emblemMessageContainer.txt_mc,_loc1_,{_alpha:100,onComplete:emblemMessageFinished3});
}
function emblemMessageFinished3()
{
    emblemMsg_array.shift();
    if(emblemMsg_array.length > 0)
    {
        rotateEmblemMsg();
        rotateEmblem();
    }
    else
    {
        checkEmblemShow();
    }
}
function emblemMessageFinished4()
{
    emblemMessageContainer._visible = false;
}
function rotateEmblem()
{
    var _loc1_ = 0;
    while(_loc1_ < emblemMsg_array.length)
    {
        var _loc2_ = emblemMsg_array[_loc1_].mc;
        gs.TweenLite.killTweensOf(_loc2_,false);
        if(_loc1_ != 0)
        {
            if(_loc1_ == 1 || _loc1_ == 2)
            {
            }
        }
        _loc1_ = _loc1_ + 1;
    }
    rotateEmblemFinished2();
}
function rotateEmblemFinished(target)
{
    target.removeMovieClip();
}
function rotateEmblemFinished2()
{
    var _loc2_ = emblemMsg_array[0].TYPE;
    var _loc3_ = undefined;
    if(_loc2_ == 25)
    {
        emblemMessageContainer.union._visible = true;
        emblemMessageContainer.emblem._visible = false;
        _loc3_ = emblemMessageContainer.union;
    }
    else
    {
        emblemMessageContainer.union._visible = false;
        emblemMessageContainer.emblem._visible = true;
        _loc3_ = emblemMessageContainer.emblem;
    }
    emblemMessageContainer.emblem.txt.text = msg;
    if(_loc2_ == 8)
    {
        emblemMessageContainer.emblem.gotoAndStop(1);
    }
    else if(_loc2_ == 9)
    {
        var _loc1_ = Number(emblemMsg_array[0].ARGS);
        achievementEffectType = _loc1_;
        unload(achievementEffectContainer);
        if(_loc1_ == 6 || _loc1_ == 1 || _loc1_ == 2 || _loc1_ == 3)
        {
            achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Rare.swf");
        }
        else if(_loc1_ == 7 || _loc1_ == 4 || _loc1_ == 5)
        {
            achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Unique.swf");
        }
        emblemMessageContainer.emblem.gotoAndStop(8 + _loc1_);
    }
    else if(_loc2_ == 10)
    {
        emblemMessageContainer.emblem.gotoAndStop(2);
    }
    else if(_loc2_ == 13)
    {
        emblemMessageContainer.emblem.gotoAndStop(3);
    }
    else if(_loc2_ == 15)
    {
        emblemMessageContainer.emblem.gotoAndStop(7);
    }
    else if(_loc2_ == 24)
    {
        emblemMessageContainer.emblem.gotoAndStop(8);
    }
    gs.TweenLite.killTweensOf(_loc3_,false);
    _loc3_._alpha = 0;
    gs.TweenLite.to(_loc3_,0.2,{_alpha:100,ease:Back.easeOut});
}
function addMovieMsg(bShow, msg)
{
    gs.TweenLite.killTweensOf(movieMessageContainer,false);
    if(bShow)
    {
        movieMessageContainer._visible = true;
        gs.TweenLite.to(movieMessageContainer,0.2,{_alpha:0,onComplete:movieMessageFinished,onCompleteParams:[msg]});
        if(getMsgMc(movieMessageContainer) == null)
        {
            totalMsg_array.push(movieMessageContainer);
        }
    }
    else
    {
        gs.TweenLite.to(movieMessageContainer,0.5,{_alpha:0,onComplete:movieMessageFinished2});
    }
    return movieMessageContainer;
}
function movieMessageFinished(msg)
{
    movieMessageContainer.txt.text = msg;
    movieMessageContainer.txt._x = (- movieMessageContainer.txt._width) / 2;
    gs.TweenLite.killTweensOf(movieMessageContainer,false);
    gs.TweenLite.to(movieMessageContainer,0.5,{_alpha:100});
}
function movieMessageFinished2()
{
    movieMessageContainer._visible = false;
}
function showLoadingMsg(id, msg)
{
    loadingMessageContainer.type = 14;
    loadingMessageContainer._visible = true;
    loadingMessageContainer.id = id;
    loadingMessageContainer.txt.htmlText = msg;
    loadingMessageContainer.txt._x = (- loadingMessageContainer.txt._width) / 2;
    if(getMsgMc(loadingMessageContainer) == null)
    {
        totalMsg_array.push(loadingMessageContainer);
    }
}
function showDefenseMsg(bShow, _msg, _type)
{
    gs.TweenLite.killTweensOf(shieldDefenceMessageContainer,false);
    if(bShow)
    {
        shieldDefenceMessageContainer.gotoAndStop(Number(_type) + 1);
        shieldDefenceMessageContainer.txt.text = shield_Str[_type];
        shieldDefenceMessageContainer.txt0.htmlText = _msg;
        shieldDefenceMessageContainer._alpha = 100;
        if(shieldDefenceMessageContainer._visible)
        {
            shieldDefenceMessageContainer.effect.gotoAndPlay(1);
        }
        else
        {
            shieldDefenceMessageContainer._visible = true;
            shieldDefenceMessageContainer.effect.gotoAndPlay(1);
        }
        gs.TweenLite.to(shieldDefenceMessageContainer,0.5,{_alpha:100,onComplete:DefenceMessageFinished});
    }
    else
    {
        gs.TweenLite.to(shieldDefenceMessageContainer,2.5,{_alpha:0,onComplete:DefenceMessageFinished2});
    }
    return shieldDefenceMessageContainer;
}
function DefenceMessageFinished()
{
    showDefenseMsg(false);
}
function DefenceMessageFinished2()
{
    shieldDefenceMessageContainer._visible = false;
}
function showItemNeedMsg(bShow, msg, type, itemId, itemImg, itemGrade, sealType, bMasterpiece)
{
    gs.TweenLite.killTweensOf(itemNeedMessageContainer,false);
    if(bShow)
    {
        var _loc1_ = itemNeedMessageContainer.slot;
        _loc1_.id = itemId;
        _loc1_.TEX = itemImg;
        _loc1_.draw(itemImg);
        _loc1_.display = true;
        _loc1_.grade = Number(itemGrade);
        _loc1_.drag = false;
        _loc1_.effect = false;
        _loc1_.sealType = sealType;
        _loc1_.masterpiece = bMasterpiece;
        itemNeedMessageContainer._visible = true;
        gs.TweenLite.to(itemNeedMessageContainer,0.2,{_alpha:0,onComplete:itemNeedMessageFinished,onCompleteParams:[type,msg]});
        if(getMsgMc(itemNeedMessageContainer) == null)
        {
            totalMsg_array.push(itemNeedMessageContainer);
        }
    }
    else
    {
        gs.TweenLite.to(itemNeedMessageContainer,0.2,{_alpha:0,onComplete:itemNeedMessageFinished2});
    }
    return itemNeedMessageContainer;
}
function itemNeedMessageFinished(type, msg)
{
    itemNeedMessageContainer.gotoAndStop(Number(type) + 1);
    if(itemNeedMessageContainer._currentframe == 1)
    {
        itemNeedMessageContainer.txt._visible = true;
        itemNeedMessageContainer.txt2._visible = false;
    }
    else
    {
        itemNeedMessageContainer.txt._visible = false;
        itemNeedMessageContainer.txt2._visible = true;
    }
    itemNeedMessageContainer.txt.autoSize = true;
    itemNeedMessageContainer.txt.htmlText = msg;
    itemNeedMessageContainer.txt._x = (- itemNeedMessageContainer.txt._width) / 2;
    itemNeedMessageContainer.slot._x = itemNeedMessageContainer.txt._x - itemNeedMessageContainer.slot._width - 5;
    itemNeedMessageContainer.txt2.autoSize = true;
    itemNeedMessageContainer.txt2.htmlText = msg;
    itemNeedMessageContainer.txt2._x = (- itemNeedMessageContainer.txt2._width) / 2;
    itemNeedMessageContainer.slot._x = itemNeedMessageContainer.txt2._x - itemNeedMessageContainer.slot._width - 5;
    itemNeedMessageContainer.shadow._x = itemNeedMessageContainer.slot._x - 1;
    gs.TweenLite.to(itemNeedMessageContainer,0.5,{_alpha:100});
}
function itemNeedMessageFinished2()
{
    itemNeedMessageContainer._visible = false;
}
function GuildWarMotion_Init()
{
    UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
    UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
    UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
    UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
    UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
}
function GuildWarMotion_Request()
{
    var _loc1_ = {};
    var _loc2_ = new MovieClipLoader();
    _loc2_.addListener(_loc1_);
    _loc2_.loadClip("/package/S1UIRES_Effect.GuildWarMotion.swf",UI.GuildWarMotionMc);
    _loc1_.onLoadComplete = function(target_mc, status)
    {
    };
}
function addBFMsg(str, _colorType, _iconType, _fontSizeType, _existTime, container)
{
    var _loc4_ = container.getNextHighestDepth();
    var _loc1_ = new MovieClip();
    var _loc3_ = "";
    _fontSizeType = Number(_fontSizeType);
    _existTime = Number(_existTime);
    _fontSizeType = !isNaN(_fontSizeType)?_fontSizeType:0;
    var _loc10_ = 0 != _fontSizeType?60:40;
    var _loc12_ = !isNaN(_existTime)?_existTime + Number(pushTime):defaultLifeTime;
    var _loc6_ = 0;
    if(_colorType == 0)
    {
        _loc1_ = container.attachMovie("BFmessage_Red","message" + _loc4_,_loc4_);
        if(_iconType == 0 || _iconType == 1 || _iconType == 2)
        {
            _loc3_ = "<img src=\'redIcon_" + _iconType + "\' width=\'64\' height=\'64\' vspace=\'-15\'>";
        }
        else if(_iconType == 3 || _iconType == -1)
        {
            _loc1_.txt._y = _loc1_.txt._y + 15;
            _loc1_.effectMc.txt._y = _loc1_.effectMc.txt._y + 15;
            _loc6_ = 5;
        }
        else if(_iconType != "" && _iconType != undefined)
        {
            _loc3_ = "<img src=\'img://__" + _iconType + "\' width=\'64\' height=\'64\' vspace=\'-15\'>";
        }
    }
    else if(_colorType == 1)
    {
        _loc1_ = container.attachMovie("BFmessage_Blue","message" + _loc4_,_loc4_);
        if(_iconType == 0 || _iconType == 1 || _iconType == 2)
        {
            _loc3_ = "<img src=\'blueIcon_" + _iconType + "\' width=\'64\' height=\'64\' vspace=\'-15\'>";
        }
        else if(_iconType == 3 || _iconType == -1)
        {
            _loc1_.txt._y = _loc1_.txt._y + 15;
            _loc1_.effectMc.txt._y = _loc1_.effectMc.txt._y + 15;
            _loc6_ = 5;
        }
        else if(_iconType != "" && _iconType != undefined)
        {
            _loc3_ = "<img src=\'img://__" + _iconType + "\' width=\'64\' height=\'64\' vspace=\'-15\'>";
        }
    }
    else if(_colorType == 2)
    {
        _loc1_ = container.attachMovie("BFmessage_Orange","message" + _loc4_,_loc4_);
        if(_iconType == 0 || _iconType == 1 || _iconType == 2)
        {
            _loc3_ = "<img src=\'orangeIcon_" + _iconType + "\' width=\'64\' height=\'64\' vspace=\'-15\'>";
        }
        else if(_iconType == 3 || _iconType == -1)
        {
            _loc1_.txt._y = _loc1_.txt._y + 15;
            _loc1_.effectMc.txt._y = _loc1_.effectMc.txt._y + 15;
            _loc6_ = 5;
        }
        else if(_iconType != "" && _iconType != undefined)
        {
            _loc3_ = "<img src=\'img://__" + _iconType + "\' width=\'64\' height=\'64\' vspace=\'-15\'>";
        }
    }
    _loc1_._y = 0;
    _loc1_._alpha = 0;
    _loc1_.currentLine = 0;
    _loc1_.cnt = 0;
    if(_iconType == 1)
    {
        _loc1_.txt.textColor = Ox000000;
        _loc1_.effectMc.txt.textColor = Ox000000;
    }
    var _loc7_ = 2600;
    _loc1_.txt._width = _loc7_ >> 1;
    _loc1_.txt.htmlText = "<font size=\'" + _loc10_ + "\'>" + _loc3_ + str + "</font>";
    _loc1_.txt.multiline = true;
    _loc1_.txt.autoSize = true;
    _loc1_.txt.wordWrap = true;
    _loc1_.effectMc.txt._width = _loc7_ >> 1;
    _loc1_.effectMc.txt.htmlText = "<font size=\'" + _loc10_ + "\'>" + _loc3_ + str + "</font>";
    _loc1_.effectMc.txt.multiline = true;
    _loc1_.effectMc.txt.autoSize = true;
    _loc1_.effectMc.txt.wordWrap = true;
    _loc1_.txt._y = - _loc1_.txt._height / 2;
    _loc1_.effectMc._y = - _loc1_.txt._height / 2;
    var _loc14_ = _loc7_ >> 1;
    var _loc9_ = (- _loc14_) / 2 + _loc6_;
    _loc1_.txt._x = _loc9_;
    _loc1_.effectMc.txt._x = _loc9_;
    _loc1_.cnt = 0;
    setLifeTime(_loc1_,_loc12_);
    pushBFMessage(container);
}
function SetMultiply(_targetMc, _num)
{
    if(_num > 1)
    {
        _targetMc._visible = true;
        _targetMc.txt.text = _num;
        _targetMc.mc._x = 30 - _targetMc.txt.textWidth / 2;
    }
    else
    {
        _targetMc._visible = false;
    }
}
function NewMessagePostionChange()
{
    newMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    for(var _loc2_ in newMessageContainer)
    {
        if(typeof newMessageContainer[_loc2_] == "movieclip")
        {
            var _loc1_ = newMessageContainer[_loc2_];
            _loc1_._y = lib.info.AlignInfo.yRatioToPixel(_loc1_.yPos) * 1.25;
        }
    }
}
function SyetemMessage(titleStr, contentStr, buttonGuide, clearID)
{
    newMessageContainer.systemMc.Bg.removeMovieClip();
    newMessageContainer.systemMc.removeMovieClip();
    var _loc2_ = newMessageContainer.attachMovie("mContaienr","systemMc",systemStyle[2]);
    _loc2_.id = clearID;
    _loc2_.yPos = systemStyle[1];
    _loc2_._y = lib.info.AlignInfo.yRatioToPixel(_loc2_.yPos) * 1.25;
    _loc2_._alpha = 0;
    var _loc9_ = titleStr.split("\t");
    var _loc14_ = Number(_loc9_[2]) + 1;
    var _loc12_ = systemTime;
    var _loc10_ = _loc2_.attachMovie("systemBg","Bg",_loc2_.getNextHighestDepth());
    _loc10_.gotoAndStop(_loc14_);
    _loc10_.ani.gotoAndPlay(1);
    var _loc8_ = lib.display.TextBuilder.draw(_loc2_,"txt0",-180,-21,360,30,centerTxt);
    var _loc4_ = lib.display.TextBuilder.draw(_loc2_,"txt1",-180,7,360,64,subTxt);
    _loc4_.verticalAlign = "top";
    _loc8_.setText(_loc9_[0]);
    _loc4_.setText(_loc9_[1]);
    _loc8_._visible = true;
    _loc4_._visible = true;
    _loc8_._alpha = 0;
    _loc4_._alpha = 0;
    gs.TweenMax.to(_loc8_,0.1,{delay:0.2,_alpha:100});
    gs.TweenMax.to(_loc4_,0.1,{delay:0.2,_alpha:100});
    var _loc11_ = 25 + _loc4_.textHeight;
    if(contentStr != "" && contentStr != undefined)
    {
        var _loc7_ = lib.display.TextBuilder.draw(_loc2_,"txt2",-180,_loc11_,360,25,subTxt2);
        _loc7_.htmlText = contentStr;
        _loc7_._visible = true;
        _loc7_._alpha = 0;
        gs.TweenMax.to(_loc7_,0.1,{delay:0.2,_alpha:100});
    }
    if(buttonGuide != "" && buttonGuide != undefined)
    {
        _loc12_ = systemLongTime;
        var _loc3_ = _loc2_.attachMovie("btnMc","btnMc",_loc2_.getNextHighestDepth());
        var _loc5_ = buttonGuide.split("\t");
        _loc3_.idx = _loc5_[0];
        _loc3_.txt.verticalAlign = "center";
        var _loc6_ = SetKey(_loc5_[1],_loc3_.txt);
        if(_loc6_ !== undefined && _loc6_ !== "")
        {
            var _loc13_ = _loc5_[2] + " ( " + _loc6_ + " )";
            if(_loc6_.length > 4)
            {
                _loc13_ = _loc5_[2] + "<br> ( " + _loc6_ + " )";
            }
            _loc3_.txt.setText(_loc13_);
        }
        else
        {
            _loc3_.txt.setText(_loc5_[2]);
        }
        _loc3_._x = -75;
        _loc3_._y = _loc11_ + 10;
        if(_loc2_.txt2)
        {
            _loc3_._y = _loc2_.txt2._y + _loc2_.txt2.textHeight + 10;
        }
        _loc3_.onRelease = function()
        {
            this.gotoAndStop(1);
            MessageClear(newMessageContainer.systemMc,0);
            ToGame_Message_ButtonClick(this.idx);
        };
        _loc3_.onPress = function()
        {
            this.gotoAndStop(3);
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
    gs.TweenMax.to(_loc2_,0.5,{_alpha:100,onComplete:MessageClear,onCompleteParams:[_loc2_,_loc12_]});
}
function RewardMessage()
{
    var _loc4_ = rewardBox.length;
    if(_loc4_ == 0)
    {
        clearInterval(RewardInterval);
        RewardInterval = null;
        return undefined;
    }
    var _loc1_ = rewardWave;
    if(newMessageContainer.systemMc)
    {
        _loc1_ = rewardWave2;
    }
    var _loc2_ = rewardBox[0];
    var _loc3_ = CreateMessageBox(newMessageContainer.rewardMc,rewardIdx,_loc2_.tStr,_loc2_.rStr,_loc2_.G);
    rewardIdx = (rewardIdx + 1) % (rewardMax + 1);
    gs.TweenMax.to(_loc3_,0.5,{delay:_loc1_,_alpha:100,onComplete:MessageClear,onCompleteParams:[_loc3_,rewardEndTime]});
    rewardBox.shift();
    RotationMessageBox(_loc1_);
}
function RotationMessageBox(waveDelay)
{
    rewardCount = 0;
    var _loc1_ = 0;
    while(_loc1_ < rewardMax + 1)
    {
        var _loc4_ = (rewardIdx + rewardMax - _loc1_) % (rewardMax + 1);
        var _loc2_ = newMessageContainer.rewardMc["messageBox" + _loc4_];
        if(_loc2_)
        {
            var _loc3_ = _loc1_ * 66;
            if(_loc1_ == rewardMax)
            {
                gs.TweenMax.killTweensOf(_loc2_,false);
                gs.TweenMax.to(_loc2_,0.3,{delay:waveDelay,_y:_loc3_,_alpha:0,onComplete:MessageClear,onCompleteParams:[mc,0.1]});
            }
            else
            {
                gs.TweenLite.to(_loc2_,0.3,{delay:waveDelay,_y:_loc3_,ease:Regular.easeOut});
            }
        }
        _loc1_ = _loc1_ + 1;
    }
}
function ToGame_Message_ButtonClick(idx)
{
    getURL("FSCommand:ToGame_Message_ButtonClick",idx);
}
function CreateMessageBox(mc, idx, typeStr, rewardStr, keyGuide)
{
    var _loc3_ = mc.attachMovie("messageBox","messageBox" + idx,idx);
    _loc3_.typeTxt.verticalAlign = "center";
    _loc3_.typeTxt.htmlText = typeStr;
    _loc3_._alpha = 0;
    _loc3_.btn.txt.autoSize = true;
    lib.display.DrawBitmapData.draw(_loc3_,rewardBg,-256,0,0,0,512,64,1);
    var _loc18_ = 275;
    if(keyGuide == undefined || keyGuide == "")
    {
        _loc3_.btn._visible = false;
        _loc18_ = 325;
    }
    else
    {
        var _loc23_ = keyGuide.split("\t");
        if(_loc23_[2])
        {
            lib.display.DrawBitmapData.draw(_loc3_,_loc23_[2],172,0,0,0,64,64,1);
            _loc3_.btn._visible = false;
        }
        else
        {
            var _loc22_ = SetKey(_loc23_[1],_loc3_.btn.txt);
            if(_loc22_ !== undefined && _loc22_ !== "")
            {
                _loc3_.btn.txt.setText(_loc22_);
                if(_loc22_.length > 1)
                {
                    _loc3_.btn.bg0._width = _loc3_.btn.bg1.bg1._width = _loc3_.btn.txt.textWidth + 15;
                }
                else
                {
                    _loc3_.btn.txt._x = 7;
                }
                _loc3_.btn._visible = true;
            }
        }
    }
    var _loc12_ = rewardStr.split("\t");
    var _loc4_ = -130;
    var _loc21_ = 0;
    var _loc19_ = 16777215;
    var _loc2_ = 0;
    while(_loc2_ < _loc12_.length)
    {
        var _loc5_ = _loc12_[_loc2_];
        var _loc13_ = _loc5_.substring(1,5);
        if(_loc13_ == "item")
        {
            var _loc16_ = _loc5_.indexOf("<");
            var _loc17_ = _loc5_.indexOf(">") + 1;
            var _loc15_ = _loc5_.substring(_loc16_,_loc17_);
            var _loc6_ = lib.util.ExtString.findTag(_loc15_,"item");
            var _loc14_ = _loc6_[0].src;
            var _loc8_ = Number(_loc6_[0].grade);
            var _loc11_ = Number(_loc6_[0].count);
            var _loc9_ = Number(_loc6_[0].scale);
            var _loc10_ = BITMAP_RESIZE;
            if(_loc9_)
            {
                _loc10_ = 64 / _loc9_;
            }
            lib.display.DrawBitmapData.draw(_loc3_,_loc14_,_loc4_,0,0,0,64,64,_loc10_);
            if(_loc11_ > 1)
            {
                var _loc7_ = lib.display.TextBuilder.draw(_loc3_,"amount",_loc4_ + 1,38,56,25,amountTxt);
                _loc7_.text = _loc11_;
                _loc7_.textAutoSize = "shrink";
                _loc7_._visible = true;
            }
            if(_loc8_ > 0)
            {
                lib.display.DrawBitmapData.draw(_loc3_,UI["gradeBm" + _loc8_],_loc4_,0,0,0,16,16,1);
                _loc19_ = gradeFontColor[_loc8_];
            }
            _loc4_ = _loc4_ + 68;
            _loc18_ = _loc18_ - 68;
        }
        else
        {
            var _loc1_ = lib.display.TextBuilder.draw(_loc3_,"txt" + _loc2_,_loc4_,0,_loc18_,68,subTxt3);
            _loc1_.verticalAlign = "center";
            _loc1_.shadowColor = _loc21_;
            _loc1_.textColor = _loc19_;
            _loc1_.multiline = true;
            var _loc20_ = _loc1_.setText(_loc12_[_loc2_]);
            _loc1_._visible = true;
            _loc4_ = _loc4_ + _loc1_._width;
        }
        _loc2_ = _loc2_ + 1;
    }
    return _loc3_;
}
function SetTxt(subTxt, str)
{
    subTxt.verticalAlign = "center";
    subTxt.shadowColor = shadowColorType;
    subTxt.textColor = fontColorType;
    subTxt.setText(str);
    subTxt._visible = true;
    subTxt._width = subTxt.textWidth + 5;
    textPos = textPos + subTxt._width;
}
function MessageClear(mc, timer)
{
    gs.TweenMax.to(mc,1,{delay:timer,_alpha:0,onComplete:function()
    {
        mc.removeMovieClip();
    }});
}
function SetKey(keyCode, txt)
{
    var _loc1_ = lib.info.KeyMap.toKeyCode(keyCode);
    if(lib.util.ExtString.isOverLenght(txt,_loc1_))
    {
        _loc1_ = "";
    }
    return _loc1_;
}
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var UI = this;
questTaskMessageContainer.hitTestDisable = true;
sectionNameMessageContainer.hitTestDisable = true;
tutorialMessageContainer.hitTestDisable = true;
emblemMessageContainer.bg.hitTestDisable = true;
movieMessageContainer.hitTestDisable = true;
loadingMessageContainer.hitTestDisable = true;
shieldDefenceMessageContainer.hitTestDisable = true;
bfMessageContainer.hitTestDisable = true;
bfContainer.hitTestDisable = true;
guardNameMessageContainer.hitTestDisable = true;
questTaskMessageContainer.txt.autoSize = true;
sectionNameMessageContainer.txt.autoSize = true;
actionKeyMessageContainer.name_txt.autoSize = true;
actionKeyMessageContainer.txt.autoSize = true;
shieldDefenceMessageContainer.txt.autoSize = true;
itemNeedMessageContainer.txt.autoSize = true;
questTaskMessageContainer.txt.htmlText = "";
sectionNameMessageContainer.txt.htmlText = "";
actionKeyMessageContainer.name_txt.htmlText = "";
actionKeyMessageContainer.txt.htmlText = "";
tutorialMessageContainer.txt.htmlText = "";
emblemMessageContainer.txt_mc.txt.htmlText = "";
movieMessageContainer.txt.htmlText = "";
loadingMessageContainer.txt.htmlText = "";
itemNeedMessageContainer.txt.htmlText = "";
guardNameMessageContainer.txt.htmlText = "";
guardNameMessageContainer.txt2.htmlText = "";
tutorialMessageContainer.txt.verticalAutoSize = "bottom";
loadingMessageContainer.txt.textAutoSize = "shrink";
loadingMessageContainer.txt.verticalAlign = "top";
movieMessageContainer.txt.textAutoSize = "shrink";
movieMessageContainer.txt.verticalAlign = "top";
var customStaticMsgId = -9999;
var bShowType4 = 1;
var bShowType5 = 1;
var bShowType6 = 1;
var bShowType9 = 1;
var bShowType11 = 1;
var bShowType18 = 1;
var bShowChatWhisper = 1;
var bShowDebuffMsg = 1;
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE,this,"chatWhisperHandler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE,this,"messageType4Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE5_VISIBLE,this,"messageType5Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE,this,"messageType6Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE,this,"messageType9Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE,this,"messageType11Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEI_VISIBLE,this,"messageType18Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_DEBUFFSHOW_BOOLEAN,this,"debuffMsgHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var NameTextLength_Local = 0;
var totalMsg_array = new Array();
myListener.testPosition = function(type, __x, __y)
{
    if(type == 0)
    {
        systemMessageContainer._visible = true;
        systemMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        systemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 1)
    {
        questTaskMessageContainer._visible = true;
        questTaskMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        questTaskMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 2)
    {
        emblemMessageContainer._visible = true;
        emblemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 3)
    {
        movieMessageContainer._visible = true;
        movieMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 4)
    {
        rootMessageContainer._visible = true;
        rootMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        rootMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 5)
    {
        loadingMessageContainer._visible = true;
        loadingMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        loadingMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 6)
    {
        tutorialMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        tutorialMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 7)
    {
        staticMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        staticMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 8)
    {
        shieldDefenceMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        shieldDefenceMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
    else if(type == 9)
    {
        actionKeyMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
        actionKeyMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
    }
};
myListener.OnGame_ResetUIPosition = function()
{
};
var MESSAGE_TYPE_CITYWAR_DESTROY_BASE = 26;
var MESSAGE_TYPE_CITYWAR_START = 27;
var MESSAGE_TYPE_CITYWAR_END_WIN = 28;
var MESSAGE_TYPE_CITYWAR_END_FREE = 29;
var MESSAGE_TYPE_CITYWAR_BOSS_APPEAR = 30;
var MESSAGE_TYPE_CITYWAR_BOSS_DEATH = 31;
var MESSAGE_TYPE_GUILD_LEVEL_CHANGE = 32;
var MESSAGE_TYPE_GUILD_SKILL_LEARN = 33;
var MESSAGE_TYPE_GUILD_QUEST_START = 34;
var MESSAGE_TYPE_GUILD_QUEST_FAIL = 35;
var MESSAGE_TYPE_GUILD_QUEST_DONE = 36;
var MESSAGE_TYPE_GUILDWAR_DECLARE = 37;
var MESSAGE_TYPE_GUILDWAR_SURRENDER = 38;
var MESSAGE_TYPE_GUILDWAR_WITHDRAW = 39;
var MESSAGE_TYPE_GUILD_INCENTIVE = 40;
var MESSAGE_STYLE_CITYWAR_START = MESSAGE_TYPE_CITYWAR_DESTROY_BASE;
var MESSAGE_STYLE_CITYWAR_END = MESSAGE_TYPE_GUILD_INCENTIVE;
myListener.OnGame_Message_Add = function(type, id, msg, Arguments)
{
    type = Number(type);
    if(type == 0)
    {
        return undefined;
    }
    var addParam = Arguments.split("\t");
    if(type == 1)
    {
        myListener.OnGame_SystemMessage_Add(msg,addParam[0],systemMessageContainer);
    }
    else if(type == 2)
    {
        _root.OnGameEvent("OnGame_Chat_SetWriting",addParam[0],msg,addParam[1]);
    }
    else if(type == 3)
    {
        addStaticMsg(id,msg,addParam[0],addParam[1],addParam[2]);
    }
    else if(type == 4 && bShowType4)
    {
        var _loc37_ = showFKey(1,msg,addParam[0],addParam[1]);
        _loc37_.id = id;
    }
    else if(type == 5 && bShowType5)
    {
        showTutorialMsg(1,msg,Arguments);
    }
    else if(type == 6 && bShowType6)
    {
        _loc37_ = showOneLineMsg(sectionNameMessageContainer,1,function()
        {
            sectionNameMessageContainer.txt.text = msg;
            sectionNameMessageContainer.txt._x = (- sectionNameMessageContainer.txt._width) / 2;
        }
        );
    }
    else if(type == 7)
    {
        questTaskMessageContainer._visible = true;
        var _loc29_ = Number(addParam[0]);
        var _loc32_ = Number(addParam[1]);
        if(_loc29_ >= _loc32_)
        {
            lib.manager.UISound.play(lib.manager.UISound.QUEST_CHANGED);
        }
        else
        {
            lib.manager.UISound.play(lib.manager.UISound.QUEST_CHANGED);
        }
        var _loc36_ = msg + " &lt; " + _loc29_ + " / " + _loc32_ + " &gt;";
        myListener.OnGame_SystemMessage_Add(_loc36_,16177697,questTaskMessageContainer);
    }
    else if(type == 8)
    {
        addEmblemMsg(1,msg,8);
    }
    else if(type == 9)
    {
        if(bShowType9)
        {
            achievementEffectType = Number(Arguments);
            unload(achievementEffectContainer);
            Arguments = Arguments != undefined?Arguments:0;
            addEmblemMsg(1,msg,9,Arguments);
        }
        else
        {
            achievementEffectType = Number(Arguments);
            unload(achievementEffectContainer);
            if(Arguments == "1" || Arguments == "2" || Arguments == "3")
            {
                achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Rare.swf");
            }
            else if(Arguments == "7" || Arguments == "4" || Arguments == "5")
            {
                achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Unique.swf");
            }
        }
    }
    else if(type == 10)
    {
        addEmblemMsg(1,msg,10);
        test5.text = msg;
    }
    else if(type == 11 && bShowType11)
    {
        addRootItem(addParam[0],addParam[1],addParam[2],addParam[3],addParam[4],addParam[5],addParam[6],addParam[7]);
    }
    else if(type == 12)
    {
        _loc37_ = addMovieMsg(1,msg);
        _loc37_.id = id;
    }
    else if(type == 13)
    {
        addEmblemMsg(1,msg,13);
    }
    else if(type == 14)
    {
        showLoadingMsg(id,msg);
    }
    else if(type == 15)
    {
        showDefenseMsg(true,msg,addParam[0]);
    }
    else if(type != 16)
    {
        if(type == 17)
        {
            _loc37_ = showItemNeedMsg(1,msg,Number(addParam[0]),addParam[1],addParam[2],addParam[3],addParam[4],addParam[5]);
            _loc37_.id = id;
        }
        else if(type == 18 && bShowType18)
        {
            _loc37_ = showOneLineMsg(guardNameMessageContainer,1,function()
            {
                guardNameMessageContainer.txt.text = msg;
                if(addParam[0] != "" && addParam[0] != undefined)
                {
                    guardNameMessageContainer.txt2._visible = true;
                    guardNameMessageContainer.crest_mc._visible = true;
                    guardNameMessageContainer.txt2.text = "[ " + addParam[0] + " ]";
                    var _loc1_ = lib.util.DrawBitmap.draw(guardNameMessageContainer.crest_mc.Icon,addParam[1],50,50);
                    guardNameMessageContainer.txt2._width = guardNameMessageContainer.txt2.textWidth + 5;
                    guardNameMessageContainer.txt2._x = (- guardNameMessageContainer.txt2._width) / 2;
                }
                else
                {
                    guardNameMessageContainer.txt2._visible = false;
                    guardNameMessageContainer.crest_mc._visible = false;
                }
                guardNameMessageContainer.txt._x = (- guardNameMessageContainer.txt._width) / 2;
            }
            );
        }
        else if(type == 19)
        {
            var _loc30_ = countDownContainer.getNextHighestDepth();
            var _loc23_ = undefined;
            if(Arguments == "1")
            {
                _loc23_ = countDownContainer.attachMovie("EventcountDownMessage","countDownMessage" + _loc30_,_loc30_);
                _loc23_._y = 150;
                _loc23_.count.gotoAndStop(Number(msg) + 1);
            }
            else
            {
                _loc23_ = countDownContainer.attachMovie("countDownMessage","countDownMessage" + _loc30_,_loc30_);
                _loc23_.countMc.txt.autoSize = "center";
                _loc23_.countMc.txt.verticalAlign = "center";
                _loc23_.countMc.txt.htmlText = msg;
            }
        }
        else if(type == 20)
        {
            _loc30_ = indunMessageContainer.getNextHighestDepth();
            var _loc35_ = "indunMessage";
            var _loc19_ = indunMessageContainer.attachMovie(_loc35_,"indunMessage" + _loc30_,_loc30_);
            _loc19_.mc0.txt.autoSize = "center";
            _loc19_.mc0.txt.verticalAlign = "center";
            _loc19_.mc0.txt.htmlText = msg;
            _loc19_.mc1.txt.autoSize = "center";
            _loc19_.mc1.txt.verticalAlign = "center";
            _loc19_.mc1.txt.htmlText = msg;
            _loc19_.mc2.txt.autoSize = "center";
            _loc19_.mc2.txt.verticalAlign = "center";
            _loc19_.mc2.txt.htmlText = msg;
        }
        else if(type == 21)
        {
            var _loc25_ = msg.split("\t");
            var _loc34_ = _loc25_[0];
            var _loc33_ = _loc25_[1];
            var _loc28_ = _loc25_[2];
            type = _loc25_[3];
            _loc30_ = popupMessageContainer.getNextHighestDepth();
            _loc35_ = "popupType" + type;
            var _loc7_ = popupMessageContainer.attachMovie(_loc35_,"popupMessage" + _loc30_,_loc30_);
            var _loc31_ = _loc7_.bodyMc._height;
            _loc7_.headTitleMc.txt.htmlText = _loc34_;
            _loc7_.bodyMc.txt.htmlText = _loc28_;
            _loc7_.bodyMc.txt._height = _loc7_.bodyMc.txt.textHeight + 4;
            if(type == "1")
            {
                _loc7_.titleMc.txt.textColor = 16775335;
            }
            _loc7_.titleMc.txt.setText(_loc33_);
            var _loc21_ = _loc7_.bodyMc.txt._y + _loc7_.bodyMc.txt._height + 5;
            if(_loc28_ == "" || _loc28_ == undefined)
            {
                _loc21_ = 9;
            }
            if(Arguments != undefined && Arguments != "")
            {
                var _loc22_ = Arguments.split("\n");
                var _loc24_ = _loc22_.length;
                var _loc26_ = 0;
                while(_loc26_ < _loc24_)
                {
                    var _loc4_ = _loc22_[_loc26_].split("\t");
                    if(_loc4_[0] == "" || _loc4_[0] == undefined)
                    {
                        break;
                    }
                    var _loc11_ = _loc7_.bodyMc.getNextHighestDepth();
                    var _loc3_ = _loc7_.bodyMc.attachMovie("Slot2_link","slotMc" + _loc11_,_loc11_);
                    _loc3_._x = _loc7_.bodyMc.txt._x + _loc3_._width * (_loc26_ % 2);
                    _loc3_._y = _loc21_ + _loc3_._height * int(_loc26_ / 2);
                    id = _loc4_[0];
                    _loc3_.img = _loc4_[1];
                    var _loc15_ = _loc4_[2];
                    var _loc6_ = Number(_loc4_[3]);
                    var _loc16_ = Number(_loc4_[4]);
                    var _loc14_ = Number(_loc4_[5]);
                    var _loc12_ = Number(_loc4_[6]);
                    var _loc5_ = Number(_loc4_[7]);
                    SetMultiply(_loc3_.multiply,Number(_loc4_[8]));
                    var _loc10_ = 0;
                    if(_loc4_[9] != undefined && _loc4_[9] != "" && _loc4_[9] != "undefined")
                    {
                        _loc10_ = Number(_loc4_[9]);
                    }
                    _loc3_.onEnterFrame = function()
                    {
                        if(this.Slot != undefined)
                        {
                            this.draw(this.img);
                            delete this.onEnterFrame;
                        }
                    };
                    _loc3_.display = true;
                    _loc3_.grade = _loc16_;
                    _loc3_.drag = fale;
                    _loc3_.sealType = _loc14_;
                    _loc3_.masterpiece = _loc12_;
                    if(_loc5_ == 0)
                    {
                        _loc3_.setLineNum(2);
                        _loc3_.upText = _loc15_;
                        if(_loc3_.downTxt > 0)
                        {
                            _loc3_.downText = lib.util.UIString.getUIString("$181002","ItemCount",_loc3_.downTxt);
                        }
                        else
                        {
                            _loc3_.downText = "";
                        }
                    }
                    else if(_loc5_ == 2)
                    {
                        _loc3_.setLineNum(3);
                        _loc3_.upText = "";
                        _loc3_.center_txt.html = true;
                        _loc3_.center_txt.htmlText = lib.util.GoldCurrency.SetGoldText(_loc6_,0,0,0,_loc10_);
                    }
                    else if(_loc5_ == 3)
                    {
                        _loc3_.setLineNum(3);
                        _loc3_.upText = "";
                        _loc3_.centerText = lib.util.CurrencyFormat.makeComma(_loc6_);
                        _loc3_.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
                        var _loc9_ = _loc3_.attachMovie("symbol_xp","symbol_xp",_loc3_.getNextHighestDepth());
                        _loc9_._x = _loc3_.center_txt._x + _loc3_.center_txt.textWidth + 6;
                        _loc9_._y = _loc3_.center_txt._y;
                        _loc9_.hitTestDisable = true;
                    }
                    else if(_loc5_ == 4)
                    {
                        _loc3_.setLineNum(3);
                        _loc3_.upText = "";
                        _loc3_.centerText = lib.util.CurrencyFormat.makeComma(_loc6_);
                        _loc3_.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                        var _loc8_ = _loc3_.attachMovie("symbol_p","symbol_p",_loc3_.getNextHighestDepth());
                        _loc8_._x = _loc3_.center_txt._x + _loc3_.center_txt.textWidth + 6;
                        _loc8_._y = _loc3_.center_txt._y;
                        _loc8_.hitTestDisable = true;
                    }
                    else if(_loc5_ == 5)
                    {
                        _loc3_.setLineNum(2);
                        _loc3_.upText = _loc4_[2];
                        _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc6_);
                        _loc3_.down_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                        _loc8_ = _loc3_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc3_.getNextHighestDepth());
                        _loc3_.down_txt._width = 113;
                        _loc8_._x = _loc3_.down_txt._x + _loc3_.down_txt._width + 1;
                        _loc8_._y = _loc3_.down_txt._y;
                        _loc8_.hitTestDisable = true;
                    }
                    else if(_loc5_ == 6)
                    {
                        _loc3_.setLineNum(2);
                        _loc3_.upText = _loc4_[2];
                        _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc6_);
                        _loc3_.down_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                        _loc8_ = _loc3_.attachMovie("symbol_rp_point","symbol_rp_point",_loc3_.getNextHighestDepth());
                        _loc3_.down_txt._width = 113;
                        _loc8_._x = _loc3_.down_txt._x + _loc3_.down_txt._width + 1;
                        _loc8_._y = _loc3_.down_txt._y;
                        _loc8_.hitTestDisable = true;
                    }
                    else if(_loc5_ == 7)
                    {
                        _loc3_.setLineNum(2);
                        _loc3_.upText = _loc4_[2];
                        _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc6_);
                        _loc3_.down_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                        _loc8_ = lib.util.DrawBitmap.makeMcAndDraw(_loc3_,"img://__Icon_Items.UnionPointCoin");
                        _loc3_.down_txt._width = 113;
                        _loc8_._x = _loc3_.down_txt._x + _loc3_.down_txt._width + 1;
                        _loc8_._y = _loc3_.down_txt._y;
                        _loc8_.hitTestDisable = true;
                    }
                    else if(_loc5_ == 8)
                    {
                        _loc3_.setLineNum(2);
                        _loc3_.upText = _loc4_[2];
                    }
                    _loc26_ = _loc26_ + 1;
                }
            }
            if(_loc31_ < _loc7_.bodyMc._height)
            {
                var _loc27_ = _loc7_.bodyMc._height - _loc31_ + 10;
                _loc7_.bodyMc.bgMc._height = _loc7_.bodyMc.bgMc._height + _loc27_;
                _loc7_.addBgMc.bgMc._height = _loc7_.addBgMc.bgMc._height + _loc27_;
                _loc7_.bgMc.bgMc._height = _loc7_.bgMc.bgMc._height + _loc27_;
                _loc7_.line0Mc._y = _loc7_.line0Mc._y + _loc27_;
            }
        }
        else if(type == 22)
        {
            addEmblemMsg(1,msg,15,addParam[0]);
        }
        else if(type == 23)
        {
            for(var _loc26_ in tutorialMsgContainer.txtMc.keyContainer)
            {
                if(typeof tutorialMsgContainer.txtMc.keyContainer[_loc26_] == "movieclip")
                {
                    tutorialMsgContainer.txtMc.keyContainer[_loc26_].removeMovieClip();
                }
            }
            if(msg == "" || msg == undefined)
            {
                if(tutorialMsgContainer._currentframe < 24)
                {
                    tutorialMsgContainer.gotoAndPlay(15);
                }
                else
                {
                    tutorialMsgContainer.gotoAndPlay(49);
                }
            }
            else
            {
                if(addParam[0] == "1")
                {
                    tutorialMsgContainer.txtMc.txt.text = "";
                    tutorialMsgContainer.clearMc0.txt.verticalAlign = "center";
                    tutorialMsgContainer.clearMc1.mc.txt.verticalAlign = "center";
                    tutorialMsgContainer.clearMc1.txt.verticalAlign = "center";
                    tutorialMsgContainer.clearMc0.txt.text = msg;
                    tutorialMsgContainer.clearMc1.mc.txt.text = msg;
                    tutorialMsgContainer.clearMc1.txt.text = msg;
                    tutorialMsgContainer.gotoAndPlay(24);
                }
                else
                {
                    tutorialMsgContainer.clearMc0.txt.text = "";
                    tutorialMsgContainer.clearMc1.mc.txt.text = "";
                    tutorialMsgContainer.clearMc1.txt.text = "";
                    keyString(msg);
                    tutorialMsgContainer.gotoAndPlay(2);
                }
                tutorialMsgContainer._visible = true;
            }
        }
        else if(type == 24)
        {
            if(addParam[0] == -1)
            {
                addEmblemMsg(1,msg,24);
            }
            else
            {
                addBFMsg(msg,addParam[0],addParam[1],addParam[2],addParam[3],bfContainer);
            }
        }
        else if(type == 25)
        {
            addEmblemMsg(1,msg,25,addParam[0]);
        }
        else if(MESSAGE_STYLE_CITYWAR_START <= type && type <= MESSAGE_STYLE_CITYWAR_END)
        {
            var _loc20_ = 1;
            switch(type)
            {
                case MESSAGE_TYPE_CITYWAR_BOSS_APPEAR:
                case MESSAGE_TYPE_CITYWAR_BOSS_DEATH:
                    _loc20_ = 2;
                    break;
                case MESSAGE_TYPE_CITYWAR_START:
                case MESSAGE_TYPE_CITYWAR_END_WIN:
                case MESSAGE_TYPE_CITYWAR_END_FREE:
                    _loc20_ = 3;
                    break;
                case MESSAGE_TYPE_GUILD_QUEST_START:
                case MESSAGE_TYPE_GUILD_QUEST_FAIL:
                case MESSAGE_TYPE_GUILD_QUEST_DONE:
                case MESSAGE_TYPE_GUILD_INCENTIVE:
                    _loc20_ = 4;
                    break;
                case MESSAGE_TYPE_GUILD_LEVEL_CHANGE:
                    _loc20_ = 5;
                    break;
                case MESSAGE_TYPE_GUILD_SKILL_LEARN:
                    _loc20_ = 6;
                case MESSAGE_TYPE_GUILDWAR_DECLARE:
                case MESSAGE_TYPE_GUILDWAR_SURRENDER:
                case MESSAGE_TYPE_GUILDWAR_WITHDRAW:
                    _loc20_ = type - 30;
            }
            addCityWarMsg(msg,_loc20_);
        }
    }
};
var cityWarMsgArray = new Array();
myListener.OnGame_Message_Remove = function(id)
{
    getURL("FSCommand:" add ("Delete~~~  " + random(999)),"");
    var _loc1_ = getMsg(id);
    if(_loc1_ != null)
    {
        if(_loc1_.type == 3)
        {
            removeStaticMsg(id);
        }
        else if(_loc1_.type == 4)
        {
            showFKey(0,"",0,"");
        }
        else if(_loc1_.type != 11)
        {
            if(_loc1_.type == 12)
            {
                addMovieMsg(0,"");
            }
            else if(_loc1_.type == 14)
            {
                loadingMessageContainer.txt.text = "";
                loadingMessageContainer._visible = false;
            }
            else if(_loc1_.type == 15)
            {
                showDefenseMsg(false);
            }
            else if(_loc1_.type == 17)
            {
                showItemNeedMsg(0,"",0,"");
            }
        }
        removeMsg(id);
        clearTimeout(UI[id]);
        delete UI.id;
    }
};
myListener.OnGame_Message_Clear = function()
{
    totalMsg_array = [];
    staticMsg_array = [];
    remakeContainer(systemMessageContainer);
    remakeContainer(staticMessageContainer);
    remakeContainer(questTaskMessageContainer);
    clearSectionMessage();
    clearGuardNameMessage();
    clearActionKeyMessage();
    clearTutorialMessage();
    clearRootMessage();
    clearEmblemMessage();
    clearMovieMessage();
    clearLoadingMessage();
    clearShieldDefenceMessage();
    clearItemNeedMessage();
    clearCoolTimeAlim();
    clearAllCityWarMsg();
};
myListener.OnGame_LogOut = function()
{
    clearEmblemMessage();
};
var lineGap = 5;
var defaultLifeTime = 4;
var lineHeight = 28;
var BFlineHeight = 72;
var maxLine = 5;
var maxBFLine = 4;
var currentNumOfMsg = 0;
var fadeInTime = 0.3;
var pushedFadeOutTime = 2;
var pushTime = 0.5;
var linesY_array = new Array(0,- lineHeight,(- lineHeight) * 2,(- lineHeight) * 3,(- lineHeight) * 4,(- lineHeight) * 5);
var linesY_BFarray = new Array(0,- BFlineHeight,(- BFlineHeight) * 2,(- BFlineHeight) * 3,(- BFlineHeight) * 4);
var emblemPosY = 7.5;
myListener.OnGame_ScaleUI = function()
{
    myListener.OnGame_ChangeStageSize();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
    systemMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    systemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(22);
    questTaskMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    questTaskMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(28);
    emblemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(emblemPosY);
    movieMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(93);
    rootMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(60);
    rootMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(73);
    actionKeyMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    actionKeyMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(64.5);
    itemNeedMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    itemNeedMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(63);
    tutorialMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    tutorialMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(70.5);
    staticMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    staticMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(38);
    shieldDefenceMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(55);
    shieldDefenceMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(36);
    sectionNameMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    sectionNameMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(32);
    guardNameMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    guardNameMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(29);
    loadingMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    loadingMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(95);
    bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
    bfMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    bfContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
    bfContainer._y = lib.info.AlignInfo.yRatioToPixel(34);
    GuildWarMotionMc._x = lib.info.AlignInfo.xRatioToPixel(50);
    GuildWarMotionMc._y = lib.info.AlignInfo.yRatioToPixel(22);
    NewMessagePostionChange();
};
myListener.OnGame_SystemMessage_Add = function(str, color, container)
{
    var _loc3_ = container.getNextHighestDepth();
    var _loc1_ = container.attachMovie("message","message" + _loc3_,_loc3_);
    if(str.indexOf("asfunction") == -1)
    {
        _loc1_.hitTestDisable = true;
    }
    _loc1_._y = 0;
    _loc1_._alpha = 0;
    _loc1_.currentLine = 0;
    _loc1_.txt.htmlText = str;
    if(color != undefined && color != "undefined" && color != "")
    {
        _loc1_.txt.textColor = color;
    }
    _loc1_.txt._width = _loc1_.txt.textWidth + 10;
    _loc1_.txt._height = _loc1_.txt.textHeight + 10;
    _loc1_.txt._x = (- _loc1_.txt._width) / 2;
    _loc1_.cnt = 0;
    setLifeTime(_loc1_,defaultLifeTime);
    pushMessage(container);
};
var staticMsg_array = new Array();
sectionNameMessageContainer.txt.textColor = lib.info.TextColor.SYSTEM_AREA;
sectionNameMessageContainer.show = false;
sectionNameMessageContainer._alpha = 0;
sectionNameMessageContainer._visible = false;
guardNameMessageContainer.txt.textColor = lib.info.TextColor.SYSTEM_GUARD;
guardNameMessageContainer.txt2.textColor = lib.info.TextColor.SYSTEM_GUARD_GUILD;
guardNameMessageContainer.show = false;
guardNameMessageContainer._alpha = 0;
guardNameMessageContainer._visible = false;
actionKeyMessageContainer._alpha = 0;
actionKeyMessageContainer._visible = false;
actionKeyMessageContainer.type = 4;
var slotHeight = 60;
var rootItem_array = [];
emblemMessageContainer.txt_mc._alpha = 0;
emblemMessageContainer.emblem._alpha = 0;
emblemMessageContainer.union._alpha = 0;
emblemMessageContainer._alpha = 0;
emblemMessageContainer._visible = false;
emblemMessageContainer.emblemX = -305.6;
emblemMessageContainer.emblemY = 95.4;
var emblemMsg_array = new Array();
var bAttach = false;
var curType = -1;
var achievementEffectType = 0;
movieMessageContainer._alpha = 0;
movieMessageContainer._visible = false;
movieMessageContainer.type = 12;
shieldDefenceMessageContainer._alpha = 0;
shieldDefenceMessageContainer._visible = false;
shieldDefenceMessageContainer.type = 15;
var shield_Str = ["$005003","$005029","$005030","$005031","$005032"];
myListener.OnGame_BFScoreBoard_SetBattleState = function(_state)
{
    vipTxt = "";
    _state = Number(_state);
    bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
    unloadMovie(bfMessageContainer);
    if(_state == 1)
    {
        loadMovie(lib.info.LoadURL.BF_RESULT_WIN,bfMessageContainer);
    }
    else if(_state == 2)
    {
        loadMovie(lib.info.LoadURL.BF_RESULT_LOSE,bfMessageContainer);
    }
    else if(_state == 3)
    {
        loadMovie(lib.info.LoadURL.BF_RESULT_DRAW,bfMessageContainer);
    }
};
itemNeedMessageContainer._alpha = 0;
itemNeedMessageContainer._visible = false;
itemNeedMessageContainer.type = 17;
var guildwarmotion_strdata1 = lib.util.UIString.getUIString("$129001");
var guildwarmotion_strdata2 = lib.util.UIString.getUIString("$129002");
var guildwarmotion_strdata3 = lib.util.UIString.getUIString("$129003");
var guildwarmotion_strdata4 = lib.util.UIString.getUIString("$129004");
var guildwarmotion_strdata5 = lib.util.UIString.getUIString("$129005");
var NameTextLength_Local = 0;
myListener.OnGame_GuildWarMotion_Join = function(setdata)
{
    var setList = setdata.split("\t");
    GuildWarMotion_Request();
    var delay_num = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delay_num++;
        if(delay_num > 1)
        {
            UI.onEnterFrame = null;
            lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DECARED);
            UI.GuildWarMotionMc.GuildMc5.gotoAndPlay(2);
            UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
            lib.util.DrawBitmap.draw(UI.GuildWarMotionMc.GuildMc5.img_mc1.IconMc,setList[0],50,50);
            var delay_num2 = 0;
            UI.GuildWarMotionMc.GuildMc5.onEnterFrame = null;
            UI.GuildWarMotionMc.GuildMc5.onEnterFrame = function()
            {
                delay_num2++;
                if(delay_num2 > 1)
                {
                    UI.GuildWarMotionMc.GuildMc5.onEnterFrame = null;
                    UI.GuildWarMotionMc.GuildMc5.img_mc1.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc5.img_mc1.IconMc._height = 50;
                }
            };
            UI.GuildWarMotionMc.GuildMc5.txt_mc1.txt0.setText(setList[1]);
            UI.GuildWarMotionMc.GuildMc5.txt_mc2.txt.setText(setList[2]);
            UI.GuildWarMotionMc.GuildMc5.txt_mc3.txt.setText(setList[2]);
            UI.GuildWarMotionMc.GuildMc5.txt_mc4.txt.setText(setList[2]);
        }
    };
};
myListener.OnGame_GuildWarMotion_Decared = function(setdata)
{
    var setList = setdata.split("\t");
    GuildWarMotion_Request();
    var delay_num = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delay_num++;
        if(delay_num > 1)
        {
            UI.onEnterFrame = null;
            lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DECARED);
            UI.GuildWarMotionMc.GuildMc1.gotoAndPlay(2);
            UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
            lib.util.DrawBitmap.draw(UI.GuildWarMotionMc.GuildMc1.img_mc1.IconMc,setList[0],50,50);
            lib.util.DrawBitmap.draw(UI.GuildWarMotionMc.GuildMc1.img_mc2.IconMc,setList[1],50,50);
            var delay_num2 = 0;
            UI.GuildWarMotionMc.GuildMc1.onEnterFrame = null;
            UI.GuildWarMotionMc.GuildMc1.onEnterFrame = function()
            {
                delay_num2++;
                if(delay_num2 > 1)
                {
                    UI.GuildWarMotionMc.GuildMc1.onEnterFrame = null;
                    UI.GuildWarMotionMc.GuildMc1.img_mc1.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc1.img_mc1.IconMc._height = 50;
                    UI.GuildWarMotionMc.GuildMc1.img_mc2.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc1.img_mc2.IconMc._height = 50;
                }
            };
            UI.GuildWarMotionMc.GuildMc1.txt_mc1.txt0.setText(setList[2]);
            UI.GuildWarMotionMc.GuildMc1.txt_mc1.txt1.setText(setList[3]);
            UI.GuildWarMotionMc.GuildMc1.txt_mc2.txt.setText(guildwarmotion_strdata1);
            UI.GuildWarMotionMc.GuildMc1.txt_mc3.txt.setText(guildwarmotion_strdata1);
            UI.GuildWarMotionMc.GuildMc1.txt_mc4.txt.setText(guildwarmotion_strdata1);
            UI.GuildWarMotionMc.GuildMc1.txt_mc5.txt.setText(setList[4]);
        }
    };
};
myListener.OnGame_GuildWarMotion_Decared_loadinit = function(setdata)
{
};
var vipTxt = "";
myListener.OnGame_VipMotion_Up = function(txt)
{
    unloadMovie(bfMessageContainer);
    bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
    vipTxt = txt;
    loadMovie(lib.info.LoadURL.BF_RESULT_WIN,bfMessageContainer);
};
myListener.OnGame_GuildWarMotion_Win = function(setdata)
{
    var setList = setdata.split("\t");
    GuildWarMotion_Request();
    var delay_num = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delay_num++;
        if(delay_num > 1)
        {
            UI.onEnterFrame = null;
            lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_WIN);
            GuildWarMotionMc.GuildMc2.gotoAndPlay(2);
            UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc2.img_mc1.IconMc,setList[0],50,50);
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc2.img_mc2.IconMc,setList[1],50,50);
            var delay_num2 = 0;
            UI.GuildWarMotionMc.GuildMc2.onEnterFrame = null;
            UI.GuildWarMotionMc.GuildMc2.onEnterFrame = function()
            {
                delay_num2++;
                if(delay_num2 > 1)
                {
                    UI.GuildWarMotionMc.GuildMc2.onEnterFrame = null;
                    UI.GuildWarMotionMc.GuildMc2.img_mc1.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc2.img_mc1.IconMc._height = 50;
                    UI.GuildWarMotionMc.GuildMc2.img_mc2.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc2.img_mc2.IconMc._height = 50;
                }
            };
            GuildWarMotionMc.GuildMc2.txt_mc1.txt0.setText(setList[2]);
            GuildWarMotionMc.GuildMc2.txt_mc1.txt1.setText(setList[3]);
            GuildWarMotionMc.GuildMc2.txt_mc2.txt.setText(guildwarmotion_strdata2);
            GuildWarMotionMc.GuildMc2.txt_mc3.txt.setText(guildwarmotion_strdata2);
            GuildWarMotionMc.GuildMc2.txt_mc4.txt.setText(guildwarmotion_strdata2);
        }
    };
};
myListener.OnGame_GuildWarMotion_Fail = function(setdata)
{
    var setList = setdata.split("\t");
    GuildWarMotion_Request();
    var delay_num = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delay_num++;
        if(delay_num > 1)
        {
            UI.onEnterFrame = null;
            lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_FAIL);
            GuildWarMotionMc.GuildMc3.gotoAndPlay(2);
            UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc1.IconMc,setList[0],50,50);
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc2.IconMc,setList[1],50,50);
            var delay_num2 = 0;
            UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
            UI.GuildWarMotionMc.GuildMc3.onEnterFrame = function()
            {
                delay_num2++;
                if(delay_num2 > 1)
                {
                    UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
                    UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._height = 50;
                    UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._height = 50;
                }
            };
            GuildWarMotionMc.GuildMc3.txt_mc1.txt0.setText(setList[2]);
            GuildWarMotionMc.GuildMc3.txt_mc1.txt1.setText(setList[3]);
            GuildWarMotionMc.GuildMc3.txt_mc2.txt.setText(guildwarmotion_strdata3);
            GuildWarMotionMc.GuildMc3.txt_mc3.txt.setText(guildwarmotion_strdata3);
            GuildWarMotionMc.GuildMc3.txt_mc4.txt.setText(guildwarmotion_strdata3);
        }
    };
};
myListener.OnGame_GuildWarMotion_Draw = function(setdata)
{
    var setList = setdata.split("\t");
    GuildWarMotion_Request();
    var delay_num = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delay_num++;
        if(delay_num > 1)
        {
            UI.onEnterFrame = null;
            lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DRAW);
            GuildWarMotionMc.GuildMc4.gotoAndPlay(2);
            UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc4.img_mc1.IconMc,setList[0],50,50);
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc4.img_mc2.IconMc,setList[1],50,50);
            var delay_num2 = 0;
            UI.GuildWarMotionMc.GuildMc4.onEnterFrame = null;
            UI.GuildWarMotionMc.GuildMc4.onEnterFrame = function()
            {
                delay_num2++;
                if(delay_num2 > 1)
                {
                    UI.GuildWarMotionMc.GuildMc4.onEnterFrame = null;
                    UI.GuildWarMotionMc.GuildMc4.img_mc1.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc4.img_mc1.IconMc._height = 50;
                    UI.GuildWarMotionMc.GuildMc4.img_mc2.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc4.img_mc2.IconMc._height = 50;
                }
            };
            GuildWarMotionMc.GuildMc4.txt_mc1.txt0.setText(setList[2]);
            GuildWarMotionMc.GuildMc4.txt_mc1.txt1.setText(setList[3]);
            GuildWarMotionMc.GuildMc4.txt_mc2.txt.setText(guildwarmotion_strdata4);
            GuildWarMotionMc.GuildMc4.txt_mc3.txt.setText(guildwarmotion_strdata4);
            GuildWarMotionMc.GuildMc4.txt_mc4.txt.setText(guildwarmotion_strdata4);
        }
    };
};
myListener.OnGame_GuildWarMotion_StartBattle = function(setdata)
{
    var setList = setdata.split("\t");
    GuildWarMotion_Request();
    var delay_num = 0;
    UI.onEnterFrame = null;
    UI.onEnterFrame = function()
    {
        delay_num++;
        if(delay_num > 1)
        {
            UI.onEnterFrame = null;
            lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DECARED);
            GuildWarMotionMc.GuildMc3.gotoAndPlay(2);
            UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
            UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc1.IconMc,setList[0],50,50);
            lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc2.IconMc,setList[1],50,50);
            var delay_num2 = 0;
            UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
            UI.GuildWarMotionMc.GuildMc3.onEnterFrame = function()
            {
                delay_num2++;
                if(delay_num2 > 1)
                {
                    UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
                    UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._height = 50;
                    UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._width = 50;
                    UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._height = 50;
                }
            };
            GuildWarMotionMc.GuildMc3.txt_mc1.txt0.setText(setList[2]);
            GuildWarMotionMc.GuildMc3.txt_mc1.txt1.setText(setList[3]);
            GuildWarMotionMc.GuildMc3.txt_mc2.txt.setText(guildwarmotion_strdata5);
            GuildWarMotionMc.GuildMc3.txt_mc3.txt.setText(guildwarmotion_strdata5);
            GuildWarMotionMc.GuildMc3.txt_mc4.txt.setText(guildwarmotion_strdata5);
        }
    };
};
GuildWarMotion_Init();
var chatUI = undefined;
var whisperColor = "#" + lib.info.TextColor.CHAT_WHISPER.toString(16);
var whisperChatType = null;
myListener.OnGame_Chat_SetWriting = function(chatType, writing, id, addParam, tabList, wisperType)
{
    if(bShowChatWhisper != 1)
    {
        return undefined;
    }
    wisperType = Number(wisperType);
    if(wisperType != 1)
    {
        return undefined;
    }
    chatType = Number(chatType);
    var _loc2_ = "";
    customStaticMsgId++;
    _loc2_ = "<FONT color=\'" + whisperColor + "\' size=\'18\'>" + "<a href=\'asfunction:chatNameAction," + id + "@" + chatType + "@" + "test" + "\'>" + "[" + id + "]" + "</a>" + lib.util.UIString.getUIString("$031055") + "[" + lib.util.UIString.getUIString("$031009") + "] : </FONT>";
    if(chatUI == undefined)
    {
        chatUI = _root.GetLoadedUI("chat2");
    }
    var _loc6_ = chatUI.calcHtmlText(writing,1,chatType);
    _loc2_ = _loc2_ + _loc6_;
    var _loc4_ = addStaticMsg(customStaticMsgId,_loc2_,0);
    _loc4_._xscale = _loc4_._yscale = 130;
    UI[customStaticMsgId] = setTimeout(myListener.OnGame_Message_Remove,5000,customStaticMsgId);
};
var CHANNEL_INDEX = 0;
var CHANNEL_NAME = 1;
var CHANNEL_COLOR = 2;
var CHANNEL_TYPE = 3;
var CHANNEL_BLINK = 4;
var CHANNEL_BNAME = 5;
var CHANNEL_BHTML = 6;
myListener.OnGame_Chat_SetChannelInfo = function(channelData)
{
    var _loc6_ = lib.util.ExtString.split(channelData,"\n");
    var _loc2_ = 0;
    while(_loc2_ < _loc6_.length)
    {
        var _loc1_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
        var _loc5_ = Number(_loc1_[CHANNEL_INDEX]);
        var _loc3_ = Number(_loc1_[CHANNEL_TYPE]);
        if(_loc3_ == 1)
        {
            if(_loc3_ == 1)
            {
                var _loc4_ = Number(_loc1_[CHANNEL_COLOR]);
                whisperColor = "#" + _loc4_.toString(16);
                whisperChatType = _loc5_;
                return undefined;
            }
        }
        _loc2_ = _loc2_ + 1;
    }
};
myListener.OnGame_ChangeStageSize();
var systemTime = 8;
var systemLongTime = 120;
var rewardIdx = 0;
var rewardMax = 3;
var rewardEndTime = 6;
var rewardBox = [];
var rewardDelay = 2000;
var rewardWave = 0.1;
var rewardWave2 = 1;
var systemStyle = [0,6,100];
var rewardStyle = [0,24,99];
var RewardInterval = null;
myListener.OnGame_Message_System = function(titleStr, contentStr, buttonGuide, clearID)
{
    var _loc1_ = newMessageContainer.systemMc;
    gs.TweenMax.killTweensOf(_loc1_,false);
    if(!_loc1_)
    {
        SyetemMessage(titleStr,contentStr,buttonGuide,clearID);
    }
    else
    {
        gs.TweenMax.to(_loc1_,0.5,{_alpha:0,onComplete:SyetemMessage,onCompleteParams:[titleStr,contentStr,buttonGuide]});
    }
};
myListener.OnGame_Message_Reward = function(typeStr, rewardStr, keyGuide)
{
    var _loc3_ = newMessageContainer.rewardMc;
    if(!_loc3_)
    {
        _loc3_ = newMessageContainer.attachMovie("mContaienr","rewardMc",rewardStyle[2]);
        _loc3_.yPos = rewardStyle[1];
        _loc3_._y = lib.info.AlignInfo.yRatioToPixel(_loc3_.yPos) * 1.25;
    }
    var _loc4_ = new Object();
    _loc4_.tStr = typeStr;
    _loc4_.rStr = rewardStr;
    _loc4_.G = keyGuide;
    rewardBox.push(_loc4_);
    var _loc2_ = 0;
    for(var _loc5_ in newMessageContainer.rewardMc)
    {
        var _loc1_ = newMessageContainer.rewardMc[_loc5_];
        if(typeof _loc1_ == "movieclip")
        {
            _loc2_ = _loc2_ + 1;
        }
    }
    if(_loc2_ < rewardMax)
    {
        RewardMessage();
    }
    else
    {
        clearInterval(RewardInterval);
        RewardInterval = setInterval(RewardMessage,rewardDelay);
    }
};
var rewardBox = [];
myListener.OnGame_Message_SystemClear = function(id)
{
    if(id)
    {
        if(newMessageContainer.systemMc.id == id)
        {
            gs.TweenMax.killTweensOf(newMessageContainer.systemMc,false);
            newMessageContainer.systemMc.removeMovieClip();
        }
    }
    else
    {
        gs.TweenMax.killTweensOf(newMessageContainer.systemMc,false);
        newMessageContainer.systemMc.removeMovieClip();
    }
};
myListener.OnGame_Message_RewardClear = function()
{
    rewardIdx = 0;
    rewardBox = [];
    clearInterval(RewardInterval);
    lib.manager.UISound.play("2001");
    RewardInterval = null;
    for(var _loc1_ in newMessageContainer.rewardMc)
    {
        if(typeof newMessageContainer.rewardMc[_loc1_] == "movieclip")
        {
            gs.TweenMax.killTweensOf(newMessageContainer.rewardMc[_loc1_],false);
        }
    }
    newMessageContainer.rewardMc.removeMovieClip();
};
var amountTxt = new TextFormat("$NormalFont",24,14145495,false,false,false,null,null,"right",0,0,0,0);
var centerTxt = new TextFormat("$TitleFontB",23,16763904,false,false,false,null,null,"center",0,0,0,0);
var subTxt = new TextFormat("$TitleFontB",27,16777215,false,false,false,null,null,"center",0,0,0,0);
var subTxt2 = new TextFormat("$TitleFontB",21,16777215,false,false,false,null,null,"center",0,0,0,0);
var subTxt3 = new TextFormat("$NormalFont",21,16777215,false,false,false,null,null,"left",0,0,0,0);
var rewardBg = flash.display.BitmapData.loadBitmap("rewardBg");
var gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
var couponBox = flash.display.BitmapData.loadBitmap("CouponBox");
var gradeFontColor = [16777215,39168,39901,16763904];
var BITMAP_RESIZE = 1;
