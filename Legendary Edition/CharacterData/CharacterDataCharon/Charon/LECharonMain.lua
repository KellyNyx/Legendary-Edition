OnWeaponFired{ "LECharonDash",
    function( triggerArgs )
		thread(CharonDashPresentation)
end
}

function CharonDashPresentation ()
    --SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 0.0 })
    SetAnimation({ Name = "Blank", DestinationId = CurrentRun.Hero.ObjectId })
    CreateAnimation({ Name = "ThanatosTeleport", DestinationId = CurrentRun.Hero.ObjectId })
    --SetAnimation({ Name = "HadesBattleIntro", DestinationId = CurrentRun.Hero.ObjectId })
    wait(0.3)
    --SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 1.0 })
    SetAnimation({ Name = "Charon_IdleBattle", DestinationId = CurrentRun.Hero.ObjectId })
    CreateAnimation({ Name = "ThanatosTeleport", DestinationId = CurrentRun.Hero.ObjectId })
end

--Intro (Run start)--
function CharonIntroPresentation ( heroId, lightId, heroDestination, disableCollision, dropDelay, landDelay, speedAdjustment )
    AddInputBlock({ Name = "CharonIntroPresentation" })
    AddTimerBlock( CurrentRun, "CharonIntroPresentation" )
     wait( dropDelay )
    -- SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "SuppressSounds", Value = true, DataValue = false })
    -- if disableCollision then
    --     SetUnitProperty({ DestinationId = heroId, Property = "CollideWithObstacles", Value = false })
    -- end
    -- if speedAdjustment then
    --     SetUnitProperty({ DestinationId = heroId, Property = "Speed", Value = speedAdjustment })
    -- end
    -- SetAlpha({ Id = heroId, Fraction = 1.0 })
    -- if( lightId ~= nil ) then
    --     SetAlpha({ Id = lightId, Fraction = 1.0 })
    -- end
    SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 1.0 })
    
    SetAnimation({ Name = "Charon_IdleGreeting", DestinationId = heroId })
    CreateAnimation({ Name = "ThanatosTeleport", DestinationId = heroId })
    --SetThingProperty({ DestinationId = heroId, Property = "TouchdownGraphic", Value = CurrentCharacterHeroTouchDownGraphic })
    --AdjustZLocation({ Id = heroId, Distance = 1500, Duration = 0 })
    wait(3.0)
   -- AdjustZLocation({ Id = heroId, Distance = 1500, Duration = 1.0 })
    --Move({ Id = heroId, DestinationId = heroDestination, Mode = "Precise" })
    --PlaySound({ Name = "/SFX/Player Sounds/ZagreusWhooshDropIn", Id = heroId, Delay = 0.5 })
    --thread( DustLanding, 1.62 )
    -- wait( landDelay )
    Stop({ Id = heroId })
    --AngleTowardTarget({ Id = heroId, DestinationId = 553377 })
    SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "SuppressSounds", Value = false, DataValue = false })
    --if disableCollision then
       -- SetUnitProperty({ DestinationId = heroId, Property = "CollideWithObstacles", Value = true })
   -- end
    if speedAdjustment then
        SetUnitProperty({ DestinationId = heroId, Property = "Speed", Value = CurrentCharacterBaseSpeed })
    end
    --StopAnimation({ Name = "HadesReappear", DestinationId = heroId })
    thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.2, Duration = 0.15 }, } )
    RemoveInputBlock({ Name = "CharonIntroPresentation" })
    RemoveTimerBlock( CurrentRun, "CharonIntroPresentation" )
end

-- function LECharonTeleportToRoom()

-- end