class lib.gamedata.MapMarkerCollection extends lib.gamedata.GameDataCollectionImpl
{
    static var _this = null;
    function MapMarkerCollection()
    {
        super();
    }
    function createOnGameListener(collection)
    {
        this.myListener = new Object();
        _global.EventBroadCaster.addListener(this.myListener);
        this.myListener.OnGame_RegisterWorldMapMarkerStyleData = function(dataList)
        {
            var _loc4_ = dataList.split("\n");
            var _loc12_ = _loc4_[_loc4_.length - 1];
            if(_loc12_ == undefined || _loc12_ == "")
            {
                _loc4_.pop();
            }
            var _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
                var _loc1_ = _loc4_[_loc2_].split("\t");
                var _loc3_ = _loc1_[_loc1_.length - 1];
                if(_loc3_ == undefined || _loc3_ == "")
                {
                    _loc1_.pop();
                }
                var _loc7_ = _loc1_[0];
                var _loc9_ = _loc1_[1];
                var _loc8_ = _loc1_[2];
                var _loc10_ = "img://__" + _loc1_[3];
                var _loc5_ = _loc1_[4];
                var _loc6_ = _loc1_[5];
                var _loc11_ = _loc1_[6];
                collection.addData(new lib.gamedata.MapMarker({id:_loc7_,leftMargin:_loc9_,topMargin:_loc8_,img:_loc10_,detph:_loc5_,bRollOver:_loc6_,rollOverImg:_loc11_}));
                _loc2_ = _loc2_ + 1;
            }
        };
    }
    static function getInstance()
    {
        if(lib.gamedata.MapMarkerCollection._this == null)
        {
            lib.gamedata.MapMarkerCollection._this = new lib.gamedata.MapMarkerCollection();
            lib.gamedata.MapMarkerCollection._this.createOnGameListener(lib.gamedata.MapMarkerCollection._this);
        }
        return lib.gamedata.MapMarkerCollection._this;
    }
}
