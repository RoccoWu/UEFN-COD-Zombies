
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/Diagnostics }

points_counter_device := class(creative_device):

    @editable
    var ElimManager : elimination_manager_device = elimination_manager_device{}
    var Points: int = 0
    var Players : []player = array{}
    var UIBox : button_loud = button_loud{}

    UIText<localizes>(PlayerPoints : int) : message = "Points: {PlayerPoints}"
 
    OnBegin<override>()<suspends>:void=
       ElimManager.EliminationEvent.Subscribe(EnemyKilled)

       set Players = GetPlayspace().GetPlayers()
       if(Player := Players[0]):
            CreateUI(Player)

    EnemyKilled(Agent : ?agent) : void = 
        set Points +=100 #unforunately adds when player dies
        UIBox.SetText(UIText(Points))
        Print ("Kills: {Points}")

    CreateUI(Player : player) : void =
        if(PlayerUI := GetPlayerUI[Player]):
            UIBox.SetText(UIText(0))
            PlayerCanvas : canvas = canvas:
                Slots := array:
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.0, Y := 1.0}, Maximum := vector2{X := 0.0, Y := 1.0}}
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom   := 0.0}
                        Alignment := vector2{X := 0.0, Y := 1.0}
                        SizeToContent := true
                        Widget := UIBox

            PlayerUI.AddWidget(PlayerCanvas)