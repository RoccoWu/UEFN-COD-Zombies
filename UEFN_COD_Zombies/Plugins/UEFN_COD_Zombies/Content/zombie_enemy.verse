
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using {/Fortnite.com/Devices }
using {/Fortnite.com/Characters }
using {/Fortnite.com/Game }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
zombie := class():
    var TotalHP : int = 100
    var CurrentHP : int = 100
    var GameUI : game_ui = game_ui{}
    var Players : []player = array{}

    TakeDamage(DamagePoints : int) : void =
        set CurrentHP -= DamagePoints

    IsAlive()<decides>: void=
        if(CurrentHP > 0) {true}
        else {false}

    
             

zombie_enemy := class(creative_device):
    @editable ZombieManager : creature_manager_device = creature_manager_device{}
    @editable GameManager : game_manager = game_manager{}
    @editable RegularZombieHealth : int = 100
    @editable ZombieHealthMultiplier : float = 1.5

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
       ZombieInstance := zombie{}
      #ZombieInstance.health := 100 
       #ZombieInstance.TakeDamage(10)
       #GameManager.GivePlayerPoints(100)
       #Print("Zombie Taking Damage SHEEESH [GameManager.PlayerPoints]")
#TODO CREATE ON HIT DAMAGE EVENT FOR ZOMBIE
    HandlePlayerHit(DamageResult : damage_result) : void =
        Target := DamageResult.Target
        #GameManager.GivePlayerPoints(100)
        Print("Got Hit By Sheesher")

    