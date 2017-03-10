var UI = this;
UI._visible = false;
var UIname = "RankAround";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
function scrollRegister(maskMc, maskedMc, scrollBarMc, posY)
{
    scrollBarMc.addListener(maskedMc);
    maskedMc.onScroll = function()
    {
        maskedMc._y = posY - arguments[0];
    };
    scrollBarMc.setWheel(maskedMc);
    scrollBarMc.wheelDelta = 1;
    scrollBarMc.pageSize = 0;
    scrollBarMc.displaySize = maskMc._height;
    scrollBarMc.defaultBarSizeRatio = 0.3333333333333333;
    scrollBarMc.rowHeight = LINE_HEIGHT;
    scrollBarMc.scroll = 0;
}
function updateScrollBar(maskedMc, scrollBarMc)
{
    scrollBarMc.pageSize = maskedMc._height;
    scrollBarMc.scroll = 0;
}
function listReset()
{
    var _loc1_ = container_mc.infomationContainer;
    for(var _loc2_ in _loc1_)
    {
        if(typeof _loc1_[_loc2_] == "movieclip")
        {
            _loc1_[_loc2_].removeMovieClip();
        }
    }
    updateScrollBar(container_mc.infomationContainer,infomationScrollBar);
}
function ToGame_RankAround_Init()
{
    fscommand("ToGame_RankAround_Init");
}
function test()
{
    UI._visible = true;
    var _loc1_ = "1\t김재경1\t0000\t1\t0\t0\n";
    _loc1_ = _loc1_ + "2\t김재경2\t2000\t0\t0\t1\n";
    _loc1_ = _loc1_ + "3\t나자신\t1000\t0\t1\t0\n";
    _loc1_ = _loc1_ + "4\t김재경4\t2000\t1\t0\t1\n";
    _loc1_ = _loc1_ + "5\t김재경5\t2000\t1\t0\t1";
}
if(_global.EventBroadCaster)
{
    _global.EventBroadCaster.addListener(myListener);
}
var Labels = [];
var Colums = [];
var TextCoulms = [];
var LINE_HEIGHT = 24;
var CATE_HEIGHT = 36;
var columMax = 795;
var prevFocus = -1;
var infomationListY = container_mc.infomationContainer._y;
var infomationScrollBar = container_mc.infomationScroll;
scrollRegister(container_mc.infomationMask,container_mc.infomationContainer,infomationScrollBar,infomationListY);
var rankStr = lib.util.UIString.getUIString("$700000");
var characterNameStr = lib.util.UIString.getUIString("$700001");
var totalScoreStr = lib.util.UIString.getUIString("$700004");
var streamRankStr = lib.util.UIString.getUIString("$700015");
container_mc.rankTF.text = rankStr;
container_mc.characterNameTF.text = characterNameStr;
container_mc.totalScoreTF.text = totalScoreStr;
container_mc.streamRankTF.text = streamRankStr;
myListener.OnGame_RankAround_AddPlayerList = function(_dataList)
{
    listReset();
    var _loc5_ = lib.util.ExtString.split(_dataList,"\n");
    var _loc6_ = _loc5_.length;
    var _loc3_ = 0;
    while(_loc3_ < _loc6_)
    {
        var _loc2_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
        var _loc1_ = container_mc.infomationContainer.attachMovie("ListMc","listMc" + _loc3_,container_mc.infomationContainer.getNextHighestDepth());
        _loc1_._x = 0;
        _loc1_._y = _loc1_._height * _loc3_;
        _loc1_.gotoAndStop(Number(_loc2_[3]) + 1);
        var _loc4_ = Number(_loc2_[5]) + 1;
        if(Number(_loc2_[4]) == 0)
        {
            _loc1_.myMc._visible = false;
            _loc1_.txtMc._visible = true;
            _loc1_.txtMc.gotoAndStop(_loc4_);
            _loc1_.txtMc.numTF.text = _loc2_[0];
            _loc1_.txtMc.nameTF.text = _loc2_[1];
            _loc1_.txtMc.scoreTF.text = _loc2_[2];
        }
        else
        {
            _loc1_.myMc._visible = true;
            _loc1_.txtMc._visible = false;
            _loc1_.myMc.gotoAndStop(_loc4_);
            _loc1_.myMc.numTF.text = _loc2_[0];
            _loc1_.myMc.nameTF.text = _loc2_[1];
            _loc1_.myMc.scoreTF.text = _loc2_[2];
        }
        _loc3_ = _loc3_ + 1;
    }
    updateScrollBar(container_mc.infomationContainer,infomationScrollBar);
};
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
    if(_WindowName.toLowerCase() == UIname.toLowerCase())
    {
        bWindowOpen = _bShow;
        if(_global.gbUIMode && bWindowOpen)
        {
            UI._visible = true;
        }
        else
        {
            UI._visible = false;
        }
    }
};
infomationScrollBar._visible = false;
ToGame_RankAround_Init();
