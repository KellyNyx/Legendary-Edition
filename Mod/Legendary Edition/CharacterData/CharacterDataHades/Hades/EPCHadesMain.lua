if not LegendaryEdition.Config.Enabled then return end



-- ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
--     if CurrentRun == nil then return end
--     if HeroHasTrait('EPCAlectoTrait') then
-- 		local mod = "LegendaryEdition" 
-- 	DebugPrint({ Text = "Player Has Character Trait, Setting all Unit Properties..." })
-- 	SetThingProperty({ Property = "Graphic", Value = "Fury2Idle", DestinationId = CurrentRun.Hero.ObjectId })
-- 	SetUnitProperty({ Property = "StartGraphic", Value = "Fury2Start", DestinationId = CurrentRun.Hero.ObjectId })
-- 	SetUnitProperty({ Property = "MoveGraphic", Value = "Fury2Run", DestinationId = CurrentRun.Hero.ObjectId })
-- 	SetUnitProperty({ Property = "StopGraphic", Value = "Fury2Stop", DestinationId = CurrentRun.Hero.ObjectId })
-- 	SetUnitProperty({ Property = "Speed", Value = 600, DestinationId = CurrentRun.Hero.ObjectId })
-- 	SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = CurrentRun.Hero.ObjectId })
--     --SetThingProperty({ Property = "SubtitleColor", Value = { Red = 0.22, Green = 1.0, Blue = 0.22 }, DestinationId = CurrentRun.Hero.ObjectId })
--     LoadPackages{ Name = "Tartarus" }
-- 		end
-- return baseFunc()
-- end)

--     OnWeaponFired{ "EPCHarpyWhipArc",
--     function( triggerArgs )
--         if CurrentRun.Hero.Enraged == true then
--         FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
--         end
        
--     end

-- }

-- OnWeaponFired{ "EPCAlectoRushWeapon",
-- function( triggerArgs )
--     local fireticks = 3
--     if CurrentRun.Hero.Enraged == true then
--         for fireticks = 1, fireticks, 1 do
--     FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
--     wait( 0.15 )
--     end
-- end
-- end

-- }

