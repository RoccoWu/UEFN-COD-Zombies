
using {/UnrealEngine.com/Temporary/UI }
using {/UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Fortnite.com/UI }  

# A Verse-authored creative device that can be placed in a level
game_ui := class():

    PlayerPointsText<localizes>(Points: int): message = "{Points}"
    PlayerPointCountWidget : button_loud = button_loud{}

    UpdatePointCount(TotalPoints : int) :void=
        PlayerPointCountWidget.SetText(PlayerPointsText(TotalPoints))
    
    CreatePlayerUI(Player: player): void=
        if(PlayerUI := GetPlayerUI[Player]):
            PlayerPointCountWidget.SetText(PlayerPointsText(0))
            PlayerCanvas : canvas = canvas: 
                Slots := array:
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.5, Y := 0.0}, Maximum := vector2{X := 0.5, Y := 0.0}}
                        Offsets := margin{Top := 100.0, Left := 0.0, Right := 0.0, Bottom   := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := PlayerPointCountWidget

            PlayerUI.AddWidget(PlayerCanvas)