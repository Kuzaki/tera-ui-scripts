function drawBitmap(LinkageID)
{
    var _loc4_ = flash.display.BitmapData.loadBitmap(LinkageID);
    var _loc2_ = this.createEmptyMovieClip(LinkageID,this.getNextHighestDepth());
    _loc2_.attachBitmap(_loc4_,this.getNextHighestDepth());
    _loc2_._width = 24;
    _loc2_._height = 24;
    resourcID = LinkageID;
}
var resourcID;
