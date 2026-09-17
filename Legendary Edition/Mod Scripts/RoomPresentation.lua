
function DeathPresentation( currentRun, killer, killingUnitWeapon )

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
		
			currentRun.Hero.Mute = false
			SetPlayerInvulnerable( "PlayerDeath" )
			PlaySound({ Name = "/SFX/Player Sounds/PlayerDeath" })
			-- Check For EPC Traits To Override Death Voicelines --
			local EPCTrait = { "EPCMegaeraTrait", "EPCAlectoTrait", "EPCTisiphoneTrait" }
			local currentlyEquippedWeapon = GetEquippedWeapon()
			local traitName = GetWeaponUpgradeTrait(currentlyEquippedWeapon, GameState.LastWeaponUpgradeData[currentlyEquippedWeapon].Index)
			if HeroHasTrait( "EPCAlectoTrait" ) then
			thread( PlayVoiceLines, TraitData[traitName].DeathVoiceLines )
		
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
		    local idleAnimation = TraitData[traitName].DeathIdleAnimation
			local criticalSlowHoldTime = 0
			FocusCamera({ Fraction = 1.0, Duration = 0.3, ZoomType = "Ease" })
			SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = CurrentRun.Hero.ObjectId })
			SetThingProperty({ Property = "Graphic", Value = idleAnimation, DestinationId = CurrentRun.Hero.ObjectId })
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
			-- local zagreusDeathFlash = CreateScreenComponent({ Name = "rectangle01", Group = "Overlay" })
			-- SetAnimation({ DestinationId = zagreusDeathFlash.Id, Name = "zagreusDeathFlash" })
		
			local deathAnimation = TraitData[traitName].DeathAnimation
			if CurrentRun.Cleared then
				deathAnimation = TraitData[traitName].DeathAnimation
			end
			SetThingProperty({ Property = "Graphic", Value = deathAnimation, DestinationId = currentRun.Hero.ObjectId })
			wait( 10 )
		end
	end

-- ending
GlobalVoiceLines.EndingDeathVoiceLines =
{
	{
		SkipAnim = true,
		NoTarget = true,
		RandomRemaining = true,
		PreLineWait = 6,

		-- Urgh... can't... hold... on...
		{ Cue = "/VO/ZagreusField_4646" },
		-- Grr... I... can't...
		{ Cue = "/VO/ZagreusField_4647" },
		-- Won't... go... back...!
		{ Cue = "/VO/ZagreusField_4648" },
		-- No... not... yet...
		{ Cue = "/VO/ZagreusField_4649" },
		-- I'll... be... back...
		{ Cue = "/VO/ZagreusField_4650" },
		-- Urgh... mmm... ungh...
		{ Cue = "/VO/ZagreusField_4651" },
		-- Khh... uhhh... urgh...
		{ Cue = "/VO/ZagreusField_4652" },
		-- Mmph... rrkh... ungh...
		{ Cue = "/VO/ZagreusField_4653" },
	},
}
function SurfaceDeathPresentation( currentRun )

	AddInputBlock({ Name = "DeathPresentation" })
	ClearCameraClamp({ LerpTime = 1.5 })
	PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 1.5, })
	FocusCamera({ Fraction = 1.1, Duration = 1.5, ZoomType = "Ease" })
	ZeroMouseTether("DeathPresentation")
	DisableCombatControls()
	UnblockCombatUI("Surface")
	DestroyCombatUI( "Death" )
	ClearStoredAmmoHero()
	SetConfigOption({ Name = "UseOcclusion", Value = false })

	StopAmbientSound({ All = true })

	Stop({ Id = currentRun.Hero.ObjectId })
	Halt({ Id = currentRun.Hero.ObjectId })

	currentRun.Hero.Mute = false
	SetPlayerInvulnerable( "PlayerDeath" )
	-- PlaySound({ Name = "/SFX/Player Sounds/PlayerDeath" })

	-- thread( PlayVoiceLines, GlobalVoiceLines.EndingDeathVoiceLines )

	-- black out world
	AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })
	ScreenAnchors.DeathBackground = CreateScreenObstacle({ Name = "rectangle01", Group = "Combat_UI", X = ScreenCenterX, Y = ScreenCenterY })
	SetScale({ Id = ScreenAnchors.DeathBackground, Fraction = 10 })
	SetColor({ Id = ScreenAnchors.DeathBackground, Color = Color.Black })
	SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 0, Duration = 0 })
	SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0.3 })

	RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing" })
	thread( DoRumble, currentRun.Hero.HeroSurfaceDeathRumbleParameters )

	--Flash({ Id = currentRun.Hero.ObjectId, Speed = 4, MinFraction = 1.0, MaxFraction = 1.0, Color = Color.Red, Duration = 0.15 })
	--SetGoalAngle({ Id = currentRun.Hero.ObjectId, Angle = 200, CompleteAngle = true }) -- this was causing a snap
	local deathAngleFace = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = currentRun.Hero.ObjectId, OffsetX = -200, OffsetY = 100 })	
	wait( 0.02 )
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = deathAngleFace })
	wait( 0.08 )

	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal2" })

	SetThingProperty({ Property = "Graphic", Value = "ZagreusInjured_SickStanding_ToDeath", DestinationId = currentRun.Hero.ObjectId })

    -- local criticalSlowHoldTime = 0
	-- FocusCamera({ Fraction = 1.0, Duration = 0.3, ZoomType = "Ease" })
	-- SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = CurrentRun.Hero.ObjectId })
	-- SetThingProperty({ Property = "Graphic", Value = "ZagreusOnHitFinal", DestinationId = CurrentRun.Hero.ObjectId })
	-- Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 1.65, MinFraction = 1.0, MaxFraction = 0.0, Color = Color.Red, Duration = 0.15, ExpireAfterCycle = true })
	-- thread( DeathFrameHold )

	--[[
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
	]]
	wait(0.15)

	--SetThingProperty({ Property = "Grip", Value = "Default", DestinationId = CurrentRun.Hero.ObjectId })
	-- StopFlashing({ Id = CurrentRun.Hero.ObjectId })
	-- local zagreusDeathFlash = CreateScreenComponent({ Name = "rectangle01", Group = "Overlay" })
	-- SetAnimation({ DestinationId = zagreusDeathFlash.Id, Name = "ZagreusDeathFlash" })
	
	thread( DisplayLocationText, nil, { Text = "OutroDeathMessageAlt", Delay = 1.15, Color = Color.Red, Layer = "Overlay", AnimationName = "LocationTextBGDeath", AnimationOutName = "LocationTextBGDeathOut", Duration = 4.25 } )


	wait( 0.3 )
	-- Destroy({ Id = zagreusDeathFlash.Id })

	wait(0.55)

	local ambientSoundId = PlaySound({ Name = "/Leftovers/Object Ambiences/WaterRushingBloodFall" })

	for index, requirements in pairs(GameData.FlashbackRequirements) do
		if IsGameStateEligible( CurrentRun, requirements ) then
			GameState.Flags.AllowFlashback = true
		end
	end

	wait(11.8)

	StopSound({ Id = ambientSoundId, Duration = 4 })

	RemoveInputBlock({ Name = "DeathPresentation" })
	UnblockCombatUI("Death")
	SetConfigOption({ Name = "UseOcclusion", Value = true })

end

function RoomEntranceHades( currentRun, currentRoom )
	local hadesId = 510857
	if currentRoom.Encounter.Name == "BossHadesPeaceful" then
		hadesId = 552710
	end

	HideCombatUI("BossEntrance")
	ZeroMouseTether("BossEntrance")
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or RoomData.BaseRoom.IntroSequenceDuration or 0.0

	FadeOut({ Color = Color.White, Duration = 0 })
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })

	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay=0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay=0 })

	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0, Delay = 0.1 })

	SetVolume({ Id = OutdoorAmbientSoundId, Value = 0.0, Duration = 5 })
	OutdoorAmbientSoundId = nil

	wait(0.03)

	AdjustZoom({ Fraction = CurrentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 5.5 })
	LockCamera({ Id = hadesId, Duration = roomIntroSequenceDuration })
	FullScreenFadeInAnimation()
	AdjustColorGrading({ Name = "Rain", Duration = 0 })
	AdjustColorGrading({ Name = "Off", Duration = 4 })

	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	local initialSpeed = GetUnitDataValue({ Id = currentRun.Hero.ObjectId, Property = "Speed" })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })

	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = currentRun.Hero.ObjectId })

	thread( PlayVoiceLines, currentRoom.EnterVoiceLines, true )
	thread( PlayVoiceLines, GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true )

	if currentRoom.HeroEndPoint ~= nil then
		Move({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Mode = "Precise" })

		local notifyName = "WithinDistance"..currentRoom.HeroEndPoint
		NotifyWithinDistance({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Distance = 30, Notify = notifyName })
		waitUntil( notifyName )
	end
	Stop({ Id = currentRun.Hero.ObjectId })

	SetUnitProperty({ Property = "StartGraphic", Value = "FuryStart", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "FuryStop", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	wait( 0.3 )
	--LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	UnzeroMouseTether("BossEntrance")
	UnblockCombatUI("BossEntrance")end
