function setCoolTime(remainTime, maxTime)
{
    var _loc2_ = int((maxTime - remainTime) / maxTime * 59 + 1);
    this.gotoAndStop(_loc2_);
}
function setEnable(bEnable)
{
    if(bEnable)
    {
        this.gotoAndStop(62);
    }
    else
    {
        trace("colltime bEnable:" + bEnable);
        this.gotoAndStop(61);
    }
}
stop();
this.setEnable(true);
