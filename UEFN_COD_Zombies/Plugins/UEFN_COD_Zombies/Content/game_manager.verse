
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using {/Fortnite.com/Teams }
using {/Fortnite.com/Game }
using {/Fortnite.com/Characters }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
game_manager := class(creative_device):
    var PlayerMap: [player]int = map {}
    var PlayerPoints: int = 0;
    var GameUI : game_ui = game_ui{}

    @editable var StartingWeapon : []item_granter_device = array{}

    #@editable var Sentries : []sentry_device = array{}
    
    @editable var RoundTracker : tracker_device = tracker_device{}
    @editable var ZombiesManager : creature_manager_device = creature_manager_device{}
    @editable var ZombieEliminationTracker : tracker_device = tracker_device{}
    
    @editable EndGameDevice : end_game_device = end_game_device{}

    @editable var PropManipulator : prop_manipulator_device = prop_manipulator_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitPlayers()

    InitPlayers() : void=
        PropManipulator.DestroyedEvent.Subscribe(OnBarrierRemove)
        AllPlayers := GetPlayspace().GetPlayers();
        if(Player := AllPlayers[0]):
            # GameUI.CreatePlayerUI(Player)
        for(Player : AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            if(set PlayerMap[Player] = 0, WeaponTier := PlayerMap[Player]):
                Print("Storing player")
                GrantWeapon(Player, WeaponTier)

    GrantWeapon(Player : player, WeaponTier: int) : void=
        Print("Attempt to grant weapon")
        if(ItemGranter := StartingWeapon[WeaponTier]):
            Print("Granted item to player")
            ItemGranter.GrantItem(Player)

    OnBarrierRemove(Agent: agent) : void=
        set PlayerPoints -= 500 
    #    GameUI.UpdatePointCount(PlayerPoints);

    GivePlayerPoints(Points : int) : void = 
        set PlayerPoints += 100
        # GameUI.UpdatePointCount(PlayerPoints);
        Print("Updated Player Points:  {PlayerPoints}")
        
    # OnDamageTaken(Result : OnDamageTakenResult) : void=
    #     if(Result.DamageType = DamageType::Elimination):
    #         if(Player := Result.DamageInstigator):
