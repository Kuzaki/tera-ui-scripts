function ToGame_PartyLootingSetting_CloseUI()
{
    fscommand("ToGame_PartyLootingSetting_CloseUI");
}
function ToGame_PartyLootingSetting_Init()
{
    fscommand("ToGame_PartyLootingSetting_Init");
}
function ToGame_PartyLootingSetting_Confirm()
{
    var _loc1_ = Number(container_mc.order_radio.checked) + "\t" + Number(container_mc.random_check.checked) + "\t" + 3 + "\t" + container_mc.level_combo2.selected + "\t" + Number(container_mc.equip_check.checked) + "\t" + Number(container_mc.class_check.checked) + "\t" + Number(container_mc.items_check.checked) + "\t" + container_mc.level_combo3.selected + "\t" + Number(container_mc.looting_check.checked);
    getURL("FSCommand:ToGame_PartyLootingSetting_Confirm",_loc1_);
}
function checkDist(flag)
{
    if(flag == 0)
    {
        container_mc.blindmc._visible = true;
    }
    else
    {
        container_mc.blindmc._visible = false;
    }
    container_mc.free_radio.checked = !flag;
    container_mc.order_radio.checked = flag;
    container_mc.random_check.setEnabled(flag);
    container_mc.order_radio_txt1.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    checkRandom(container_mc.random_check.checked && flag);
}
function checkRandom(flag)
{
    confirm_btn.setEnabled(true);
    container_mc.order_radio_txt2.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    container_mc.order_radio_txt3.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    container_mc.order_radio_txt4.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    container_mc.equip_check_txt.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    container_mc.class_check_txt.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    container_mc.items_check_txt.textColor = !flag?lib.info.TextColor.GENERAL_DISABLE:14145495;
    container_mc.level_combo.active = flag;
    container_mc.level_combo2.active = flag;
    container_mc.level_combo3.active = flag;
    if(flag)
    {
        if(container_mc.level_combo2.selected == 3)
        {
            container_mc.order_radio_txt5.textColor = 14145495;
        }
        else
        {
            container_mc.order_radio_txt5.textColor = 8224125;
        }
    }
    else
    {
        container_mc.order_radio_txt5.textColor = 8224125;
    }
    if(flag)
    {
        container_mc.level_combo._alpha = 100;
        container_mc.level_combo2._alpha = 100;
        container_mc.level_combo3._alpha = 100;
    }
    else
    {
        container_mc.level_combo._alpha = 50;
        container_mc.level_combo2._alpha = 50;
        container_mc.level_combo3._alpha = 50;
    }
    if(!container_mc.random_check.checked)
    {
        container_mc.equip_check.checked = false;
        container_mc.class_check.checked = false;
        container_mc.items_check.checked = false;
    }
    container_mc.equip_check.setEnabled(flag);
    container_mc.class_check.setEnabled(flag);
    container_mc.items_check.setEnabled(flag);
}
function checkRandom3(flag)
{
    confirm_btn.setEnabled(true);
    container_mc.level_combo3.active = flag;
}
function checkLootin(flag)
{
    container_mc.looting_check.checked = flag;
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PartyLootingSetting";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.random_txt.textAutoSize = "shrink";
container_mc.random_txt.verticalAlign = "center";
container_mc.item_check_txt.textAutoSize = "shrink";
container_mc.item_check_txt.verticalAlign = "center";
container_mc.order_radio_txt5.text = "연합파티만 사용";
container_mc.order_radio_txt5._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
    if(widgetName.toLowerCase() == UIname.toLowerCase())
    {
        bWidgetOpen = bShow;
        if(_global.gbUIMode && bWidgetOpen)
        {
            UI._visible = true;
        }
        else
        {
            UI._visible = false;
        }
    }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
    if(_global.gbUIMode && bWidgetOpen)
    {
        UI._visible = true;
    }
    else
    {
        UI._visible = false;
    }
    container_mc.ToolTip._visible = bShow;
};
var levelIndex;
var itemGrade = ["","$321087","$321086","$321085","$321084"];
myListener.OnGame_PartyLootingSetting_SetData = function(distribute, randomDist, levelIndex, randomIndex, equip, _class, dice, lootincheck)
{
    this.levelIndex = levelIndex;
    container_mc.order_radio_txt4.text = lib.util.UIString.getUIString("$195037","grade",itemGrade[Number(levelIndex)]);
    container_mc.level_combo.selectedIndex = Number(levelIndex) - 1;
    container_mc.level_combo2.setSelectedIndex(Number(randomIndex) - 1);
    container_mc.level_combo3.selectedIndex = Number(0);
    container_mc.random_check.checked = Boolean(Number(randomDist));
    checkRandom(Boolean(Number(randomDist)));
    container_mc.equip_check.checked = Boolean(Number(equip));
    container_mc.class_check.checked = Boolean(Number(_class));
    container_mc.items_check.checked = Boolean(Number(dice));
    checkRandom3(Boolean(Number(dice)));
    checkDist(Boolean(Number(distribute)));
    checkLootin(Boolean(Number(lootincheck)));
    confirm_btn.setEnabled(false);
};
container_mc.looting_check.setText(container_mc.looting_check_txt);
container_mc.looting_check.onChanged = function(checked)
{
    confirm_btn.setEnabled(true);
};
container_mc.free_radio.setText(container_mc.free_radio_txt);
container_mc.free_radio.onChanged = function(checked)
{
    checkDist(!checked);
};
container_mc.order_radio.setText(container_mc.order_radio_txt);
container_mc.order_radio.onChanged = function(checked)
{
    checkDist(checked);
};
container_mc.random_check.setText(container_mc.order_radio_txt1);
container_mc.random_check.onChanged = function(checked)
{
    checkRandom(checked);
};
container_mc.equip_check.setText(container_mc.equip_check_txt);
container_mc.equip_check.onChanged = function(checked)
{
    confirm_btn.setEnabled(true);
};
container_mc.class_check.setText(container_mc.class_check_txt);
container_mc.class_check.onChanged = function(checked)
{
    confirm_btn.setEnabled(true);
};
container_mc.items_check.setText(container_mc.items_check_txt);
container_mc.items_check.onChanged = function(checked)
{
    confirm_btn.setEnabled(true);
};
var close_btn = container_mc.txtBtn1.txtBtn;
var confirm_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_PartyLootingSetting_CloseUI);
x_btn.setRelease(ToGame_PartyLootingSetting_CloseUI);
confirm_btn.setRelease(ToGame_PartyLootingSetting_Confirm);
var comboList = {};
comboList.onChanged = function(tg, _selected)
{
    if(tg == container_mc.level_combo2 && _selected == 2)
    {
        container_mc.level_combo.selectedIndex = 0;
    }
    confirm_btn.setEnabled(true);
    if(container_mc.level_combo2.selected == 3)
    {
        container_mc.order_radio_txt5.textColor = 14145495;
    }
    else
    {
        container_mc.order_radio_txt5.textColor = 8224125;
    }
};
container_mc.level_combo.rowMax = 3;
container_mc.level_combo.data = [{label:"$321087",id:1},{label:"$321086",id:2},{label:"$321085",id:3}];
container_mc.level_combo.addListener(comboList);
container_mc.level_combo2.rowMax = 3;
container_mc.level_combo2.data = [{label:"$195011",id:1},{label:"$195012",id:2}];
container_mc.level_combo2.addListener(comboList);
container_mc.level_combo3.rowMax = 2;
container_mc.level_combo3.data = [{label:"$195017",id:1}];
container_mc.level_combo3.addListener(comboList);
ToGame_PartyLootingSetting_Init();
