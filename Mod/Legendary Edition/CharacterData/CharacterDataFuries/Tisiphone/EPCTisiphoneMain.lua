if not LegendaryEdition.Config.Enabled then return end
OnAnyLoad{ "DeathArea",
    function(triggerArgs)
	CheckForEPCTisiphoneTrait()
	end}



ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
    if CurrentRun == nil then return end
    if HeroHasTrait('EPCTisiphoneTrait') then
		local mod = "LegendaryEdition" 
	DebugPrint({ Text = "Player Has Character Trait, Setting all Unit Properties..." })
	SetThingProperty({ Property = "Graphic", Value = "Fury3Idle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "Fury3Start", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "Fury3Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "Fury3Stop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 850.0, DestinationId = CurrentRun.Hero.ObjectId })
	SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = CurrentRun.Hero.ObjectId })
    --SetThingProperty({ Property = "SubtitleColor", Value = { Red = 0.22, Green = 1.0, Blue = 0.22 }, DestinationId = CurrentRun.Hero.ObjectId })
    LoadPackages{ Name = "Tartarus" }
		end
return baseFunc()
end)

--Debug Only--
-- ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
-- 	if not HeroHasTrait( 'EPCDebugDamageTrait' ) then
--     AddTraitToHero({ TraitName = "EPCDebugDamageTrait" })
-- 	end
-- return baseFunc()
-- end)

function CheckForEPCTisiphoneTrait()
    ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
        if HeroHasTrait('EPCTisiphoneTrait') then
            local mod = "LegendaryEdition" 
        DebugPrint({ Text = "Player Has Character Trait, Setting all Unit Properties..." })
        SetThingProperty({ Property = "Graphic", Value = "Fury3Idle", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "StartGraphic", Value = "Fury3Start", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "MoveGraphic", Value = "Fury3Run", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "StopGraphic", Value = "Fury3Stop", DestinationId = CurrentRun.Hero.ObjectId })
        SetUnitProperty({ Property = "Speed", Value = 850.0, DestinationId = CurrentRun.Hero.ObjectId })
        SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = CurrentRun.Hero.ObjectId })
        SetThingProperty({ Property = "SubtitleColor", Value = Color.TisiphoneVoice, DestinationId = CurrentRun.Hero.ObjectId })
        LoadPackages{ Name = "Tartarus" }
            end
    return baseFunc()
    end)
    end

EPCTisSubColor = { Red = 0.94, Green = 0.27, Blue = 0.16 }
-- Tisiphone Weapon Scripts --

-- EPCHarpyWhipSlash1 --

OnWeaponCharging{ "EPCHarpyWhipSlash1",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyWhipSlash1.PreAttackVoiceLines, true, nil)
end
}

OnWeaponFired{ "HarpyWhipSlash1",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

-- EPCHarpyWhipSlash2 --
OnWeaponFired{ "HarpyWhipSlash2",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

-- HarpyWhipSlash3 --
OnWeaponFired{ "HarpyWhipSlash3",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

-- EPCHarpyWhipCombo3 --
OnWeaponFired{ "EPCHarpyWhipCombo3",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

-- EPCHarpyWhipLasso --

OnWeaponCharging{ "EPCHarpyWhipLasso",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyWhipLasso.PreAttackVoiceLines, true, nil)
end
}

OnWeaponFired{ "EPCHarpyWhipLasso",
    function( triggerArgs )
		--thread(CheckVacuumNearbyEnemyTisiphone)
		thread(PlayMegWhipWhirlFireSound)
end
}

--EPCHarpyLightningLine2--

OnWeaponFired{ "EPCHarpyLightningLine2",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyLightningLine2.PreAttackVoiceLines, true, nil)
end
}

-- EPCHarpyWhipLasso --
-- OnWeaponFired{ "EPCHarpyWhipLasso",
--     function( triggerArgs )
-- 		thread(CheckVacuumNearbyEnemyTisiphone)
-- end
-- }

function CheckVacuumNearbyEnemyTisiphone( weaponData, args )
	local targetId = GetNearestEnemyArgs({ Arc = args.AutoLockArc, Range = args.Range, RequireFacing = true })
	if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
		local distanceBuffer = args.DistanceBuffer
		ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, CurrentRun.Hero.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = CurrentRun.Hero.ObjectId }) })
		--FireWeaponFromUnit({ Weapon = "FistSpecialVacuum", Id = CurrentRun.Hero.ObjectId, DestinationId = targetId })
		--FistVacuumPullPresentation( targetId, args )
	end
end

-- EPCHarpyLungeSurgeBeam --
OnWeaponFired{ "EPCTisiphoneRushWeapon",
    function( triggerArgs )
    EPCTisiphoneRushWeaponDumbFireweapons()    
end
}



function EPCTisiphoneRushWeaponDumbFireweapons()
	local fireTicks = 8
	for fireTick = 1, fireTicks, 1 do
		FireWeaponFromUnit({ Weapon = "EPCHarpyLungeSurgeBeam", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		wait( 0.02 )
	end
end

-- EPCHarpySlowBeam360 --

-- Pre Attack Voicelines --
OnWeaponCharging{ "EPCHarpySlowBeam360",
    function( triggerArgs )
		thread( PlayVoiceLines, EPCHarpySlowBeam360PreAttackVoiceLines, true, CurrentRun.Hero )
end}
EPCHarpySlowBeam360PreAttackVoiceLines =
{
	
	{
	Queue = "Interrupt",
    RandomRemaining = true,
    BreakIfPlayed = true,
    PreLineWait = 0.15,
	CooldownTime = 10,
	SkipAnim = true,
    Source = {SubtitleColor = Color.TisiphoneVoice},
	
    -- Murderrr!!
    { Cue = "/VO/Tisiphone_0034" },
    -- Murrrr...!
    { Cue = "/VO/Tisiphone_0035" },
    -- Mmmurder!
    { Cue = "/VO/Tisiphone_0036" },
    -- Mmmm!!!
    { Cue = "/VO/Tisiphone_0037" },
    -- Murderrerr!
    { Cue = "/VO/Tisiphone_0038" },
    -- Murderrr!!
    { Cue = "/VO/Tisiphone_0039" },
	},
}
-- EPCHarpyLightningLine --
OnWeaponFired{ "EPCHarpyLightningLineCONTROL",
    function( triggerArgs )
    EPCProcessAttackSlotsTisiphone()    
end
}
-- Attack Slots --
 function EPCProcessAttackSlotsTisiphone( weaponName )
	local weaponData = GetWeaponData( weaponName )
	local EnemyTargetId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = WeaponData.EPCHarpyLightningLine.LockOnRange })
	local PlayerOriginalPosition = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = CurrentRun.Hero.ObjectId, Group = "Scripting" })
	local targetOriginalPosition = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = EnemyTargetId, Group = "Scripting" })
	local numAttacks = WeaponData.EPCHarpyLightningLine.AttackSlotsPerTick or RandomInt(WeaponData.EPCHarpyLightningLine.AttackSlotsPerTickMin, WeaponData.EPCHarpyLightningLine.AttackSlotsPerTickMax)
    local Hero = CurrentRun.Hero
	local attackSlots = DeepCopyTable(WeaponData.EPCHarpyLightningLine.AttackSlots)
	local removeNum = TableLength(WeaponData.EPCHarpyLightningLine.AttackSlots) - numAttacks
	local skipIndexes = {}
	for k = 1, removeNum, 1 do
		table.insert(skipIndexes, RemoveRandomKey(attackSlots))
	end

	local randomAngle = nil
	if WeaponData.UseRandomAngle then
		randomAngle = RandomFloat(0, 360)
	end

	for k, attackSlot in ipairs(WeaponData.EPCHarpyLightningLine.AttackSlots) do
		if not Contains(skipIndexes, k) then
			local angle = attackSlot.Angle or randomAngle or 0
			if attackSlot.UseAngleBetween then
				angle = GetAngleBetween({ Id = PlayerOriginalPosition, DestinationId = targetOriginalPosition })
			end
			if attackSlot.UseAttackerAngle then
				angle = GetAngle({ Id = enemy.ObjectId })
			end
			angle = angle + (attackSlot.OffsetAngle or 0)
			local offset = CalcOffset(math.rad(angle), attackSlot.OffsetDistance or 0)
			if attackSlot.OffsetX ~= nil then
				offset.X = offset.X + attackSlot.OffsetX
			end
			if attackSlot.OffsetY ~= nil then
				offset.Y = offset.Y + attackSlot.OffsetY
			end

			local anchor = targetOriginalPosition
			if attackSlot.OffsetFromAttacker then
				anchor = CurrentRun.Hero.ObjectId
			end
			if attackSlot.TeleportToId then
				Teleport({ Id = enemy.ObjectId, DestinationId = attackSlot.TeleportToId })
			end
			if attackSlot.UseMapObjectId then
				if type(attackSlot.UseMapObjectId) == "table" then
					anchor = attackSlot.UseMapObjectId[CurrentRun.CurrentRoom.Name]
				else
					anchor = attackSlot.UseMapObjectId
				end
			end
			if attackSlot.UseTargetPosition then
				anchor = targetId
			end
			if attackSlot.AnchorAngleOffset ~= nil then
				local anchorOffset = CalcOffset(math.rad(angle + 90), attackSlot.AnchorAngleOffset)
				offset.X = offset.X + anchorOffset.X
				offset.Y = offset.Y + anchorOffset.Y
			end
			if attackSlot.OffsetScaleY ~= nil then
				offset.Y = offset.Y * attackSlot.OffsetScaleY
			end
			local targetOffset = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = anchor, OffsetX = offset.X, OffsetY = offset.Y })

			if attackSlot.InstantAngleTowardsTarget then
				AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetOffset })
			end

			--wait( WeaponData.EPCHarpyLightningLine.AttackSlotPreFireWait or 0.01)
			FireWeaponFromUnit({ Weapon = "EPCHarpyLightningLine", Id = CurrentRun.Hero.ObjectId, DestinationId = targetOffset, AutoEquip = true })
			Destroy({ Id = targetOffset })
			if attackSlot.PauseDuration then
				wait( attackSlot.PauseDuration )
			end
			wait( WeaponData.EPCHarpyLightningLine.AttackSlotInterval or 0.01 )
		end
	end
	Destroy({ Id = PlayerOriginalPosition })
	Destroy({ Id = targetOriginalPosition })
 end

 -- EPCTisiphoneRushWeapon --
OnWeaponFired{ "TisiphoneRushWeaponControl",
function( triggerArgs )
	thread(EPCTisRushBlink)
end
}

function EPCTisRushBlink()
wait(0.1)
FireWeaponFromUnit({ Weapon = "EPCTisiphoneRushWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 5, Duration = 0.5 })
-- wait(0.5)
-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 1, Duration = 0.0 })

end

--Bug fix for Tisiphone's regular dash 
--interrupting her special lunge
-- OnWeaponFired{ "EPCHarpyWhipLasso",
-- function( triggerArgs )
-- 	thread(EPCTisRushWeaponDisable)
-- end
-- }
function EPCTisRushWeaponDisable()

SetWeaponProperty({ WeaponName = "TisiphoneDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = false })
wait(0.4)
SetWeaponProperty({ WeaponName = "TisiphoneDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 5, Duration = 0.5 })
-- wait(0.5)
-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 1, Duration = 0.0 })

end