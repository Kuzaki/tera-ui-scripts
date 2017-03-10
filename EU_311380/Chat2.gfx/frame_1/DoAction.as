var UI = this;
UI._visible = false;
var UIname = "Chat2";
var bWidgetOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
_global.gfxExtensions = true;
dummy2._visible = false;
dummy._visible = false;
lib.manager.Focus.CHAT_INPUT = container_mc.input_mc.txt;
var selectedChannel_txt = container_mc.input_mc.comboBox1_mc.selected_txt;
selectedChannel_txt.verticalAlign = "center";
var baseChatWidth = 730;
var baseChatHeight = 317;
var baseChatMinWidth = 720;
var baseChatMinHeight = 130;
var sepaChatMinWidth = 509;
var sepaChatMinHeight = 90;
var outputTxt_xGap = -90;
var outputTxt_yGap = -20;
var inputTxt_xGap = -20;
var inputTxt_x = 50;
var baseChatX = container_mc._x;
var baseChatY = container_mc._y;
var baseTabChanged = false;
var tabMaxLimit = 7;
var whisperMode = false;
var whisperReadyMode = false;
var maxChatLeng = 150;
var invisibleSecond = 30;
var tabColorNormal = 8553090;
var tabColorActive = 13421772;
var mainTabAlpha = 45;
var sepaTabAlpha = 45;
var inputOpen = false;
var currentWhisperTarget = "";
var channelNum_array = new Array();
var currentChannel = 0;
var newTabStr = lib.util.UIString.getUIString("$031042");
var addTabStr = lib.util.UIString.getUIString("$031038");
var removeTabStr = lib.util.UIString.getUIString("$031056");
var optionTabStr = lib.util.UIString.getUIString("$031057");
var initTabPosStr = lib.util.UIString.getUIString("$031058");
var optionChatStr = lib.util.UIString.getUIString("$031039");
var lockChatStr = lib.util.UIString.getUIString("$031040");
var unlockChatStr = lib.util.UIString.getUIString("$031063");
var initChatPosStr = lib.util.UIString.getUIString("$031041");
var initChatConfigStr = lib.util.UIString.getUIString("$031061");
var curTabOptionStr = lib.util.UIString.getUIString("$031076");
var battleStr = lib.util.UIString.getUIString("$031045");
var toDearStr = lib.util.UIString.getUIString("$031055");
var whisperStr = lib.util.UIString.getUIString("$032016");
var LVSTR = lib.util.UIString.getUIString("$331013");
var totalTabStr = lib.util.UIString.getUIString("$031059");
var addPrivateChannelStr = lib.util.UIString.getUIString("$032019");
var chatColor_array = new Array();
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
        var _loc3_ = Number(_loc1_[CHANNEL_INDEX]);
        var _loc4_ = _loc1_[CHANNEL_NAME];
        var _loc8_ = _loc1_[CHANNEL_COLOR];
        var _loc12_ = OxToShap(Number(_loc8_));
        var _loc5_ = Number(_loc1_[CHANNEL_TYPE]);
        var _loc10_ = Number(_loc1_[CHANNEL_BLINK]);
        var _loc9_ = Number(_loc1_[CHANNEL_BNAME]);
        var _loc11_ = Number(_loc1_[CHANNEL_BHTML]);
        chatColor_array[_loc3_] = {name:_loc4_,color:_loc8_,shapColor:_loc12_,type:_loc5_,bLink:_loc10_,bName:_loc9_,bHTML:_loc11_};
        if(_loc5_ == 1)
        {
            container_mc.input_mc.detail_txt.textColor = chatColor_array[_loc3_].color;
        }
        _loc2_ = _loc2_ + 1;
    }
    paintChannelList();
    refreshTexts();
};
var sc = container_mc.output_mc.scrollBar;
sc.defaultBarSizeRatio = 0.3333333333333333;
sc.setTextField(container_mc.output_mc.txt);
var newTf = new TextFormat();
newTf.letterSpacing = 0;
container_mc.output_mc.txt.setNewTextFormat(newTf);
var scO = new Object();
sc.addListener(scO);
scO.onScroll = function(delta)
{
    if(delta < 0)
    {
        container_mc.output_mc.txt.scroll = container_mc.output_mc.txt.scroll + 1;
    }
    else
    {
        container_mc.output_mc.txt.scroll = container_mc.output_mc.txt.scroll - 1;
    }
};
sc.setWheel(container_mc.output_mc.txt);
sc.onMaxScroll = function()
{
    sc.glow = false;
};
var str = lib.util.UIString.getUIString("$510001");
lib.manager.ToolTip.add(container_mc.input_mc.social_mc,str,1);
container_mc.input_mc.social_mc.onRelease = function()
{
    ToGame_Chat_ClickSocialBtn();
};
container_mc.output_mc.bg_mc._alpha = mainTabAlpha;
container_mc.interactionMenu_mc._visible = false;
container_mc.optionMenu_mc.baseY = container_mc.optionMenu_mc._y;
container_mc.output_mc.tabOptionMenu_mc.baseY = container_mc.output_mc.tabOptionMenu_mc._y;
container_mc.output_mc.txt.fontScaleFactor = fontSize;
container_mc.input_mc.changeLang_mc.txt.text = lib.util.UIString.getUIString("$032014");
container_mc.input_mc._visible = false;
container_mc.input_mc.detail_txt._visible = false;
container_mc.input_mc.detail_txt.autoSize = true;
container_mc.input_mc.txt_focus.hitTestDisable = true;
container_mc.cantChat_mc._visible = false;
container_mc.output_mc.option_btn._visible = false;
container_mc.noticeBg._visible = false;
container_mc.shout_mc._visible = false;
container_mc.notice_mc._visible = false;
var MAXLINE = 500;
var CLEARLINE = 300;
var inputChat_0 = lib.gamedata.DefaultData.getDefaultUIData("inputChat").param0;
var inputChat_1 = lib.gamedata.DefaultData.getDefaultUIData("inputChat").param1;
function paintChannelList()
{
    for(mc in container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc)
    {
        var _loc1_ = container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc[mc];
        if(typeof _loc1_ == "movieclip" && _loc1_.id != undefined)
        {
            _loc1_.text_txt.textColor = chatColor_array[_loc1_.id].color;
        }
    }
    selectedChannel_txt.textColor = chatColor_array[currentChannel].color;
    container_mc.input_mc.detail_txt.textColor = chatColor_array[currentChannel].color;
    remakeInputTf();
}
function makeShoutBody(htmlStr, sColor, paintTextColorChannel)
{
    test001.text = "calcHtmlText";
    var _loc9_ = link_array.length > 0?false:true;
    var _loc5_ = null;
    htmlStr = lib.util.ExtString.replace(htmlStr,"<img","{@img#}",false);
    htmlStr = lib.util.ExtString.replace(htmlStr,"/>","{@img/#}",false);
    if(htmlStr == undefined)
    {
        _loc5_ = lib.util.ExtString.split(container_mc.input_mc.txt.htmlText,"<FONT");
    }
    else
    {
        _loc5_ = lib.util.ExtString.split(htmlStr,"<FONT");
    }
    var _loc6_ = _loc5_.length;
    if(isNaN(_loc6_))
    {
        _loc6_ = 1;
    }
    var _loc4_ = "";
    var _loc3_ = 0;
    while(_loc3_ < _loc6_)
    {
        var _loc2_ = "<FONT" + _loc5_[_loc3_];
        var _loc1_ = "";
        tf.htmlText = _loc2_;
        _loc1_ = tf.text;
        if(_loc1_ != "")
        {
            if(_loc1_.indexOf("<") != -1)
            {
                _loc1_ = lib.util.ExtString.replace(_loc1_,"<","&lt;",false);
            }
            if(_loc1_.indexOf(">") != -1)
            {
                _loc1_ = lib.util.ExtString.replace(_loc1_,">","&gt;",false);
            }
            if(_loc2_.indexOf("chatLinkAction") == -1)
            {
                _loc4_ = _loc4_ + ("<FONT color=\'" + sColor + "\'>" + _loc1_ + "</FONT>");
            }
            else
            {
                _loc4_ = _loc4_ + _loc2_;
            }
        }
        _loc3_ = _loc3_ + 1;
    }
    if(_loc4_ == "")
    {
        _loc4_ = htmlStr;
    }
    _loc4_ = lib.util.ExtString.replace(_loc4_,"{@img#}","<img",false);
    _loc4_ = lib.util.ExtString.replace(_loc4_,"{@img/#}","/>",false);
    return _loc4_;
}
function refreshTexts()
{
    lib.Debuger.trace("refreshTexts");
    var _loc7_ = tabArray[tab.activedNum];
    var _loc4_ = "";
    container_mc.output_mc.txt.htmlText = "";
    var _loc5_ = 0;
    while(_loc5_ < chatObjects[_loc7_].textArr.length)
    {
        _loc4_ = _loc4_ + chatObjects[_loc7_].textArr[_loc5_];
        _loc5_ = _loc5_ + 1;
    }
    container_mc.output_mc.txt.htmlText = _loc4_;
    if(sc.scroll == sc.scrollMax)
    {
        container_mc.output_mc.txt.scroll = container_mc.output_mc.txt.maxscroll;
    }
    else
    {
        sc.scrollMax = container_mc.output_mc.txt.maxscroll;
    }
    _loc5_ = 0;
    while(_loc5_ < viewerArray.length)
    {
        var _loc2_ = viewerArray[_loc5_];
        var _loc6_ = chatObjects[_loc2_].mc.scrollBar;
        var _loc3_ = chatObjects[_loc2_].mc.txt;
        _loc3_.htmlText = "";
        _loc4_ = "";
        var _loc1_ = 0;
        while(_loc1_ < chatObjects[_loc2_].textArr.length)
        {
            _loc4_ = _loc4_ + chatObjects[_loc2_].textArr[_loc1_];
            _loc1_ = _loc1_ + 1;
        }
        _loc3_.htmlText = _loc4_;
        if(_loc6_.scroll == _loc6_.scrollMax)
        {
            _loc3_.scroll = _loc3_.maxscroll;
        }
        else
        {
            _loc6_.scrollMax = _loc3_.maxscroll;
        }
        _loc5_ = _loc5_ + 1;
    }
}
function changeTabInMainChat(index)
{
    var _loc2_ = tabArray[index];
    var _loc4_ = chatObjects[_loc2_];
    currentTab = index;
    sc.scrollMax = chatObjects[_loc2_].textArr.length;
    sc.scroll = sc.scrollMax;
    if(_global.gbUIMode)
    {
        container_mc.output_mc.bg_mc._alpha = chatObjects[_loc2_].alpha;
    }
    else
    {
        container_mc.output_mc.bg_mc._alpha = chatObjects[_loc2_].alpha - 25;
    }
    container_mc.output_mc.txt.fontScaleFactor = chatObjects[_loc2_].fontSize;
    refreshTexts();
    getURL("FSCommand:ToGame_Chat_TabChanged",index);
}
function changeMainTab()
{
    tab.btn_array[tab.activedNum].gotoAndStop(1);
    tab.btn_array[tab.activedNum].txt.textColor = tabColorNormal;
    tab.activedNum = 0;
    tab.btn_array[0].gotoAndStop(4);
    tab.btn_array[tab.activedNum].txt.textColor = tabColorActive;
    changeTabInMainChat(0);
}
function html_To_NotHtml(htmlStr)
{
    dummy2.htmlText = htmlStr;
    var _loc1_ = dummy2.text;
    if(_loc1_.indexOf("<") != -1)
    {
        _loc1_ = lib.util.ExtString.replace(_loc1_,"<","&lt;",false);
    }
    if(_loc1_.indexOf(">") != -1)
    {
        _loc1_ = lib.util.ExtString.replace(_loc1_,">","&gt;",false);
    }
    if(_loc1_.indexOf("\'") != -1)
    {
        _loc1_ = lib.util.ExtString.replace(_loc1_,"\'","&&&;",false);
    }
    return _loc1_;
}
function broadCast(chatType, msgs, id, addParam, bLink, bName, bHTML, tabList, wisperType)
{
    var _loc12_ = lib.util.ExtString.split(tabList,"\t");
    if(_loc12_.length <= 0)
    {
        _loc12_.push(tabList);
    }
    addParam = Number(addParam);
    chatType = Number(chatType);
    addParam = Number(addParam);
    bName = Number(bName);
    bLink = Number(bLink);
    bHTML = Number(bHTML);
    wisperType = Number(wisperType);
    var _loc14_ = "[" + id + "]";
    if(id.indexOf("\'") != -1)
    {
        id = lib.util.ExtString.replace(id,"\'","",false);
    }
    if(addParam == 1)
    {
        _loc14_ = "[<img src=\'Icon_bless_Seren\' width=\'24\' height=\'24\' vspace=\'-7\'>" + id + "]";
    }
    else if(addParam == 2)
    {
        _loc14_ = "[<img src=\'Icon_GM\' width=\'28\' height=\'28\' vspace=\'-5\'>" + id + "]";
    }
    else if(addParam == 3)
    {
        _loc14_ = "[<img src=\'Icon_OldUser\' width=\'28\' height=\'28\' vspace=\'-5\'>" + id + "]";
    }
    var _loc15_ = msgs.split("\n");
    var _loc24_ = 0;
    var _loc10_ = 0;
    while(_loc10_ < _loc15_.length)
    {
        var _loc2_ = _loc15_[_loc10_];
        if(_loc10_ >= 1)
        {
            var _loc13_ = chatColor_array[chatType].shapColor;
            var _loc7_ = "";
            if(chatColor_array[chatType].type == 1)
            {
                if(wisperType == 0)
                {
                    _loc7_ = "<font color=\'" + chatColor_array[chatType].shapColor + "\'>" + "[" + channel_7 + "]" + "<a href=\'asfunction:chatNameAction," + id + "@" + chatType + "@" + html_To_NotHtml(_loc2_) + "\'>" + _loc14_ + "</a>" + lib.util.UIString.getUIString("$031087") + " : </font>";
                    setWhisperTarget("add",id);
                }
                else if(wisperType == 1)
                {
                    _loc7_ = "<font color=\'" + chatColor_array[chatType].shapColor + "\'>" + "   [" + channel_8 + "]" + "<a href=\'asfunction:chatNameAction," + id + "@" + chatType + "@" + html_To_NotHtml(_loc2_) + "\'>" + _loc14_ + "</a>" + lib.util.UIString.getUIString("$031087") + " : </font>";
                    setWhisperTarget("add",id);
                }
            }
            else
            {
                if(bName)
                {
                    var _loc16_ = chatColor_array[chatType].name;
                    _loc7_ = "<font color=\'" + _loc13_ + "\'>[" + _loc16_ + "]</font>";
                }
                if(bLink)
                {
                    if(id != undefined && id != "")
                    {
                        _loc7_ = _loc7_ + ("<font color=\'" + chatColor_array[chatType].shapColor + "\'>" + "<a href=\'asfunction:chatNameAction," + id + "@" + chatType + "@" + html_To_NotHtml(_loc2_) + "\'>" + _loc14_ + "</a>" + " : </font>");
                    }
                    else
                    {
                        _loc7_ = _loc7_ + "";
                    }
                }
            }
            if(bHTML)
            {
                var _loc17_ = calcHtmlText(_loc2_,1,chatType);
                _loc2_ = _loc7_ + _loc17_ + "\n";
            }
            else
            {
                _loc2_ = _loc7_ + "<font color=\'" + _loc13_ + "\'>" + _loc2_ + "</font>" + "\n";
            }
        }
        else
        {
            _loc2_ = _loc15_[_loc10_] + "\n";
        }
        var _loc3_ = 0;
        while(_loc3_ < _loc12_.length)
        {
            var _loc1_ = _loc12_[_loc3_];
            chatObjects[_loc1_].textArr.push(_loc2_);
            if(chatObjects[_loc1_].mainIndex == -1)
            {
                chatObjects[_loc1_].mc.txt.appendHtml(_loc2_);
                var _loc4_ = chatObjects[_loc3_].mc.scrollBar;
                var _loc6_ = chatObjects[_loc1_].mc.txt;
                if(chatObjects[_loc1_].maxLine < chatObjects[_loc1_].textArr.length)
                {
                    var _loc11_ = chatObjects[_loc1_].mc.txt.getLineOffset(CLEARLINE);
                    chatObjects[_loc1_].mc.txt.replaceText(0,_loc11_,"");
                }
                if(_loc4_.scroll == _loc4_.scrollMax)
                {
                    _loc6_.scroll = _loc6_.maxscroll;
                    _loc4_.glow = true;
                }
                else
                {
                    _loc4_.scrollMax = _loc6_.maxscroll;
                    _loc4_.glow = true;
                }
                fade(chatObjects[_loc1_].mc,100,0.3);
                startCountSepaTab(chatObjects[_loc3_].mc);
            }
            else if(_loc1_ == tabArray[tab.activedNum])
            {
                container_mc.output_mc.txt.appendHtml(_loc2_);
                if(chatObjects[_loc1_].maxLine < chatObjects[_loc1_].textArr.length)
                {
                    _loc11_ = container_mc.output_mc.txt.getLineOffset(CLEARLINE);
                    container_mc.output_mc.txt.replaceText(0,_loc11_,"");
                }
                if(sc.scroll == sc.scrollMax)
                {
                    container_mc.output_mc.txt.scroll = container_mc.output_mc.txt.maxscroll;
                    sc.glow = false;
                }
                else
                {
                    sc.scrollMax = container_mc.output_mc.txt.maxscroll;
                    sc.glow = true;
                }
                fade(container_mc,100,0.3);
                startCount();
            }
            else if(chatColor_array[chatType].type == 1)
            {
                var _loc9_ = chatObjects[_loc1_].mainIndex;
                tab.btn_array[_loc9_].glow._visible = true;
                lib.util.Warning.add(tab.btn_array[_loc9_].glow);
            }
            if(chatObjects[_loc1_].maxLine < chatObjects[_loc1_].textArr.length)
            {
                chatObjects[_loc1_].textArr.splice(0,CLEARLINE);
            }
            _loc3_ = _loc3_ + 1;
        }
        _loc10_ = _loc10_ + 1;
    }
}
function countClose()
{
    fade(container_mc,0,3);
    myListener.OnGame_Chat_ChangeChatMode(false);
    container_mc.onRollOver = function()
    {
        resetCount();
    };
    container_mc.cantChat_mc.hitTestDisable = true;
}
function resetCount()
{
    fade(container_mc,100,0.2);
    container_mc.cantChat_mc.hitTestDisable = false;
    delete container_mc.onRollOver;
}
function resetCountSepaTab(sepa)
{
    fade(sepa,100,0.2);
    startCountSepaTab(sepa);
    delete sepa.onRollOver;
}
function SepaTabCloseEvent(mc)
{
    fade(mc,0,3);
    mc.onRollOver = function()
    {
        resetCountSepaTab(mc);
    };
}
function startCountSepaTab(sepa)
{
    gs.TweenLite.killTweensOf(sepa.bg_mc,false);
    gs.TweenLite.to(sepa.bg_mc,0.1,{delay:invisibleSecond,onComplete:SepaTabCloseEvent,onCompleteParams:[sepa]});
}
function fade(target, opacity, time)
{
    gs.TweenLite.killTweensOf(target,false);
    gs.TweenLite.to(target,time,{_alpha:opacity});
}
function clearComboBox()
{
    comboBox1Maker.clearMovie();
    selectedChannel_txt.text = "";
    firstComboBox1Data = true;
    container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc._y = 0;
}
function ColorCheck(textCheck)
{
    var _loc4_ = textCheck.split("COLOR");
    var _loc5_ = _loc4_.length;
    var _loc2_ = 1;
    while(_loc2_ < _loc5_)
    {
        var _loc3_ = _loc4_[_loc2_];
        var _loc1_ = _loc3_.substring(3,9);
        if(_loc1_ == "FFCC00" || _loc1_ == "00AEEF" || _loc1_ == "4ECD30")
        {
            return true;
        }
        _loc2_ = _loc2_ + 1;
    }
    return false;
}
function addRecentSendMsg(htmlStr, link_array)
{
    var _loc1_ = new Array();
    _loc1_ = link_array.concat();
    recentMsg_array.push({STR:htmlStr,ARR:_loc1_});
    if(recentMsg_array.length > recentMsgMax)
    {
        recentMsg_array.shift();
    }
}
function setRecentMsg(method)
{
    if(method == "prev")
    {
        recentMsg_array.unshift(recentMsg_array.splice(recentMsg_array.length - 1,1)[0]);
    }
    else if(method == "next")
    {
        recentMsg_array.push(recentMsg_array.splice(0,1)[0]);
    }
    remakeInputTf();
    var _loc1_ = calcHtmlText(recentMsg_array[0].STR);
    container_mc.input_mc.txt.htmlText = _loc1_;
    saveText = recentMsg_array[0].STR;
    link_array = recentMsg_array[0].ARR.concat();
    notInputArea = false;
    linkDelete = false;
    setFocusAtInput();
}
function setWhisperTarget(method, target)
{
    if(method == "add")
    {
        var _loc3_ = false;
        var _loc2_ = null;
        var _loc4_ = whisperTarget_array.length;
        var _loc1_ = 0;
        while(_loc1_ < _loc4_ + 1)
        {
            if(whisperTarget_array[_loc1_] == target)
            {
                _loc2_ = _loc1_;
                _loc3_ = true;
                break;
            }
            _loc1_ = _loc1_ + 1;
        }
        if(_loc3_)
        {
            whisperTarget_array.unshift(whisperTarget_array.splice(_loc2_,1)[0]);
        }
        else
        {
            whisperTarget_array.unshift(target);
        }
        if(whisperTarget_array.length > 10)
        {
            whisperTarget_array.splice(whisperTarget_array.length - 1,1)[0];
        }
    }
    else if(method == "prev")
    {
        whisperTarget_array.unshift(whisperTarget_array.splice(whisperTarget_array.length - 1,1)[0]);
        currentWhisperTarget = whisperTarget_array[0];
        container_mc.input_mc.detail_txt.text = lib.util.UIString.getUIString("$031037","UserName",whisperTarget_array[0]);
        container_mc.input_mc.txt._x = inputTxt_x + container_mc.input_mc.detail_txt._width;
        container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
    }
    else if(method == "next")
    {
        whisperTarget_array.push(whisperTarget_array.splice(0,1)[0]);
        currentWhisperTarget = whisperTarget_array[0];
        container_mc.input_mc.detail_txt.text = lib.util.UIString.getUIString("$031037","UserName",whisperTarget_array[0]);
        container_mc.input_mc.txt._x = inputTxt_x + container_mc.input_mc.detail_txt._width;
        container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
    }
}
function changeWhisperMode(bTrue, target, bNotChatClear)
{
    if(bTrue)
    {
        currentWhisperTarget = target;
        container_mc.input_mc.detail_txt.text = lib.util.UIString.getUIString("$031037","UserName",target);
        container_mc.input_mc.detail_txt._visible = true;
        container_mc.input_mc.txt._x = inputTxt_x + container_mc.input_mc.detail_txt._width;
        container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
        whisperReadyMode = false;
        whisperMode = true;
    }
    else
    {
        container_mc.input_mc.detail_txt._visible = false;
        container_mc.input_mc.txt._x = inputTxt_x;
        container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
        whisperMode = false;
    }
    container_mc.input_mc.txt.maxChars = maxChatLeng;
    container_mc.input_mc.txt.text = !bNotChatClear?"":container_mc.input_mc.txt.text;
}
function impossibleCaretCheck()
{
    checkCaretPos = setTimeout(checkCaretPosAndRepos,10);
}
function checkCaretPosAndRepos()
{
    if(container_mc.input_mc.txt.caretIndex == 0 && link_array[0].sI == 1)
    {
        Selection.setSelection(container_mc.input_mc.txt.length,container_mc.input_mc.txt.length);
    }
    clearInterval(checkCaretPos);
}
function remakeInputTf()
{
    var _loc19_ = container_mc.input_mc.txt._x;
    var _loc18_ = container_mc.input_mc.txt._y;
    var _loc12_ = container_mc.input_mc.txt._name;
    var _loc15_ = container_mc.input_mc.txt._width;
    var _loc17_ = container_mc.input_mc.txt._height;
    var _loc14_ = container_mc.input_mc.txt.getDepth();
    var _loc7_ = container_mc.input_mc.createTextField(_loc12_,_loc14_,_loc19_,_loc18_,_loc15_,_loc17_);
    _loc7_.shadowBlurX = 2;
    _loc7_.shadowBlurY = 2;
    _loc7_.blurStrenth = 4;
    _loc7_.shadowDistance = 0.5;
    _loc7_.shadowAngle = 60;
    _global.chating = false;
    _global.inputing = false;
    _loc7_.embedFonts = true;
    _loc7_.maxChars = maxChatLeng;
    firstFormat.color = chatColor_array[currentChannel].color;
    firstFormat.size = 20;
    firstFormat.font = "$ChatFont";
    _loc7_.setNewTextFormat(firstFormat);
    _loc7_.html = true;
    _loc7_.type = "input";
    _loc7_.htmlText = "<font size=\'18\' color=\'" + chatColor_array[currentChannel].shapColor + "\'></font>";
    _loc7_.onChanged = function()
    {
        if(isFirstCaretAndLink())
        {
            this.htmlText = saveText;
            Selection.setSelection(container_mc.input_mc.txt.length,container_mc.input_mc.txt.length);
            return undefined;
        }
        if(notInputArea)
        {
            if(linkDelete)
            {
                if(eraseInputText.length > 0)
                {
                    eraseInputText = [];
                }
                saveText = this.htmlText;
                notInputArea = false;
                linkDelete = false;
            }
            else
            {
                this.htmlText = saveText;
                Selection.setSelection(container_mc.input_mc.txt.length,container_mc.input_mc.txt.length);
            }
        }
        else
        {
            if(saveText != this.htmlText)
            {
                var _loc7_ = link_array.length;
                if(selectionInputIndex.length > 1)
                {
                    var _loc4_ = selectionInputIndex[1] - selectionInputIndex[0];
                    var _loc5_ = [];
                    var _loc2_ = 0;
                    for(; _loc2_ < _loc7_; _loc2_ = _loc2_ + 1)
                    {
                        if(link_array[_loc2_].sI == container_mc.input_mc.txt.caretIndex)
                        {
                        }
                        if(link_array[_loc2_].sI >= selectionInputIndex[0])
                        {
                            if(link_array[_loc2_].sI < selectionInputIndex[1])
                            {
                                if(link_array[_loc2_].eI <= selectionInputIndex[1])
                                {
                                    _loc5_.push(_loc2_);
                                    continue;
                                }
                                if(link_array[_loc2_].eI > selectionInputIndex[1])
                                {
                                    _loc5_.push(_loc2_);
                                    var _loc10_ = !(saveDownKey == 46 || saveDownKey == 8)?selectionInputIndex[0] + 1:selectionInputIndex[0];
                                    var _loc11_ = !(saveDownKey == 46 || saveDownKey == 8)?selectionInputIndex[0] + link_array[_loc2_].eI - selectionInputIndex[1] + 1:selectionInputIndex[0] + link_array[_loc2_].eI - selectionInputIndex[1];
                                    this.replaceText(_loc10_,_loc11_,"");
                                    _loc4_ = _loc4_ + (link_array[_loc2_].eI - selectionInputIndex[1]);
                                    if(!(saveDownKey == 46 || saveDownKey == 8))
                                    {
                                        _loc4_ = _loc4_ - 1;
                                    }
                                    continue;
                                }
                            }
                        }
                        else if(link_array[_loc2_].sI < selectionInputIndex[0])
                        {
                            if(link_array[_loc2_].eI > selectionInputIndex[0] && link_array[_loc2_].eI <= selectionInputIndex[1])
                            {
                                _loc5_.push(_loc2_);
                                this.replaceText(link_array[_loc2_].sI - 1,selectionInputIndex[0],"");
                                _loc4_ = _loc4_ + (selectionInputIndex[0] - link_array[_loc2_].sI + 1);
                                Selection.setSelection(container_mc.input_mc.txt.length,container_mc.input_mc.txt.length);
                                continue;
                            }
                            continue;
                        }
                    }
                    _loc2_ = _loc5_.length - 1;
                    while(_loc2_ >= 0)
                    {
                        link_array.splice(_loc5_[_loc2_],1);
                        linkNum--;
                        _loc2_ = _loc2_ - 1;
                    }
                    _loc7_ = link_array.length;
                    _loc2_ = 0;
                    while(_loc2_ < _loc7_)
                    {
                        if(link_array[_loc2_].sI >= selectionInputIndex[1])
                        {
                            link_array[_loc2_].sI = link_array[_loc2_].sI - _loc4_;
                            link_array[_loc2_].eI = link_array[_loc2_].eI - _loc4_;
                        }
                        _loc2_ = _loc2_ + 1;
                    }
                    selectionInputIndex = [];
                    eraseLinkIndex = null;
                }
                else
                {
                    _loc7_ = link_array.length;
                    _loc2_ = 0;
                    while(_loc2_ < _loc7_)
                    {
                        if(link_array[_loc2_].sI >= container_mc.input_mc.txt.caretIndex)
                        {
                            if(saveDownKey == 229 || saveDownKey != 17 && saveDownKey != 13 && saveDownKey != 9 && saveDownKey != 38 && saveDownKey != 40 && saveDownKey != 39 && saveDownKey != 37 && saveDownKey != 18 && saveDownKey != 20 && saveDownKey != 35 && saveDownKey != 27 && saveDownKey != 36 && saveDownKey != 45 && saveDownKey != 16 && saveDownKey != 34 && saveDownKey != 33)
                            {
                                if(saveDownKey == 8 || saveDownKey == 46)
                                {
                                    link_array[_loc2_].sI = link_array[_loc2_].sI - 1;
                                    link_array[_loc2_].eI = link_array[_loc2_].eI - 1;
                                }
                                else
                                {
                                    link_array[_loc2_].sI = link_array[_loc2_].sI + 1;
                                    link_array[_loc2_].eI = link_array[_loc2_].eI + 1;
                                }
                            }
                        }
                        _loc2_ = _loc2_ + 1;
                    }
                    if(eraseLinkIndex != null)
                    {
                        var _loc9_ = link_array[eraseLinkIndex].sI;
                        var _loc8_ = link_array[eraseLinkIndex].eI;
                        _loc10_ = saveDownKey != 46?_loc9_ - 1:_loc9_;
                        _loc11_ = saveDownKey != 46?_loc8_ - 1:_loc8_;
                        this.replaceText(_loc10_,_loc11_,"");
                        var _loc3_ = 0;
                        while(_loc3_ < link_array.length)
                        {
                            if(link_array[eraseLinkIndex].eI < link_array[_loc3_].sI)
                            {
                                link_array[_loc3_].sI = link_array[_loc3_].sI - (link_array[eraseLinkIndex].eI - link_array[eraseLinkIndex].sI);
                                link_array[_loc3_].eI = link_array[_loc3_].eI - (link_array[eraseLinkIndex].eI - link_array[eraseLinkIndex].sI);
                            }
                            _loc3_ = _loc3_ + 1;
                        }
                        link_array.splice(eraseLinkIndex,1);
                        linkNum--;
                        if(linkNum <= 0)
                        {
                            linkNum = 0;
                        }
                        eraseLinkIndex = null;
                    }
                }
            }
            saveText = this.htmlText;
            var _loc6_ = this.text;
            if(whisperReadyMode && _loc6_.indexOf(" ") != -1)
            {
                setWhisperTarget("add",_loc6_.substr(0,_loc6_.indexOf(" ")));
                whisperReadyMode = false;
            }
            if(_loc6_.substr(0,1) == "/" && _loc6_.substr(_loc6_.length - 1,1) == " ")
            {
                ToGame_Chat_RequestSlashCommand(_loc6_);
            }
        }
        if(lib.util.ExtString.trim(this.text) == "")
        {
            this.text = "";
            this.htmlText = "";
            saveText = "";
            this.textColor = chatColor_array[currentChannel].color;
        }
    };
    _loc7_.onSetFocus = function()
    {
        _global.chating = true;
        _global.inputing = true;
        delete closer.onEnterFrame;
        inputFocus(true);
        lib.manager.Focus.currentFocus = container_mc.input_mc.txt;
    };
    _loc7_.onKillFocus = function()
    {
        _global.chating = false;
        _global.inputing = false;
        inputFocus(false);
    };
}
function isFirstCaretAndLink()
{
    if(container_mc.input_mc.txt.caretIndex <= 1 && link_array[0].sI == 1)
    {
        return true;
    }
    return false;
}
function calcHtmlText(htmlStr, paintTextColor, paintTextColorChannel)
{
    test001.text = "calcHtmlText";
    var _loc10_ = link_array.length > 0?false:true;
    var _loc5_ = null;
    htmlStr = lib.util.ExtString.replace(htmlStr,"<img","{@img#}",false);
    htmlStr = lib.util.ExtString.replace(htmlStr,"/>","{@img/#}",false);
    if(htmlStr == undefined)
    {
        _loc5_ = lib.util.ExtString.split(container_mc.input_mc.txt.htmlText,"<FONT");
    }
    else
    {
        _loc5_ = lib.util.ExtString.split(htmlStr,"<FONT");
    }
    var _loc6_ = _loc5_.length;
    if(isNaN(_loc6_))
    {
        _loc6_ = 1;
    }
    var _loc4_ = "";
    var _loc3_ = 0;
    while(_loc3_ < _loc6_)
    {
        var _loc2_ = "<FONT" + _loc5_[_loc3_];
        var _loc1_ = "";
        tf.htmlText = _loc2_;
        _loc1_ = tf.text;
        if(_loc1_ != "")
        {
            if(_loc1_.indexOf("<") != -1)
            {
                _loc1_ = lib.util.ExtString.replace(_loc1_,"<","&lt;",false);
            }
            if(_loc1_.indexOf(">") != -1)
            {
                _loc1_ = lib.util.ExtString.replace(_loc1_,">","&gt;",false);
            }
            if(_loc2_.indexOf("chatLinkAction") == -1)
            {
                if(paintTextColor == 1)
                {
                    _loc4_ = _loc4_ + ("<FONT size=\'18\' color=\'" + chatColor_array[paintTextColorChannel].shapColor + "\'>" + _loc1_ + "</FONT>");
                }
                else
                {
                    _loc4_ = _loc4_ + ("<FONT>" + _loc1_ + "</FONT>");
                }
            }
            else
            {
                _loc4_ = _loc4_ + _loc2_;
            }
        }
        _loc3_ = _loc3_ + 1;
    }
    _loc4_ = lib.util.ExtString.replace(_loc4_,"{@img#}","<img",false);
    _loc4_ = lib.util.ExtString.replace(_loc4_,"{@img/#}","/>",false);
    return _loc4_;
}
function setChatChannel(channelNum, target, bNotChatClear)
{
    linkNum = 0;
    for(line in container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc)
    {
        if(typeof container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc[line] == "movieclip")
        {
            if(Number(container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc[line].id) == channelNum)
            {
                selectedChannel_txt.setText(container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc[line].text_txt.text);
                comboBox1AbsoluteClose = true;
                currentChannel = channelNum;
                selectedChannel_txt.textColor = chatColor_array[channelNum].color;
                container_mc.input_mc.txt.textColor = chatColor_array[channelNum].color;
                container_mc.input_mc.txt.text = !bNotChatClear?"":container_mc.input_mc.txt.text;
                container_mc.input_mc.comboBox1_mc.open_btn.onRelease();
            }
        }
    }
    if(chatColor_array[channelNum].type == 1)
    {
        currentChannel = channelNum;
        selectedChannel_txt.textColor = chatColor_array[channelNum].color;
        container_mc.input_mc.txt.textColor = chatColor_array[channelNum].color;
        container_mc.input_mc.detail_txt.textColor = chatColor_array[channelNum].color;
        container_mc.input_mc.txt.text = !bNotChatClear?"":container_mc.input_mc.txt.text;
        changeWhisperMode(true,target,bNotChatClear);
    }
    else
    {
        changeWhisperMode(false,target,bNotChatClear);
    }
    saveText = "";
}
function addLink(htmlStr, str)
{
    if(container_mc.input_mc.txt.text.length + str.length <= maxChatLeng)
    {
        var _loc1_ = container_mc.input_mc.txt.length;
        saveText = container_mc.input_mc.txt.htmlText + htmlStr;
        dummy.htmlText = htmlStr;
        if(_loc1_ <= 0)
        {
            _loc1_ = 0;
        }
        link_array.push({sI:_loc1_ + 1,eI:_loc1_ + dummy.length,txt:htmlStr});
        container_mc.input_mc.txt.htmlText = saveText;
    }
}
function addInputText(str)
{
    if(container_mc.input_mc.txt.text.length + str.length <= maxChatLeng)
    {
        var _loc1_ = container_mc.input_mc.txt.length;
        saveText = container_mc.input_mc.txt.htmlText + str;
        dummy.htmlText = str;
        if(_loc1_ <= 0)
        {
            _loc1_ = 0;
        }
        container_mc.input_mc.txt.htmlText = saveText;
        setFocusAtInput();
    }
}
function OxToShap(str)
{
    return "#" + str.toString(16);
}
function setChatOptionMenu(dataList)
{
    var _loc3_ = 0;
    while(_loc3_ < 30)
    {
        container_mc.optionMenu_mc["line" + _loc3_].removeMovieClip();
        _loc3_ = _loc3_ + 1;
    }
    var _loc4_ = lib.util.ExtString.split(dataList,"\n");
    if(dataList != undefined && dataList != null && dataList != "")
    {
        _loc3_ = 0;
        while(_loc3_ < _loc4_.length)
        {
            if(_loc4_.length > 1)
            {
                var _loc8_ = container_mc.optionMenu_mc.attachMovie("line","line" + _loc3_,container_mc.optionMenu_mc.getNextHighestDepth());
                _loc8_._y = _loc8_._y + _loc3_ * lineH;
            }
            _loc3_ = _loc3_ + 1;
        }
        _loc3_ = 0;
        while(_loc3_ < _loc4_.length)
        {
            var _loc2_ = container_mc.optionMenu_mc["line" + _loc3_];
            _loc2_.stat = _loc3_;
            _loc2_.txt.text = _loc4_[_loc3_];
            var _loc5_ = new TextFormat();
            if(_loc2_.txt.maxscroll > 1)
            {
                _loc5_.size = 16;
                _loc2_.txt.setTextFormat(_loc5_);
            }
            _loc2_.txt.verticalAlign = "center";
            _loc2_.txt.textAutoSize = "shrink”";
            _loc2_.hit.onRollOver = function()
            {
                delete container_mc.optionMenu_mc.onEnterFrame;
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
                chatOptionOutClear();
            };
            _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
                chatOptionOutStart();
            };
            _loc2_.hit.onPress = function()
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            };
            _loc2_.hit.onRelease = function()
            {
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
                if(this._parent.stat == 0)
                {
                    ToGame_Chat_RequestAddTab();
                }
                else if(this._parent.stat == 1)
                {
                    var _loc2_ = chatObjects[firstIndex].lock;
                    chatObjects[firstIndex].lock = !_loc2_;
                    lock();
                    ToGame_Chat_SaveLock(chatObjects[firstIndex].lock);
                }
                else if(this._parent.stat == 2)
                {
                    var _loc3_ = tabArray[tab.activedNum];
                    ToGame_Chat_RequestOpenChatTabOptionUI(_loc3_);
                }
                else if(this._parent.stat == 3)
                {
                    ToGame_Chat_RequestInitPos();
                }
                else if(this._parent.stat == 4)
                {
                    ToGame_Chat_RequestInitChat();
                }
                chatOptionOutEnd();
            };
            _loc3_ = _loc3_ + 1;
        }
        container_mc.optionMenu_mc.bg._height = _loc4_.length * lineH + 18;
        container_mc.optionMenu_mc._y = -405 - container_mc.optionMenu_mc._height;
    }
}
function lock()
{
    if(chatObjects[firstIndex].lock)
    {
        container_mc.optionMenu_mc.line1.txt.setText(unlockChatStr);
    }
    else
    {
        container_mc.optionMenu_mc.line1.txt.setText(lockChatStr);
    }
}
function chatOptionOutClear()
{
    delete container_mc.optionMenu_mc.onEnterFrame;
}
function chatOptionOutEnd()
{
    chatOptionOutClear();
    container_mc.output_mc.option_btn.gotoAndStop(1);
    container_mc.optionMenu_mc._visible = false;
    startCount();
}
function chatOptionOutStart()
{
    resetCount();
    container_mc.optionMenu_mc.cnt = 0;
    container_mc.optionMenu_mc.onEnterFrame = function()
    {
        this.cnt++;
        if(this.cnt >= 50)
        {
            startCount();
            chatOptionOutEnd();
            delete this.onEnterFrame;
        }
    };
}
function defaultPosInit()
{
    initMainChatPos();
    var _loc1_ = 0;
    while(_loc1_ < viewerArray.length)
    {
        var _loc2_ = viewerArray[_loc1_];
        attachSepaOnMainChat(tabArray.length,chatObjects[_loc2_].mc);
        _loc1_ = _loc1_ + 1;
    }
}
function setInteractionMenu(dataList)
{
    var menu = container_mc.interactionMenu_mc;
    var _loc3_ = 1;
    while(_loc3_ < 30)
    {
        menu["line" + _loc3_].removeMovieClip();
        _loc3_ = _loc3_ + 1;
    }
    var _loc5_ = dataList.split("\n");
    if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
    {
        _loc5_.splice(_loc5_.length - 1,1);
    }
    if(dataList != undefined && dataList != null && dataList != "")
    {
        _loc3_ = 0;
        while(_loc3_ < _loc5_.length)
        {
            if(_loc5_.length > 1)
            {
                var _loc2_ = menu.attachMovie("line","line" + _loc3_,menu.getNextHighestDepth());
                _loc2_._y = _loc2_._y + _loc3_ * lineH;
                var _loc4_ = _loc5_[_loc3_].split("\t");
                if(_loc4_.length != 1)
                {
                    _loc2_ = menu["line" + _loc3_];
                    _loc2_.stat = _loc3_;
                    _loc2_.id = _loc4_[0];
                    _loc2_.txt.text = _loc4_[1];
                    var _loc6_ = new TextFormat();
                    if(_loc2_.txt.maxscroll > 1)
                    {
                        _loc6_.size = 16;
                        _loc2_.txt.setTextFormat(_loc6_);
                    }
                    _loc2_.txt.verticalAlign = "center";
                    _loc2_.txt.textAutoSize = "shrink”";
                    _loc2_.hit.onRollOver = function()
                    {
                        delete menu.onEnterFrame;
                        this._parent.effect.gotoAndPlay("over");
                        this._parent.effect._alpha = 50;
                    };
                    _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
                    {
                        this._parent.effect.gotoAndPlay("out");
                        interactionMenuClosing();
                    };
                    _loc2_.hit.onRelease = function()
                    {
                        ToGame_Chat_ClickInteractionMenu(this._parent.id);
                        interactionMenuClosing(1);
                    };
                }
            }
            _loc3_ = _loc3_ + 1;
        }
        menu.bg._height = menu["line" + _loc5_.length - 1]._y + menu["line" + _loc5_.length - 1]._height;
        menu.line0._visible = false;
    }
}
function interactionMenuClosing(rightNow)
{
    if(rightNow)
    {
        container_mc.interactionMenu_mc._visible = false;
        delete container_mc.interactionMenu_mc.onEnterFrame;
    }
    else
    {
        container_mc.interactionMenu_mc.cnt = 0;
        container_mc.interactionMenu_mc.onEnterFrame = function()
        {
            this.cnt++;
            if(this.cnt >= 720)
            {
                this._visible = false;
                delete this.onEnterFrame;
            }
        };
    }
}
function createNewChatObj()
{
    var _loc1_ = new Object();
    _loc1_.isMaxScroll = true;
    _loc1_.scroll = 8;
    _loc1_.alpha = mainTabAlpha;
    _loc1_.fontSize = baseFontScale;
    _loc1_.textArr = new Array();
    _loc1_.maxLine = MAXLINE;
    return _loc1_;
}
function getChatObjectNum()
{
    var _loc3_ = chatObjects.length;
    var _loc2_ = 0;
    var _loc1_ = 0;
    while(_loc1_ < _loc3_)
    {
        if(chatObjects[_loc1_] != undefined || chatObjects[_loc1_] != null)
        {
            _loc2_ = _loc2_ + 1;
        }
        _loc1_ = _loc1_ + 1;
    }
    return _loc2_;
}
function moveTab(index)
{
    var _loc1_ = tabArray.length;
    while(_loc1_ > index)
    {
        var _loc2_ = tab.txt_array[_loc1_ - 1].txt;
        var _loc3_ = tab.txt_array[_loc1_];
        set2LineText(_loc3_,_loc2_);
        tab.txt_array[_loc1_].txt = _loc2_;
        tab.setVisible(_loc1_,1);
        _loc1_ = _loc1_ - 1;
    }
}
function removeSepaTab(index)
{
    ToGame_Chat_RemoveTab(index);
    chatObjects[index].mc.removeMovieClip();
    chatObjects[index] = null;
}
function removeTab(index, nextSelectMainTab)
{
    var _loc1_ = index;
    while(_loc1_ < tabArray.length)
    {
        var _loc2_ = tab.txt_array[_loc1_ + 1].txt;
        var _loc3_ = tab.txt_array[_loc1_];
        set2LineText(_loc3_,_loc2_);
        tab.txt_array[_loc1_].txt = _loc2_;
        tab.btn_array[_loc1_]._alpha = chatObjects[tabArray[_loc1_ + _loc1_]].alpha;
        _loc1_ = _loc1_ + 1;
    }
    if(nextSelectMainTab)
    {
        changeMainTab();
    }
    tab.setVisible(tabArray.length - 1,0);
    tabArray.splice(index,1);
    _loc1_ = index;
    while(_loc1_ < tabArray.length)
    {
        chatObjects[tabArray[_loc1_]].mainIndex = _loc1_;
        _loc1_ = _loc1_ + 1;
    }
    refreshTexts();
    tab.alignText(undefined,3);
}
function resetTab()
{
    var _loc1_ = 0;
    while(_loc1_ < tabArray.length)
    {
        tab.setVisible(_loc1_,0);
        tab.btn_array[_loc1_]._alpha = mainTabAlpha;
        _loc1_ = _loc1_ + 1;
    }
    viewerArray = [];
    chatObjects = [];
    tabArray = [];
    firstIndex = -1;
    for(mc in UI)
    {
        var _loc2_ = UI[mc];
        if(typeof _loc2_ == "movieclip" && _loc2_._name.substr(0,6) == "viewer")
        {
            _loc2_.removeMovieClip();
        }
    }
    setEnableMenuLine(undefined,1);
    changeMainTab();
}
function resetText()
{
    container_mc.output_mc.txt.htmlText = "";
    refreshTexts();
}
function makeViewer(maxScroll, index, tabName, x, y, width, height, alpha, fontSize)
{
    var mc = UI.attachMovie("viewer","viewer_" + index,UI.getNextHighestDepth());
    mc._xscale = mc._yscale = lib.info.AlignInfo.scaleRatio * 100;
    mc.stat = index;
    mc.tab0_txt.verticalAlign = "center";
    set2LineText(mc.tab0_txt,tabName);
    mc.tab0_txt.txt = tabName;
    mc.tab0_mc.glow._visible = false;
    mc.scrollBar.onEnterFrame = function()
    {
        if(mc.scrollBar.defaultBarSizeRatio == 1)
        {
            mc.scrollBar.setTextField(mc.txt);
            mc.scrollBar.setWheel(mc.txt);
            mc.scrollBar.addListener(mc);
            mc.scrollBar.defaultBarSizeRatio = 0.3333333333333333;
            mc.onScroll = function(delta)
            {
                if(delta < 0)
                {
                    this.txt.scroll = this.txt.scroll + 1;
                }
                else
                {
                    this.txt.scroll = this.txt.scroll - 1;
                }
            };
            mc.scrollBar.onMaxScroll = function()
            {
                this.glow = false;
            };
            mc.scrollBar.scroll = mc.txt.maxscroll;
            mc.scrollBar.resize(height + outputTxt_yGap);
            mc.scrollBar.barBg._visible = false;
            delete this.onEnterFrame;
        }
    };
    mc._x = x;
    mc._y = y;
    mc.xRatio = lib.info.AlignInfo.xPixelToRatio(x);
    mc.yRatio = lib.info.AlignInfo.yPixelToRatio(y);
    mc.txt._width = width + outputTxt_xGap;
    mc.txt._height = height + outputTxt_yGap;
    mc.bg_mc._width = width;
    mc.bg_mc._height = height;
    mc.expander._x = mc.bg_mc._width - 80;
    mc.expander._y = mc.bg_mc._height - mc.expander._height;
    resizeWork(mc.bg_mc,mc.expander,sepaChatMinWidth,sepaChatMinHeight,baseChatWidth * 2,baseChatHeight * 3);
    mc.tabOptionMenu_mc._visible = false;
    var _loc9_ = removeTabStr + "\n" + optionTabStr + "\n" + addPrivateChannelStr + "\n" + initTabPosStr;
    var _loc6_ = lib.util.ExtString.split(_loc9_,"\n");
    if(_loc9_ != undefined && _loc9_ != null && _loc9_ != "")
    {
        var _loc5_ = 0;
        while(_loc5_ < _loc6_.length)
        {
            if(_loc6_.length > 1)
            {
                var _loc4_ = mc.tabOptionMenu_mc.attachMovie("line","line" + _loc5_,mc.tabOptionMenu_mc.getNextHighestDepth());
                _loc4_._y = _loc5_ * lineH;
            }
            _loc5_ = _loc5_ + 1;
        }
        _loc5_ = 0;
        while(_loc5_ < _loc6_.length)
        {
            _loc4_ = mc.tabOptionMenu_mc["line" + _loc5_];
            _loc4_.stat = _loc5_;
            _loc4_.txt.text = _loc6_[_loc5_];
            var _loc7_ = new TextFormat();
            if(_loc4_.txt.maxscroll > 1)
            {
                _loc7_.size = 16;
                _loc4_.txt.setTextFormat(_loc7_);
            }
            _loc4_.txt.verticalAlign = "center";
            _loc4_.txt.textAutoSize = "shrink”";
            _loc4_.hit.onRollOver = function()
            {
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
                clearSepaTabOptionOut(mc);
            };
            _loc4_.hit.onRollOut = _loc4_.hit.onReleaseOutside = function()
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
                startSepaTabOptionOut(mc);
            };
            _loc4_.hit.onPress = function()
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            };
            _loc4_.hit.onRelease = function()
            {
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
                if(this._parent.stat == -1)
                {
                    addTab(1);
                }
                else if(this._parent.stat == 0)
                {
                    removeSepaTab(mc.stat);
                }
                else if(this._parent.stat == 1)
                {
                    ToGame_Chat_RequestOpenChatTabOptionUI(index);
                }
                else if(this._parent.stat == 2)
                {
                    ToGame_Chat_RequestPrivateChannelUI(index);
                }
                else if(this._parent.stat == 3)
                {
                    attachSepaOnMainChat(tabArray.length,mc);
                    saveTabInfo();
                }
                startSepaTabOptionOut(mc,1);
            };
            _loc5_ = _loc5_ + 1;
        }
        mc.tabOptionMenu_mc.bg._height = _loc6_.length * lineH + 18;
    }
    mc.tabOptionMenu_mc._y = -38 - mc.tabOptionMenu_mc._height;
    mc.btn = new lib.util.TxtBtn(mc.tab0_mc,mc.tab0_txt);
    mc.btn.setTextColor(tabColorActive,tabColorActive,tabColorActive,tabColorActive);
    mc.btn.setTextDropShadow(2,2,2,0,0,0);
    mc.btn.alignText(0,5);
    mc.btn.setPress(function()
    {
        sepaDragingMc = mc;
        startSepaTabOptionOut(mc,1);
        var _loc3_ = - lib.info.AlignInfo.horizontalSpace;
        var _loc4_ = Stage.width - lib.info.AlignInfo.horizontalSpace - 200 * lib.info.AlignInfo.scaleRatio;
        var _loc1_ = - lib.info.AlignInfo.verticalSpace + 40 * lib.info.AlignInfo.scaleRatio;
        var _loc2_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - 90 * lib.info.AlignInfo.scaleRatio;
        if(chatObjects[firstIndex].lock != 1)
        {
            startDrag(mc,0,_loc3_,_loc1_,_loc4_,_loc2_);
        }
    }
    );
    mc.btn.setRelease(function()
    {
        sepaDragingMc = null;
        mc.xRatio = lib.info.AlignInfo.xPixelToRatio(mc._x);
        mc.yRatio = lib.info.AlignInfo.yPixelToRatio(mc._y);
        stopDrag();
        saveTabInfo();
    }
    );
    mc.btn.setReleaseOutside(function()
    {
        sepaDragingMc = null;
        mc.xRatio = lib.info.AlignInfo.xPixelToRatio(mc._x);
        mc.yRatio = lib.info.AlignInfo.yPixelToRatio(mc._y);
        stopDrag();
        saveTabInfo();
    }
    );
    mc.optionMenu_mc._visible = false;
    mc.option_btn.onRollOver = function()
    {
        lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$032001"),1);
        if(this._currentframe == 1)
        {
            this.gotoAndStop(2);
        }
    };
    mc.option_btn.onRollOut = mc.option_btn.onReleseOutside = function()
    {
        if(this._currentframe == 2)
        {
            this.gotoAndStop(1);
        }
    };
    mc.option_btn.onRelease = function()
    {
        lib.manager.ToolTip.remove(this);
        lib.manager.UISound.play(lib.manager.UISound.CHAT_OPTION);
        if(this._currentframe != 3)
        {
            this.gotoAndStop(3);
            mc.tabOptionMenu_mc._visible = true;
            var _loc3_ = {x:_root._xmouse,y:_root._ymouse};
            mc.globalToLocal(_loc3_);
            if(20 > lib.info.AlignInfo.yPixelToRatio(_root._ymouse))
            {
                mc.tabOptionMenu_mc._y = _loc3_.y + 30 * lib.info.AlignInfo.scaleRatio;
            }
            else
            {
                mc.tabOptionMenu_mc._y = _loc3_.y - mc.tabOptionMenu_mc._height - 30 * lib.info.AlignInfo.scaleRatio;
            }
            if(80 > lib.info.AlignInfo.xPixelToRatio(_root._xmouse))
            {
                mc.tabOptionMenu_mc._x = _loc3_.x - 15 * lib.info.AlignInfo.scaleRatio;
            }
            else
            {
                mc.tabOptionMenu_mc._x = _loc3_.x - mc.tabOptionMenu_mc._width + 15 * lib.info.AlignInfo.scaleRatio;
            }
            startSepaTabOptionOut(mc);
            resetCountSepaTab(mc);
            if(mc.tabOptionMenu_mc._visible)
            {
                chatOptionOutEnd();
            }
        }
        else
        {
            this.gotoAndStop(1);
            chatOptionOutEnd();
        }
    };
    lib.manager.ToolTip.add(mc.option_btn,lib.util.UIString.getUIString("$032001"),1);
    mc.bg_mc._alpha = alpha;
    mc.btn.btn._alpha = alpha;
    mc.txt.fontScaleFactor = fontSize;
    if(_global.gbUIMode)
    {
        mc.expander._visible = true;
        mc.option_btn._visible = true;
    }
    else
    {
        mc.expander._visible = false;
        mc.option_btn._visible = false;
    }
    startCountSepaTab(mc);
    return mc;
}
function startSepaTabOptionOut(mc, rightNow)
{
    mc.cnt = 0;
    if(!rightNow)
    {
        mc.onEnterFrame = function()
        {
            this.cnt++;
            if(this.cnt >= 50)
            {
                mc.tabOptionMenu_mc._visible = false;
                mc.option_btn.gotoAndStop(1);
                startCountSepaTab(this);
                delete mc.onEnterFrame;
            }
        };
    }
    else
    {
        mc.tabOptionMenu_mc._visible = false;
        mc.option_btn.gotoAndStop(1);
        startCountSepaTab(this);
        delete mc.onEnterFrame;
    }
}
function clearSepaTabOptionOut(mc)
{
    delete mc.onEnterFrame;
}
function attachSepaOnMainChat(attachIndex, sepaMc)
{
    var _loc4_ = sepaMc.stat;
    moveTab(attachIndex);
    tabArray.splice(attachIndex,0,_loc4_);
    var _loc1_ = 0;
    while(_loc1_ < tabArray.length)
    {
        chatObjects[tabArray[_loc1_]].mainIndex = _loc1_;
        _loc1_ = _loc1_ + 1;
    }
    viewerArray.splice(chatObjects[sepaMc.stat].viewerIndex,1);
    _loc1_ = 0;
    while(_loc1_ < viewerArray.length)
    {
        chatObjects[viewerArray[_loc1_]].viewerIndex = _loc1_;
        _loc1_ = _loc1_ + 1;
    }
    chatObjects[sepaMc.stat].viewerIndex = -1;
    tab.btn_array[attachIndex]._alpha = chatObjects[sepaMc.stat].alpha;
    var _loc5_ = tab.txt_array[attachIndex];
    set2LineText(_loc5_,sepaMc.tab0_txt.txt);
    tab.setVisible(attachIndex,1);
    tab.txt_array[attachIndex].txt = sepaMc.tab0_txt.txt;
    sepaMc.removeMovieClip();
    sepaMc = null;
    chatObjects[_loc4_].mc = null;
    changeTabInMainChat(attachIndex);
    tab.setTab(attachIndex,1);
    currentTab = attachIndex;
}
function openChatTabOptionUI(index, name)
{
    var _loc4_ = "";
    var _loc6_ = "";
    var _loc2_ = 0;
    while(_loc2_ < chatObjects[index].channelArr.length)
    {
        if(Number(chatObjects[index].channelArr[_loc2_]) == 1 || Number(chatObjects[index].channelArr[_loc2_]) == 0)
        {
            _loc4_ = _loc4_ + (_loc2_ + "\t");
            var _loc5_ = chatColor_array[_loc2_].name;
            _loc4_ = _loc4_ + (_loc5_ + "\t");
            _loc4_ = _loc4_ + (chatObjects[index].channelArr[_loc2_] + "\n");
        }
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < chatColor_array.length)
    {
        if(chatColor_array[_loc2_] != undefined && chatColor_array[_loc2_] != "undefined")
        {
            _loc6_ = _loc6_ + (_loc2_ + "\t");
            _loc6_ = _loc6_ + (chatColor_array[_loc2_].color.toString(16) + "\n");
        }
        _loc2_ = _loc2_ + 1;
    }
    _root.OnGameEvent("OnGame_ChatTabOption_SetTabInfo",index,name,_loc4_,chatObjects[index].alpha,chatObjects[index].fontSize,_loc6_);
    _root.OnGameEvent("OnGameEventShowUI","ChatTabOption",1);
}
function setTabOptionMenu(dataList)
{
    var _loc5_ = lib.util.ExtString.split(dataList,"\n");
    if(dataList != undefined && dataList != null && dataList != "")
    {
        var _loc3_ = 0;
        while(_loc3_ < _loc5_.length)
        {
            if(_loc5_.length > 1)
            {
                var _loc8_ = container_mc.output_mc.tabOptionMenu_mc.attachMovie("line","line" + _loc3_,container_mc.output_mc.tabOptionMenu_mc.getNextHighestDepth());
                _loc8_._y = _loc3_ * lineH;
            }
            _loc3_ = _loc3_ + 1;
        }
        _loc3_ = 0;
        while(_loc3_ < _loc5_.length)
        {
            var _loc2_ = container_mc.output_mc.tabOptionMenu_mc["line" + _loc3_];
            _loc2_.stat = _loc3_;
            _loc2_.txt.text = _loc5_[_loc3_];
            var _loc7_ = new TextFormat();
            if(_loc2_.txt.maxscroll > 1)
            {
                _loc7_.size = 16;
                _loc2_.txt.setTextFormat(_loc7_);
            }
            _loc2_.txt.verticalAlign = "center";
            _loc2_.txt.textAutoSize = "shrink”";
            _loc2_.hit.onRollOver = function()
            {
                delete container_mc.output_mc.tabOptionMenu_mc.onEnterFrame;
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 16777215;
                clearTabOptionOut();
            };
            _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
            {
                this._parent.gotoAndStop(1);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
                this._parent.txt.shadowColor = 0;
                startTabOptionOut();
            };
            _loc2_.hit.onPress = function()
            {
                this._parent.gotoAndStop(3);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
                this._parent.txt.shadowColor = 0;
            };
            _loc2_.hit.onRelease = function()
            {
                this._parent.gotoAndStop(2);
                this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
                this._parent.txt.shadowColor = 0;
                var _loc2_ = undefined;
                if(this._parent.stat == 0)
                {
                    if(tab.activedNum != 0)
                    {
                        var _loc3_ = tabArray[tab.activedNum];
                        removeTab(tab.activedNum,1);
                        chatObjects[_loc3_] = null;
                        ToGame_Chat_RemoveTab(_loc3_);
                    }
                }
                else if(this._parent.stat == 1)
                {
                    _loc2_ = tabArray[tab.activedNum];
                    ToGame_Chat_RequestOpenChatTabOptionUI(_loc2_);
                }
                else if(this._parent.stat == 2)
                {
                    _loc2_ = tabArray[tab.activedNum];
                    ToGame_Chat_RequestPrivateChannelUI(_loc2_);
                }
                else if(this._parent.stat == 3)
                {
                    ToGame_Chat_RequestAddTab();
                }
                startTabOptionOut(1);
            };
            _loc3_ = _loc3_ + 1;
        }
        container_mc.output_mc.tabOptionMenu_mc.bg._height = _loc5_.length * lineH + 18;
    }
    container_mc.output_mc.tabOptionMenu_mc._y = -47 - container_mc.output_mc.tabOptionMenu_mc._height;
}
function startTabOptionOut(now)
{
    container_mc.output_mc.tabOptionMenu_mc.cnt = 0;
    container_mc.output_mc.tabOptionMenu_mc.onEnterFrame = function()
    {
        this.cnt++;
        if(this.cnt >= 30)
        {
            delete this.onEnterFrame;
            this._visible = false;
            startCount();
        }
    };
    if(now)
    {
        delete container_mc.output_mc.tabOptionMenu_mc.onEnterFrame;
        container_mc.output_mc.tabOptionMenu_mc._visible = false;
        startCount();
    }
    startCount();
}
function clearTabOptionOut()
{
    delete container_mc.output_mc.tabOptionMenu_mc.onEnterFrame;
}
function saveTabInfo()
{
    ToGame_Chat_StartSaveTabInfo();
    var _loc2_ = 0;
    while(_loc2_ < tabArray.length)
    {
        var _loc3_ = tabArray[_loc2_];
        ToGame_Chat_SaveTabInfo(_loc3_,container_mc._x,container_mc._y,container_mc.output_mc.bg_mc._width,container_mc.output_mc.bg_mc._height,"0");
        _loc2_ = _loc2_ + 1;
    }
    _loc2_ = 0;
    while(_loc2_ < viewerArray.length)
    {
        var _loc1_ = viewerArray[_loc2_];
        ToGame_Chat_SaveTabInfo(_loc1_,chatObjects[_loc1_].mc._x,chatObjects[_loc1_].mc._y,chatObjects[_loc1_].mc.bg_mc._width,chatObjects[_loc1_].mc.bg_mc._height,"1");
        _loc2_ = _loc2_ + 1;
    }
    ToGame_Chat_EndSaveTabInfo();
}
function setDefaultOption()
{
    _root.OnGameEvent("OnGame_Chat_SetTabInfo",1,channel_1,DefaultChatCahnnels[1],mainTabAlpha,baseFontScale * 100);
    _root.OnGameEvent("OnGame_Chat_SetTabInfo",2,channel_28,DefaultChatCahnnels[6],mainTabAlpha,baseFontScale * 100);
    _root.OnGameEvent("OnGame_Chat_SetTabInfo",3,channel_24,DefaultChatCahnnels[3],mainTabAlpha,baseFontScale * 100);
    _root.OnGameEvent("OnGame_Chat_SetTabInfo",4,battleStr,DefaultChatCahnnels[4],mainTabAlpha,baseFontScale * 100);
    _root.OnGameEvent("OnGame_Chat_SetTabInfo",5,channel_19,DefaultChatCahnnels[5],mainTabAlpha,baseFontScale * 100);
    _root.OnGameEvent("OnGame_Chat_SetTabInfo",6,whisperStr,DefaultChatCahnnels[2],mainTabAlpha,baseFontScale * 100);
    setDefaultColor();
}
function resizeWork(resizeTarget, drager, minW, minH, maxW, maxH, w, h)
{
    lib.manager.ToolTip.add(drager,lib.util.UIString.getUIString("$031077"),1);
    drager.dragging = false;
    drager.onRollOver = function()
    {
        this.gotoAndStop(2);
    };
    drager.onRollOut = function()
    {
        this.gotoAndStop(1);
    };
    drager.onPress = function()
    {
        lib.manager.ToolTip.hide(this);
        if(chatObjects[firstIndex].lock == 0)
        {
            if(resizeTarget._parent == container_mc.output_mc)
            {
                resetCount();
            }
            else
            {
                resetCountSepaTab(resizeTarget._parent);
            }
            this.gotoAndStop(3);
            this.dragging = dragerDragging = true;
            this.xmouse = resizeTarget._xmouse;
            this.ymouse = resizeTarget._ymouse;
            this.onEnterFrame = function()
            {
                var _loc4_ = resizeTarget._xmouse - this.xmouse;
                var _loc5_ = resizeTarget._ymouse - this.ymouse;
                var _loc3_ = null;
                var _loc2_ = null;
                if(minW < resizeTarget._width + _loc4_ && maxW > resizeTarget._width + _loc4_)
                {
                    _loc3_ = resizeTarget._width + _loc4_;
                    this._x = this._x + _loc4_;
                }
                else if(minW >= resizeTarget._width + _loc4_)
                {
                    _loc3_ = minW;
                    this._x = _loc3_ - 80;
                }
                else if(maxW <= resizeTarget._width + _loc4_)
                {
                    _loc3_ = maxW;
                    this._x = _loc3_ - 80;
                }
                if(minH < resizeTarget._height + _loc5_ && maxH > resizeTarget._height + _loc5_)
                {
                    _loc2_ = resizeTarget._height + _loc5_;
                    this._y = this._y + _loc5_;
                }
                else if(minH >= resizeTarget._height + _loc5_)
                {
                    _loc2_ = minH;
                    this._y = _loc2_ - this._height;
                }
                else if(maxH <= resizeTarget._height + _loc5_)
                {
                    _loc2_ = maxH;
                    this._y = _loc2_ - this._height;
                }
                if(w == undefined && h == undefined)
                {
                    if(resizeTarget._parent == container_mc.output_mc)
                    {
                        container_mc.output_mc.txt._width = _loc3_ + outputTxt_xGap;
                        container_mc.output_mc.txt._height = _loc2_;
                        container_mc.input_mc.bg_mc._width = _loc3_ + inputTxt_xGap;
                        container_mc.input_mc.txt_focus._width = container_mc.input_mc.bg_mc._width - 168 - 25;
                        container_mc.input_mc.changeLang_mc._x = container_mc.input_mc.bg_mc._x + container_mc.input_mc.bg_mc._width - container_mc.input_mc.changeLang_mc._width - 25;
                        container_mc.input_mc.social_mc._x = container_mc.input_mc.changeLang_mc._x + 24;
                        container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
                        container_mc.input_mc._y = _loc2_ - 576;
                        container_mc.interactionMenu_mc._x = _loc3_;
                        sc.resize(_loc2_ - 5);
                        sc.scroll = sc.scrollMax;
                    }
                    else
                    {
                        resizeTarget._parent.txt._width = _loc3_ + outputTxt_xGap;
                        resizeTarget._parent.txt._height = _loc2_ + outputTxt_yGap;
                        resizeTarget._parent.scrollBar.resize(_loc2_ + outputTxt_yGap);
                        resizeTarget._parent.scrollBar.scroll = resizeTarget._parent.scrollBar.scrollMax;
                    }
                    resizeTarget._width = _loc3_;
                    resizeTarget._height = _loc2_;
                }
                else
                {
                    if(resizeTarget._parent == container_mc.output_mc)
                    {
                        container_mc.output_mc.txt._width = w + outputTxt_xGap;
                        container_mc.output_mc.txt._height = h;
                        container_mc.input_mc.bg_mc._width = container_mc.output_mc._width + inputTxt_xGap;
                        container_mc.input_mc.txt_focus._width = container_mc.input_mc.bg_mc._width - 168 - 25;
                        container_mc.input_mc.changeLang_mc._x = container_mc.input_mc.bg_mc._x + container_mc.input_mc.bg_mc._width - container_mc.input_mc.changeLang_mc._width - 4 - 25;
                        container_mc.input_mc.social_mc._x = container_mc.input_mc.changeLang_mc._x + 24;
                        container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
                        container_mc.input_mc._y = _loc2_ - 576;
                        container_mc.interactionMenu_mc._x = _loc3_;
                        sc.resize(h - 5);
                        sc.scroll = sc.scrollMax;
                    }
                    else
                    {
                        resizeTarget._parent.txt._width = w + outputTxt_xGap;
                        resizeTarget._parent.txt._height = h + outputTxt_yGap;
                        resizeTarget._parent.scrollBar.resize(h + outputTxt_yGap);
                        resizeTarget._parent.scrollBar.scroll = resizeTarget._parent.scrollBar.scrollMax;
                    }
                    resizeTarget._width = w;
                    resizeTarget._height = h;
                }
                dragPosObj.x = resizeTarget._xmouse;
                dragPosObj.y = resizeTarget._ymouse;
            };
        }
    };
    drager.onRelease = drager.onReleaseOutside = function()
    {
        refreshTexts();
        if(resizeTarget._parent == container_mc.output_mc)
        {
            startCount();
        }
        else
        {
            startCountSepaTab(resizeTarget._parent);
        }
        this.gotoAndStop(1);
        this.dragging = dragerDragging = false;
        delete this.onEnterFrame;
        saveTabInfo();
        if(container_mc.input_mc._visible)
        {
            setFocusAtInput();
        }
    };
}
function baseViewerSizeSet(aimW, aimH)
{
    container_mc.output_mc.bg_mc._width = aimW;
    container_mc.output_mc.bg_mc._height = aimH;
    container_mc.output_mc.txt._width = aimW + outputTxt_xGap;
    container_mc.output_mc.txt._height = aimH;
    container_mc.input_mc.bg_mc._width = aimW + inputTxt_xGap;
    container_mc.input_mc.txt_focus._width = container_mc.input_mc.bg_mc._width - 168 - 25;
    container_mc.input_mc.changeLang_mc._x = container_mc.input_mc.bg_mc._x + container_mc.input_mc.bg_mc._width - container_mc.input_mc.changeLang_mc._width - 25;
    container_mc.input_mc.social_mc._x = container_mc.input_mc.changeLang_mc._x + 24;
    container_mc.input_mc.txt._width = container_mc.input_mc.changeLang_mc._x - container_mc.input_mc.txt._x;
    container_mc.input_mc._y = aimH - 576;
    container_mc.interactionMenu_mc._x = aimW;
    sc.resize(aimH - 5);
    sc.scroll = sc.scrollMax;
}
function setEnableMenuLine(str, bEnable)
{
    for(line in container_mc.output_mc.tabOptionMenu_mc)
    {
        var _loc1_ = container_mc.output_mc.tabOptionMenu_mc[line];
        if(typeof _loc1_ == "movieclip" && _loc1_._name.substr(0,4) == "line")
        {
            var _loc3_ = false;
            if(_loc1_.txt.text == str || str == undefined)
            {
                _loc3_ = true;
            }
            if(_loc3_)
            {
                if(bEnable)
                {
                    _loc1_.txt._alpha = 100;
                    _loc1_.hit._visible = true;
                }
                else
                {
                    _loc1_.txt._alpha = 30;
                    _loc1_.hit._visible = false;
                }
            }
        }
    }
    for(line in container_mc.optionMenu_mc)
    {
        _loc1_ = container_mc.optionMenu_mc[line];
        if(typeof _loc1_ == "movieclip" && _loc1_._name.substr(0,4) == "line")
        {
            _loc3_ = false;
            if(_loc1_.txt.text == str || str == undefined)
            {
                _loc3_ = true;
            }
            lib.Debuger.trace(_loc1_.txt.text + " == " + str);
            if(_loc3_)
            {
                if(bEnable)
                {
                    _loc1_.txt._alpha = 100;
                    _loc1_.hit._visible = true;
                }
                else
                {
                    _loc1_.txt._alpha = 30;
                    _loc1_.hit._visible = false;
                }
            }
        }
    }
}
function ToGame_Chat_RequestAddTab()
{
    fscommand("ToGame_Chat_RequestAddTab");
}
function ToGame_Chat_RemoveTab(index)
{
    getURL("FSCommand:ToGame_Chat_RemoveTab",index);
}
function ToGame_Chat_RequestOpenChatTabOptionUI(index)
{
    getURL("FSCommand:ToGame_Chat_RequestOpenChatTabOptionUI",index);
}
function ToGame_Chat_RequestPrivateChannelUI(index)
{
    getURL("FSCommand:ToGame_Chat_RequestPrivateChannelUI",index);
}
function ToGame_Chat_RequestInitChat()
{
    mainTextArray = new Array();
    mainTextArray = chatObjects[firstIndex].textArr;
    fscommand("ToGame_Chat_RequestInitChat");
}
function ToGame_Chat_SaveTabInfo(index, x, y, width, height, type)
{
    getURL("FSCommand:ToGame_Chat_SaveTabInfo",index + "\t" + x + "\t" + y + "\t" + width + "\t" + height + "\t" + type);
}
function ToGame_Chat_EndSaveTabInfo()
{
    fscommand("ToGame_Chat_EndSaveTabInfo");
}
function ToGame_Chat_StartSaveTabInfo()
{
    fscommand("ToGame_Chat_StartSaveTabInfo");
}
function ToGame_Chat_ChangeInputLanguage()
{
    fscommand("ToGame_Chat_ChangeInputLanguage");
}
function ToGame_Chat_RequestInitPos()
{
    fscommand("ToGame_Chat_RequestInitPos");
}
function ToGame_Chat_ClickSocialBtn()
{
    fscommand("ToGame_Chat_ClickSocialBtn");
}
function ToGame_Chat_SendWriting(chatType, HtmlText, id, notHtmlText)
{
    var _loc9_ = "<A HREF=\"asfunction:chatLinkAction,";
    var _loc2_ = HtmlText.indexOf(_loc9_);
    if(_loc2_ != -1)
    {
        var _loc8_ = "";
        var _loc4_ = 0;
        while(_loc2_ != -1)
        {
            _loc8_ = _loc8_ + HtmlText.substring(_loc4_,_loc2_);
            _loc4_ = HtmlText.indexOf("</A>",_loc2_);
            var _loc1_ = HtmlText.substring(_loc2_,_loc4_);
            var _loc5_ = _loc1_.indexOf("{");
            var _loc6_ = _loc1_.indexOf("}");
            var _loc7_ = _loc1_.substring(_loc5_ + 1,_loc6_);
            _loc8_ = _loc8_ + (_loc1_.substring(0,_loc5_) + "\">&lt;" + _loc7_ + "&gt;</A>");
            _loc2_ = HtmlText.indexOf(_loc9_,_loc4_);
        }
        _loc8_ = _loc8_ + HtmlText.substring(_loc4_ + 4);
        HtmlText = _loc8_;
    }
    getURL("FSCommand:ToGame_Chat_SendWriting",chatType + "\t" + HtmlText + "\t" + id + "\t" + notHtmlText);
    myListener.OnGame_Chat_ChangeChatMode(false);
    linkNum = 0;
}
function ToGame_Chat_ClickLink(type, id, id2)
{
    if(id2 == undefined)
    {
        getURL("FSCommand:ToGame_Chat_ClickLink",type + "\t" + id);
    }
    else
    {
        getURL("FSCommand:ToGame_Chat_ClickLink",type + "\t" + id + "\t" + id2);
    }
}
function ToGame_Chat_ClickName(name, chatType, strTalk, combinationKey)
{
    lib.Debuger.trace("ToGame_Chat_ClickName - name : " + name);
    if(combinationKey == undefined || combinationKey == "")
    {
        getURL("FSCommand:ToGame_Chat_ClickName",name + "\t" + chatType + "\t" + strTalk);
    }
    else
    {
        getURL("FSCommand:ToGame_Chat_ClickName",name + "\t" + chatType + "\t" + strTalk + "\t" + combinationKey);
    }
}
function ToGame_Chat_RequestSlashCommand(str)
{
    var _loc1_ = str.split(" ");
    if(_loc1_.length >= 3)
    {
        getURL("FSCommand:ToGame_Chat_RequestSlashCommand",_loc1_[0] + "\t" + _loc1_[1]);
        trace("ToGame_Chat_RequestSlashCommand: " + _loc1_[0] + ", " + _loc1_[1]);
    }
    else
    {
        getURL("FSCommand:ToGame_Chat_RequestSlashCommand",_loc1_[0]);
        trace("ToGame_Chat_RequestSlashCommand: " + _loc1_[0]);
    }
}
function ToGame_Chat_SaveLock(states)
{
    getURL("FSCommand:ToGame_Chat_SaveLock",states);
    trace("ToGame_Chat_SaveLock: " + states);
}
function ToGame_Chat_ClickInteractionMenu(id)
{
    lib.manager.UISound.play(lib.manager.UISound.CONTEXMENU_CLICK);
    getURL("FSCommand:ToGame_Chat_ClickInteractionMenu",id);
}
function ToGame_chat_ClickChatTabOptionBtn(index)
{
    getURL("FSCommand:ToGame_chat_ClickChatTabOptionBtn",index);
    trace("ToGame_chat_ClickChatTabOptionBtn: " + index);
}
function ToGame_Chat_NoticeClick()
{
    fscommand("ToGame_Chat_NoticeClick");
}
function press(num)
{
    resetCount();
    lib.manager.ToolTip.hide();
    if(container_mc.output_mc.tabOptionMenu_mc._visible)
    {
        startTabOptionOut(1);
    }
    if(num == 0)
    {
        var _loc3_ = - lib.info.AlignInfo.horizontalSpace;
        var _loc4_ = Stage.width - lib.info.AlignInfo.horizontalSpace - 200 * lib.info.AlignInfo.scaleRatio;
        var _loc1_ = - lib.info.AlignInfo.verticalSpace + 400 * lib.info.AlignInfo.scaleRatio;
        var _loc2_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace + 225 * lib.info.AlignInfo.scaleRatio;
        if(chatObjects[firstIndex].lock != 1)
        {
            startDrag(container_mc,0,_loc3_,_loc1_,_loc4_,_loc2_);
        }
    }
    else
    {
        checkCanSepa(num);
    }
}
function checkCanSepa(num)
{
    checkSepaNum = num;
    var _loc2_ = tab.btn_array[num];
    var centerP = {x:_root._xmouse,y:_root._ymouse};
    var sepaLimit = 15;
    _loc2_.onEnterFrame = function()
    {
        var _loc3_ = Math.abs(centerP.x - _root._xmouse);
        var _loc2_ = Math.abs(centerP.y - _root._ymouse);
        if(_loc3_ >= sepaLimit || _loc2_ >= sepaLimit)
        {
            if(chatObjects[firstIndex].lock != 1)
            {
                tab.pressed = false;
                if(tab.pressedNum != tab.activedNum)
                {
                    tab.txt_array[tab.pressedNum]._y = tab.txt_array[tab.pressedNum]._y - 2;
                }
                deleteCheckCanSepa(num);
                changeMainTab();
                sepaStart(num,tab.txt_array[num].txt);
            }
        }
    };
}
function deleteCheckCanSepa(num)
{
    delete tab.btn_array[num].onEnterFrame;
}
function sepaStart(tabNum, tabName)
{
    var _loc1_ = tabArray[tabNum];
    var _loc2_ = makeViewer(chatObjects[_loc1_].textArr.length,_loc1_,tabName,x,y,600,320,chatObjects[_loc1_].alpha,chatObjects[_loc1_].fontSize);
    chatObjects[_loc1_].mainIndex = -1;
    chatObjects[_loc1_].viewerIndex = viewerArray.length;
    chatObjects[_loc1_].mc = _loc2_;
    sepaMc = _loc2_;
    _loc2_._x = UI._xmouse;
    _loc2_._y = UI._ymouse;
    sepaMc.btn.btn.onPress();
    viewerArray.push(_loc1_);
    removeTab(tabNum,1);
    tab.alignText(undefined,3);
}
function sepaEnd(tabNum)
{
    sepaMc.btn.btn.onRelease();
    sepaMc = null;
}
function getSepa(index)
{
    var _loc3_ = 0;
    for(mc in UI)
    {
        var _loc1_ = UI[mc];
        if(typeof _loc1_ == "movieclip")
        {
            if(_loc1_._name.substr(0,6) == "viewer")
            {
                if(index != undefined)
                {
                    if(Number(_loc1_._name.substr(6)) == index)
                    {
                        return _loc1_;
                    }
                }
                else
                {
                    _loc3_ = _loc3_ + 1;
                }
            }
        }
    }
    if(index != undefined)
    {
        return null;
    }
    return _loc3_;
}
function release(num, notSendToGame)
{
    changeTabInMainChat(num);
    if(tab.btn_array[num].glow._visible)
    {
        var _loc1_ = 0;
        while(_loc1_ < tabArray.length)
        {
            if(tab.btn_array[_loc1_].glow._visible)
            {
                lib.util.Warning.remove(tab.btn_array[_loc1_].glow);
                tab.btn_array[_loc1_].glow._visible = false;
            }
            _loc1_ = _loc1_ + 1;
        }
    }
    if(num == 0)
    {
        container_mc.xRatio = lib.info.AlignInfo.xPixelToRatio(container_mc._x);
        container_mc.yRatio = lib.info.AlignInfo.yPixelToRatio(container_mc._y);
        stopDrag();
        saveTabInfo();
    }
    else
    {
        deleteCheckCanSepa(checkSepaNum);
        sepaEnd();
    }
    tab.alignText(undefined,3);
}
function releaseOutside(num)
{
    if(num == 0)
    {
        container_mc.xRatio = lib.info.AlignInfo.xPixelToRatio(container_mc._x);
        container_mc.yRatio = lib.info.AlignInfo.yPixelToRatio(container_mc._y);
        stopDrag();
        saveTabInfo();
    }
    else
    {
        deleteCheckCanSepa(checkSepaNum);
        sepaEnd();
    }
}
function set2LineText(targetTextField, str)
{
    targetTextField.fontScaleFactor = 1;
    targetTextField.text = str;
    if(targetTextField.numLines == 1)
    {
        targetTextField.fontScaleFactor = 1;
    }
    else if(targetTextField.numLines == 2)
    {
        targetTextField.fontScaleFactor = 0.8;
    }
    else if(targetTextField.numLines >= 3)
    {
        targetTextField.fontScaleFactor = 0.65;
    }
    targetTextField.text = str;
    targetTextField._height = targetTextField.textHeight + 5;
    tab.alignText(undefined,3);
}
function initMainChatPos()
{
    container_mc._x = lib.info.AlignInfo.zeroPointX + 10;
    container_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 98.8;
    baseChatX = container_mc._x;
    baseChatY = container_mc._y;
    container_mc.xRatio = lib.info.AlignInfo.xPixelToRatio(baseChatX);
    container_mc.yRatio = lib.info.AlignInfo.yPixelToRatio(baseChatY);
}
function clearInputTxt()
{
    saveText = "";
    dummy.text = "";
    dummy.htmlText = "";
    container_mc.input_mc.txt.text = "";
    container_mc.input_mc.txt.htmlText = "";
    notInputArea = false;
    linkDelete = false;
    link_array = [];
    linkNum = 0;
    container_mc.input_mc.txt.onKillFocus();
    inputOpen = false;
    remakeInputTf();
    selectionInputIndex = [];
    saveDownKey = null;
    eraseLinkIndex = null;
}
function inputFocus(bTrue)
{
    container_mc.input_mc.txt_focus._visible = bTrue;
    if(bTrue)
    {
        container_mc.input_mc.txt_focus.gotoAndPlay(2);
    }
    else
    {
        container_mc.input_mc.txt_focus.gotoAndStop(1);
    }
}
function isFocusInput()
{
    return Selection.getFocus() == container_mc.input_mc.txt;
}
function setFocusAtInput()
{
    Selection.setFocus(container_mc.input_mc.txt);
    Selection.setSelection(container_mc.input_mc.txt.length,container_mc.input_mc.txt.length);
}
function noticeFadeMotion(num)
{
    container_mc.notice_mc.motionTxt._visible = true;
    container_mc.notice_mc.motionTxt.htmlText = noticeTxt;
    container_mc.notice_mc.motionTxt._y = TEXT_TOP_PADDING + num;
    reflowShoutMCAndBg();
    gs.TweenLite.to(container_mc.notice_mc.mainTxt,0.5,{_y:TEXT_TOP_PADDING - num,ease:Strong.easeIn});
    gs.TweenLite.to(container_mc.notice_mc.motionTxt,0.5,{_y:TEXT_TOP_PADDING,onComplete:noticeFadeMotionEnd,ease:Strong.easeIn});
}
function noticeFadeMotionEnd()
{
    gs.TweenLite.killTweensOf(container_mc.notice_mc.mainTxt,false);
    container_mc.notice_mc.mainTxt.htmlText = noticeTxt;
    container_mc.notice_mc.mainTxt._y = TEXT_TOP_PADDING;
    container_mc.notice_mc.motionTxt._visible = false;
    container_mc.notice_mc.bell.gotoAndPlay(1);
    motionLock = false;
}
function shoutFadeMotion(num)
{
    container_mc.shout_mc.motionTxt._visible = true;
    container_mc.shout_mc.motionTxt.htmlText = shoutTxt;
    container_mc.shout_mc.motionTxt._y = TEXT_TOP_PADDING + num;
    reflowShoutMCAndBg();
    gs.TweenLite.to(container_mc.shout_mc.mainTxt,0.5,{_y:TEXT_TOP_PADDING - num,ease:Strong.easeIn});
    gs.TweenLite.to(container_mc.shout_mc.motionTxt,0.5,{_y:TEXT_TOP_PADDING,onComplete:shoutFadeMotionEnd,ease:Strong.easeIn});
}
function shoutFadeMotionEnd()
{
    gs.TweenLite.killTweensOf(container_mc.shout_mc.mainTxt,false);
    container_mc.shout_mc.horn._xscale = 120;
    container_mc.shout_mc.horn._yscale = 120;
    gs.TweenLite.to(container_mc.shout_mc.horn,0.4,{_xscale:100,_yscale:100,ease:Back.easeOut});
    container_mc.shout_mc.mainTxt.htmlText = shoutTxt;
    container_mc.shout_mc.mainTxt._y = TEXT_TOP_PADDING;
    container_mc.shout_mc.motionTxt._visible = false;
    motionLock = false;
}
function reflowShoutMCAndBg()
{
    var _loc1_ = 1;
    if(container_mc.shout_mc.motionTxt.textHeight > 50)
    {
        container_mc.shout_mc.noticeMask._height = 80;
        _loc1_ = 3;
    }
    else if(container_mc.shout_mc.motionTxt.textHeight > 32)
    {
        container_mc.shout_mc.noticeMask._height = 52;
        _loc1_ = 2;
    }
    else
    {
        container_mc.shout_mc.noticeMask._height = 31;
    }
    if(container_mc.notice_mc._visible)
    {
        switch(_loc1_)
        {
            case 1:
                container_mc.shout_mc._y = -474;
                break;
            case 2:
                container_mc.shout_mc._y = -494;
                break;
            case 3:
                container_mc.shout_mc._y = -514;
        }
    }
    else
    {
        switch(_loc1_)
        {
            case 1:
                container_mc.shout_mc._y = -440;
                break;
            case 2:
                container_mc.shout_mc._y = -474;
                break;
            case 3:
                container_mc.shout_mc._y = -494;
        }
    }
    if(container_mc.notice_mc._visible && container_mc.shout_mc._visible)
    {
        resizeNoticeBackground(_loc1_);
    }
    else if(container_mc.shout_mc._visible && _loc1_ > 1)
    {
        resizeNoticeBackground(_loc1_ - 1);
    }
    else
    {
        resizeNoticeBackground(0);
    }
    container_mc.notice_mc._y = -440;
    if(container_mc.cantChat_mc._visible)
    {
        container_mc.shout_mc._y = container_mc.shout_mc._y - 50;
        container_mc.notice_mc._y = container_mc.notice_mc._y - 50;
        container_mc.noticeBg._y = container_mc.noticeBg._y - 50;
    }
}
function resizeNoticeBackground(type)
{
    switch(type)
    {
        case 0:
            container_mc.noticeBg._y = -440;
            container_mc.noticeBg._height = 36;
            break;
        case 1:
            container_mc.noticeBg._y = -479.5;
            container_mc.noticeBg._height = 75.5;
            break;
        case 2:
            container_mc.noticeBg._y = -499;
            container_mc.noticeBg._height = 95;
            break;
        case 3:
            container_mc.noticeBg._y = -518.5;
            container_mc.noticeBg._height = 109.5;
    }
}
if(inputChat_0 != undefined)
{
    maxChatLeng = Number(inputChat_0);
}
if(inputChat_1 != undefined)
{
    container_mc.input_mc.txt._y = Number(inputChat_1);
}
mainOutput.maxLine = MAXLINE;
mainOutput.lock = 0;
container_mc.input_mc.txt.onSetFocus = function()
{
    _global.chating = true;
    _global.inputing = true;
    inputFocus(true);
    lib.manager.Focus.currentFocus = container_mc.input_mc.txt;
};
container_mc.input_mc.txt.onKillFocus = function()
{
    _global.chating = false;
    _global.inputing = false;
    inputFocus(false);
};
var newTextFormat = container_mc.input_mc.txt.getTextFormat();
container_mc.input_mc.txt.onChanged = function()
{
    if(notInputArea)
    {
        if(linkDelete)
        {
            saveText = this.htmlText;
            notInputArea = false;
            linkDelete = false;
        }
        else
        {
            this.htmlText = saveText;
            Selection.setSelection(container_mc.input_mc.txt.caretIndex,container_mc.input_mc.txt.caretIndex);
        }
    }
    else
    {
        saveText = this.htmlText;
        var _loc2_ = this.text;
        if(whisperReadyMode && _loc2_.indexOf(" ") != -1)
        {
            setWhisperTarget("add",_loc2_.substr(0,_loc2_.indexOf(" ")));
            whisperReadyMode = false;
        }
        if(_loc2_.substr(0,1) == "/" && _loc2_.substr(_loc2_.length - 1,1) == " ")
        {
            ToGame_Chat_RequestSlashCommand(_loc2_);
        }
    }
    if(lib.util.ExtString.trim(this.text) == "")
    {
        this.text = "";
        this.htmlText = "";
        saveText = "";
        this.textColor = chatColor_array[currentChannel].color;
    }
};
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == "chat2")
    {
        bWindowOpen = bShow;
        UI._visible = bShow;
        if(bShow)
        {
            myListener.OnGameEventChangeUIMode(_global.gbUIMode);
        }
    }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
    var _loc4_ = -1;
    if(!_global.gbUIMode)
    {
        _loc4_ = tabArray[tab.activedNum];
        if(inputOpen)
        {
            myListener.OnGame_Chat_ChangeChatMode(false);
        }
        container_mc.output_mc.scroller._visible = false;
        container_mc.output_mc.bg_mc._alpha = chatObjects[_loc4_].alpha - 25;
        container_mc.output_mc.expander._visible = false;
        container_mc.output_mc.option_btn._visible = false;
        sc.setVisible(false);
        var _loc3_ = 0;
        while(_loc3_ < tabArray.length)
        {
            _loc4_ = tabArray[_loc3_];
            tab.btn_array[_loc3_]._alpha = chatObjects[_loc4_].alpha - 25;
            _loc3_ = _loc3_ + 1;
        }
        interactionMenuClosing(1);
        for(mc in UI)
        {
            var _loc2_ = UI[mc];
            if(typeof _loc2_ == "movieclip" && _loc2_ != container_mc)
            {
                _loc2_.expander._visible = false;
                _loc2_.bg_mc._alpha = chatObjects[_loc2_.stat].alpha - 25;
                _loc2_.btn.btn._alpha = chatObjects[_loc2_.stat].alpha - 25;
                _loc2_.scrollBar.setVisible(false);
                _loc2_.option_btn._visible = false;
            }
        }
    }
    else
    {
        _loc4_ = tabArray[tab.activedNum];
        container_mc.output_mc.scroller._visible = true;
        container_mc.output_mc.bg_mc._alpha = chatObjects[_loc4_].alpha;
        container_mc.output_mc.expander._visible = true;
        container_mc.output_mc.option_btn._visible = true;
        sc.setVisible(true);
        sc.barBg._visible = false;
        _loc3_ = 0;
        while(_loc3_ < tabArray.length)
        {
            _loc4_ = tabArray[_loc3_];
            tab.btn_array[_loc3_]._alpha = chatObjects[_loc4_].alpha;
            _loc3_ = _loc3_ + 1;
        }
        for(mc in UI)
        {
            _loc2_ = UI[mc];
            if(typeof _loc2_ == "movieclip" && _loc2_ != container_mc)
            {
                _loc2_.expander._visible = true;
                _loc2_.bg_mc._alpha = chatObjects[_loc2_.stat].alpha;
                _loc2_.btn.btn._alpha = chatObjects[_loc2_.stat].alpha;
                _loc2_.scrollBar.setVisible(true);
                _loc2_.scrollBar.barBg._visible = false;
                _loc2_.option_btn._visible = true;
            }
        }
    }
};
myListener.OnGame_Chat_ChangeChatMode = function(bTrue, DontSendMsg)
{
    bTrue = Number(bTrue);
    if(bTrue)
    {
        sc.scroll = sc.scrollMax;
        container_mc._visible = true;
        inputOpen = true;
        container_mc.input_mc._visible = inputOpen;
        setFocusAtInput();
        resetCount();
    }
    else
    {
        inputOpen = false;
        if(isFocusInput())
        {
            Selection.setFocus(dummy2);
        }
        container_mc.input_mc._visible = false;
        startCount();
    }
};
myListener.OnGame_Chat_SetPunishment = function(bShow, Data)
{
    bShow = Number(bShow);
    container_mc.cantChat_mc._visible = bShow;
    lib.manager.ToolTip.add(container_mc.cantChat_mc,lib.util.UIString.getUIString("$031064"),1);
    container_mc.cantChat_mc.txt.autoSize = true;
    container_mc.cantChat_mc.txt.text = Data;
    reflowShoutMCAndBg();
};
myListener.OnGame_Chat_NoticeView = function(bShow)
{
    container_mc.notice_mc._visible = Boolean(Number(bShow));
    container_mc.shout_mc._visible = Boolean(Number(bShow));
    container_mc.noticeBg._visible = Boolean(Number(bShow));
    reflowShoutMCAndBg();
};
myListener.OnGame_Chat_SetShout = function(sShout, shoutColor, userId, idColor)
{
    var _loc2_ = "[" + userId + "]";
    if(userId.indexOf("\'") != -1)
    {
        userId = lib.util.ExtString.replace(userId,"\'","&&&;",false);
    }
    var _loc3_ = "<font color=\'" + idColor + "\'>" + "<a href=\'asfunction:chatNameAction," + userId + "@" + 0 + "@" + html_To_NotHtml(sShout) + "\'>" + _loc2_ + "</a>" + " : </font>";
    var _loc4_ = makeShoutBody(sShout,shoutColor,0);
    shoutTxt = lib.util.ExtString.replace(_loc3_ + _loc4_,"color=\'0x","color=\'#",false);
    motionLock = true;
    shoutFadeMotion(80);
};
myListener.OnGame_Chat_SetNotice = function(sNotice, nColor)
{
    var _loc1_ = "<font color=\'" + sColor + "\'>";
    var _loc2_ = sNotice + "</font>";
    noticeTxt = lib.util.ExtString.replace(_loc1_ + _loc2_,"color=\'0x","color=\'#",false);
    motionLock = true;
    noticeFadeMotion(30);
};
myListener.OnGame_Chat_SetNoticeMode = function(modeN)
{
    if(modeN == 1)
    {
        container_mc.notice_mc._visible = true;
        container_mc.shout_mc._visible = false;
    }
    else if(modeN == 2)
    {
        container_mc.notice_mc._visible = false;
        container_mc.shout_mc._visible = true;
    }
    else
    {
        container_mc.notice_mc._visible = true;
        container_mc.shout_mc._visible = true;
    }
    reflowShoutMCAndBg();
};
container_mc.notice_mc.noticeBtn.onRollOver = function()
{
    container_mc.notice_mc.bell.gotoAndStop(1);
};
container_mc.notice_mc.noticeBtn.onRelease = function()
{
    ToGame_Chat_NoticeClick();
};
myListener.OnGameEvent_Chat_SetLock = function(states)
{
    chatObjects[firstIndex].lock = Number(states);
    lock();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
    var _loc2_ = chatObjects.length;
    var _loc1_ = 0;
    while(_loc1_ < _loc2_)
    {
        chatObjects[_loc1_].mc._x = lib.info.AlignInfo.xRatioToPixel(chatObjects[_loc1_].mc.xRatio);
        chatObjects[_loc1_].mc._y = lib.info.AlignInfo.yRatioToPixel(chatObjects[_loc1_].mc.yRatio);
        _loc1_ = _loc1_ + 1;
    }
    if(!baseTabChanged)
    {
        initMainChatPos();
    }
    if(container_mc._y < lib.info.AlignInfo.yRatioToPixel(30))
    {
        container_mc._y = lib.info.AlignInfo.yRatioToPixel(37);
    }
};
myListener.OnGame_Chat_Refresh = function()
{
    refreshTexts();
};
myListener.OnGame_Chat_SetWriting = function(chatType, writing, id, addParam, tabList, wisperType)
{
    container_mc._visible = true;
    chatType = Number(chatType);
    addParam = Number(addParam);
    bName = chatColor_array[chatType].bName;
    bLink = chatColor_array[chatType].bLink;
    bHTML = chatColor_array[chatType].bHTML;
    wisperType = Number(wisperType);
    var _loc8_ = chatColor_array[chatType].shapColor;
    var _loc2_ = "";
    var _loc13_ = false;
    var _loc14_ = false;
    var _loc6_ = id;
    var _loc5_ = "[" + id + "]";
    if(_loc6_.indexOf("\'") != -1)
    {
        _loc6_ = lib.util.ExtString.replace(_loc6_,"\'","&&&;",false);
    }
    if(addParam == 1)
    {
        _loc5_ = "[<img src=\'\' width=\'24\' height=\'24\' vspace=\'-7\'>" + id + "]";
    }
    else if(addParam == 2)
    {
        _loc5_ = "[<img src=\'Icon_GM\' width=\'28\' height=\'28\' vspace=\'-5\'>" + id + "]";
    }
    else if(addParam == 3)
    {
        _loc5_ = "[<img src=\'Icon_OldUser\' width=\'28\' height=\'28\' vspace=\'-5\'>" + id + "]";
    }
    else if(addParam == 4)
    {
        _loc2_ = "<img src=\'Icon_Shout\' width=\'21\' height=\'21\' vspace=\'-4\'>";
    }
    else if(addParam == 5)
    {
        _loc2_ = "<img src=\'Icon_Whisper\' width=\'21\' height=\'21\' vspace=\'-4\'>";
    }
    if(chatColor_array[chatType].type == 1)
    {
        var _loc3_ = "";
        if(wisperType == 0)
        {
            _loc3_ = lib.util.UIString.getUIString("$031085");
            _loc3_ = _loc3_ + " " + chatColor_array[chatType].name;
            _loc2_ = _loc2_ + ("<font color=\'" + _loc8_ + "\'>" + "[" + _loc3_ + "]" + "<a href=\'asfunction:chatNameAction," + _loc6_ + "@" + chatType + "@" + html_To_NotHtml(writing) + "\'>" + _loc5_ + "</a>" + lib.util.UIString.getUIString("$031087") + " : </font>");
            setWhisperTarget("add",id);
        }
        else if(wisperType == 1)
        {
            _loc3_ = lib.util.UIString.getUIString("$031086");
            _loc3_ = _loc3_ + " " + chatColor_array[chatType].name;
            _loc2_ = "   " + _loc2_ + "<font color=\'" + _loc8_ + "\'>" + "[" + _loc3_ + "]" + "<a href=\'asfunction:chatNameAction," + _loc6_ + "@" + chatType + "@" + html_To_NotHtml(writing) + "\'>" + _loc5_ + "</a>" + lib.util.UIString.getUIString("$031087") + " : </font>";
            setWhisperTarget("add",id);
        }
    }
    else
    {
        if(bName)
        {
            var _loc11_ = chatColor_array[chatType].name;
            _loc2_ = _loc2_ + ("<font color=\'" + _loc8_ + "\'>[" + _loc11_ + "]</font>");
        }
        if(bLink)
        {
            if(id != undefined && id != "")
            {
                _loc2_ = _loc2_ + ("<font color=\'" + _loc8_ + "\'>" + "<a href=\'asfunction:chatNameAction," + _loc6_ + "@" + chatType + "@" + html_To_NotHtml(writing) + "\'>" + _loc5_ + "</a>" + " : </font>");
            }
            else
            {
                _loc2_ = _loc2_ + "";
            }
        }
    }
    if(bHTML)
    {
        var _loc12_ = calcHtmlText(writing,1,chatType);
        _loc2_ = _loc2_ + _loc12_;
    }
    else
    {
        _loc2_ = _loc2_ + ("<font color=\'" + _loc8_ + "\'>" + writing + "</font>");
    }
    broadCast(chatType,_loc2_,id,addParam,bLink,bName,bHTML,tabList,wisperType);
};
myListener.OnGame_Chat_RemakeToHtml = function(chatChannelType, message, id)
{
    chatChannelType = Number(chatChannelType);
    var _loc5_ = "#" + chatColor_array[chatChannelType].color.toString(16);
    if(message.indexOf("<") != -1)
    {
        message = lib.util.ExtString.replace(message,"<","&lt;",false);
    }
    if(message.indexOf(">") != -1)
    {
        message = lib.util.ExtString.replace(message,">","&gt;",false);
    }
    var _loc4_ = "<FONT>" + message + "</FONT>";
    saveText = "";
    dummy.text = "";
    container_mc.input_mc.txt.text = "";
    notInputArea = false;
    linkDelete = false;
    link_array = [];
    var _loc3_ = calcHtmlText(_loc4_,1,chatChannelType);
    ToGame_Chat_SendWriting(chatChannelType,_loc3_,id,message);
};
myListener.OnGame_Chat_Close = function()
{
    countClose();
};
myListener.OnGame_Chat_SetShoutNum = function(channelList)
{
    var _loc1_ = 0;
    while(container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc["comboBox1Sub" + _loc1_] == undefined)
    {
    }
    container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc["comboBox1Sub" + _loc1_];
    _loc1_ = _loc1_ + 1;
};
var comboBox1Maker = new lib.util.McMaker();
var firstComboBox1Data = true;
container_mc.input_mc.comboBox1_mc.opened = false;
var data1_array = new Array();
var chatChannelArray = new Array();
var comboBox1AbsoluteClose = false;
myListener.OnGame_Chat_SetChannelList = function(channelList)
{
    channelNum_array = [];
    clearComboBox();
    chatChannelArray = channelList.split("\n");
    var _loc10_ = true;
    var _loc11_ = "";
    if(chatChannelArray[chatChannelArray.length - 1] == "undefined" || chatChannelArray[chatChannelArray.length - 1] == "" || chatChannelArray[chatChannelArray.length - 1] == undefined)
    {
        chatChannelArray.splice(chatChannelArray.length - 1,1);
    }
    if(channelList != "" && channelList != "null" && channelList != "undefined" && channelList != undefined)
    {
        comboBox1Maker.createMovie("comboBoxSlot",container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc,"comboBox1Sub",0,0,1,chatChannelArray.length,0,1,0);
    }
    container_mc.input_mc.comboBox1_mc.sub_mc.scroller.__height = container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc._height;
    var _loc6_ = 0;
    while(_loc6_ < chatChannelArray.length)
    {
        var _loc4_ = chatChannelArray[_loc6_].split("\t");
        if(_loc4_.length != 1)
        {
            var _loc3_ = container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc["comboBox1Sub" + _loc6_];
            var _loc5_ = Number(_loc4_[0]);
            if(_loc5_ == currentChannel && _loc10_ == true && container_mc.input_mc.txt.text != "")
            {
                _loc10_ = false;
            }
            if(_loc5_ == currentChannel)
            {
                _loc11_ = _loc4_[1];
            }
            _loc3_.stat = _loc6_;
            _loc3_.over._visible = false;
            _loc3_.id = _loc5_;
            channelNum_array.push(_loc5_);
            _loc3_.text_txt.text = _loc4_[1];
            _loc3_.text_txt.textAutoSize = "shrink";
            _loc3_.text_txt.textColor = chatColor_array[_loc3_.id].color;
            if(_loc6_ == 0)
            {
                selectedChannel_txt.setText(_loc4_[1]);
            }
            _loc3_.onRollOver = function()
            {
                this.over._visible = true;
            };
            _loc3_.onRollOut = _loc3_.onReleaseOutside = function()
            {
                this.over._visible = false;
            };
            _loc3_.onRelease = function()
            {
                var _loc3_ = this.text_txt.text.indexOf("/");
                var _loc2_ = this.text_txt.text.substr(_loc3_,2);
                if(chatColor_array[this.id].type == 1)
                {
                    container_mc.input_mc.txt.text = _loc2_;
                    setFocusAtInput();
                }
                else
                {
                    ToGame_Chat_RequestSlashCommand(_loc2_ + " ");
                    Selection.setFocus(container_mc.input_mc.txt);
                }
            };
        }
        _loc6_ = _loc6_ + 1;
    }
    if(firstComboBox1Data)
    {
        container_mc.input_mc.comboBox1_mc.sub_mc._y = 0;
        container_mc.input_mc.comboBox1_mc.opened = false;
        firstComboBox1Data = false;
    }
    container_mc.input_mc.comboBox1_mc.open_btn.onRollOver = function()
    {
        this._parent.over._alpha = 100;
    };
    container_mc.input_mc.comboBox1_mc.open_btn.onRollOut = container_mc.input_mc.comboBox1_mc.open_btn.onReleaseOutside = function()
    {
        this._parent.over._alpha = 0;
    };
    container_mc.input_mc.comboBox1_mc.open_btn.onPress = function()
    {
        this._parent.arrow_mc.gotoAndStop(3);
        resetCount();
    };
    container_mc.input_mc.comboBox1_mc.open_btn.onRelease = function()
    {
        startCount();
        gs.TweenLite.killTweensOf(container_mc.input_mc.comboBox1_mc.sub_mc,false);
        if(comboBox1AbsoluteClose)
        {
            this._parent.arrow.gotoAndStop(1);
            container_mc.input_mc.comboBox1_mc.opened = false;
            gs.TweenLite.to(container_mc.input_mc.comboBox1_mc.sub_mc,0.3,{_y:0,ease:Strong.easeOut});
        }
        else if(container_mc.input_mc.comboBox1_mc.opened)
        {
            this._parent.arrow.gotoAndStop(1);
            container_mc.input_mc.comboBox1_mc.opened = false;
            gs.TweenLite.to(container_mc.input_mc.comboBox1_mc.sub_mc,0.3,{_y:0,ease:Strong.easeOut});
        }
        else
        {
            this._parent.arrow.gotoAndStop(2);
            container_mc.input_mc.comboBox1_mc.opened = true;
            var _loc2_ = - container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc._height - 8;
            gs.TweenLite.to(container_mc.input_mc.comboBox1_mc.sub_mc,0.3,{_y:_loc2_,ease:Strong.easeOut});
        }
        comboBox1AbsoluteClose = false;
    };
    _loc6_ = 0;
    while(_loc6_ < channelNum_array.length)
    {
        var _loc9_ = channelNum_array[_loc6_];
        if(chatColor_array[_loc9_].type == 2)
        {
            _global.inputing = false;
        }
        _loc6_ = _loc6_ + 1;
    }
    if(_global.inputing && _global.chating && _loc10_ == false)
    {
        for(line in container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc)
        {
            if(typeof container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc[line] == "movieclip")
            {
                if(Number(container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc[line].id) == currentChannel)
                {
                    selectedChannel_txt.setText(_loc11_);
                    selectedChannel_txt.textColor = chatColor_array[currentChannel].color;
                }
            }
        }
    }
    else
    {
        currentChannel = 0;
        channelMc.text_txt.textColor = "0xFFFFFF";
        selectedChannel_txt.textColor = "0xFFFFFF";
        var _loc14_ = ColorCheck(container_mc.input_mc.txt.htmlText);
        if(!_loc14_)
        {
            container_mc.input_mc.txt.textColor = "0xFFFFFF";
        }
    }
};
myListener.OnGame_Chat_UpdateChannelList = function(channelId, txtName)
{
    var _loc1_ = 0;
    while(_loc1_ < chatChannelArray.length)
    {
        var _loc2_ = container_mc.input_mc.comboBox1_mc.sub_mc.contents_mc.content_mc["comboBox1Sub" + _loc1_];
        if(_loc2_.id == channelId)
        {
            _loc2_.text_txt.text = txtName;
            break;
        }
        _loc1_ = _loc1_ + 1;
    }
};
myListener.OnGame_Chat_ChangeChannel = function(channelNum, whisperTarget)
{
    var _loc3_ = whisperTarget.indexOf("<img");
    if(_loc3_ != -1)
    {
        var _loc4_ = whisperTarget.indexOf("/>") + 2;
        whisperTarget = whisperTarget.substring(_loc4_,whisperTarget.length);
    }
    channelNum = Number(channelNum);
    if(chatColor_array[channelNum].type == 1)
    {
        setChatChannel(channelNum,whisperTarget);
    }
    else
    {
        setChatChannel(channelNum);
    }
};
myListener.OnGame_Chat_SetLanguageInfo = function(language)
{
    if(language == "0")
    {
        container_mc.input_mc.changeLang_mc.txt.text = lib.util.UIString.getUIString("$032015");
    }
    else if(language == "1")
    {
        container_mc.input_mc.changeLang_mc.txt.text = lib.util.UIString.getUIString("$032014");
    }
};
container_mc.input_mc.changeLang_mc.onRelease = function()
{
    setFocusAtInput();
    ToGame_Chat_ChangeInputLanguage();
};
myListener.OnGame_Chat_ChangeInputChannel = function(channelNum, whisperTarget, bNotChatClear)
{
    channelNum = Number(channelNum);
    bNotChatClear = Boolean(Number(bNotChatClear));
    if(chatColor_array[channelNum].type == 1)
    {
        setChatChannel(channelNum,whisperTarget,bNotChatClear);
    }
    else
    {
        setChatChannel(channelNum,whisperTarget,bNotChatClear);
    }
    if(false == bNotChatClear)
    {
        container_mc.input_mc.txt.text = "";
    }
};
var recentMsg_array = new Array();
var recentMsgMax = 10;
var whisperTarget_array = new Array();
var selectionInputIndex = [];
var saveDownKey = null;
var eraseLinkIndex = null;
var link_array = new Array();
var notInputArea = false;
var linkDelete = false;
var saveText = "";
var chatO = new Object();
Key.addListener(chatO);
chatO.onKeyDown = function()
{
    var _loc4_ = Key.getCode();
    var _loc11_ = false;
    var _loc9_ = link_array.length;
    if(lib.util.ExtString.trim(container_mc.input_mc.txt.text) == "")
    {
        _loc11_ = true;
    }
    if(inputOpen && _global.chating == true)
    {
        if(_loc4_ == 13)
        {
            if(_loc11_)
            {
                myListener.OnGame_Chat_ChangeChatMode(false);
                linkNum = 0;
            }
            else if(whisperReadyMode)
            {
                setWhisperTarget("add",container_mc.input_mc.txt.text);
            }
            else
            {
                setFocusAtInput();
                var _loc12_ = calcHtmlText();
                if(whisperMode)
                {
                    addRecentSendMsg(container_mc.input_mc.txt.htmlText,link_array);
                    ToGame_Chat_SendWriting(currentChannel,_loc12_,currentWhisperTarget,container_mc.input_mc.txt.text);
                }
                else
                {
                    addRecentSendMsg(container_mc.input_mc.txt.htmlText,link_array);
                    ToGame_Chat_SendWriting(currentChannel,_loc12_,undefined,container_mc.input_mc.txt.text);
                }
            }
            clearInputTxt();
            return undefined;
        }
        if(_loc4_ == 27)
        {
            if(inputOpen && _global.chating == true)
            {
                myListener.OnGame_Chat_ChangeChatMode(false);
            }
        }
        else if(_loc4_ == 38)
        {
            if(whisperReadyMode || whisperMode)
            {
                if(whisperTarget_array.length > 1)
                {
                    setWhisperTarget("next");
                }
            }
            else if(recentMsg_array.length >= 1)
            {
                setRecentMsg("prev");
            }
        }
        else if(_loc4_ == 40)
        {
            if(whisperReadyMode || whisperMode)
            {
                if(whisperTarget_array.length > 1)
                {
                    setWhisperTarget("prev");
                }
            }
            else if(recentMsg_array.length >= 1)
            {
                setRecentMsg("next");
            }
        }
        else if(_loc4_ == 37)
        {
            if(_loc11_)
            {
                var _loc10_ = null;
                var _loc14_ = channelNum_array.length - 1;
                channelNum_array.unshift(channelNum_array.pop());
                _loc10_ = channelNum_array[0];
                if(chatColor_array[_loc10_].type != 1)
                {
                    setChatChannel(_loc10_);
                }
                else if(currentWhisperTarget != "" && currentWhisperTarget != undefined && currentWhisperTarget != "undefined")
                {
                    setChatChannel(_loc10_,currentWhisperTarget);
                }
                else
                {
                    channelNum_array.unshift(channelNum_array.pop());
                    _loc10_ = channelNum_array[0];
                    setChatChannel(_loc10_);
                }
            }
        }
        else if(_loc4_ == 39)
        {
            if(_loc11_)
            {
                _loc10_ = null;
                _loc14_ = channelNum_array.length - 1;
                channelNum_array.push(channelNum_array.shift());
                _loc10_ = channelNum_array[0];
                if(chatColor_array[_loc10_].type != 1)
                {
                    setChatChannel(_loc10_);
                }
                else if(currentWhisperTarget != "" && currentWhisperTarget != undefined && currentWhisperTarget != "undefined")
                {
                    setChatChannel(_loc10_,currentWhisperTarget);
                }
                else
                {
                    channelNum_array.push(channelNum_array.shift());
                    _loc10_ = channelNum_array[0];
                    setChatChannel(_loc10_);
                }
            }
        }
        else if(_loc4_ == 9)
        {
            var _loc13_ = undefined;
            if(tab.getVisible(tab.activedNum + 1))
            {
                _loc13_ = tab.activedNum + 1;
            }
            else
            {
                _loc13_ = 0;
            }
            tab.setTab(_loc13_);
        }
        notInputArea = false;
        linkDelete = false;
        var _loc7_ = null;
        var _loc3_ = container_mc.input_mc.txt.caretIndex;
        downCaret = _loc3_;
        if(_loc4_ == 37 && _loc3_ > 0)
        {
            _loc3_ = _loc3_ - 1;
            _loc7_ = -1;
        }
        else if(_loc4_ == 39 && _loc3_ < container_mc.input_mc.txt.length)
        {
            _loc3_ = _loc3_ + 1;
            _loc7_ = 1;
        }
        else if(_loc4_ == 38)
        {
            _loc3_ = 0;
        }
        else if(_loc4_ == 40)
        {
            _loc3_ = container_mc.input_mc.txt.length;
        }
        var _loc6_ = null;
        var _loc5_ = null;
        var _loc8_ = null;
        var _loc2_ = 0;
        while(_loc2_ < _loc9_)
        {
            _loc6_ = link_array[_loc2_].sI;
            _loc5_ = link_array[_loc2_].eI;
            link_array.curElementAtcaret = _loc2_;
            if(_loc4_ == 8)
            {
                if(_loc3_ >= _loc6_ && _loc3_ <= _loc5_)
                {
                    linkDelete = true;
                    eraseLinkIndex = link_array.curElementAtcaret;
                    break;
                }
                linkDelete = false;
                var delaynum = 0;
                container_mc.input_mc.onEnterFrame = null;
                container_mc.input_mc.onEnterFrame = function()
                {
                    if(delaynum > 1)
                    {
                        container_mc.input_mc.onEnterFrame = null;
                        if(container_mc.input_mc.txt.length == 0)
                        {
                            linkNum = 0;
                            inputFocus(true);
                            lib.manager.Focus.currentFocus = container_mc.input_mc.txt;
                        }
                    }
                    delaynum++;
                };
            }
            else if(_loc4_ == 46)
            {
                if(_loc3_ >= _loc6_ - 1 && _loc3_ <= _loc5_ - 1)
                {
                    linkDelete = true;
                    eraseLinkIndex = link_array.curElementAtcaret;
                    break;
                }
                linkDelete = false;
                var delaynum = 0;
                container_mc.input_mc.onEnterFrame = null;
                container_mc.input_mc.onEnterFrame = function()
                {
                    if(delaynum > 1)
                    {
                        container_mc.input_mc.onEnterFrame = null;
                        if(container_mc.input_mc.txt.length == 0)
                        {
                            linkNum = 0;
                            inputFocus(true);
                            lib.manager.Focus.currentFocus = container_mc.input_mc.txt;
                        }
                    }
                    delaynum++;
                };
            }
            else if(_loc3_ >= _loc6_ && _loc3_ <= _loc5_ - 1)
            {
                notInputArea = true;
                _loc8_ = _loc2_;
                if(_loc7_ == -1)
                {
                    Selection.setSelection(link_array[_loc2_].sI,link_array[_loc2_].sI);
                }
                else if(_loc7_ == 1)
                {
                    Selection.setSelection(link_array[_loc2_].eI - 1,link_array[_loc2_].eI - 1);
                }
            }
            _loc2_ = _loc2_ + 1;
        }
        if(_loc4_ == 36 || _loc4_ == 33 || _loc4_ == 37)
        {
            impossibleCaretCheck();
        }
        saveDownKey = _loc4_;
        if(Selection.getBeginIndex() != Selection.getEndIndex())
        {
            selectionInputIndex = [Selection.getBeginIndex(),Selection.getEndIndex()];
        }
    }
    else if(_loc4_ == 191)
    {
        if(!_global.inputing && !_global.chating)
        {
            saveText = "";
            dummy.text = "";
            dummy.htmlText = "";
            container_mc.input_mc.txt.text = "/";
            notInputArea = false;
            linkDelete = false;
            link_array = [];
            myListener.OnGame_Chat_ChangeChatMode(true);
        }
    }
};
var checkCaretPos = 1;
var firstFormat = container_mc.input_mc.txt.getTextFormat();
firstFormat.font = "$ChatFont";
firstFormat.size = 20;
firstFormat.color = 16777215;
var tf = UI.createTextField("test_txt",UI.getNextHighestDepth(),0,0,0,0);
tf.html = true;
myListener.OnGame_Chat_AddInputText = function(str)
{
    addInputText(str);
};
var linkTextColor = new Array();
linkTextColor[1] = OxToShap(Number(lib.info.TextColor.CHAT_LINK_ITEM));
linkTextColor[2] = OxToShap(Number(lib.info.TextColor.CHAT_LINK_QUEST));
linkTextColor[3] = OxToShap(Number(lib.info.TextColor.CHAT_LINK_MARKER));
linkTextColor[4] = OxToShap(Number(lib.info.TextColor.CHAT_LINK_BARGAIN));
linkTextColor[5] = OxToShap(Number(lib.info.TextColor.CHAT_LINK_SEARCH_PARTY));
var itemLinkTextColor = new Array();
itemLinkTextColor[0] = OxToShap(Number(lib.info.TextColor.RAREGRADE0));
itemLinkTextColor[1] = OxToShap(Number(lib.info.TextColor.RAREGRADE1));
itemLinkTextColor[2] = OxToShap(Number(lib.info.TextColor.RAREGRADE2));
itemLinkTextColor[3] = OxToShap(Number(lib.info.TextColor.RAREGRADE3));
var nowLinking = false;
var enableLinkNum = 3;
var linkNum = 0;
myListener.OnGame_Chat_AddLink = function(type, tooltipID, str, info1, info2)
{
    if(lib.manager.Focus.currentFocus != lib.manager.Focus.CHAT_INPUT && lib.manager.Focus.currentFocus.toString() != undefined)
    {
        return undefined;
    }
    if(!nowLinking && linkNum < enableLinkNum)
    {
        delete container_mc.onEnterFrame;
        linkNum++;
        type = Number(type);
        str = lib.util.ExtString.replace(str,"\"","″");
        var _loc5_ = undefined;
        if(type == 1)
        {
            _loc5_ = itemLinkTextColor[Number(info1)];
        }
        else
        {
            _loc5_ = linkTextColor[type];
        }
        var _loc6_ = "<a href=\"asfunction:chatLinkAction," + type + "#####" + tooltipID + "{" + str + "}\"><font size=\"18\" color=\"" + _loc5_ + "\">&lt;" + str + "&gt;</font></a><font color=\"" + chatColor_array[currentChannel].shapColor + "\"> </font>";
        addLink(_loc6_,str);
        nowLinking = true;
        container_mc.cnt = 0;
        container_mc.onEnterFrame = function()
        {
            this.cnt++;
            if(this.cnt >= 2)
            {
                _root.OnGameEvent("OnGame_Chat_ChangeChatMode",1);
                saveText = "";
                dummy.text = "";
                notInputArea = false;
                linkDelete = false;
                nowLinking = false;
                delete this.onEnterFrame;
            }
        };
    }
    else
    {
        _root.OnGameEvent("OnGame_Chat_ChangeChatMode",1);
    }
};
var lineH = 43;
var gapH = container_mc.optionMenu_mc.bg_mc._height - container_mc.optionMenu_mc.mask_mc._height;
container_mc.optionMenu_mc._visible = false;
container_mc.output_mc.option_btn.onRollOver = function()
{
    lib.manager.ToolTip.add(container_mc.output_mc.option_btn,lib.info.ToolTipStr.CHAT_OPTION,1);
    if(this._currentframe == 1)
    {
        this.gotoAndStop(2);
    }
};
container_mc.output_mc.option_btn.onRollOut = container_mc.output_mc.option_btn.onReleseOutside = function()
{
    if(this._currentframe == 2)
    {
        this.gotoAndStop(1);
    }
};
container_mc.output_mc.option_btn.onRelease = function()
{
    lib.manager.ToolTip.remove(this);
    lib.manager.UISound.play(lib.manager.UISound.CHAT_OPTION);
    if(this._currentframe != 3)
    {
        this.gotoAndStop(3);
        container_mc.optionMenu_mc._visible = true;
        var _loc3_ = {x:_root._xmouse,y:_root._ymouse};
        container_mc.globalToLocal(_loc3_);
        if(20 > lib.info.AlignInfo.yPixelToRatio(_root._ymouse))
        {
            container_mc.optionMenu_mc._y = _loc3_.y + 30 * lib.info.AlignInfo.scaleRatio;
        }
        else
        {
            container_mc.optionMenu_mc._y = _loc3_.y - container_mc.optionMenu_mc._height - 30 * lib.info.AlignInfo.scaleRatio;
        }
        chatOptionOutStart();
        if(container_mc.output_mc.tabOptionMenu_mc._visible)
        {
            startTabOptionOut(1);
        }
    }
    else
    {
        chatOptionOutEnd();
    }
};
lib.manager.ToolTip.add(container_mc.output_mc.option_btn,lib.info.ToolTipStr.CHAT_OPTION,1);
var class_array = [16758861,15260857,16777041,16732497,6737151,10198015,16777215,7536450];
myListener.OnGame_Chat_SetInteractionMenu = function(name, classNum, classText, level, menuInfo)
{
    classNum = Number(classNum);
    level = Number(level);
    var _loc1_ = container_mc.interactionMenu_mc;
    _loc1_.name_txt.setText(name);
    _loc1_.class_txt.setText("[" + classText + "]");
    _loc1_.class_txt.textColor = class_array[classNum - 1];
    _loc1_.level_txt.text = "[" + LVSTR + level + "]";
    setInteractionMenu(menuInfo);
    _loc1_._visible = true;
    interactionMenuClosing();
};
var sepaDragingMc = null;
var tabArray = new Array();
var chatObjects = new Array();
var chatIndexArray = new Array();
var viewerArray = new Array();
var firstIndex = -1;
myListener.OnGame_Chat_UpdateTab = function(index, tabName, x, y, width, height, alpha, fontSize, type, bLock)
{
    index = Number(index);
    x = Number(x);
    y = Number(y);
    width = Number(width);
    height = Number(height);
    if(alpha != undefined)
    {
        alpha = Number(alpha);
    }
    else
    {
        alpha = mainTabAlpha;
    }
    type = Number(type);
    fontSize = Number(fontSize);
    fontSize = fontSize / 100;
    var _loc7_ = -2;
    var _loc5_ = -2;
    var _loc2_ = -2;
    var _loc11_ = false;
    var _loc14_ = false;
    if(type == 0)
    {
        _loc2_ = chatObjects[index].mainIndex;
        if(_loc2_ == -1)
        {
            _loc14_ = true;
            _loc7_ = tabArray.length;
            _loc5_ = chatObjects[index].viewerIndex;
            tab.setVisible(_loc7_,1);
            viewerArray.splice(_loc5_,1);
            chatObjects[index].mc.removeMovieClip();
            chatObjects[index].mainIndex = _loc7_;
            _loc2_ = chatObjects[index].mainIndex;
            chatObjects[index].viewerIndex = -1;
            tabArray.push(index);
            changeTabInMainChat(_loc7_);
        }
        var _loc15_ = tab.txt_array[_loc2_];
        set2LineText(_loc15_,tabName);
        tab.txt_array[_loc2_].txt = tabName;
        tab.btn_array[_loc2_]._alpha = alpha;
        if(_loc14_ == false && index == tab.activedNum)
        {
            container_mc.output_mc.bg_mc._alpha = alpha;
            container_mc.output_mc.txt.fontScaleFactor = fontSize;
        }
    }
    else
    {
        _loc5_ = chatObjects[index].viewerIndex;
        if(_loc5_ == -1)
        {
            if(tab.activedNum == index)
            {
                _loc11_ = true;
            }
            _loc2_ = chatObjects[index].mainIndex;
            removeTab(_loc2_);
            tabArray.splice(_loc2_,1);
            _loc5_ = viewerArray.length;
            var _loc16_ = makeViewer(chatObjects[index].textArr.length,index,tabName,x,y,width,height,alpha,fontSize);
            chatObjects[index].mc = _loc16_;
            chatObjects[index].mainIndex = -1;
            chatObjects[index].viewerIndex = _loc5_;
            viewerArray.push(index);
        }
        var _loc6_ = chatObjects[index].mc;
        _loc6_.btn._alpha = alpha;
        _loc15_ = chatObjects[index].mc.tab0_txt;
        set2LineText(_loc15_,tabName);
        _loc6_.tab0_txt.txt = tabName;
        _loc6_.bg_mc._alpha = alpha;
        _loc6_.txt.fontScaleFactor = fontSize;
        if(_loc11_)
        {
            changeTabInMainChat(attachIndex);
        }
    }
    if(index == firstIndex)
    {
        chatObjects[index].lock = Number(bLock);
        if(x == -1)
        {
            initMainChatPos();
        }
        else
        {
            container_mc._x = x;
            container_mc._y = y;
            container_mc.xRatio = lib.info.AlignInfo.xPixelToRatio(x);
            container_mc.yRatio = lib.info.AlignInfo.yPixelToRatio(y);
        }
        baseViewerSizeSet(width,height);
        container_mc.output_mc.bg_mc._alpha = alpha;
        container_mc.output_mc.txt.fontScaleFactor = fontSize;
        container_mc.output_mc.expander._x = container_mc.output_mc.bg_mc._width - 80;
        container_mc.output_mc.expander._y = container_mc.output_mc.bg_mc._height - container_mc.output_mc.expander._height;
    }
    chatObjects[index].alpha = alpha;
    chatObjects[index].fontSize = fontSize;
    refreshTexts();
};
var mainTextArray = null;
myListener.OnGame_Chat_AddTab = function(index, tabName, x, y, width, height, alpha, fontSize, type, bLock)
{
    index = Number(index);
    x = Number(x);
    y = Number(y);
    width = Number(width);
    height = Number(height);
    if(alpha != undefined)
    {
        alpha = Number(alpha);
    }
    else
    {
        alpha = mainTabAlpha;
    }
    type = Number(type);
    fontSize = Number(fontSize);
    fontSize = fontSize / 100;
    if(chatObjects[index] == null || chatObjects[index] == undefined)
    {
        chatObjects[index] = createNewChatObj();
        if(type == 0)
        {
            var _loc3_ = tabArray.length;
            var _loc10_ = tab.txt_array[_loc3_];
            set2LineText(_loc10_,tabName);
            tab.txt_array[_loc3_].txt = tabName;
            tab.btn_array[_loc3_]._alpha = alpha;
            tab.setVisible(_loc3_,1);
            chatObjects[index].mainIndex = _loc3_;
            chatObjects[index].viewerIndex = -1;
            tabArray.push(index);
        }
        else
        {
            var _loc13_ = viewerArray.length;
            chatObjects[index].mainIndex = -1;
            chatObjects[index].viewerIndex = _loc13_;
            var _loc7_ = makeViewer(0,index,tabName,x,y,width,height,alpha,fontSize);
            _loc7_.btn._alpha = alpha;
            chatObjects[index].mc = _loc7_;
            viewerArray.push(index);
        }
        if(firstIndex == -1)
        {
            firstIndex = index;
            chatObjects[index].lock = Number(bLock);
            baseTabChanged = true;
            if(x == -1)
            {
                initMainChatPos();
            }
            else
            {
                container_mc._x = x;
                container_mc._y = y;
                container_mc.xRatio = lib.info.AlignInfo.xPixelToRatio(x);
                container_mc.yRatio = lib.info.AlignInfo.yPixelToRatio(y);
            }
            baseViewerSizeSet(width,height);
            container_mc.output_mc.bg_mc._alpha = alpha;
            container_mc.output_mc.txt.fontScaleFactor = fontSize;
            container_mc.output_mc.expander._x = container_mc.output_mc.bg_mc._width - 80;
            container_mc.output_mc.expander._y = container_mc.output_mc.bg_mc._height - container_mc.output_mc.expander._height;
            if(mainTextArray != null)
            {
                chatObjects[index].textArr = mainTextArray;
                refreshTexts();
            }
        }
        chatObjects[index].alpha = alpha;
        chatObjects[index].fontSize = fontSize;
        changeMainTab();
    }
};
myListener.OnGame_Chat_ResetInfo = function()
{
    resetTab();
    resetText();
};
var bletActivateMargin = 35;
myListener.OnGame_MouseMove = function(target)
{
    if(sepaDragingMc != null)
    {
        var _loc3_ = {x:sepaDragingMc._x,y:sepaDragingMc._y - 10};
        var _loc5_ = null;
        container_mc.output_mc.globalToLocal(_loc3_);
        var _loc4_ = 35 * lib.info.AlignInfo.scaleRatio;
        var _loc2_ = 1;
        while(_loc2_ < tabArray.length + 1)
        {
            var _loc1_ = container_mc.output_mc["blet" + _loc2_];
            if(_loc3_.x >= _loc1_._x - _loc4_ && _loc3_.x < _loc1_._x + _loc1_._width + _loc4_ && _loc3_.y >= _loc1_._y - _loc4_ && _loc3_.y < _loc1_._y + _loc1_._height + _loc4_)
            {
                _loc1_._visible = true;
                _loc5_ = _loc2_;
            }
            _loc2_ = _loc2_ + 1;
        }
        if(_loc5_ != null)
        {
            _loc2_ = 1;
            while(_loc2_ < tabArray.length + 1)
            {
                if(_loc2_ != _loc5_)
                {
                    container_mc.output_mc["blet" + _loc2_]._visible = false;
                }
                _loc2_ = _loc2_ + 1;
            }
        }
        else
        {
            _loc2_ = 1;
            while(_loc2_ < tabArray.length + 1)
            {
                container_mc.output_mc["blet" + _loc2_]._visible = false;
                _loc2_ = _loc2_ + 1;
            }
        }
    }
};
myListener.OnGame_MouseUp = function(button, target)
{
    if(sepaDragingMc != null)
    {
        var _loc3_ = null;
        var _loc1_ = 1;
        while(_loc1_ < tabArray.length + 1)
        {
            var _loc2_ = container_mc.output_mc["blet" + _loc1_];
            if(_loc2_._visible)
            {
                _loc3_ = _loc2_.stat;
                break;
            }
            _loc1_ = _loc1_ + 1;
        }
        if(_loc3_ != null)
        {
            attachSepaOnMainChat(_loc3_,sepaDragingMc);
            saveTabInfo();
        }
        _loc1_ = 1;
        while(_loc1_ < tabArray.length + 1)
        {
            container_mc.output_mc["blet" + _loc1_]._visible = false;
            _loc1_ = _loc1_ + 1;
        }
    }
};
myListener.OnGame_MouseDown = function(button, target)
{
    if(target == container_mc.input_mc.txt && container_mc.input_mc.txt.caretIndex == 0)
    {
        impossibleCaretCheck();
    }
    var _loc6_ = target._name;
    if(button == 2 && _loc6_.substr(0,3) == "tab")
    {
        if(target._parent._parent._parent._parent.UIname == UIname || target._parent._parent._parent.UIname == UIname)
        {
            var _loc5_ = _loc6_.substr(3,1);
            tab.setTab(_loc5_);
            if(_loc5_ == 0)
            {
                setEnableMenuLine(removeTabStr,0);
            }
            else
            {
                setEnableMenuLine(removeTabStr,1);
            }
            var _loc3_ = target._parent.tabOptionMenu_mc;
            _loc3_._x = target._x + 5;
            if(chatObjects[firstIndex].lock == 0)
            {
                var _loc4_ = {x:_root._xmouse,y:_root._ymouse};
                target._parent.globalToLocal(_loc4_);
                if(20 > lib.info.AlignInfo.yPixelToRatio(_root._ymouse))
                {
                    _loc3_._y = _loc4_.y + 30 * lib.info.AlignInfo.scaleRatio;
                }
                else
                {
                    _loc3_._y = _loc4_.y - _loc3_._height - 30 * lib.info.AlignInfo.scaleRatio;
                }
                if(80 > lib.info.AlignInfo.xPixelToRatio(_root._xmouse))
                {
                    _loc3_._x = _loc4_.x - 30 * lib.info.AlignInfo.scaleRatio;
                }
                else
                {
                    _loc3_._x = _loc4_.x - _loc3_._width + 30 * lib.info.AlignInfo.scaleRatio;
                }
                _loc3_._visible = true;
                startTabOptionOut();
                resetCount();
                if(container_mc.optionMenu_mc._visible)
                {
                    chatOptionOutEnd();
                }
            }
        }
        if(target._parent._name.substr(0,6) == "viewer")
        {
            _loc3_ = target._parent.tabOptionMenu_mc;
            _loc3_._x = target._x + 5;
            if(chatObjects[firstIndex].lock == 0)
            {
                _loc4_ = {x:_root._xmouse,y:_root._ymouse};
                target._parent.globalToLocal(_loc4_);
                if(20 > lib.info.AlignInfo.yPixelToRatio(_root._ymouse))
                {
                    _loc3_._y = _loc4_.y + 30 * lib.info.AlignInfo.scaleRatio;
                }
                else
                {
                    _loc3_._y = _loc4_.y - _loc3_._height - 30 * lib.info.AlignInfo.scaleRatio;
                }
                if(80 > lib.info.AlignInfo.xPixelToRatio(_root._xmouse))
                {
                    _loc3_._x = _loc4_.x - 30 * lib.info.AlignInfo.scaleRatio;
                }
                else
                {
                    _loc3_._x = _loc4_.x - _loc3_._width + 30 * lib.info.AlignInfo.scaleRatio;
                }
                _loc3_._visible = true;
                target._parent.option_btn.gotoAndStop(3);
                startSepaTabOptionOut(target._parent);
                resetCountSepaTab(target._parent);
                if(container_mc.optionMenu_mc._visible)
                {
                    chatOptionOutEnd();
                }
            }
        }
    }
};
myListener.OnGame_LogOut = function()
{
    container_mc.input_mc.txt.text = "";
    dummy.htmlText = "";
    saveText = "";
    var _loc1_ = 0;
    while(_loc1_ < tabMaxLimit)
    {
        if(tab.btn_array[_loc1_].glow._visible)
        {
            lib.util.Warning.remove(tab.btn_array[_loc1_].glow);
            tab.btn_array[_loc1_].glow._visible = false;
        }
        _loc1_ = _loc1_ + 1;
    }
    myListener.OnGame_Chat_ResetInfo();
    mainTextArray = null;
};
myListener.OnGame_Chat_SaveTabInfo = function()
{
    saveTabInfo();
};
myListener.OnGame_Chat_EnableCahnnel = function(_tabIndex, chtIndex, flag)
{
    _tabIndex = Number(_tabIndex);
    chatObjects[_tabIndex].channelArr[Number(chtIndex)] = Number(flag);
};
container_mc.output_mc.tabOptionMenu_mc._visible = false;
_global.chatLinkAction = function(id)
{
    var _loc1_ = id.split("#####");
    if(_loc1_.length == 2)
    {
        ToGame_Chat_ClickLink(_loc1_[0],_loc1_[1]);
    }
    else if(_loc1_.length == 3)
    {
        ToGame_Chat_ClickLink(_loc1_[0],_loc1_[1],_loc1_[2]);
    }
    if(isFocusInput())
    {
        myListener.OnGame_Chat_ChangeChatMode(false);
        clearInputTxt();
    }
};
_global.chatNameAction = function(nameLinkData)
{
    var _loc5_ = nameLinkData.split("@");
    var _loc2_ = _loc5_[0];
    var _loc4_ = _loc5_[1];
    var _loc3_ = _loc5_[2];
    if(_loc2_.indexOf("&&&;") != -1)
    {
        _loc2_ = lib.util.ExtString.replace(_loc2_,"&&&;","\'",false);
    }
    if(_loc3_.indexOf("&&&;") != -1)
    {
        _loc3_ = lib.util.ExtString.replace(_loc3_,"&&&;","\'",false);
    }
    if(_global.shift)
    {
        ToGame_Chat_ClickName(_loc2_,_loc4_,_loc3_,"SHIFT");
    }
    else if(_global.control)
    {
        ToGame_Chat_ClickName(_loc2_,_loc4_,_loc3_,"CTRL");
    }
    else
    {
        ToGame_Chat_ClickName(_loc2_,_loc4_,_loc3_);
    }
};
_global.debug = function(txt)
{
    debug_txt.text = txt;
};
var dragerDragging = false;
var tabMc_array = new Array(container_mc.output_mc.tab0_mc,container_mc.output_mc.tab1_mc,container_mc.output_mc.tab2_mc,container_mc.output_mc.tab3_mc,container_mc.output_mc.tab4_mc,container_mc.output_mc.tab5_mc,container_mc.output_mc.tab6_mc);
var tabTxt_array = new Array(container_mc.output_mc.tab0_txt,container_mc.output_mc.tab1_txt,container_mc.output_mc.tab2_txt,container_mc.output_mc.tab3_txt,container_mc.output_mc.tab4_txt,container_mc.output_mc.tab5_txt,container_mc.output_mc.tab6_txt);
var tabColor_array = new Array(tabColorNormal,tabColorActive,tabColorActive,tabColorActive);
var tab = new lib.util.TabBtn(tabMc_array,tabTxt_array,tabColor_array);
var checkSepaNum = null;
var sepaMc = null;
var noticeType = "1";
var noticeTxt = "";
var noticeColor = 16777215;
var shoutTxt = "";
var shoutColor = 16777215;
var motionLock = false;
var TEXT_TOP_PADDING = 6;
container_mc.notice_mc.bell.hitTestDisable = true;
container_mc.notice_mc.uBtn.onRelease = function()
{
    if(motionLock)
    {
        return undefined;
    }
    noticeType = "0";
    getURL("FSCommand:ToGame_Chat_NoticeCall",noticeType);
};
container_mc.notice_mc.dBtn.onRelease = function()
{
    if(motionLock)
    {
        return undefined;
    }
    noticeType = "1";
    getURL("FSCommand:ToGame_Chat_NoticeCall",noticeType);
};
baseViewerSizeSet(baseChatWidth,baseChatHeight);
resizeWork(container_mc.output_mc.bg_mc,container_mc.output_mc.expander,baseChatMinWidth,baseChatMinHeight,baseChatWidth * 2,baseChatHeight * 3);
container_mc.output_mc.expander._x = baseChatWidth - 80;
container_mc.output_mc.expander._y = baseChatHeight - container_mc.output_mc.expander._height;
setChatOptionMenu(addTabStr + "\n" + lockChatStr + "\n" + curTabOptionStr + "\n" + initChatPosStr + "\n" + initChatConfigStr);
setTabOptionMenu(removeTabStr + "\n" + optionTabStr + "\n" + addPrivateChannelStr + "\n" + addTabStr);
tab.setRelease(release);
tab.setPress(press);
tab.setReleaseOutside(releaseOutside);
tab.alignText(undefined,3);
showTabContainer(0);
changeMainTab();
set2LineText(tab.txt_array[0],totalTabStr);
tab.txt_array[0].txt = totalTabStr;
changeWhisperMode(false);
setDefaultColor();
remakeInputTf();
var i = 0;
while(i < tabMaxLimit)
{
    tab.setVisible(i,0);
    tab.txt_array[i].verticalAlign = "center";
    tab.btn_array[i]._alpha = mainTabAlpha;
    tab.btn_array[i].glow._visible = false;
    container_mc.output_mc["blet" + i]._visible = false;
    container_mc.output_mc["blet" + i].stat = i;
    i++;
}
fscommand("ToGame_Chat_Init");
