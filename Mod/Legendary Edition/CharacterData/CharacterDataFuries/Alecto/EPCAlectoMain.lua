if not LegendaryEdition.Config.Enabled then return end
OnAnyLoad{ "DeathArea",
    function(triggerArgs)
	CheckForEPCAlectoTrait()
	end}

ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
    if CurrentRun == nil then return end
    if HeroHasTrait('EPCAlectoTrait') then
		local mod = "LegendaryEdition" 
	DebugPrint({ Text = "Player Has Character Trait, Setting all Unit Properties..." })
	SetThingProperty({ Property = "Graphic", Value = "Fury2Idle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "Fury2Start", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "Fury2Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "Fury2Stop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 600, DestinationId = CurrentRun.Hero.ObjectId })
	SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = CurrentRun.Hero.ObjectId })
    --SetThingProperty({ Property = "SubtitleColor", Value = { Red = 0.22, Green = 1.0, Blue = 0.22 }, DestinationId = CurrentRun.Hero.ObjectId })
    LoadPackages{ Name = "Tartarus" }
		end
return baseFunc()
end)

function CheckForEPCAlectoTrait()
    ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
        if HeroHasTrait('EPCAlectoTrait') then
            local mod = "LegendaryEdition" 
        DebugPrint({ Text = "Player Has Character Trait, Setting all Unit Properties..." })
        SetThingProperty({ Property = "Graphic", Value = "Fury2Idle", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "StartGraphic", Value = "Fury2Start", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "MoveGraphic", Value = "Fury2Run", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "StopGraphic", Value = "Fury2Stop", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "Speed", Value = 600, DestinationId = CurrentRun.Hero.ObjectId })
        SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = CurrentRun.Hero.ObjectId })
        --SetThingProperty({ Property = "SubtitleColor", Value = { Red = 0.22, Green = 1.0, Blue = 0.22 }, DestinationId = CurrentRun.Hero.ObjectId })
        LoadPackages{ Name = "Tartarus" }
            end
    return baseFunc()
    end)
    end

--Alecto Weapon Scripts--

--AlectoWhipLash1--
OnWeaponCharging{ "AlectoWhipLash1",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.AlectoWhipLash1.PreAttackVoiceLines, true, nil)
end
}

OnWeaponFired{ "AlectoWhipLash1",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

--AlectoWhipLash2--
OnWeaponFired{ "AlectoWhipLash2",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

--AlectoWhipLash3--
OnWeaponFired{ "AlectoWhipLash3",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

--AlectoWhipLash4--
OnWeaponFired{ "AlectoWhipLash4",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

--AlectoWhipLash5--
OnWeaponFired{ "AlectoWhipLash5",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

--AlectoWhipLash6--
OnWeaponFired{ "AlectoWhipLash6",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

OnWeaponFired{ "EPCHarpyWhipWhirlAlectoDash",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}


-- EPCHarpyWhipShot --
OnWeaponCharging{ "EPCHarpyWhipShot",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyWhipShot.PreAttackVoiceLines, true, nil)
end
}

OnWeaponFired{ "EPCHarpyWhipShot",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

--EPCHarpyLightningChase--
OnWeaponFired{ "EPCHarpyLightningChase",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyLightningChase.PreAttackVoiceLines, true, nil)
end
}

--Rage Dumb Fire Weapons--
    OnWeaponFired{ "AlectoWhipLash1",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}
OnWeaponFired{ "AlectoWhipLash2",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}
OnWeaponFired{ "AlectoWhipLash3",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}
OnWeaponFired{ "AlectoWhipLash4",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}
OnWeaponFired{ "AlectoWhipLash5",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}
OnWeaponFired{ "AlectoWhipLash6",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}

OnWeaponFired{ "EPCHarpyWhipWhirlAlectoDash",
    function( triggerArgs )
        if CurrentRun.Hero.Enraged == true then
        FireWeaponFromUnit({ Weapon = "EPCHarpyBuildRageBlast", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
        end
        
    end

}

OnWeaponFired{ "AlectoDash",
function( triggerArgs )
    local fireticks = 3
    if CurrentRun.Hero.Enraged == true then
        for fireticks = 1, fireticks, 1 do
    FireWeaponFromUnit({ Weapon = "EPCHarpyWhipRageBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
    wait( 0.1 )
    end
end
end

}



-- EPCAlectoRushWeapon --
OnWeaponFired{ "AlectoRushWeaponControl",
    function( triggerArgs )
		thread(EPCAlectoRushBlink)
end
}

function EPCAlectoRushBlink()
	wait(0.1)
	FireWeaponFromUnit({ Weapon = "EPCAlectoRushWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 5, Duration = 0.5 })
	-- wait(0.5)
	-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 1, Duration = 0.0 })
	
end