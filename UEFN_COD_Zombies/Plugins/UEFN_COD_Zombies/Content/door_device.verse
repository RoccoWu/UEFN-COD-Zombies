
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }


door_device := class(creative_device):
    
    @editable var Button1 :button_device = button_device{}
    @editable var Door1 : prop_manipulator_device = prop_manipulator_device{}

    @editable var DoorPrice1: int = 1000;
    
    @editable var PointsCounter: points_counter_device = points_counter_device{}


    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Button1.InteractedWithEvent.Subscribe(RemoveDoor1)
    

    RemoveDoor1(Agent:agent): void=
        if(PointsCounter.Points >= DoorPrice1):
            if(Player := PointsCounter.Players[0]):
                Door1.HideProps()
                Button1.Disable()
                Print("Destroying Door")
                set PointsCounter.Points -= DoorPrice1
                PointsCounter.UIBox.SetText(PointsCounter.UIText(PointsCounter.Points))
        else:
                Print("Insufficient Points")
    