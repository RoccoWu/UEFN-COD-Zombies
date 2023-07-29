
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using {/Fortnite.com/Teams }
using {/Fortnite.com/Game }
using {/Fortnite.com/Characters }
using {/Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
game_manager := class(creative_device):
    var PlayerMap: [player]int = map {}

    @editable
    var StartingWeapon : []item_granter_device = array{}

    @editable
    var Sentries : []sentry_device = array{}

    @editable
    EndGmeDevice : end_game_device = end_game_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitPlayers()

    InitPlayers() : void=
        AllPlayers := GetPlayspace().GetPlayers();
        for(Player : AllPlayers, FortCharacter := Player.GetFortCharacter[]):
            if(set PlayerMap[Player] = 0, WeaponTier := PlayerMap[Player]):
                Print("Storing player")
                GrantWeapon(Player, WeaponTier)

    GrantWeapon(Player : player, WeaponTier: int) : void=
        Print("Attempt to grant weapon")
        if(ItemGranter := StartingWeapon[WeaponTier]):
            Print("Granted item to player")
            ItemGranter.GrantItem(Player)

    # OnDamageTaken(Result : OnDamageTakenResult) : void=
    #     if(Result.DamageType = DamageType::Elimination):
    #         if(Player := Result.DamageInstigator):
                