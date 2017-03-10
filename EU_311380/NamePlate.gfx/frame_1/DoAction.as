function OnGame_NamePlate_SetPcName(TopIcon, BottomIcon, titleName, pcName, guildName)
{
    this.clear();
    var _loc11_ = 60;
    var _loc3_ = lib.util.ExtString.split(TopIcon,"\t");
    var _loc4_ = lib.util.ExtString.split(BottomIcon,"\t");
    var _loc9_ = lib.util.ExtString.split(titleName,"\t");
    var _loc17_ = lib.util.ExtString.split(pcName,"\t");
    var _loc10_ = lib.util.ExtString.split(guildName,"\t");
    var _loc8_ = "";
    var _loc21_ = "";
    var _loc6_ = -17;
    if(_loc9_[0] != "" && _loc9_[0] != undefined)
    {
        _loc8_ = _loc8_ + ("<font size=\'18\' color=\'" + _loc9_[1] + "\'>" + _loc9_[0] + "</font><br>");
    }
    var _loc12_ = _loc17_[0];
    if(_loc12_ != "" && _loc12_ != undefined)
    {
        _loc8_ = _loc8_ + ("<font size=\'20\' color=\'" + _loc17_[1] + "\'>" + _loc12_ + "</font><br>");
    }
    if(_loc10_[0] != "" && _loc10_[0] != undefined)
    {
        _loc8_ = _loc8_ + ("<font size=\'14\' color=\'" + _loc10_[1] + "\'>" + _loc10_[0] + "</font>");
    }
    else
    {
        _loc6_ = 3;
    }
    var _loc14_ = 0.609;
    var _loc13_ = 39;
    var _loc16_ = -45;
    var _loc15_ = 30;
    var _loc18_ = 0;
    _loc8_ = lib.util.ExtString.replace(_loc8_,"\r","");
    txtFormat.align = "left";
    nameFd.text = "";
    nameFd.setNewTextFormat(txtFormat);
    nameFd.htmlText = _loc8_;
    var _loc19_ = nameFd.textWidth + _loc11_;
    var _loc20_ = (TEXTUREWIDTH - _loc19_) / 2;
    var _loc5_ = _loc20_ + _loc11_;
    nameFd._x = _loc5_;
    var _loc7_ = false;
    var _loc2_ = 0;
    while(_loc2_ < _loc3_.length)
    {
        if(_loc3_[_loc2_] != "" && _loc3_[_loc2_] != undefined)
        {
            _loc7_ = true;
            lib.display.DrawBitmapData.draw(this,_loc3_[_loc2_],_loc5_ - (_loc2_ + 1) * 33,_loc6_,0,0,30,30,0.937);
        }
        _loc2_ = _loc2_ + 1;
    }
    if(_loc4_[1] != "" && _loc4_[1] != undefined)
    {
        if(_loc4_[2] != "" && _loc4_[2] != undefined)
        {
            _loc14_ = 0.5;
            _loc13_ = 32;
            _loc16_ = -42;
            _loc15_ = 33;
            _loc18_ = -9;
            lib.display.DrawBitmapData.draw(this,_loc4_[2],_loc5_ - 53,_loc6_ + 25,0,0,54,54,0.5);
        }
        _loc7_ = true;
        lib.display.DrawBitmapData.draw(this,_loc4_[1],_loc5_ + _loc16_,_loc6_ + _loc15_,0,0,_loc13_,_loc13_,_loc14_);
        if(_loc4_[0] != "" && _loc4_[0] != undefined)
        {
            lib.display.DrawBitmapData.draw(this,_loc4_[0],_loc5_ - 64 + _loc18_,_loc6_ + 29,0,0,19,39,0.609);
        }
    }
    else if(_loc4_[0] != "" && _loc4_[0] != undefined)
    {
        _loc7_ = true;
        lib.display.DrawBitmapData.draw(this,_loc4_[0],_loc5_ - 27,_loc6_ + 29,0,0,19,39,0.609);
    }
    if(!_loc7_)
    {
        nameFd._x = nameFd._x - _loc11_ / 2;
    }
    nameFd2._visible = false;
    nameFd._visible = true;
}
function OnGame_NamePlate_GetPosition()
{
    var _loc2_ = nameFd.getLineMetrics(0);
    var _loc1_ = nameFd._y + nameFd._height - nameFd.textHeight - 4 + 58;
    return nameFd._x + "\t" + _loc1_ + "\t" + _loc2_.width;
}
function OnGame_NamePlate_SetName()
{
    var _loc5_ = "";
    this.clear();
    var _loc3_ = 0;
    while(_loc3_ < arguments.length)
    {
        args = lib.util.ExtString.split(arguments[_loc3_],"\t");
        var _loc4_ = args[0].indexOf("{@img:",0);
        if(_loc4_ != -1 && _loc4_ != undefined)
        {
            args[0] = lib.util.ExtString.replace(args[0],"{@img:","<img src=\'");
            args[0] = lib.util.ExtString.replace(args[0],"}","\' width=\'23\' height=\'23\' vspace=\'3\'>");
        }
        _loc5_ = _loc5_ + ("<font color=\'" + args[1] + "\'>" + args[0] + "</font><br>");
        _loc3_ = _loc3_ + 1;
    }
    _loc5_ = lib.util.ExtString.replace(_loc5_,"\r","");
    nameFd2._visible = true;
    nameFd._visible = false;
    nameFd2.htmlText = _loc5_;
}
function OnGame_NamePlate_SetCastleName(guildIcon, guildName, pcName)
{
    this.clear();
    var _loc3_ = 64;
    var _loc7_ = 224;
    var _loc6_ = -30;
    var _loc2_ = "";
    var _loc8_ = "";
    var _loc5_ = lib.util.ExtString.split(pcName,"\t");
    var _loc4_ = lib.util.ExtString.split(guildName,"\t");
    _loc2_ = _loc2_ + ("<font size=\'24\' color=\'" + _loc5_[1] + "\'>" + _loc5_[0] + "</font><br>");
    _loc2_ = _loc2_ + ("<font size=\'16\' color=\'" + _loc4_[1] + "\'>" + _loc4_[0] + "</font>");
    _loc2_ = lib.util.ExtString.replace(_loc2_,"\r","");
    lib.display.DrawBitmapData.draw(this,guildIcon,_loc7_,_loc6_,0,0,_loc3_,_loc3_,1);
    nameFd2._visible = true;
    nameFd._visible = false;
    nameFd2.htmlText = _loc2_;
    nameFd2._y = 0;
}
function setTextShadow(tf, blurX, blurY, strength, angle, distance, color)
{
    tf.shadowBlurX = blurX;
    tf.shadowBlurY = blurY;
    tf.shadowStrength = strength;
    tf.shadowQuality = 3;
    tf.shadowAngle = angle;
    tf.shadowDistance = distance;
    tf.shadowColor = color;
}
_global.gfxExtensions = true;
nameFd.verticalAlign = "bottom";
nameFd2.verticalAlign = "bottom";
iconFd.verticalAlign = "bottom";
nameFd.noTranslate = true;
nameFd2.noTranslate = true;
var TOPFONTSIZE = 18;
var BOOTOOMFONTSIZE = 15;
var TEXTUREWIDTH = 512;
var instBitMapObject = new lib.display.BitMapObject();
var FONTSIZES0 = 18;
var FONTSIZES1 = 20;
var FONTSIZES2 = 14;
var unionicons = ["","img://__Icon_System.UnionFlag_AL","img://__Icon_System.UnionFlag_KA","img://__Icon_System.UnionFlag_VK"];
var masteriocns = ["","img://__Icon_System.artisanMaster_Armor_Tex","img://__Icon_System.artisanMaster_Weapon_Tex","img://__Icon_System.artisanMaster_Potion_Tex","img://__Icon_System.artisanMaster_Enchant_Tex"];
var gicons = ["","img://__Icon_Items.FireWorks_Ding_Exclam_Tex","img://__Icon_Items.fallfestival_coin_Tex","img://__Icon_Items.Union_Collect3_Tex"];
