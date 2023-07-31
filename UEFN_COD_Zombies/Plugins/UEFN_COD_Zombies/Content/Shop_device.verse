
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }


Shop_device := class(creative_device):
    @editable var Button1 :button_device = button_device{}
    @editable var ItemGranter1 : item_granter_device = item_granter_device{}
    @editable var WeaponPrice1: int = 1000;

    @editable var Button2 :button_device = button_device{}
    @editable var ItemGranter2 : item_granter_device = item_granter_device{}
    @editable var WeaponPrice2: int = 1000;

    @editable var Button3 :button_device = button_device{}
    @editable var ItemGranter3 : item_granter_device = item_granter_device{}
    @editable var WeaponPrice3: int = 1000;

    @editable var Button4 :button_device = button_device{}
    @editable var ItemGranter4 : item_granter_device = item_granter_device{}
    @editable var WeaponPrice4: int = 1000;

    @editable var Button5 :button_device = button_device{}
    @editable var ItemGranter5 : item_granter_device = item_granter_device{}
    @editable var WeaponPrice5: int = 1000;

    @editable var PointsCounter: points_counter_device = points_counter_device{}

    
    OnBegin<override>()<suspends>:void=
        Button1.InteractedWithEvent.Subscribe(BuyItem1)
        Button2.InteractedWithEvent.Subscribe(BuyItem2)
        Button3.InteractedWithEvent.Subscribe(BuyItem3)
        Button4.InteractedWithEvent.Subscribe(BuyItem4)
        Button5.InteractedWithEvent.Subscribe(BuyItem5)


    BuyItem1(Agent : agent): void= 
        if(PointsCounter.Points >= WeaponPrice1):
            if(Player := PointsCounter.Players[0]):
                ItemGranter1.GrantItem(Player)
                set PointsCounter.Points -= WeaponPrice1
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")
    
    BuyItem2(Agent : agent): void= 
        if(PointsCounter.Points >= WeaponPrice2):
            if(Player := PointsCounter.Players[0]):
                ItemGranter2.GrantItem(Player)
                set PointsCounter.Points -= WeaponPrice2
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")
    
    BuyItem3(Agent : agent): void= 
        if(PointsCounter.Points >= WeaponPrice3):
            if(Player := PointsCounter.Players[0]):
                ItemGranter3.GrantItem(Player)
                set PointsCounter.Points -= WeaponPrice3
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")

    BuyItem4(Agent : agent): void= 
        if(PointsCounter.Points >= WeaponPrice4):
            if(Player := PointsCounter.Players[0]):
                ItemGranter4.GrantItem(Player)
                set PointsCounter.Points -= WeaponPrice4
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")


    BuyItem5(Agent : agent): void= 
        if(PointsCounter.Points >= WeaponPrice5):
            if(Player := PointsCounter.Players[0]):
                ItemGranter5.GrantItem(Player)
                set PointsCounter.Points -= WeaponPrice5
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")