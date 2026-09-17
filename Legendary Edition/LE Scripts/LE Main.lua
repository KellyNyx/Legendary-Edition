---@diagnostic disable: lowercase-global
if not LegendaryEdition.Config.Enabled then return end

--nop function--
function nop()
end

LECharacterData = {}

LECharacterData.LastCharacter = TraitData.DefaultCharacterTrait
-- CurrentCharTrait = LECharacterData.LastCharacter
-- --Character Rage Data--
--      CurrentCharacterEnragedPresentation = CurrentCharTrait.RageData.EnragedPresentation or "null"
--      CurrentCharacterRageDecayRate = CurrentCharTrait.RageData.RageDecayRate or "null"
--      CurrentCharacterRageDecayStartDuration = CurrentCharTrait.RageData.RageDecayStartDuration or "null"
--      CurrentCharacterLastRageGainTime = CurrentCharTrait.RageData.LastRageGainTime or "null"
--      CurrentCharacterRageChargeMultiplier = CurrentCharTrait.RageData.RageChargeMultiplier or "null"
--      CurrentCharacterEnragedDuration = CurrentCharTrait.RageData.EnragedDuration or "null"
--      CurrentCharacterEnragedWaitMultiplier = CurrentCharTrait.RageData.EnragedWaitMultiplier or "null"
--      CurrentCharacterEnragedMoveSpeedBonus = CurrentCharTrait.RageData.EnragedMoveSpeedBonus or "null"
--      CurrentCharacterRequiredMaxLastStandsForPermaRage = CurrentCharTrait.RageData.RequiredMaxLastStandsForPermaRage or "null"
--      CurrentCharacterPermaRageThreshold = CurrentCharTrait.RageData.PermaRageHealthThreshold or "null"
--      CurrentCharacterRageWeapon = CurrentCharTrait.RageData.RageWeapon or "null"
--      CurrentCharacterRageFullSound = CurrentCharTrait.RageData.RageFullSound or "null"
--      CurrentCharacterRageFullVoiceLines = CurrentCharTrait.RageData.RageFullVoiceLines or "null"
--      CurrentCharacterRageExpireSound = CurrentCharTrait.RageData.RageExpiredSound or "null"
--      CurrentCharacterRageExpireVoiceLines = CurrentCharTrait.RageData.RageExpiredVoiceLines or "null"
LECharacterData.LastCharTraitName = "DefaultCharacterTrait"

--equip character trait--
-- ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
-- 	--if CurrentRun == nil then return end
--     local LastCharTrait = LECharacterData.LastCharacter
--     if not HeroHasTrait( LastCharTrait ) then
--     AddTraitToHero({ TraitName = LastCharTrait })
--     end
-- return baseFunc()
-- end)

function SpawnContractExchangeObstacle()
    local CharManager = SpawnObstacle({ Name = "BlankObstacle",  LocationX = 17540, LocationY = 4500, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId  })
    SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
end

ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
   local CharManager = SpawnObstacle({ Name = "BlankObstacle",  LocationX = 17540, LocationY = 4500, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId  })
    SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
return baseFunc()
end)

-- OnAnyLoad{"RoomPreRun", function(triggerArgs)
--     local CharManager = DeepCopyTable( DeathLoopData.DeathAreaOffice.ObstacleData[488699] )
    
--     --local CharManager = SpawnObstacle({ Name = "BlankObstacle",  LocationX = 17540, LocationY = 4500, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId  })
--     CharManager.UseText = "Heh"
--     CharManager.OnUsedFunctionName = "OpenContractExchangeScreen"
--     CharManager.Activate = true
--     CharManager.ObjectId = SpawnObstacle({ 
--     Name = "HouseDesk01",  
--     LocationX = 5033, LocationY = 3863, OffsetZ = 50, Group = "Standing", 
--     DestinationId = CurrentRun.Hero.ObjectId,
--     AttachedTable = CharManager,  })

--     --SetScale{ Id = CharManager.ObjectId, Fraction = 0.17 }
--     SetColor{ Id = CharManager.ObjectId, Color = { 120, 255, 170, 255 } }
--     SetupObstacle( CharManager )
--     wait(0.1)
--     --Teleport({ Id = CharManager, LocationX = 4995, LocationY = 3844 })
--     --SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
-- end}

-- ModUtil.WrapBaseFunction( 'PlaySpeechCue', function(baseFunc)
--    if cue == nil or cue == "" then
-- 		return 0
--    end

--    if HeroHasTrait("EPC_CharacterHandlerTrait") and string.match("Zagreus", cue ) then
--     DebugPrint({ Text = cue })
--    cue = nil
-- end 
-- return baseFunc()
-- end)

-- OnControlPressed{ "Shout",
-- 	function( triggerArgs )
-- 		testObstacleSpawn()
-- 	end
-- }

function LEShoddyZeusAttackFix( victim, attacker, args )
    -- if GetWeaponProperty({ Id = CurrentRun.Hero.ObjectId, WeaponName = "ChainLightning", Property = "Enabled" }) then
    --     SetWeaponProperty({ WeaponName = "ChainLightning", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
    --attacker = args.attacker
    if HeroHasTrait("ZeusWeaponTrait") then
        SetWeaponProperty({ WeaponName = "ChainLightning", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
    
        FireWeaponFromUnit({ Weapon = "ChainLightning", AutoEquip = true, Id = CurrentRun.Hero.ObjectId, DestinationId = victimId, FireFromTarget = true})
        --    wait(0.1)
        --  SetWeaponProperty({ WeaponName = "ChainLightning", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = false })
        -- --SetWeaponProperty({ WeaponName = "ChainLightning", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })

        -- UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "ChainLightning", UnloadPackages = false })
    end
end
--end

function testObstacleSpawn()
	local CharManager = SpawnObstacle({ Name = "HouseDesk01",  LocationX = 5033, LocationY = 3863, OffsetZ = 50, Group = "Standing"  })
    --SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "KeyItem_QuestLog" })
    SetScale({ Fraction = 0.3, Id = CharManager })
    --SetThingProperty({ Property = "StopsLight", DestinationId = CharManager, Value = "false" })
    --FlipHorizontal({ Id = CharManager })
    --Teleport({ Id = CharManager, LocationX = 17513, LocationY = 4489 })
	end

-- function GetCurrentCharacterTrait()
--     local currentWeaponInSlot = GetEquippedWeapon()
--    local TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
--    if WeaponUpgradeData[currentWeaponInSlot].Index.TraitName then
--     return WeaponUpgradeData[currentWeaponInSlot].Index.TraitName
--    end
-- end

-- function EPCGetWeaponUpgradeTrait( weapon, index )
-- 	if weapon == nil or index == nil then
-- 		return "DefaultCharacterTrait"
-- 	end
-- 	if WeaponUpgradeData[weapon][index].TraitName then
-- 		return WeaponUpgradeData[weapon][index].TraitName
-- 	elseif  WeaponUpgradeData[weapon][index].RequiredInvestmentTraitName and GetWeaponUpgradeLevel(weapon, index) > 0 then
-- 		return WeaponUpgradeData[weapon][index].RequiredInvestmentTraitName
-- 	end
-- 	return "DefaultCharacterTrait"
-- end

--local tableToReturn = WeaponSets.HeroPhysicalWeapons

-- OnAnyLoad{"RoomPreRun", function(triggerArgs)
--     --local CharManager = SpawnObstacle({ Name = "KeyItem_QuestLog",  LocationX = 17513.332031, LocationY = 4489.218750 })
--     local CharManager = SpawnObstacle({ Name = "BlankObstacle",  LocationX = 17513, LocationY = 4489  })
--     SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "KeyItem_QuestLog" })
-- end}

function MergeWeaponSetTables()
  moddedAttackWeapons = {}
    for attackWeaponName, moddedAttackWeapons   in pairs( ModdedAttackWeapons ) do
       moddedAttackWeapons.Name = attackWeaponName
       if type(moddedAttackWeapons) == "table" then
         for subKey, subValue in pairs(moddedAttackWeapons) do
        if type(subValue) == "string" then
        table.insert( WeaponSets.HeroPhysicalWeapons, subValue )
         end
         end
     end
     --return WeaponSets.HeroPhysicalWeapons
end
    moddedSpecialWeapons = {}
    for specialWeaponName, moddedSpecialWeapons   in pairs( ModdedSpecialWeapons ) do
       moddedSpecialWeapons.Name = specialWeaponName
       if type(moddedSpecialWeapons) == "table" then
         for subKey, subValue in pairs(moddedSpecialWeapons) do
        if type(subValue) == "string" then
        table.insert( WeaponSets.HeroSecondaryWeapons, subValue )
         end
         end
     end
end
    -- for rushWeaponName, moddedRushWeapons in pairs( ModdedRushWeapons ) do
    --     moddedRushWeapons.Name = rushWeaponName
    --     CombineAllValues({ WeaponSets.HeroRushWeapons, rushWeaponName })
    -- end
    -- for dashWeaponName, moddedDashWeapons in pairs( ModdedDashWeapons ) do
    --     moddedDashWeapons.Name = dashWeaponName
    --     CombineAllValues({ WeaponSets.HeroDashWeapons, dashWeaponName })
    -- end
    -- for attackSpecialWeaponName, moddedAttackSpecialWeapons in pairs( ModdedAttackSpecialWeapons ) do
    --     moddedAttackSpecialWeapons.Name = attackSpecialWeaponName
    --     CombineAllValues({ WeaponSets.HeroPrimarySecondaryWeapons, attackSpecialWeaponName })
    -- end
    -- for meleeWeaponName, moddedMeleeWeapons in pairs( ModdedMeleeWeapons ) do
    --     moddedMeleeWeapons.Name = meleeWeaponName
    --     CombineAllValues({ WeaponSets.HeroSecondaryWeapons, meleeWeaponName })
    -- end
    -- for meleeRangeWeaponName, meleeRangeWeapons in pairs( ModdedMeleeRangeWeapons ) do
    --     meleeRangeWeapons.Name = meleeRangeWeaponName
    --     CombineAllValues({ WeaponSets.HeroMeleeRangeWeapons, meleeRangeWeaponName })
    -- end
    -- for allWeaponName, moddedAllWeapons in pairs( ModdedAllWeapons ) do
    --     moddedAllWeapons.Name = allWeaponName
    --     CombineAllValues({ WeaponSets.HeroAllWeapons, allWeaponName })
    -- end
    -- for moddedWeaponSetName, moddedWeaponSets in pairs( ModdedWeaponSets ) do
    --     moddedWeaponSets.Name = moddedWeaponSetName
    --     table.insert({ WeaponSets.HeroWeaponSets, moddedWeaponSetName })
    -- end
    -- moddedSpecialWeapons = {}
    for linkedWeaponUpgradeName, moddedLinkedWeaponUpgrades  in pairs( ModdedLinkedWeaponUpgrades ) do
       moddedLinkedWeaponUpgrades.Name = linkedWeaponUpgradeName
        table.insert( WeaponSets.LinkedWeaponUpgrades, linkedWeaponUpgradeName )
    end
end


function SetupCurrentCharacter()
    --local currentWeaponInSlot = GetEquippedWeapon()
    CurrentCharTrait = LECharacterData.LastCharacter
   --local TraitName = GetWeaponUpgradeTrait("SpearWeapon", GameState.LastWeaponUpgradeData["SpearWeapon"].Index)
     CurrentCharacterIdleAnimation = CurrentCharTrait.IdleAnimation
    CurrentCharacterMoveStartAnimation = CurrentCharTrait.MoveStartAnimation
    CurrentCharacterMoveAnimation = CurrentCharTrait.MoveAnimation
    CurrentCharacterMoveStopAnimation = CurrentCharTrait.MoveStopAnimation
    CurrentCharacterLowSpeedAnimation = CurrentCharTrait.LowSpeedAnimation
    CurrentCharacterHighSpeedAnimation = CurrentCharTrait.HighSpeedAnimation
    CurrentCharacterBaseSpeed = CurrentCharTrait.BaseSpeedValue
    CurrentCharacterScale = CurrentCharTrait.ScaleFraction
    CurrentCharacterRequiredPackages = CurrentCharTrait.RequiredPackages
    CurrentCharacterDamagedAnimation = CurrentCharTrait.DamagedAnimation
    CurrentCharacterDamagedSound = CurrentCharTrait.DamagedSound
    CurrentCharacterIntroPresentationFunction = CurrentCharTrait.IntroPresentationFunction
    CurrentCharacterHeroLandingAnimation = CurrentCharTrait.HeroLandingAnimation
    CurrentCharacterHeroTouchDownGraphic = CurrentCharTrait.HeroTouchdownGraphic
    CurrentCharacterUpgradeAcquiredAnimation = CurrentCharTrait.UpgradeAcquiredAnimation
    CurrentCharacterSecretDoorDiveAnimation = CurrentCharTrait.SecretDoorDiveAnimation
    CurrentCharacterSecretRoomEntranceExitAnimation = CurrentCharTrait.SecretRoomEntranceExitAnimation
    CurrentCharacterChargingEmote = CurrentCharTrait.ChargingEmote
    CurrentCharacterPowerUpEmote = CurrentCharTrait.PowerUpEmote
    CurrentCharacterLastStandAnimation = CurrentCharTrait.LastStandAnimation
    CurrentCharacterLastStandVoiceLines = CurrentCharTrait.LastStandVoicelines
    CurrentCharacterLastStandLastLifeVoiceLines = CurrentCharTrait.LastStandLastLifeVoiceLines
    CurrentCharacterDeathIdleAnimation = CurrentCharTrait.DeathIdleAnimation
    CurrentCharacterDeathAnimation = CurrentCharTrait.DeathAnimation
    CurrentCharacterDeathVoicelines = CurrentCharTrait.DeathVoiceLines
    CurrentCharacterInteractAnimation = CurrentCharTrait.InteractAnimation
    CurrentCharacterAttachedAnimationName = CurrentCharTrait.AttachedAnimationName or "null"
    CurrentCharacterAttachedAnimationScale = CurrentCharTrait.AttachedAnimationScale or 1.0
    CurrentCharacterAttachedAnimation2Name = CurrentCharTrait.AttachedAnimation2Name or "null"
    CurrentCharacterAttachedAnimationOffsetZ = CurrentCharTrait.AttachedAnimationOffsetZ or "null"
    --Character Rage Data--
     CurrentCharacterEnragedPresentation = CurrentCharTrait.RageData.EnragedPresentation or "null"
     CurrentCharacterRageDecayRate = CurrentCharTrait.RageData.RageDecayRate or "null"
     CurrentCharacterRageDecayStartDuration = CurrentCharTrait.RageData.RageDecayStartDuration or "null"
     CurrentCharacterLastRageGainTime = CurrentCharTrait.RageData.LastRageGainTime or "null"
     CurrentCharacterRageChargeMultiplier = CurrentCharTrait.RageData.RageChargeMultiplier or "null"
     CurrentCharacterEnragedDuration = CurrentCharTrait.RageData.EnragedDuration or "null"
     CurrentCharacterEnragedWaitMultiplier = CurrentCharTrait.RageData.EnragedWaitMultiplier or "null"
     CurrentCharacterEnragedMoveSpeedBonus = CurrentCharTrait.RageData.EnragedMoveSpeedBonus or "null"
     CurrentCharacterRequiredMaxLastStandsForPermaRage = CurrentCharTrait.RageData.RequiredMaxLastStandsForPermaRage or "null"
     CurrentCharacterPermaRageThreshold = CurrentCharTrait.RageData.PermaRageHealthThreshold or "null"
     CurrentCharacterRageWeapon = CurrentCharTrait.RageData.RageWeapon or "null"
     CurrentCharacterRageFullSound = CurrentCharTrait.RageData.RageFullSound or "null"
     CurrentCharacterRageFullVoiceLines = CurrentCharTrait.RageData.RageFullVoiceLines or "null"
     CurrentCharacterRageExpireSound = CurrentCharTrait.RageData.RageExpiredSound or "null"
     CurrentCharacterRageExpireVoiceLines = CurrentCharTrait.RageData.RageExpiredVoiceLines or "null"

   --local CurrentCharacterVoiceLines = TraitData[TraitName].CharacterVoiceLines
    
	--Set Current Character Properties
	SetThingProperty({ Property = "Graphic", Value = CurrentCharacterIdleAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = CurrentCharacterMoveStartAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = CurrentCharacterMoveAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = CurrentCharacterMoveStopAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = CurrentCharacterLowSpeedAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = CurrentCharacterHighSpeedAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = CurrentCharacterBaseSpeed, DestinationId = CurrentRun.Hero.ObjectId })
	SetScale({ Fraction = CurrentCharacterScale, Id = CurrentRun.Hero.ObjectId })
	LoadPackages{ Name = CurrentCharacterRequiredPackages }

    if HeroHasTrait("EPCAlectoTrait") then
        if CurrentRun.Hero.Enraged == true or CurrentRun.Hero.PermanentEnraged == true then
            SetupAlectoRagePropertyChanges()
        end
    end

    --Setup Damage Animations/Sounds--
    CurrentRun.Hero.DamagedAnimation = CurrentCharacterDamagedAnimation
    CurrentRun.Hero.DamagedSound = CurrentCharacterDamagedSound

    -- Attached Animations --
    CurrentRun.Hero.AttachedAnimationName = "null"
			if CurrentRun.Hero.AttachedAnimationName ~= nil then
				CreateAnimation({ Name = CurrentCharacterAttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId, Scale = CurrentCharacterAttachedAnimationScale, OffsetZ = CurrentCharacterAttachedAnimationOffsetZ  })
                CreateAnimation({ Name = CurrentCharacterAttachedAnimation2Name, DestinationId = CurrentRun.Hero.ObjectId })
			end	
            --MergeWeaponSetTables()		
end

function SetupDefaultCharacter()
    -- Damaged Animation/Sound --
    CurrentRun.Hero.DamagedAnimation = "ZagreusOnHit"
    CurrentRun.Hero.DamagedSound = "/VO/ZagreusEmotes/EmoteHurt"
    CurrentRun.Hero.AttachedAnimationName = "LaurelCindersSpawner"
    -- Laurel Crown VFX
			if CurrentRun.Hero.AttachedAnimationName ~= nil then
				CreateAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
			end
        end
--Function to ensure that the player always
--has this trait during setup to prevent crashes--
function SetupCharacterHandler()
    if not HeroHasTrait( "EPC_CharacterHandlerTrait") then
        AddTraitToHero({ TraitName = "EPC_CharacterHandlerTrait" })
    end
end

function PlayVoiceLinesFromObstacleSource( voiceLines, neverQueue, source, args )
	if args ~= nil and args.Defer then
		for k, v in pairs(DeferredPlayVoiceLines) do
			if v[1] == voiceLines then
				--DebugPrint({ Text = "voice lines play request de-duped"})
				return
			end
		end
		table.insert( DeferredPlayVoiceLines, { voiceLines, neverQueue, source, args } )
		return
	end

	return PlayVoiceLinesReal( voiceLines, neverQueue, source, args )
end

function CurrentCharacterDeathPresentation( currentRun, killer, killingUnitWeapon )

    

		AddInputBlock({ Name = "DeathPresentation" })
		ClearCameraClamp({ LerpTime = 0.4 })
		PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 0.4 })
		FocusCamera({ Fraction = 1.1, Duration = 0.4 })
		ZeroMouseTether("DeathPresentation")
		DisableCombatControls()
		DestroyCombatUI( "Death" )
		ClearStoredAmmoHero()
		SetConfigOption({ Name = "UseOcclusion", Value = false })
	
		if IsScreenOpen("Codex") then
			CloseCodexScreen()
		end

		
	    
		-- had to move this above CleanUpEnemies() for the RequiredKillEnemies check to work
		local deathPresentation = 0
		if CurrentRun.CurrentRoom.Encounter ~= nil then
			if CurrentRun.CurrentRoom.Encounter.HadesDeathTaunt then
				-- Hades Death Taunt
				deathPresentation = 1
			elseif CurrentRun.CurrentRoom.Encounter.SpurnedGodName ~= nil and not IsEmpty( RequiredKillEnemies ) then
				-- Olympian Death Taunt
				deathPresentation = 2
			elseif CurrentRun.CurrentRoom.Encounter.ThanatosId ~= nil and not not IsEmpty( RequiredKillEnemies ) then
				-- Thanatos Death Taunt
				deathPresentation = 3
			elseif CurrentRun.CurrentRoom.Encounter.TookChaosCurseDamage ~= nil and not IsEmpty( RequiredKillEnemies ) then
				-- Chaos Death Taunt
				deathPresentation = 4
			end
		end
	
		CleanupEnemies()
		ExpireProjectiles({ })
		ClearEffect({ Id = killer.ObjectId, All = true, BlockAll = true })
		SetThingProperty({ Property = "AllowAnyFire", Value = false, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		StopAmbientSound({ All = true })
		StopSound({ Id = SecretMusicId, Duration = 0.25 })
		SecretMusicId = nil
		SecretMusicName = nil
	
		Stop({ Id = currentRun.Hero.ObjectId })
		Halt({ Id = currentRun.Hero.ObjectId })
		SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationNames = { "GroundEnemies", "FlyingEnemies" } })
	
		RemoveFromGroup({ Id = killer.ObjectId, Names = { "Standing", "GroundEnemies", "FlyingEnemies" } })
		AddToGroup({ Id = killer.ObjectId, Name = "Combat_Menu", DrawGroup = true })
	
		if currentRun.Hero.AttachedAnimationName ~= nil then
			StopAnimation({ Name = currentRun.Hero.AttachedAnimationName, DestinationId = currentRun.Hero.ObjectId })
		end
	
		if currentRun.Hero.HitShields ~= nil and currentRun.Hero.HitShields > 0 then
			CurrentRun.Hero.HitShields = 0
			for i, traitData in pairs(currentRun.Hero.Traits) do
				if traitData.BossEncounterShieldHits then
					UpdateTraitNumber( traitData )
				end
			end
		end
	
		--currentRun.Hero.Mute = false
		SetPlayerInvulnerable( "PlayerDeath" )
		PlaySound({ Name = "/SFX/Player Sounds/PlayerDeath" })

        local DummyObstacle = SpawnObstacle({ Name = "BlankObstacle", Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId  })
	
		thread( PlayVoiceLines, CurrentCharacterDeathVoicelines )
	
		if killer.CauseOfDeathVoiceLines ~= nil then
			thread( PlayVoiceLines, killer.CauseOfDeathVoiceLines, nil, killer )
		elseif currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines ~= nil then
			thread( PlayVoiceLines, currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines )
		elseif currentRun.CurrentRoom.CauseOfDeathVoiceLines ~= nil then
			thread( PlayVoiceLines, currentRun.CurrentRoom.CauseOfDeathVoiceLines )
		end
	
		-- black out world
		StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessVignetteHold" })
		StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessGroundFog" })
		AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })
		ScreenAnchors.DeathBackground = CreateScreenObstacle({ Name = "rectangle01", Group = "Combat_UI", X = ScreenCenterX, Y = ScreenCenterY })
		SetScale({ Id = ScreenAnchors.DeathBackground, Fraction = 10 })
		SetColor({ Id = ScreenAnchors.DeathBackground, Color = Color.Black })
		SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })
	
		RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing" })
		thread( DoRumble, currentRun.Hero.HeroFinalHitRumbleParameters )
	
		wait( 0.15 )
		SetAlpha({ Id = killer.ObjectId, Fraction = 0, Duration = 0.3 })
	
		if CurrentRun.Cleared then
			thread( DisplayLocationText, nil, { Text = "OutroDeathMessageAlt", Delay = 0.95, Color = Color.Red, Layer = "Overlay", AnimationName = "LocationTextBGDeath", AnimationOutName = "LocationTextBGDeathOut", ThreadName = "Outro", Duration = 4.25 } )
		else
			thread( DisplayLocationText, nil, { Text = "DeathMessage", Delay = 0.95, Color = Color.Red, Layer = "Overlay", AnimationName = "LocationTextBGDeath", AnimationOutName = "LocationTextBGDeathOut" } )
		end
	
		local criticalSlowHoldTime = 0
		FocusCamera({ Fraction = 1.0, Duration = 0.3, ZoomType = "Ease" })
		SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = CurrentRun.Hero.ObjectId })
		SetThingProperty({ Property = "Graphic", Value = CurrentCharacterDeathIdleAnimation, DestinationId = CurrentRun.Hero.ObjectId })
		Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 1.65, MinFraction = 1.0, MaxFraction = 0.0, Color = Color.Red, Duration = 0.15, ExpireAfterCycle = true })
		thread( DeathFrameHold )
	
		for k, simData in ipairs( CurrentRun.Hero.FinalHitSlowParameters ) do
			if( damageVulnerability or damageCrit ) then
				if( k == 2) then
					criticalSlowHoldTime = 0.04
				end
			end
			waitScreenTime( simData.ScreenPreWait + criticalSlowHoldTime )
			if simData.Fraction < 1.0 then
				AddSimSpeedChange( "Death", { Fraction = simData.Fraction, LerpTime = simData.LerpTime } )
			else
				RemoveSimSpeedChange( "Death", { LerpTime = simData.LerpTime } )
			end
		end
		wait(0.15)
		SetThingProperty({ Property = "Grip", Value = "Default", DestinationId = CurrentRun.Hero.ObjectId })
		StopFlashing({ Id = CurrentRun.Hero.ObjectId })
		local zagreusDeathFlash = CreateScreenComponent({ Name = "rectangle01", Group = "Overlay" })
		SetAnimation({ DestinationId = zagreusDeathFlash.Id, Name = "ZagreusDeathFlash" })
	
		local deathAnimation = CurrentCharacterDeathAnimation
		if CurrentRun.Cleared then
			deathAnimation = "ZagreusDeathPostEndingFullscreen"
		end
		SetThingProperty({ Property = "Graphic", Value = deathAnimation, DestinationId = currentRun.Hero.ObjectId })
	
		wait( 0.3 )
		Teleport({ Id = killer.ObjectId, OffsetX = 0, OffsetY = 0 })
		ClearLootDrops( killer )
		Destroy({ Id = zagreusDeathFlash.Id })
	
		wait(0.55)
		if CurrentRun.Cleared then
			PlaySound({ Name = "/Music/HadesThemeStingerINTENSE" })
		else
			PlaySound({ Name = "/Music/HadesThemeStinger" })
		end
	
		if ConfigOptionCache.EasyMode and not currentRun.Cleared then
			thread( EasyModeLevelUpPresentation )
			wait( 3.0 )
		end
	
		if deathPresentation == 1 then
			-- Hades Death Taunt
			thread( HadesSpeakingPresentation, {}, { BlockScreenshake = true, VoiceLines = GlobalVoiceLines.HadesDeathTauntVoiceLines } )
		elseif deathPresentation == 2 then
			-- Olympian Death Taunt
			local spurnedGodName = CurrentRun.CurrentRoom.Encounter.SpurnedGodName
			local spurnedGodData = LootData[spurnedGodName]
			thread( HadesSpeakingPresentation, { SubtitleColor = spurnedGodData.SubtitleColor }, { OverlayAnim = spurnedGodData.OverlayAnim, BlockScreenshake = true, VoiceLines = spurnedGodData.DeathTauntVoiceLines } )
		elseif deathPresentation == 3 then
			-- Thanatos Death Taunt
			thread( HadesSpeakingPresentation, ActiveEnemies[ThanatosId] or { SubtitleColor = Color.ThanatosVoice }, { OverlayAnim = "ThanatosOverlay", BlockScreenshake = true, VoiceLines = GlobalVoiceLines.ThanatosDeathTauntVoiceLines } )
		elseif deathPresentation == 4 then
			-- Chaos Death Taunt
			thread( HadesSpeakingPresentation, { SubtitleColor = LootData.TrialUpgrade.SubtitleColor }, { OverlayAnim = "ChaosOverlay", BlockScreenshake = true, VoiceLines = LootData.TrialUpgrade.DeathTauntVoiceLines } )
		end
	
		for index, requirements in pairs(GameData.FlashbackRequirements) do
			if IsGameStateEligible( CurrentRun, requirements ) then
				GameState.Flags.AllowFlashback = true
			end
		end
	
		wait(7.2)
	
		SetThingProperty({ Property = "AllowAnyFire", Value = true, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		RemoveInputBlock({ Name = "DeathPresentation" })
		UnblockCombatUI("Death")
		SetConfigOption({ Name = "UseOcclusion", Value = true })
	end

--Intro Presentations--

function HadesIntroPresentation( heroId, lightId, heroDestination, disableCollision, dropDelay, landDelay, speedAdjustment )
    
  --Set Current Character Animations
	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
    AddTimerBlock( CurrentRun, "MoveHeroToRoomPosition" )
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
    
    SetAnimation({ Name = "HadesBattleIntro", DestinationId = heroId })
    wait(0.4)
    CreateAnimation({ Name = "HadesDisappear", DestinationId = heroId })
    --SetThingProperty({ DestinationId = heroId, Property = "TouchdownGraphic", Value = CurrentCharacterHeroTouchDownGraphic })
    --AdjustZLocation({ Id = heroId, Distance = 1500, Duration = 0 })
    wait(6.3)
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
    RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
    RemoveTimerBlock( CurrentRun, "MoveHeroToRoomPosition" )
end  

function DoCurrentCharacterIntroPresentation()
    

   CurrentCharacterIntroPresentationFunction = _G[CurrentCharacterIntroPresentationFunction]
   thread(CurrentCharacterIntroPresentationFunction, currentRun.Hero.ObjectId, currentRun.Hero.AttachedLightId)
   
		end

function DoCurrentCharacterIntroLanding( heroId, lightId, heroDestination, disableCollision, dropDelay, landDelay, speedAdjustment )
    
    
	--Set Current Character Animations
	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
			AddTimerBlock( CurrentRun, "MoveHeroToRoomPosition" )
			wait( dropDelay )
			SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "SuppressSounds", Value = true, DataValue = false })
			if disableCollision then
				SetUnitProperty({ DestinationId = heroId, Property = "CollideWithObstacles", Value = false })
			end
			if speedAdjustment then
				SetUnitProperty({ DestinationId = heroId, Property = "Speed", Value = speedAdjustment })
			end
			SetAlpha({ Id = heroId, Fraction = 1.0 })
			if( lightId ~= nil ) then
				SetAlpha({ Id = lightId, Fraction = 1.0 })
			end
			SetAnimation({ Name = CurrentCharacterHeroLandingAnimation, DestinationId = heroId })
			SetThingProperty({ DestinationId = heroId, Property = "TouchdownGraphic", Value = CurrentCharacterHeroTouchDownGraphic })
			AdjustZLocation({ Id = heroId, Distance = 1500, Duration = 0 })
			wait(0.02)
			AdjustZLocation({ Id = heroId, Distance = 1500, Duration = 1.0 })
			Move({ Id = heroId, DestinationId = heroDestination, Mode = "Precise" })
			PlaySound({ Name = "/SFX/Player Sounds/ZagreusWhooshDropIn", Id = heroId, Delay = 0.5 })
			thread( DustLanding, 1.62 )
			wait( landDelay )
			Stop({ Id = heroId })
			AngleTowardTarget({ Id = heroId, DestinationId = 553377 })
			SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "SuppressSounds", Value = false, DataValue = false })
			if disableCollision then
				SetUnitProperty({ DestinationId = heroId, Property = "CollideWithObstacles", Value = true })
			end
			if speedAdjustment then
				SetUnitProperty({ DestinationId = heroId, Property = "Speed", Value = CurrentCharacterBaseSpeed })
			end
			thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.2, Duration = 0.15 }, } )
			RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
			RemoveTimerBlock( CurrentRun, "MoveHeroToRoomPosition" )
		end

function DoCurrentCharacterSecretDoorEntrance( secretDoor )
    

    SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "TouchdownGraphic", Value = CurrentCharacterHeroTouchDownGraphic })
	SetAnimation({ Name = CurrentCharacterSecretDoorDiveAnimation, DestinationId = CurrentRun.Hero.ObjectId })
end

--RoomEntranceHades Character Animations/Voicelines--
function SetCurrentCharacterHadesEntranceAnimations()
    

    SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = CurrentCharacterMoveAnimation, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = currentRun.Hero.ObjectId })
end

function ResetCurrentCharacterAnimations()
    

    SetUnitProperty({ Property = "StartGraphic", Value = CurrentCharacterMoveStartAnimation, DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "MoveGraphic", Value = CurrentCharacterMoveAnimation, DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "StopGraphic", Value = CurrentCharacterMoveStopAnimation, DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "Speed", Value = CurrentCharacterBaseSpeed, DestinationId = currentRun.Hero.ObjectId })
end

function DoCurrentCharacterLeaveRoomAnim( currentRun, exitDoor )
    

	    SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "TouchdownGraphic", Value = CurrentCharacterHeroTouchDownGraphic })

		SetAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = CurrentCharacterSecretRoomEntranceExitAnimation })
end

function DoCurrentCharacterPortalEntrance( currentRun, currentRoom )
    

	AddInputBlock({ Name = "RoomEntrancePortal" })
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or RoomData.BaseRoom.IntroSequenceDuration or 0.0
	AdjustFullscreenBloom({ Name = "NewType09" })
	wait(0.03)

	if currentRoom.HeroEndPoint ~= nil then
		AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	end
	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0 })
	AdjustZLocation({ Id = currentRun.Hero.ObjectId, Distance = 1800, Duration = 0.0 })
	wait(0.03)
	ApplyUpwardForce({ Id = currentRun.Hero.ObjectId, Speed = -100 })
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation()

	-- Asphodel boats
	for k, unusedBoatId in pairs(GetIdsByType({ Name = "AsphodelBoat01" })) do
		Destroy({ Id = unusedBoatId })
	end

	wait(0.3)

    SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "TouchdownGraphic", Value = CurrentCharacterHeroTouchDownGraphic })

	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 1.0, Duration = 1.0 })
	SetAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = CurrentCharacterSecretRoomEntranceExitAnimation })
	AdjustFullscreenBloom({ Name = "Off", Duration = 1.0 })

	wait(0.03)

	thread( PlayVoiceLines, currentRoom.EnterVoiceLines, true )
	thread( PlayVoiceLines, GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true )

	local locationTextColor = currentRoom.LocationTextColor or { 255, 0, 0, 255 }
	if currentRoom.LocationText then
		thread( DisplayLocationText, nil, { Text = currentRoom.LocationText, Delay = 0.65, FadeColor = locationTextColor, Duration = 2.0 } )
	end
	if currentRoom.BiomeName then
		thread( CheckLocationUnlock, nil, { Biome = currentRoom.BiomeName } )
	end
	thread(DelayedRemoveInputBlock, 0.35, "RoomEntrancePortal")
end

function PlayCurrentCharacterInteractAnimation( interactableObjectId, args )args = args or {}
    

	SetAnimation({ Name = CurrentCharacterInteractAnimation, DestinationId = CurrentRun.Hero.ObjectId })
end

function DoCurrentCharacterUpgradeAcquiredAnimation(  )
    
	SetAnimation({ Name = CurrentCharacterUpgradeAcquiredAnimation, DestinationId = CurrentRun.Hero.ObjectId })
end

function PlayCurrentCharacterUpgradeAcquiredVoicelines()
    
   
   thread(PlayVoiceLines, CurrentCharacterUpgradeAcquiredVoicelines)
end

function PlayCurrentCharacterLastStandVoicelines( args )
    

    thread( PlayVoiceLines,CurrentCharacterLastStandVoiceLines, true )
end

function PlayCurrentCharacterLastStandLastLifeVoicelines( args )
    
   
    thread( PlayVoiceLines,CurrentCharacterLastStandLastLifeVoiceLines, true )
end

function DoCurrentCharacterLastStandSFX()
    

		PlaySound({ Name = "/SFX/DeathDefianceActivate", Id = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = CurrentCharacterChargingEmote, Id = CurrentRun.Hero.ObjectId })
end

function DoCurrentCharacterLastHealingPresentation()
    
    SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 4.5, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	PlaySound({ Name = CurrentCharacterPowerUpEmote, Id = CurrentRun.Hero.ObjectId })
	SetAnimation({ Name = CurrentCharacterLastStandAnimation, DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ZagreusWrathFire", DestinationId = CurrentRun.Hero.ObjectId, Color = Color.White })
	CreateAnimation({ Name = "DeathDefianceShockwave", DestinationId = CurrentRun.Hero.ObjectId })
end

function HadesLastStandBlast()
    wait(1.0)
    FireWeaponFromUnit({ Weapon = "EPCHadesAmmoWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true })
end

--Player Rage--
function CreatePlayerRageMeter(player)
	ScreenAnchors.PlayerRageTitle = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 100, Y = ScreenHeight - 30, Scale = 1.0})
	ScreenAnchors.PlayerRageBack = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 210, Y = ScreenHeight - 10, Scale = 0.5})
	ScreenAnchors.PlayerRageFill = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 210, Y = ScreenHeight - 9, Scale = 0.5})

	CreateTextBox({ Id = ScreenAnchors.PlayerRageTitle, Text = "RageMeter",
			Font = "AlegreyaSansSCBold", FontSize = 14, ShadowRed = 0, ShadowBlue = 0, ShadowGreen = 0,
			OutlineColor = {0, 0, 0, 1}, OutlineThickness = 2,
			ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 3, ShadowOffsetX = 0, Justification = "Center" })
	SetAlpha({ Id = ScreenAnchors.PlayerRageTitle, Fraction = 0.01, Duration = 0.0 })
	SetAlpha({ Id = ScreenAnchors.PlayerRageTitle, Fraction = 1, Duration = 2.0 })

	SetAnimation({ Name = "EnemyHealthBarBoss", DestinationId = ScreenAnchors.PlayerRageBack })
	SetAlpha({ Id = ScreenAnchors.PlayerRageBack, Fraction = 0.01, Duration = 0.0 })
	SetAlpha({ Id = ScreenAnchors.PlayerRageBack, Fraction = 1, Duration = 2.0 })

	player.RageBarFill = "EnemyHealthBarFillBoss"
	SetAnimation({ Name = "EnemyHealthBarFillBoss", DestinationId = ScreenAnchors.PlayerRageFill })
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1, DestinationId = ScreenAnchors.PlayerRageFill })
	SetAlpha({ Id = ScreenAnchors.PlayerRageFill, Fraction = 0.01, Duration = 0.0 })
	SetAlpha({ Id = ScreenAnchors.PlayerRageFill, Fraction = 1, Duration = 2.0 })
end

function DestroyPlayerRageMeter()
    Destroy({ Id = ScreenAnchors.PlayerRageTitle })
	Destroy({ Id = ScreenAnchors.PlayerRageBack })
	Destroy({ Id = ScreenAnchors.PlayerRageFill })
    if CurrentRun.Hero.Enraged == true then
        CurrentRun.Hero.Enraged = false
        CurrentRun.Hero.PermanentEnraged = false
    end
    end

function CalculatePlayerRageGain( triggerArgs, sourceWeaponData, victim )
	local damageAmount = triggerArgs.DamageAmount
    local damageReduction = damageAmount % 10
	if triggerArgs.PureDamage then
		return 0
	end
	if victim ~= nil and victim.BlockWrathGain then
		return 0
	end
	if sourceWeaponData ~= nil and sourceWeaponData.BlockWrathGain then
		return 0
	end
	local meterAmount = 0
	if victim == CurrentRun.Hero then
        meterAmount = 0.01
	-- 	meterAmount = ( damageAmount / victim.MaxHealth ) * CurrentRun.Hero.Super.DamageTakenMultiplier
	-- 	meterAmount = meterAmount * (1 + GetTotalHeroTraitValue("SuperGainMultiplier", { IsMultiplier = true }) - 1 + GetTotalHeroTraitValue("DefensiveSuperGainMultiplier", { IsMultiplier = true }) - 1)
	-- else
	-- 	local stepdownCutoff = 60
	-- 	if damageAmount > stepdownCutoff then
	-- 		damageAmount = stepdownCutoff + math.sqrt(damageAmount - stepdownCutoff)
	-- 	end

	-- 	meterAmount = damageAmount * CurrentRun.Hero.Super.DamageDealtMultiplier
	-- 	meterAmount = meterAmount * MetaUpgradeData.LimitMetaUpgrade.ChangeValue * (1 + GetNumMetaUpgrades("LimitMetaUpgrade"))
	-- 	meterAmount = meterAmount * GetTotalHeroTraitValue("SuperGainMultiplier", { IsMultiplier = true })
	-- 	if victim.MeterMultiplier then
	-- 		thread( MarkObjectiveComplete, "BuildSuper" )
	-- 		meterAmount = meterAmount * victim.MeterMultiplier
	-- 	end
	end
    meterAmount = 0.01
    ShakeScreen({ Speed = 300, Distance = 3, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = ScreenAnchors.PlayerRageFill, Speed = 3.0, MinFraction = 0, MaxFraction = 0.8, Color = Color.Yellow })

    local ticks = 2
    for ticks = 1, ticks, 1 do

    BuildPlayerRageMeter( CurrentRun, meterAmount, CurrentRun.Hero )
    wait( 0.01 )
    if CurrentRun.Hero.Enraged then
        if not CurrentRun.Hero.Enraged then
            StopFlashing({ Id = ScreenAnchors.PlayerRageFill })
        end
        
    end
end
end

function BuildPlayerRageMeter(currentRun, meterAmount, player)
	if player.Enraged then
		return
	end

	local screenId = ScreenAnchors.PlayerRageFill
	player.RageFraction = player.RageFraction or 0

	player.RageFraction = player.RageFraction + meterAmount
	player.LastRageGainTime = _worldTime
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1 - player.RageFraction, DestinationId = screenId })

    local lowHealthThreshold = 0.03

    PermaRageToggle = "IsOff"

    

	if player.RageFraction >= 1 then
		player.RageFraction = 0
		thread(EnragePlayerUnit, player, currentRun)
else if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth <= lowHealthThreshold then
    player.RageFraction = 0
    PermaRageToggle = "IsOn"
    thread(EPCEnrageHarpyPermanent, CurrentRun.Hero, currentRun)
    end
end
end

function BuildPlayerRageMeterAlecto(currentRun, meterAmount, player)
	if player.Enraged then
		return
	end

	local screenId = ScreenAnchors.PlayerRageFill
	player.RageFraction = player.RageFraction or 0

	player.RageFraction = player.RageFraction + meterAmount
	player.LastRageGainTime = _worldTime
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1 - player.RageFraction, DestinationId = screenId })

	if player.RageFraction >= 1 then
		player.RageFraction = 0
		thread(EnragePlayerUnit, player, currentRun)
	end
end

function EnragePlayerUnit(player, currentRun, startDelay)
    

	wait( startDelay )
	if not IsAlive({ Id = player.ObjectId }) then
		return
	end

	--DebugPrint({ Text = "Enraging: "..player })
	--if CurrentCharacterEnragedMoveSpeedBonus ~= nil then
		--player.MoveSpeedReset = GetUnitDataValue({ Id = player.ObjectId, Property = "Speed" })
		local enragedMoveSpeed = CurrentCharacterEnragedMoveSpeedBonus + CurrentCharacterBaseSpeed
		SetUnitProperty({ DestinationId = player.ObjectId, Property = "Speed", Value = enragedMoveSpeed })
	--end

	player.Enraged = true
	--if player.EnragedPresentation ~= nil then
		local enrageFunction = _G[CurrentCharacterEnragedPresentation]
		enrageFunction(player, currentRun)
	--end

    SetupAlectoRagePropertyChanges()

	wait( CurrentCharacterEnragedDuration )

    local lowHealthThreshold = 0.6

    PermaRageToggle = "IsOff"

    -- if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth ~= lowHealthThreshold and CurrentRun.Hero.LastStands ~= 0 then
    --     PermaRageToggle = "IsOn"
    -- else if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth > lowHealthThreshold and CurrentRun.Hero.LastStands > 0 then
    --     PermaRageToggle = "IsOff"
    -- end

	if player.PermanentEnraged == true then
        --if PermaRageToggle == "IsOn" then
		local notifyName = "PlayerPermanentEnraged"
		NotifyOnAllDead({ Ids = { player.ObjectId }, Notify = notifyName })
		waitUntil( notifyName )
		AdjustColorGrading({ Name = "Off", Duration = 0.45 })
        player.PermanentEnraged = false
	else
		EndPlayerEnrage(player, currentRun)
	end
end

function EPCEnrageHarpyPermanent(player, currentRun, startDelay)
    
	 wait( startDelay )
	if not IsAlive({ Id = player.ObjectId }) then
		return
	end

	--DebugPrint({ Text = "Enraging: "..player })
	--if CurrentCharacterEnragedMoveSpeedBonus ~= nil then
		--player.MoveSpeedReset = GetUnitDataValue({ Id = player.ObjectId, Property = "Speed" })
	--end

	player.Enraged = true
	player.PermanentEnraged = true
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 0.0, DestinationId = ScreenAnchors.PlayerRageFill })
	--if player.EnragedPresentation ~= nil then
		local enrageFunction = _G[CurrentCharacterEnragedPresentation]
		enrageFunction(player, currentRun)
	--end

    SetupAlectoRagePropertyChanges()

	-- wait( CurrentCharacterEnragedDuration )

	if player.PermanentEnraged then
        --if PermaRageToggle == "IsOn" then
		local notifyName = "PlayerPermanentEnraged"
		NotifyOnAllDead({ Ids = { player.ObjectId }, Notify = notifyName })
		waitUntil( notifyName )
		AdjustColorGrading({ Name = "Off", Duration = 0.45 })
	-- else
	-- 	EndPlayerEnrage(player, currentRun)
	end
end



function SetupAlectoRagePropertyChanges()
   

    local enragedMoveSpeed = CurrentCharacterEnragedMoveSpeedBonus + CurrentCharacterBaseSpeed
	SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "Speed", Value = enragedMoveSpeed })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "MaxAdjustRate", Value = 1.8 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageRadius", Value = 175 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileDefenseAngle", Value = 90 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileDefenseRadius", Value = 175 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipWhirlAlectoDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "DetonateGraphic", Value = "FuryWhipWhirlAlectoEnraged" })
    SetWeaponProperty({ WeaponName = "EPCHarpyLightningChase", DestinationId = CurrentRun.Hero.ObjectId, Property = "ClipRegenInterval", Value = 0.5 })
    SetWeaponProperty({ WeaponName = "EPCHarpyLightningChase", DestinationId = CurrentRun.Hero.ObjectId, Property = "Cooldown", Value = 0.5 })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash1", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "AlectoWhipArcOffset" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash2", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "AlectoWhipArcOffsetFlipped" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash3", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "AlectoWhipArcOffset" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash4", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "AlectoWhipArcOffsetFlipped" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash5", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "AlectoWhipArcOffset" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash6", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "AlectoWhipArcOffsetFlipped" })
end

function EndPlayerEnrage(player, currentRun)
    
    
    ResetAlectoRagePropertyChanges()

	local screenId = ScreenAnchors.PlayerRageFill
	player.Enraged = false
    player.PermanentEnraged = false
	StopFlashing({ Id = screenId })
	AdjustColorGrading({ Name = "Off", Duration = 0.45 })
	if CurrentCharacterRageExpireSound ~= nil then
		PlaySound({ Name = CurrentCharacterRageExpireSound })
	end
	if CurrentCharacterRageExpireVoiceLines ~= nil then
		thread( PlayVoiceLines, CurrentCharacterRageExpireVoiceLines, nil, player )
	end
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1.0, DestinationId = screenId })
	if CurrentCharacterEnragedMoveSpeedBonus ~= nil then
		SetUnitProperty({ DestinationId = player.ObjectId, Property = "Speed", Value = CurrentCharacterBaseSpeed })
	end
end

function EndPlayerPermaEnrage(player, currentRun)
    
    
    ResetAlectoRagePropertyChanges()

	local screenId = ScreenAnchors.PlayerRageFill
	player.Enraged = false
    player.PermanentEnraged = false
	StopFlashing({ Id = screenId })
	AdjustColorGrading({ Name = "Off", Duration = 0.45 })
	if CurrentCharacterRageExpireSound ~= nil then
		PlaySound({ Name = CurrentCharacterRageExpireSound })
	end
	if CurrentCharacterRageExpireVoiceLines ~= nil then
		thread( PlayVoiceLines, CurrentCharacterRageExpireVoiceLines, nil, player )
	end
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1.0, DestinationId = screenId })
	if CurrentCharacterEnragedMoveSpeedBonus ~= nil then
		SetUnitProperty({ DestinationId = player.ObjectId, Property = "Speed", Value = CurrentCharacterBaseSpeed })
	end
end

function CheckIfPermaRageEligible(player, currentRun)
    local LowHealthThreshold = 0.3
    if player.Health / player.MaxHealth >= LowHealthThreshold and player.MaxLastStands >= 0  then
        -- player.RageFraction = 0
        -- PermaRageToggle = "IsOn"
        killWaitUntilThreads("PlayerPermanentEnraged")
        end
    end

function ResetAlectoRagePropertyChanges()
    

    local enragedMoveSpeed = CurrentCharacterEnragedMoveSpeedBonus + CurrentCharacterBaseSpeed
	SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "Speed", Value = CurrentCharacterBaseSpeed })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "MaxAdjustRate", Value = 1 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageRadius", Value = 125 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileDefenseAngle", Value = 90 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileDefenseRadius", Value = 125 })
    SetProjectileProperty({ WeaponName = "EPCHarpyWhipWhirlAlectoDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "DetonateGraphic", Value = "FuryWhipWhirlAlecto" })
    SetWeaponProperty({ WeaponName = "EPCHarpyLightningChase", DestinationId = CurrentRun.Hero.ObjectId, Property = "ClipRegenInterval", Value = 1.2 })
    SetWeaponProperty({ WeaponName = "EPCHarpyLightningChase", DestinationId = CurrentRun.Hero.ObjectId, Property = "Cooldown", Value = 1.2 })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash1", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "FuryWhipLashAlecto" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash2", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "FuryWhipLashAlectoFlipped" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash3", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "FuryWhipLashAlecto" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash4", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "FuryWhipLashAlectoFlipped" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash5", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "FuryWhipLashAlecto" })
    SetWeaponProperty({ WeaponName = "AlectoWhipLash6", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx", Value = "FuryWhipLashAlectoFlipped" })
end

-- function EPCEnrageHarpyPermanent(player, currentRun)
-- 	player.Enraged = true
-- 	player.PermanentEnraged = true
-- 	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 0.0, DestinationId = ScreenAnchors.PlayerRageFill })
-- 	EnragePlayerUnit(player, currentRun)
-- end

function EPCHarpyEnragedPresentation(player, currentRun)
    

	local screenId = ScreenAnchors.PlayerRageFill

	if player.PermanentEnraged then
		thread( InCombatText, player.ObjectId, "Combat_PermanentEnraged", 1 )
	else
		thread( InCombatText, player.ObjectId, "Combat_Enraged", 1 )
	end

	AdjustColorGrading({ Name = "AlectoRage", Duration = 0.5 })
	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = screenId, Speed = 2.0, MinFraction = 0, MaxFraction = 0.8, Color = Color.Purple })

	if CurrentCharacterRageFullVoiceLines ~= nil then
		thread( PlayVoiceLines, CurrentCharacterRageFullVoiceLines, nil, player )
	end
	if CurrentCharacterRageFullSound ~= nil then
		PlaySound({ Name = CurrentCharacterRageFullSound })
	end

	if not player.PermanentEnraged then
		thread( EPCDrainHarpyRageMeter, player, currentRun, CurrentCharacterEnragedDuration)
	end
end

function EPCDrainHarpyRageMeter(player, currentRun, duration)
	local tickDuration = duration * 0.01

	local fraction = 0.00
	for tick=1, 100 do
		if player.PermanentEnraged then
			return
		end
		fraction = fraction + 0.01
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = fraction, DestinationId = ScreenAnchors.PlayerRageFill })
		wait( tickDuration, RoomThreadName )
	end
end

function EPCCheckAmmoDropHades(currentRun, targetId, ammoDropData, numDrops)
    if ammoDropData == nil then
        return
    end

    if ammoDropData.Count == nil or ammoDropData.Count <= 0 or numDrops == 0 then
        return
    end

    if ammoDropData.Chance ~= nil and not RandomChance( ammoDropData.Chance ) then
        return
    end

    if ammoDropData.LocationX ~= nil then
        targetId = nil
    end

    if numDrops == nil then
        numDrops = ammoDropData.Count
    end

    

    local consumableName = "EPCHadesAmmo"
    for i = 1, numDrops do
        ammoDropData.Count = ammoDropData.Count - 1
    end

    -- if IsMetaUpgradeActive("ReloadAmmoMetaUpgrade") then
    --     return
    -- end

    -- for i = 1, numDrops do
    --     local offset = {}
    --     if ammoDropData.Angle ~= nil then
    --         offset = CalcOffset( math.rad(ammoDropData.Angle + 180), 48 )
    --     end
    --     local consumableId = SpawnUnit({ Name = consumableName, DestinationId = targetId, LocationX = ammoDropData.LocationX, LocationY = ammoDropData.LocationY, OffsetX = offset.X, OffsetY = offset.Y, Group = "HeroTeam" })
    --     local consumable = CreateConsumableItem( consumableId, consumableName )

    --     ApplyUpwardForce({ Id = consumableId, Speed = RandomFloat( ammoDropData.UpwardForceMin or 500, ammoDropData.UpwardForceMax or 700 ) })
	-- 			if ammoDropData.ForceMax ~= nil then
	-- 				ApplyForce({ Id = consumableId, Speed = RandomFloat( ammoDropData.ForceMin, ammoDropData.ForceMax ), Angle = ammoDropData.Angle or RandomFloat( 0, 360 ), SelfApplied = true })
	-- 			end
	-- 			local delay = GetTotalHeroTraitValue("AmmoDropUseDelay")
	-- 			if delay > 0 then
	-- 				SetInteractProperty({ DestinationId = consumableId, Property = "Cooldown", Value = delay })
	-- 				thread( DoUseDelay, consumableId, delay )
	-- 			end
		
	-- 			for i, data in pairs(GetHeroTraitValues("AmmoFieldWeapon")) do
	-- 				thread( FireAmmoWeapon, consumableId, data )
	-- 			-- end
	-- 			-- thread( EscalateMagnetism, consumableId )
	-- 		end

end

function EPCTryUnloadAmmo( weaponName, victim, attacker, triggerArgs )
	if	attacker ~= nil and attacker.ObjectId == CurrentRun.Hero.ObjectId
		and CurrentRun.CurrentRoom.LoadedAmmo and CurrentRun.CurrentRoom.LoadedAmmo > 0
		and triggerArgs.FireIndex and triggerArgs.FireIndex == 0
		and CurrentRun.CurrentRoom.ValidVolleys and triggerArgs.ProjectileVolley then
		local count = 0
		local toDelete = {}
		for i, volleyData in pairs( CurrentRun.CurrentRoom.ValidVolleys ) do
			if volleyData[weaponName] and triggerArgs.ProjectileVolley == volleyData[weaponName] then
				count = count + 1
				table.insert( toDelete, volleyData )
			end
		end
		for i, condemnedData in pairs( toDelete ) do
			RemoveValue( CurrentRun.CurrentRoom.ValidVolleys, condemnedData )
			-- remove ammo indicator
			for i, ammoData in pairs( CurrentRun.Hero.StoredAmmo ) do
				if ammoData.WeaponName == "SelfLoadAmmoApplicator" then
					local ammoAnchors = ScreenAnchors.SelfStoredAmmo
					if ammoAnchors ~= nil and ammoAnchors[#ammoAnchors] ~= nil then
						Destroy({ Id = ammoAnchors[#ammoAnchors] })
						ammoAnchors[#ammoAnchors] = nil
					end
					CurrentRun.Hero.StoredAmmo[i] = nil
					break
				end
			end
		end
		CurrentRun.Hero.StoredAmmo = CollapseTable( CurrentRun.Hero.StoredAmmo )
		if count > 0 then
			thread( EPCUnloadAmmoThread, { Count = count, Victim = victim, Attacker = attacker, LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY, Angle = triggerArgs.ImpactAngle or triggerArgs.Angle })
		end
	end
end

function EPCUnloadAmmoThread( args )
	local victim = args.Victim
	local attacker = args.Attacker
	local locationX = args.LocationX
	local locationY = args.LocationY
	local angle = args.Angle
	local count = args.Count
	local spread = 0
	local spreadIncrement = 10
	local spreadMax = 30
	local interval = args.Interval or 0.05
	CurrentRun.CurrentRoom.LoadedAmmo = CurrentRun.CurrentRoom.LoadedAmmo - count
	for i = 1, count do
		RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { 1 } })
		if HeroHasTrait("SelfLaserTrait") then
			LockRangedToPlayer()
		end
		local fireAngle = ( angle + RandomFloat(-spread, spread))* math.pi / 180
		
		if not locationX or not locationY then
			local location = {0,0}
			if victim ~= nil then
				location = GetLocation({ Id = victim.ObjectId })
			else
				location = GetLocation({ Id = attacker.ObjectId})
			end
			local offset = CalcOffset( fireAngle, GetTotalHeroTraitValue( "UnloadAmmoOffset" ))
			locationX = location.X + offset.X
			locationY = location.Y + offset.Y
		end
		if locationX and locationY then
			local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", LocationX = locationX, LocationY = locationY })
			FireWeaponFromUnit({ Weapon = "EPCHadesCast", AutoEquip = true, Id = attacker.ObjectId, DestinationId = dropLocation, FireFromTarget = true, Angle = fireAngle })
			Destroy({Id = dropLocation })
		end
		spread = math.min( spread + spreadIncrement, spreadMax )
		wait( interval, RoomThreadName )
	end
end

--MergeWeaponSetTables()

Config2 = {
      ModName = "Heroes",
      YourFirstSetting = true,
      YourSecondSetting = false 
    }

function SetupConfig()
    local Config = {
      ModName = "Furies",
      Megaera = true,
      Tisiphone = false ,
      Alecto = false
    }

	
    ModConfigMenu.Register(Config)
end

function SetupConfig2()
    local Config = {
      ModName = "Heroes",
      YourFirstSetting = true,
      YourSecondSetting = false 
    }

	
    ModConfigMenu.Register(Config)
end

SetupConfig()

SetupConfig2()

-- OnControlPressed{ "Gift",
-- 	function(triggerArgs)
-- 	Import "../Mods/Legendary Edition/LE Scripts/ContractExchange.lua"
-- 	end
-- }

--stupid boon fix--

--[[ give the effect trait (gives a trait that 
grants the effects of the boon that would otherwise not work) ]]

-- ModUtil.WrapBaseFunction( 'AddTraitToHero', function(base, args)
--     DebugPrint({ args })
--     local traitData = args.TraitData
-- 	if traitData == nil then
-- 		traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = args.TraitName, Rarity = args.Rarity })
--     end
-- 	if CurrentRun == nil then return end
--     if  base({TraitName = "AthenaRushTrait"}) then AddTraitToHeroLE("AthenaRushTrait1")
--     end
-- return base(args)
-- end)

--Athena--


--AthenaRushTrait--
function AddBoonEffectTraitAthenaRush()
    if not HeroHasTrait("AthenaRushTrait1") then
    AddTraitToHero("AthenaRushTrait1")
    end
end

--AthenaRangedTrait--
function AddBoonEffectTraitAthenaRanged()
    if not HeroHasTrait("AthenaRangedTrait1") then
    AddTraitToHero("AthenaRangedTrait1")
    end
end

function AddTraitToHeroLE(args)
	local traitData = args.TraitData
	if traitData == nil then
		traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = args.TraitName, Rarity = args.Rarity })
	end

	GameState.LastPickedTraitName = traitData.Name

	if not args.PreProcessedForDisplay then
		ExtractValues(CurrentRun.Hero, traitData, traitData)
	end

	if traitData.Slot and CurrentRun.CurrentRoom then
		CurrentRun.CurrentRoom.AcquiredSlot = traitData.Slot
	end
	-- traits may have information that acts on weapons, so we must first equip all associated weapons to the player
	EquipReferencedWeapons( traitData )
	AddTraitData( CurrentRun.Hero, traitData, args )

	EquipSpecialWeapons( CurrentRun.Hero, traitData )
	AddAssistWeapons( CurrentRun.Hero, traitData )
	for weaponName, v in pairs( CurrentRun.Hero.Weapons ) do
		AddWallSlamWeapons( CurrentRun.Hero, traitData )
		AddOnDamageWeapons(CurrentRun.Hero, weaponName, traitData)
		AddOnFireWeapons(CurrentRun.Hero, weaponName, traitData)
		if traitData.UpgradeHeroWeapon ~= nil and Contains(traitData.UpgradeHeroWeapon.WeaponNames, weaponName) then
			AddHeroWeaponUpgrade(weaponName, traitData.UpgradeHeroWeapon.UpgradeName)
		end
	end

	if ( traitData.EnemyPropertyChanges or traitData.AddEnemyOnDeathWeapons ) and ActiveEnemies ~= nil then
		for enemyId, enemy in pairs( ActiveEnemies ) do
			EquipReferencedEnemyWeapons( currentRun, traitData, enemy )
			ApplyEnemyTrait( CurrentRun, traitData, enemy )
		end
	end

	if traitData.AddShout then
		if traitData.AddShout.Cost then
			CurrentRun.Hero.SuperCost = traitData.AddShout.Cost
		else
			CurrentRun.Hero.SuperCost = 25
		end
		ShowSuperMeter()
	end
end


--Character specific functions--

--Megaera--
function LE_EquipMegWeapon()
   EquipPlayerWeapon( WeaponData.MegWhipLash1, { PreLoadBinks = true } )
    GameState.LastWeaponUpgradeData["MegWhipLash1"] = { Index = 1 }
    --GameState.LastWeaponUpgradeData[MegWhipLash1].Index
    EquipWeaponUpgrade( CurrentRun.Hero.ObjectId, { SkipTraitHighlight = true })
    GameState.LastInteractedWeaponUpgrade = { WeaponName = "MegWhipLash1", ItemIndex = 1 }
-- local currentWeaponInSlot = GetEquippedWeapon()
-- 	args = args or {}
-- 	local skipTraitHighlight = args.SkipTraitHighlight or false
-- 	--equip trait
-- 	--if GameState.LastWeaponUpgradeData[ currentWeaponInSlot ] and GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) and not HeroHasTrait(GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)) then
-- 		--AddTraitToHero({ SkipNewTraitHighlight = skipTraitHighlight, TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot][1].TraitName), Rarity = GetRarityKey(GetWeaponUpgradeLevel(currentWeaponInSlot, GetEquippedWeaponTraitIndex( currentWeaponInSlot ))) })
-- 	--end
    -- AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "EPCMegaeraTrait"}) })
-- 	GameState.LastInteractedWeaponUpgrade = { WeaponName = currentWeaponInSlot, ItemIndex = GetEquippedWeaponTraitIndex( currentWeaponInSlot ) }
   
   
   
   --AddTraitToHero({TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "EPCMegaeraTrait"}) })
end

function EquipMegWeaponUpgrade( hero, args )
	local currentWeaponInSlot = GetEquippedWeapon()
	args = args or {}
	local skipTraitHighlight = args.SkipTraitHighlight or false
	--equip trait
	if GameState.LastWeaponUpgradeData[ WeaponData.MegWhipLash1 ] and GetWeaponUpgradeTrait(WeaponData.MegWhipLash1, GameState.LastWeaponUpgradeData[WeaponData.MegWhipLash1].Index) and not HeroHasTrait(GetWeaponUpgradeTrait(WeaponData.MegWhipLash1, GameState.LastWeaponUpgradeData[WeaponData.MegWhipLash1].Index)) then
		AddTraitToHero({ SkipNewTraitHighlight = skipTraitHighlight, TraitName = GetWeaponUpgradeTrait(WeaponData.MegWhipLash1, GameState.LastWeaponUpgradeData[WeaponData.MegWhipLash1].Index), Rarity = GetRarityKey(GetWeaponUpgradeLevel(WeaponData.MegWhipLash1, GetEquippedWeaponTraitIndex( WeaponData.MegWhipLash1 ))) })
	end
	GameState.LastInteractedWeaponUpgrade = { WeaponName = WeaponData.MegWhipLash1, ItemIndex = GetEquippedWeaponTraitIndex( WeaponData.MegWhipLash1 ) }
end

--Alecto--
function LE_EquipAlectoWeapon()
   EquipPlayerWeapon( WeaponData.AlectoWhipLash1, { PreLoadBinks = true } )
    GameState.LastWeaponUpgradeData["AlectoWhipLash1"] = { Index = 1 }
    --GameState.LastWeaponUpgradeData[MegWhipLash1].Index
    EquipWeaponUpgrade( CurrentRun.Hero.ObjectId, { SkipTraitHighlight = true })
    GameState.LastInteractedWeaponUpgrade = { WeaponName = "AlectoWhipLash1", ItemIndex = 1 }
-- local currentWeaponInSlot = GetEquippedWeapon()
-- 	args = args or {}
-- 	local skipTraitHighlight = args.SkipTraitHighlight or false
-- 	--equip trait
-- 	--if GameState.LastWeaponUpgradeData[ currentWeaponInSlot ] and GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) and not HeroHasTrait(GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)) then
-- 		--AddTraitToHero({ SkipNewTraitHighlight = skipTraitHighlight, TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot][1].TraitName), Rarity = GetRarityKey(GetWeaponUpgradeLevel(currentWeaponInSlot, GetEquippedWeaponTraitIndex( currentWeaponInSlot ))) })
-- 	--end
     --AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "EPCAlectoTrait"}) })
-- 	GameState.LastInteractedWeaponUpgrade = { WeaponName = currentWeaponInSlot, ItemIndex = GetEquippedWeaponTraitIndex( currentWeaponInSlot ) }
   
   
   
   --AddTraitToHero({TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "EPCMegaeraTrait"}) })
end

--Tisiphone--
function LE_EquipTisiphoneWeapon()
   EquipPlayerWeapon( WeaponData.HarpyWhipSlash1, { PreLoadBinks = true } )
    GameState.LastWeaponUpgradeData["HarpyWhipSlash1"] = { Index = 1 }
    --GameState.LastWeaponUpgradeData[MegWhipLash1].Index
    EquipWeaponUpgrade( CurrentRun.Hero.ObjectId, { SkipTraitHighlight = true })
    GameState.LastInteractedWeaponUpgrade = { WeaponName = "HarpyWhipSlash1", ItemIndex = 1 }
-- local currentWeaponInSlot = GetEquippedWeapon()
-- 	args = args or {}
-- 	local skipTraitHighlight = args.SkipTraitHighlight or false
-- 	--equip trait
-- 	--if GameState.LastWeaponUpgradeData[ currentWeaponInSlot ] and GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) and not HeroHasTrait(GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)) then
-- 		--AddTraitToHero({ SkipNewTraitHighlight = skipTraitHighlight, TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot][1].TraitName), Rarity = GetRarityKey(GetWeaponUpgradeLevel(currentWeaponInSlot, GetEquippedWeaponTraitIndex( currentWeaponInSlot ))) })
-- 	--end
     AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "EPCTisiphoneTrait"}) })
-- 	GameState.LastInteractedWeaponUpgrade = { WeaponName = currentWeaponInSlot, ItemIndex = GetEquippedWeaponTraitIndex( currentWeaponInSlot ) }
   
   
   
   --AddTraitToHero({TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = "EPCMegaeraTrait"}) })
end

-- ModUtil.WrapBaseFunction( 'EquipPlayerWeapon', function(baseFunc)
-- 	--if CurrentRun == nil then return end
--     --local LastCharTrait = LECharacterData.LastCharTraitName
-- 	if IsCustomHero == true
-- 	then
--         RemoveEPCMegaeraWeapons()
-- 	end
-- return baseFunc()
-- end)