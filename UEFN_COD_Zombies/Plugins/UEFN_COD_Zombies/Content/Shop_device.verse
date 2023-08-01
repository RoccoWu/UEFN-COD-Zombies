
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }


Shop_device := class(creative_device):
    #WEAPONS
    @editable var Button1 :button_device = button_device{}
    @editable var ItemGranter1 : item_granter_device = item_granter_device{}
    @editable var ItemRemover1 : item_remover_device = item_remover_device{}
    @editable var WeaponPrice1: int = 1000;
    #@editable var Button1New :conditional_button_device = conditional_button_device:


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

    #AMMO
    @editable var LightAmmoButton :button_device = button_device{}
    @editable var LightAmmoGranter : item_granter_device = item_granter_device{}
    @editable var AmmoLightPrice: int = 500;

    @editable var MediumAmmoButton :button_device = button_device{}
    @editable var MediumAmmoGranter : item_granter_device = item_granter_device{}
    @editable var AmmoMediumPrice: int = 500;

    @editable var HeavyAmmoButton :button_device = button_device{}
    @editable var HeavyAmmoGranter : item_granter_device = item_granter_device{}
    @editable var AmmoHeavyPrice: int = 500;

    @editable var ShellAmmoButton :button_device = button_device{}
    @editable var ShellAmmoGranter : item_granter_device = item_granter_device{}
    @editable var AmmoShellPrice: int = 500;
    
    @editable var ExplosiveAmmoButton :button_device = button_device{}
    @editable var ExplosiveAmmoGranter : item_granter_device = item_granter_device{}
    @editable var AmmoExplosivePrice: int = 500;

    @editable var ArrowAmmoButton :button_device = button_device{}
    @editable var ArrowAmmoGranter : item_granter_device = item_granter_device{}
    @editable var AmmoArrowPrice: int = 500;

    @editable var PointsCounter: points_counter_device = points_counter_device{}

    
    OnBegin<override>()<suspends>:void=
        Button1.InteractedWithEvent.Subscribe(BuyItem1)
        Button2.InteractedWithEvent.Subscribe(BuyItem2)
        Button3.InteractedWithEvent.Subscribe(BuyItem3)
        Button4.InteractedWithEvent.Subscribe(BuyItem4)
        Button5.InteractedWithEvent.Subscribe(BuyItem5)
        LightAmmoButton.InteractedWithEvent.Subscribe(BuyAmmoLight)
        MediumAmmoButton.InteractedWithEvent.Subscribe(BuyAmmoMedium)
        HeavyAmmoButton.InteractedWithEvent.Subscribe(BuyAmmoHeavy)
        ShellAmmoButton.InteractedWithEvent.Subscribe(BuyAmmoShells)
        ExplosiveAmmoButton.InteractedWithEvent.Subscribe(BuyAmmoExplosive)
        ArrowAmmoButton.InteractedWithEvent.Subscribe(BuyAmmoArrow)


    BuyItem1(Agent : agent): void= 
        if(PointsCounter.Points >= WeaponPrice1):
            if(Player := PointsCounter.Players[0]):
                ItemRemover1.Remove(Player)
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

    BuyAmmoLight(Agent:agent): void=
        if(PointsCounter.Points >= AmmoLightPrice):
            if(Player := PointsCounter.Players[0]):
                LightAmmoGranter.GrantItem(Player)
                set PointsCounter.Points -= AmmoLightPrice
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")
    
    BuyAmmoMedium(Agent:agent): void=
        if(PointsCounter.Points >= AmmoMediumPrice):
            if(Player := PointsCounter.Players[0]):
                MediumAmmoGranter.GrantItem(Player)
                set PointsCounter.Points -= AmmoMediumPrice
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")


    BuyAmmoHeavy(Agent:agent): void=
        if(PointsCounter.Points >= AmmoHeavyPrice):
            if(Player := PointsCounter.Players[0]):
                HeavyAmmoGranter.GrantItem(Player)
                set PointsCounter.Points -= AmmoHeavyPrice
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")

    BuyAmmoShells(Agent:agent): void=
        if(PointsCounter.Points >= AmmoShellPrice):
            if(Player := PointsCounter.Players[0]):
                ShellAmmoGranter.GrantItem(Player)
                set PointsCounter.Points -= AmmoShellPrice
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")

    BuyAmmoExplosive(Agent:agent): void=
        if(PointsCounter.Points >= AmmoExplosivePrice):
            if(Player := PointsCounter.Players[0]):
                ExplosiveAmmoGranter.GrantItem(Player)
                set PointsCounter.Points -= AmmoExplosivePrice
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")

    BuyAmmoArrow(Agent:agent): void=
        if(PointsCounter.Points >= AmmoArrowPrice):
            if(Player := PointsCounter.Players[0]):
                ArrowAmmoGranter.GrantItem(Player)
                set PointsCounter.Points -= AmmoArrowPrice
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
            Print("Insufficient Points")
