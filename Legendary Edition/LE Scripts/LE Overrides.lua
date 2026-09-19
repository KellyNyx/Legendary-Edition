if not LegendaryEdition.Config.Enabled then return end
--Damage Function Overrides--

--Damage Override--
ModUtil.BaseOverride("Damage", function ( victim, triggerArgs )

	if victim == nil or victim.Health == nil or ( victim.IsDead and not triggerArgs.PureDamage ) then
		return
	end

	triggerArgs.triggeredById = triggerArgs.triggeredById  or victim.ObjectId
	triggerArgs.TriggeredByTable = triggerArgs.TriggeredByTable or victim

	if not triggerArgs.PureDamage then
		if triggerArgs.IsInvulnerable or (victim.InvulnerableFlags ~= nil and not IsEmpty( victim.InvulnerableFlags )) or (victim.PersistentInvulnerableFlags ~= nil and not IsEmpty( victim.PersistentInvulnerableFlags )) then
			if not triggerArgs.Silent then
				thread( BlockedDamageInvulnerablePresentation, victim, triggerArgs )
			end
			return
		end

		local attacker = triggerArgs.AttackerTable
		local sourceProjectileData = nil
		local sourceEffectData = nil
		local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
		if triggerArgs.SourceProjectile ~= nil then
			sourceProjectileData = ProjectileData[triggerArgs.SourceProjectile]
		end
		if triggerArgs.EffectName ~= nil then
			sourceEffectData = EffectData[triggerArgs.EffectName]
		end
		local baseDamage = triggerArgs.DamageAmount
		local multipliers = CalculateDamageMultipliers( attacker, victim, sourceWeaponData, triggerArgs )
		local additive = CalculateDamageAdditions( attacker, victim, triggerArgs )
		triggerArgs.DamageAmount = round(triggerArgs.DamageAmount * multipliers) + additive
		CalculateLifestealModifiers( attacker, victim, sourceWeaponData, triggerArgs )

		if victim.AIEndHealthThreshold ~= nil then
			local healthThreshold = victim.MaxHealth * victim.AIEndHealthThreshold
			local remainingThresholdHealth = (victim.Health - healthThreshold) + 1
			if triggerArgs.DamageAmount > remainingThresholdHealth then
				triggerArgs.DamageAmount = remainingThresholdHealth
			end
		end

		if ConfigOptionCache.EasyMode and victim == CurrentRun.Hero then
			triggerArgs.DamageAmount = math.ceil( triggerArgs.DamageAmount * CalcEasyModeMultiplier() )
			if CurrentRun.EasyModeLevel == nil then
				CurrentRun.EasyModeLevel = GameState.EasyModeLevel
			end
		end

		if triggerArgs.DamageAmount > 0 and not triggerArgs.Silent and (sourceEffectData == nil or not sourceEffectData.RapidDamageType ) and ( sourceWeaponData == nil or not sourceWeaponData.RapidDamageType ) then
			if victim.DamagedAnimation ~= nil then
				local damagedAnimBlocked = false
				if victim.ActiveEffects ~= nil then
					for effectName, v in pairs( victim.ActiveEffects ) do
						local effectData = EffectData[effectName]
						if effectData ~= nil and effectData.BlockDamageAnimation then
							damagedAnimBlocked = true
						end
					end
				end
				if not damagedAnimBlocked then
					SetAnimation({ DestinationId = victim.ObjectId, Name = victim.DamagedAnimation })
				end
			end
			thread( GenericDamagePresentation, victim, triggerArgs )
		end
	end

	if victim == CurrentRun.Hero then

		victim.Health = victim.Health - triggerArgs.DamageAmount
		if triggerArgs.MinHealth ~= nil and victim.Health < triggerArgs.MinHealth then
			victim.Health = triggerArgs.MinHealth
		end
		if victim.Health <= 0 then
			victim.Health = 0
			DamageHero( victim, triggerArgs )
			if CheckLastStand( victim, triggerArgs ) then
				return
			end
		else
			DamageHero( victim, triggerArgs )
		end
	else
		DamageEnemy( victim, triggerArgs )
	end

	if BlockHeroDeath and victim == CurrentRun.Hero then
		victim.CannotDieFromDamage = true
	end

	if victim.Health <= 0 and not victim.CannotDieFromDamage then
		if victim.ClearChillOnDeath then
			ClearEffect({ Id = victim.ObjectId, Name = "DemeterSlow" })
		end
		if victim.Phases ~= nil and victim.CurrentPhase < victim.Phases then
			SetUnitInvulnerable( victim )
			ClearEffect({ Id = victim.ObjectId, All = true, ExcludeNames = { "BeamRotation" } })
			return
		end
		triggerArgs.Killed = true
		if victim.DeathAnimation ~= nil and not victim.ManualDeathAnimation then
			SetAnimation({ Name = victim.DeathAnimation, DestinationId = victim.ObjectId })
			-- @todo Notify on death animation finish
		end

		if victim.PreDeathFunctionName ~= nil then
			local onDeathFunction = _G[victim.PreDeathFunctionName]
			onDeathFunction( victim, victim.PreDeathFunctionArgs )
		end
		Kill( victim, triggerArgs )
	end

end)



ModUtil.BaseOverride("CheckLastStand", function ( victim, triggerArgs )

	if not HasLastStand( victim ) then
		return false
	end

	CancelOpeningCodex()
	CancelFishing()
	DisableCombatControls()

	local lastStandData = table.remove( victim.LastStands )
	local weaponName = lastStandData.WeaponName
	local lastStandHealth = lastStandData.HealAmount or 0
	local lastStandFraction = lastStandData.HealFraction or 0
	lastStandFraction = lastStandFraction + GetTotalHeroTraitValue( "LastStandHealFraction" )

	CurrentRun.Hero.LastStandsUsed = (CurrentRun.Hero.LastStandsUsed or 0) + 1

	ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "StyxPoison" })
	BlockEffect({ Id = CurrentRun.Hero.ObjectId, Name = "StyxPoison", Duration = 0.75 })
	SetPlayerInvulnerable("LastStand")

	triggerArgs.HasLastStand = HasLastStand( victim )
	ExpireProjectiles({ ExcludeNames = WeaponSets.ExpireProjectileExcludeProjectileNames })

	PlayerLastStandPresentationStart( triggerArgs )

	PlayerLastStandHeal( victim, triggerArgs, lastStandHealth, lastStandFraction )

	if GetNumLastStands( victim ) <= 0 and lastStandData.LastStandTimer == nil then
		thread( InCombatText, CurrentRun.Hero.ObjectId, "Hint_LastChance", 1.5, { PreDelay = 0.5, ShadowScale = 0.66 })
		PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteFiredUpLASTCHANCE", Delay = 0.5 })
	end
	if lastStandData.LastStandTimer then
		thread( DamageAfterInterval, lastStandData.LastStandTimer, 1000 )
	end
	thread( UpdateHealthUI, triggerArgs )

	PlayerLastStandPresentationEnd()

	EnableCombatControls()
	if weaponName ~= nil then
		FireWeaponFromUnit({ Weapon = weaponName, Id= victim.ObjectId, DestinationId = victim.ObjectId, AutoEquip = true })
	end

	wait( 1.0, RoomThreadName )


	SetPlayerVulnerable("LastStand")

	local LowHealthThreshold = 0.6

if HeroHasTrait("EPCAlectoTrait") then
	if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth ~= LowHealthThreshold and CurrentRun.Hero.LastStands ~= 0 then
		thread(EPCEnrageHarpyPermanent, CurrentRun.Hero, currentRun)
	end
end
	
	return true
end)

--AddLastStand Override--
ModUtil.BaseOverride("AddLastStand", function ( args )
	local unit = args.Unit or CurrentRun.Hero
	args.Unit = nil
	local count = args.Count or 1
	if not unit.LastStands then
		unit.LastStands = {}
	end

	for i = 1, count do
		if args.IncreaseMax then
			unit.MaxLastStands = unit.MaxLastStands or 0
			unit.MaxLastStands = unit.MaxLastStands + 1
			if ScreenAnchors.LifePipIds then
				local obstacleId = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 70 + unit.MaxLastStands * 32, Y = ScreenHeight - 95})
				SetAnimation({ Name = "ExtraLifeEmpty", DestinationId = obstacleId })
				table.insert(ScreenAnchors.LifePipIds, obstacleId )
			end
		end

		if unit.MaxLastStands and TableLength( unit.LastStands ) >= unit.MaxLastStands and not args.Silent then
			UpdateLifePips( unit )
			AtLastStandMaxPresentation( unit )
			return
		end

		if args.InsertAtEnd or ( IsMetaUpgradeActive("ExtraChanceReplenishMetaUpgrade") and args.Name ~= "ExtraChanceReplenishMetaUpgrade" ) then
			table.insert( unit.LastStands, 1, args )
			if not args.Silent then
				GainLastStandPresentation(1)
			end
		else
			table.insert( unit.LastStands, args )

			if not args.Silent then
				GainLastStandPresentation()
			end
		end
	end

	if not args.Silent then
		UpdateLifePips( unit )
	end

	
	local LowHealthThreshold = 0.6

	-- if HeroHasTrait("EPCAlectoTrait") then
	-- if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth > LowHealthThreshold and CurrentRun.Hero.MaxLastStands > 0 then PermaRageToggle = "IsOff" CurrentRun.Hero.RageFraction = 0.0 killWaitUntilThreads("PlayerPermanentEnraged") end
	-- end

end)

--RemoveLastStand--
ModUtil.BaseOverride("RemoveLastStand", function ( heroUnit, name )
	local unit = heroUnit or CurrentRun.Hero
	for i, lastStandData in pairs(unit.LastStands) do
		if lastStandData.Name == name then
			table.remove(unit.LastStands, i )
			return
		end
	end

	local LowHealthThreshold = 0.6

	-- if HeroHasTrait("EPCAlectoTrait") then
	-- if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth > LowHealthThreshold and CurrentRun.Hero.LastStands > 0 then PermaRageToggle = "IsOff" CurrentRun.Hero.RageFraction = 0.0 killWaitUntilThreads("PlayerPermanentEnraged") end
	-- end

end)

--Damage Hero Override--
ModUtil.BaseOverride("DamageHero", function ( victim, triggerArgs )
	local attacker = triggerArgs.AttackerTable
	local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
	local sourceEffectData = nil
	if triggerArgs.EffectName then
		sourceEffectData = EffectData[triggerArgs.EffectName ]
	end

	thread( CheckOnDamagedPowers, victim, attacker, triggerArgs )
	CalculateSuperGain( triggerArgs, sourceWeaponData, victim )

	if HeroHasTrait("EPCAlectoTrait") then
		thread(CalculatePlayerRageGain, triggerArgs, sourceWeaponData, victim )
	end

	local currentHealth = victim.Health
	local currentHealthFraction = victim.Health / victim.MaxHealth
	if triggerArgs.DamageAmount ~= nil and triggerArgs.DamageAmount > 0 then
		CancelOpeningCodex()
		CancelFishing()
		if IsScreenOpen("Codex") then
			CloseCodexScreen()
		end
	end

	if triggerArgs.DamageAmount ~= nil and triggerArgs.DamageAmount > 0 and not triggerArgs.Silent then

		if sourceWeaponData == nil or not sourceWeaponData.IgnoreInvulnerabilityFrameTrigger then
			if sourceEffectData == nil or not sourceEffectData.IgnoreInvulnerabilityFrameTrigger then
				thread( CheckInvulnerabilityFrameTrigger, victim, triggerArgs )
			end
		end

		if attacker ~= nil then
			if currentHealthFraction < (attacker.PlayerInjuredVoiceLineThreshold or victim.PlayerInjuredVoiceLineThreshold or 1.0) then
				if attacker.PlayerInjuredVoiceLines ~= nil then
					thread( PlayVoiceLines, attacker.PlayerInjuredVoiceLines, nil, attacker )
				else
					for k, unit in pairs( ActiveEnemies ) do
						if unit.PlayerInjuredReactionVoiceLines ~= nil then
							thread( PlayVoiceLines, unit.PlayerInjuredReactionVoiceLines, nil, unit )
						end
					end
				end
			end
		end

		if CurrentRun.CurrentRoom.Encounter ~= nil and not triggerArgs.PureDamage then
			local hasPlayerTakenDamage = CurrentRun.CurrentRoom.Encounter.PlayerTookDamage
			CurrentRun.CurrentRoom.Encounter.PlayerTookDamage = true

			if CurrentRun.ActiveObjectives.PerfectClear ~= nil then
				thread( MarkObjectiveFailed, "PerfectClear" )
				PerfectClearObjectiveFailedPresentation( CurrentRun )
			end

			if not hasPlayerTakenDamage and not CurrentRun.CurrentRoom.BlockClearRewards and not CurrentRun.CurrentRoom.PerfectEncounterCleared and IsCombatEncounterActive( CurrentRun ) then
				for i, traitData in pairs(CurrentRun.Hero.Traits) do
					local perfectClearDamageData = traitData.PerfectClearDamageBonus
					if perfectClearDamageData ~= nil then
						PerfectClearTraitFailedPresentation( traitData )
					end
				end
			end
		end

		local adjustedDamageAmount = triggerArgs.DamageAmount

		local attackerName = triggerArgs.AttackerName
		if attackerName ~= nil then
			DamageRecord[attackerName] = (DamageRecord[attackerName] or 0) + adjustedDamageAmount
			CurrentRun.DamageRecord[attackerName] = (CurrentRun.DamageRecord[attackerName] or 0) + adjustedDamageAmount
			GameState.EnemyDamage[attackerName] = (GameState.EnemyDamage[attackerName] or 0) + adjustedDamageAmount
		end
		if CurrentRun.Hero.RallyHealth.RallyActive and (sourceEffectData == nil or not sourceEffectData.NoRallyStore) and not triggerArgs.PureDamage then
			if CurrentRun.Hero.RallyHealth.HitsDrainRallyHealthMultiplier then
				CurrentRun.Hero.RallyHealth.Store = CurrentRun.Hero.RallyHealth.Store * CurrentRun.Hero.RallyHealth.HitsDrainRallyHealthMultiplier
			end
			CurrentRun.Hero.RallyHealth.Store = CurrentRun.Hero.RallyHealth.Store + adjustedDamageAmount * CurrentRun.Hero.RallyHealth.ConversionPercent
			thread(UpdateRallyHealthUI)
			thread(DrainRallyHealth)
		end

		TriggerCooldown( "BlockPerfectDash" )

	end

	-- Must be last so changes can be made to triggerArgs
	if math.ceil(currentHealth) ~= math.ceil(currentHealth + triggerArgs.DamageAmount) then
		triggerArgs.DamageAmount = math.ceil(currentHealth + triggerArgs.DamageAmount) - math.ceil(currentHealth)
		if not triggerArgs.Silent then
			HeroDamagePresentation( triggerArgs, sourceWeaponData )
		end
	end

	local lowHealthText = {}
	for i, traitData in pairs(CurrentRun.Hero.Traits) do
		local thresholdData = traitData.LowHealthThresholdText
		if thresholdData ~= nil and currentHealthFraction <= thresholdData.Threshold and (currentHealth + triggerArgs.DamageAmount) / ( victim.MaxHealth) > thresholdData.Threshold then
			lowHealthText[traitData.Name] = thresholdData.Text
			TraitUIActivateTrait(traitData)
		end
	end

	if not IsEmpty( lowHealthText ) and not triggerArgs.Silent then
		thread( LowHealthCombatTextPresentation, victim.ObjectId, lowHealthText )
	end

	if triggerArgs.DamageAmount ~= nil and triggerArgs.DamageAmount > 0 then
		InvalidateCheckpoint()
	end
	if not triggerArgs.Silent then
		thread( UpdateHealthUI, triggerArgs )
	end

	local LowHealthThreshold = 0.6

	-- if HeroHasTrait("EPCAlectoTrait") then
	-- if CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth > LowHealthThreshold and CurrentRun.Hero.MaxLastStands > 0 then PermaRageToggle = "IsOff" CurrentRun.Hero.RageFraction = 0.0 killWaitUntilThreads("PlayerPermanentEnraged") end
	-- end

	if HeroHasTrait("EPCAlectoTrait") then
    CheckIfPermaRageEligible(CurrentRun.Hero) end

end)

--DamageEnemy Override--
ModUtil.BaseOverride("DamageEnemy", function ( victim, triggerArgs )

	local sourceWeaponData = triggerArgs.AttackerWeaponData
	local attacker = triggerArgs.AttackerTable

	-- Used to detect death via artemis vulnerability crit even though it's cleared on a crit
	victim.ActiveEffectsAtDamageStart = {}
	if victim.ActiveEffects then
		victim.ActiveEffectsAtDamageStart = ShallowCopyTable( victim.ActiveEffects )
	end

	if triggerArgs.EffectName ~= nil and EffectData[triggerArgs.EffectName] and EffectData[triggerArgs.EffectName].NonPlayerDamageMultiplier then
		triggerArgs.DamageAmount = triggerArgs.DamageAmount * EffectData[triggerArgs.EffectName].NonPlayerDamageMultiplier
	end

	if triggerArgs.AttackerIsObstacle and CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.WallSlamMultiplier then
		triggerArgs.DamageAmount = triggerArgs.DamageAmount * CurrentRun.CurrentRoom.WallSlamMultiplier
	end

	if sourceWeaponData ~= nil then
		if sourceWeaponData.ForceCrit then
			triggerArgs.IsCrit = true
		end
	end

	if triggerArgs.DamageAmount == 0 then
		return
	end

	thread( CheckWallSlamPowers, victim, triggerArgs )
	thread( CheckOnDamagedPowers, victim, attacker, triggerArgs )
	thread( CheckComboPowers, victim, attacker, triggerArgs, sourceWeaponData )

	local healthProtected = ProcessHealthBuffer( victim, triggerArgs )
	if not healthProtected then
		victim.Health = victim.Health - triggerArgs.DamageAmount
		if triggerArgs.MinHealth ~= nil and victim.Health < triggerArgs.MinHealth then
			victim.Health = triggerArgs.MinHealth
		end
		if victim.Health < 0 then
			victim.Health = 0
		end
	end

	if not victim.EarlyExit and not victim.IsDead and victim.Health > 0 and triggerArgs.DamageAmount > 0 then
		CreateHealthBar( victim )
	end
	thread( UpdateHealthBar, victim, triggerArgs.DamageAmount, triggerArgs )

	if not victim.SkipDamageText then
		local weaponData = GetWeaponData(triggerArgs.AttackerTable, triggerArgs.SourceWeapon)
		if triggerArgs.DamageAmount > 0 or weaponData == nil or not weaponData.SkipDamageTextIfNoDamage then
			thread( DisplayDamageText, victim, triggerArgs )

			if (victim.HitShields ~= nil and victim.HitShields > 0) or (victim.HealthBuffer ~= nil and victim.HealthBuffer > 0) then
				thread( ArmorDamagePresentation, triggerArgs )
			else
				thread( DamagePresentation, triggerArgs )
			end
			thread( SpecialHitPresentation, triggerArgs )
			thread( WallHitPresentation, victim, triggerArgs )
		end
	end

	if not triggerArgs.VictimIsTraitor then
		if triggerArgs.IsCrit then
			if CheckCooldown( "CritSuper", 0.5 ) then
				BuildSuperMeter( CurrentRun, GetTotalHeroTraitValue("CriticalSuperGainAmount"))
			end
		end

		if triggerArgs.DamageAmount ~= nil and triggerArgs.AttackerId == CurrentRun.Hero.ObjectId then
			CalculateSuperGain( triggerArgs, sourceWeaponData, victim )
		end
	end

	if HeroHasTrait("EPCAlectoTrait") then
		thread(CalculatePlayerRageGain, triggerArgs, sourceWeaponData, victim )
	end

	local currentHealthFraction = victim.Health / victim.MaxHealth
	if victim.CriticalHealthVoiceLines ~= nil and currentHealthFraction < (victim.CriticalHealthVoiceLineThreshold or 1.0) then
		thread( PlayVoiceLines, victim.CriticalHealthVoiceLines, nil, victim )
	elseif victim.LowHealthVoiceLines ~= nil and currentHealthFraction < (victim.LowHealthVoiceLineThreshold or 1.0) then
		thread( PlayVoiceLines, victim.LowHealthVoiceLines, nil, victim )
	end

	if victim.AIEndHealthThreshold ~= nil then
		if currentHealthFraction <= victim.AIEndHealthThreshold and victim.Health > 0 then
			SetUnitInvulnerable( victim )
			if victim.ExpireEffectOnThreshold then
				ClearEffect({ Id = victim.ObjectId, Name = victim.ExpireEffectOnThreshold })
			end
			if victim.BecameInvulnerableGlobalVoiceLines then
				thread( PlayVoiceLines, GlobalVoiceLines[victim.BecameInvulnerableGlobalVoiceLines], nil, victim )
			end
		end
	end

	for i, data in pairs( GetHeroTraitValues( "OnDamageEnemyFunction")) do
		if data.FunctionName and _G[data.FunctionName] then
			_G[data.FunctionName]( data.FunctionArgs, attacker, victim )
		end
	end

	if sourceWeaponData ~= nil and HeroHasTrait("BowBondTrait") and not triggerArgs.PureDamage and not IsEmpty(ActiveEnemies) and ( not victim.SkipModifiers or victim.BondAlwaysApplies) then
		local shareData = GetHeroTraitValues("BondDamageShareData")[1]
		local enemyIds = GetAllKeys( ActiveEnemies )
		for index, id in pairs(enemyIds) do
			local enemy = ActiveEnemies[id]
			if enemy and not enemy.IsDead and IsEmpty( enemy.InvulnerableFlags ) and IsEmpty ( enemy.PersistentInvulnerableFlags )
				and enemy.ActiveEffects and enemy.ActiveEffects.MarkBondTarget and Contains(shareData.WeaponNames, sourceWeaponData.Name ) and not triggerArgs.EffectName then
				local damageAmount = triggerArgs.DamageAmount * shareData.Multiplier
				if HeroData.DefaultHero.HeroAlliedUnits[ enemy.Name ] and shareData.AlliedDamageMultiplier then
					damageAmount = damageAmount * shareData.AlliedDamageMultiplier
				end
				Damage( enemy, { EffectName = "DamageShare", DamageAmount = damageAmount, Silent = false, PureDamage = true } )
			end
		end
	end

	if sourceWeaponData ~= nil and sourceWeaponData.CauseLeap then
		victim.NeedsRetreatLeap = true
	elseif victim.DefaultAIData ~= nil then
		if victim.DefaultAIData.LeapRetreatAtHealthPercent and currentHealthFraction <= victim.DefaultAIData.LeapRetreatAtHealthPercent then
			victim.NeedsRetreatLeap = true
		elseif victim.DefaultAIData.RetreatLeapWhenHitChance and RandomChance(victim.DefaultAIData.RetreatLeapWhenHitChance) and triggerArgs.AttackerId == CurrentRun.Hero.ObjectId then
			victim.NeedsRetreatLeap = true
		elseif victim.DefaultAIData.FlankLeapWhenHit and triggerArgs.AttackerId == CurrentRun.Hero.ObjectId then
			victim.NeedsFlankLeap = true
		end
	end

	if victim.RageChargeMultiplier ~= nil then
		victim.RageHit = true
		local meterAmount = triggerArgs.DamageAmount * victim.RageChargeMultiplier * 0.01
		BuildRageMeter( CurrentRun, meterAmount, victim )
	end

	if victim.AggroSpawnsOnHit then
		local spawnIds = GetIds({ Name = "Spawner"..victim.ObjectId })
		for k, id in pairs(spawnIds) do
			if ActiveEnemies[id] ~= nil and not ActiveEnemies[id].IsDead then
				thread(AggroUnit, ActiveEnemies[id])
			end
		end
	end

	if victim.OnDamagedFunctionName ~= nil then
		local onDamagedFunction = _G[victim.OnDamagedFunctionName]
		thread( onDamagedFunction, victim, attacker )
	end

	if victim.OnFinalDamageFunctionName ~= nil and victim.Health <= 0 then
		local onFinalDamagedFunction = _G[victim.OnFinalDamageFunctionName]
		onFinalDamagedFunction( victim )
	end

	if attacker ~= nil and attacker == CurrentRun.Hero then
		victim.TimeOfLastPlayerDamage = _worldTime
	end

end)

--Heal Override--
ModUtil.BaseOverride("Heal", function ( victim, triggerArgs )

	if victim == nil or victim.Health == nil or victim.Health == victim.MaxHealth then
		return
	end

	local prevHealth = victim.Health

	if triggerArgs.HealFraction ~= nil then
		triggerArgs.HealAmount = round(victim.MaxHealth * triggerArgs.HealFraction)
	end
	if triggerArgs.HealAmount <= 0 then
		return
	end

	if triggerArgs.HealAmount ~= nil then

		victim.Health = victim.Health + triggerArgs.HealAmount
		if victim.Health > victim.MaxHealth then
			victim.Health = victim.MaxHealth
		end
	end

	triggerArgs.ActualHealAmount = victim.Health - prevHealth

	local sourceName = triggerArgs.AttackerName or "Unknown"

	if victim == CurrentRun.Hero then
		if not HealthRecord then
			HealthRecord = {}
		end
		HealthRecord[sourceName] = (HealthRecord[sourceName] or 0) + triggerArgs.ActualHealAmount
		CurrentRun.HealthRecord[sourceName] = (CurrentRun.HealthRecord[sourceName] or 0) + triggerArgs.HealAmount
		CurrentRun.ActualHealthRecord[sourceName] = (CurrentRun.ActualHealthRecord[sourceName] or 0) + triggerArgs.ActualHealAmount

		if HealthUI.ShowHealingText and not triggerArgs.Silent and not CurrentRun.CurrentRoom.HideEncounterText then
			OnPlayerHealed( triggerArgs )
			thread( UpdateHealthUI, triggerArgs )
		end

		for i, traitData in pairs( CurrentRun.Hero.Traits ) do
			local thresholdData = traitData.LowHealthThresholdText
			if thresholdData ~= nil and CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth > thresholdData.Threshold and (CurrentRun.Hero.Health - triggerArgs.ActualHealAmount ) / ( CurrentRun.Hero.MaxHealth) <= thresholdData.Threshold then
				TraitUIDeactivateTrait( traitData )
			end
		end
	else
		UpdateHealthBar( victim, -1 * triggerArgs.ActualHealAmount, triggerArgs )
		if triggerArgs.ActualHealAmount > 0 and not triggerArgs.Silent then
			DisplayEnemyHealingText( triggerArgs )
		end
	end

	local LowHealthThreshold = 0.6

	if HeroHasTrait("EPCAlectoTrait") then
		CheckIfPermaRageEligible(CurrentRun.Hero) end
end)

-- Death Functions Override --

    -- Kill Override --

    ModUtil.BaseOverride("Kill", function ( victim, triggerArgs )
	
		if victim.IsDead then
			-- Already killed
			return
		end
	
		if CurrentRun.Hero.HandlingDeath then
			-- No one can be killed after the hero dies, they can only be cleaned up directly
			return
		end
	
		triggerArgs = triggerArgs or {}
	
		local victimName = victim.Name
		local killer = triggerArgs.AttackerTable
		local destroyerId = triggerArgs.AttackerId
		local killingWeaponName = triggerArgs.SourceWeapon
		local currentRoom = CurrentRun.CurrentRoom
	
		if victim.DeathForce ~= nil and triggerArgs.ImpactAngle ~= nil and triggerArgs.ImpactAngle >= 0 then
			ApplyForce({ Id = victim.ObjectId, Speed = victim.DeathForce, Angle = triggerArgs.ImpactAngle })
		end
		if victim.HaltOnDeath then
			Halt({ Id = victim.ObjectId })
			Stop({ Id = victim.ObjectId })
		end
	
		for i, traitData in pairs ( CurrentRun.Hero.Traits ) do
			local data = traitData.GoldBonusDrop
			if data then
				currentRoom.MoneyDropActivations = currentRoom.MoneyDropActivations or 0
				if currentRoom.MoneyDropActivations < data.RoomCap and data.RequiredEffect and (( victim.ActiveEffects and victim.ActiveEffects[data.RequiredEffect] ) or (victim.ActiveEffectsAtDamageStart and victim.ActiveEffectsAtDamageStart[data.RequiredEffect] )) then
					currentRoom.MoneyDropActivations = currentRoom.MoneyDropActivations + 1
					CheckMoneyDrop( CurrentRun, currentRoom, victim, { Chance = 1, IgnoreRoomMoneyStore = true, MinParcels =1, MaxParcels = 1, MinValue = data.Amount, MaxValue = data.Amount} )
					CreateAnimation({ Name = "MoneyShower", DestinationId = victim.ObjectId })
				end
	
				if currentRoom.MoneyDropActivations >= data.RoomCap then
					TraitUIDeactivateTrait( traitData )
				end
			end
		end
	
		if victim.KillingWeaponBlockDeathWeapons ~= nil and Contains(victim.KillingWeaponBlockDeathWeapons , killingWeaponName) then
			SetUnitProperty({ Property = "OnDeathWeapon", Value = "null", DestinationId = victim.ObjectId })
			victim.SpawnsEnemyOnDeath = false
		end
	
		ClearEffect({ Id = victim.ObjectId, All = true, BlockAll = true, })
	
		if victim ~= CurrentRun.Hero then
			KillEnemy( victim, triggerArgs )
		end
	
		-- Kill Tracker
		currentRoom.Kills = currentRoom.Kills or {}
		currentRoom.Kills[victimName] = (currentRoom.Kills[victimName] or 0) + 1
	
		if currentRoom.RequiredKillsObject == victimName then
			if currentRoom.Kills[victimName] == currentRoom.RequiredKillsCount then
				if currentRoom.RequiredKillsWeapons == nil or Contains( currentRoom.RequiredKillsWeapons, triggerArgs.SourceWeapon ) then
					thread( PlayVoiceLines, currentRoom.RequiredKillVoiceLines or GlobalVoiceLines[victim.OnKillGlobalVoiceLines], true, nil, { Defer = true } )
				end
			end
		end
	
		if currentRoom.Encounter ~= nil then
			if currentRoom.Encounter.WipeEnemiesOnKill == victimName then
				DestroyRequiredKills( { BlockLoot = true, SkipIds = { victim.ObjectId } } )
			end
			if currentRoom.Encounter.SpawnThreadName ~= nil and CheckCancelSpawns( CurrentRun, currentRoom, currentRoom.Encounter ) then
				SetThreadWait( currentRoom.Encounter.SpawnThreadName, 0 )
			end
		end
	
		if victim ~= nil then
			if victim.OnKillGlobalVoiceLines ~= nil and currentRoom.Kills[victimName] >= victim.KillsRequiredForVoiceLines then
				thread( PlayVoiceLines, GlobalVoiceLines[victim.OnKillGlobalVoiceLines], true, nil, { Defer = true } )
			end
			if victim.OnKillVoiceLines ~= nil then
				thread( PlayVoiceLines, victim.OnKillVoiceLines, false )
			end
		end
	
		if victim.OnDeathCrowdReaction ~= nil then
			thread(CrowdReactionPresentation, victim.OnDeathCrowdReaction)
		end
	
		if victim.InSky then
			ObeyGravity({ Id = victim.ObjectId })
			SetAlpha({ Id = victim.ObjectId, Fraction = 1.0 })
		end
	
		if killingWeaponName ~= nil and EnemyData[victimName] ~= nil and not victim.SkipModifiers then
			GameState.WeaponKills[killingWeaponName] = (GameState.WeaponKills[killingWeaponName] or 0) + 1
			CurrentRun.CurrentRoom.CodexUpdates = CurrentRun.CurrentRoom.CodexUpdates or { Enemies = {}, CthonicGods = {}, OtherDenizens = {}, Weapons = {}}
			IncrementTableValue(CurrentRun.CurrentRoom.CodexUpdates.Weapons, killingWeaponName )
	
			CheckCodexUnlock( "Weapons", killingWeaponName )
			if WeaponData[killingWeaponName] and WeaponData[killingWeaponName].CodexWeaponName and WeaponData[killingWeaponName].CodexWeaponName ~= killingWeaponName then
				local codexName = WeaponData[killingWeaponName].CodexWeaponName
				GameState.WeaponKills[codexName] = (GameState.WeaponKills[codexName] or 0) + 1
				IncrementTableValue(CurrentRun.CurrentRoom.CodexUpdates.Weapons, codexName )
			end
		end
	
		if killer ~= nil and victim ~= nil and killer.NonHeroKillCombatText ~= nil and not victim.HideHealthBar and victim ~= CurrentRun.Hero then
			thread( InCombatText, killer.ObjectId, killer.NonHeroKillCombatText, 0.8, { SkipShadow = true } )
		end
		CheckOnKillWeaponUpgrades( destroyerId, victim, killingWeaponName )
	
		if ActiveEnemies[victim.ObjectId] ~= nil then
			if not victim.SkipRecordDestroyedState then
				RecordObjectState( CurrentRun.CurrentRoom, victim.ObjectId, "Destroyed", true )
			end
			LastEnemyKilled = victim
			CleanupEnemy( victim )
		end
		local obstacle = MapState.ActiveObstacles[victim.ObjectId]
		if obstacle ~= nil then
			if obstacle.AIThreadName ~= nil then
				killTaggedThreads( obstacle.AIThreadName )
			end
			if obstacle.AINotifyName ~= nil then
				killWaitUntilThreads( obstacle.AINotifyName )
			end
		end
	
		CheckMoneyDrop( CurrentRun, currentRoom, victim, victim.MoneyDropOnDeath )
	
		if victim.HealDropOnDeath ~= nil and RandomChance(victim.HealDropOnDeath.Chance) then
			DropHealth( victim.HealDropOnDeath.Name, victim.ObjectId, victim.HealDropOnDeath.Radius or 130, 0 )
		end
	
		if not IsEmpty( victim.StoredAmmo) then
			for i = 1, TableLength( victim.StoredAmmo ) do
				local ammoData = victim.StoredAmmo[i]
				ammoData.ForceMin = 75
				ammoData.ForceMax = 200
				ammoData.UpwardForceMin = 500
				ammoData.UpwardForceMax = 700
				ammoData.Angle = nil
				ammoData.LocationX = nil
				ammoData.LocationY = nil
				ammoData.Count = ammoData.Count
				CheckAmmoDrop( CurrentRun, victim.ObjectId, ammoData )
			end
		end
	
		if victim.ReloadSoundId ~= nil then
			StopSound({ Id = victim.ReloadSoundId, Duration = 0.2 })
		end
		if victim.PreAttackLoopingSoundId ~= nil then
			StopSound({ Id = victim.PreAttackLoopingSoundId, Duration = 0.2 })
		end
	
		if not triggerArgs.SkipOnDeathFunction then
			if victim.OnDeathFunctionName ~= nil then
				local onDeathFunction = _G[victim.OnDeathFunctionName]
				onDeathFunction( victim, victim.OnDeathFunctionArgs )
			end
			if victim.OnDeathThreadedFunctionName ~= nil then
				local onDeathThreadedFunction = _G[victim.OnDeathThreadedFunctionName]
				thread( onDeathThreadedFunction, victim, victim.OnDeathFunctionArgs )
			end
		end
	
		if victim.OnDeathShakeScreenSpeed ~= nil then
			local distanceToPlayer = GetDistance({ Id = triggerArgs.triggeredById, DestinationId = CurrentRun.Hero.ObjectId })
			local shakeSpeed = victim.OnDeathShakeScreenSpeed or 0
			local shakeDistance = victim.OnDeathShakeScreenDistance or 0
			local shakeDuration = victim.OnDeathShakeScreenDuration or 0
			if distanceToPlayer > 500 and distanceToPlayer <= 1000 then
				shakeSpeed = shakeSpeed * 0.75
				shakeDistance = shakeDistance * 0.75
				shakeDuration = shakeDuration * 0.75
			elseif distanceToPlayer > 1000 then
				shakeSpeed = shakeSpeed * 0.5
				shakeDistance = shakeDistance * 0.5
				shakeDuration = shakeDuration * 0.5
			end
			ShakeScreen({ Speed = shakeSpeed, Distance = shakeDistance, Duration = shakeDuration, FalloffSpeed = victim.OnDeathShakeScreenFalloff, Angle = victim.OnDeathShakeScreenAngle })
		end
	
		if victim.RespawnInPlaceOnDeath then
			local deathLocationId = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = victim.ObjectId })
			thread( RespawnVictim, victim.Name, deathLocationId, victim.RespawnDelay, { DestroySpawnLocation = true, } )
		end
	
		if victim.RespawnAtIdOnDeath then
			thread( RespawnVictim, victim.Name, victim.RespawnAtIdOnDeath, victim.RespawnDelay )
		end
	
		if victim.RespawnOnDeath and victim.OriginalSpawnLocationId ~= nil then
			thread( RespawnVictim, victim.Name, victim.OriginalSpawnLocationId, victim.RespawnDelay )
		end
	
		if victim.SpawnedUnitAnimation ~= nil then
			StopAnimation({ Name = victim.SpawnedUnitAnimation, DestinationId = victim.ObjectId })
		end
	
		if victim.FuseWarningAnimation then
			StopAnimation({ Name = victim.FuseWarningAnimation, DestinationId = victim.ObjectId })
		end
	
		if victim.MultiFuryObstacleIds ~= nil then
			for name, id in pairs(victim.MultiFuryObstacleIds) do
				Destroy({ Ids = id })
			end
		end
	
		thread( HandleTetherParentDeath, victim )
	
		if victim.SpawnObstaclesOnDeath ~= nil then
			for k, spawnData in pairs(victim.SpawnObstaclesOnDeath) do
				local spawnId = SpawnObstacle({ Name = spawnData.Name, Group = spawnData.GroupName or "Standing", DestinationId = victim.ObjectId })
				if spawnData.UpwardForce ~= nil and spawnData.UpwardForce > 0 then
					SetThingProperty({ Property = "OffsetZ", Value = 0, DestinationId = spawnId })
					SetThingProperty({ Property = "StopsProjectiles", Value = true, DestinationId = spawnId })
					SetThingProperty({ Property = "StopsUnits", Value = true, DestinationId = spawnId })
					ApplyUpwardForce({ Id = spawnId, Speed = spawnData.UpwardForce })
					ApplyForce({ Id = spawnId, Speed = RandomFloat( spawnData.RandomForceMin or 0, spawnData.RandomForceMax or 0 ), Angle = RandomFloat( 0, 360 ) })
				end
				if spawnData.HSV ~= nil then
					SetHSV({ Id = spawnId, HSV = spawnData.HSV })
				end
				if spawnData.Color ~= nil then
					SetColor({ Id = spawnId, Color = spawnData.Color })
				end
				if spawnData.Outline ~= nil then
					spawnData.Outline.Id = spawnId
					AddOutline( spawnData.Outline )
				end
			end
		end
	
		if victim.SpawnUnitOnDeath ~= nil then
			local newUnit = DeepCopyTable( EnemyData[victim.SpawnUnitOnDeath] )
			newUnit.ObjectId = SpawnUnit({ Name = victim.SpawnUnitOnDeath, Group = "Standing", DestinationId = victim.ObjectId, DoActivatePresentation = false })
			SetupEnemyObject( newUnit, CurrentRun)
		end
	
		if victim.SpawnBossOnDeath ~= nil then
			local newUnit = DeepCopyTable( EnemyData[victim.SpawnBossOnDeath] )
			newUnit.ObjectId = SpawnUnit({ Name = victim.SpawnBossOnDeath, Group = "Standing", DestinationId = victim.ObjectId, DoActivatePresentation = false })
			SetupEnemyObject( newUnit, CurrentRun)
			SetupBoss( newUnit, CurrentRun)
		end
	
		if victim.GroupAI ~= nil and ActiveGroupAIs[victim.GroupAI] ~= nil then
			RemoveValueAndCollapse( ActiveGroupAIs[victim.GroupAI], victim )
		end
	
		if victim.OnDeathVoiceLines then
			thread( PlayVoiceLines, victim.OnDeathVoiceLines, nil, victim )
		end
	
		if victim.StopBiomeTimerIfComboPartnerDead and not victim.CannotDieFromDamage then
			local bothBossesDead = false
			local partnerId = GetClosestUnitOfType({ Id = victim.ObjectId, DestinationName = victim.ComboPartnerName })
			if partnerId == 0 or RequiredKillEnemies[partnerId] == nil or RequiredKillEnemies[partnerId].IsDead or RequiredKillEnemies[partnerId].Health <= 0 then
				bothBossesDead = true
			end
		end
	
		MapState.ActiveObstacles[victim.ObjectId] = nil
		ActiveEnemies[victim.ObjectId] = nil
		if RequiredKillEnemies[victim.ObjectId] ~= nil then
			RequiredKillEnemies[victim.ObjectId] = nil
			GameState.TotalRequiredEnemyKills = (GameState.TotalRequiredEnemyKills or 0) + 1
			if not victim.SpawnsEnemyOnDeath then
				notifyExistingWaiters( "RequiredKillEnemyKilledOrSpawned" )
				notifyExistingWaiters("RequiredEnemyKilled")
			end
			if currentRoom.Encounter.RequiredKillFunctionName ~= nil then
				local requiredKillFunction = _G[currentRoom.Encounter.RequiredKillFunctionName]
				if requiredKillFunction ~= nil then
					requiredKillFunction( currentRoom.Encounter, victim, killer )
				end
			end
		end
	
		if victim.UnuseableWhenDead then
			RefreshUseButton( victim.ObjectId, victim )
		end
	
		if victim == CurrentRun.Hero then
			KillHero( victim, triggerArgs )
		else
			KillPresentation( victim, triggerArgs )
			if not triggerArgs.SkipDestroyDelay then
				wait( victim.DestroyDelay )
			end
			if not triggerArgs.SkipDestroy then
				Destroy({ Id = victim.ObjectId })
			end
		end
	
	end)

    -- KillHero Override --

    ModUtil.BaseOverride("KillHero", function ( victim, triggerArgs )
		local killer = triggerArgs.AttackerTable
		local currentRun = CurrentRun
		local killingUnitWeapon = triggerArgs.SourceWeapon
		local killingUnitId = triggerArgs.AttackerId
		local killingUnitName = triggerArgs.AttackerName
		local enemyData = EnemyData[killingUnitName]
	
		thread( CheckOnDeathPowers, victim, killer, killingUnitWeapon )
	
		killTaggedThreads( RoomThreadName )
		if currentRun.CurrentRoom.Encounter ~= nil then
			killTaggedThreads( currentRun.CurrentRoom.Encounter.SpawnThreadName )
		end
		killWaitUntilThreads( "RequiredKillEnemyKilledOrSpawned" )
		killWaitUntilThreads( "AllRequiredKillEnemiesDead" )
		killWaitUntilThreads( "AllEncounterEnemiesDead" )
		killWaitUntilThreads( "RequiredEnemyKilled" )
		killWaitUntilThreads( UIData.BoonMenuId )
	
		EndAmbience( 0.5 )
		EndMusic( MusicId, MusicName, triggerArgs.MusicEndTime or 0.0 )
	
		if killer == nil then
			killer = {}
			killer.Name = killingUnitName
			killer.ObjectId = killingUnitId
		end
	
		LastKilledByUnitName = killer.Name
		LastKilledByWeaponName = killingUnitWeapon
	
		if currentRun.DeathFunctionName ~= nil then
			local deathFunction = _G[currentRun.DeathFunctionName]
			deathFunction( currentRun, killer, killingUnitWeapon )
		else
			HandleDeath( currentRun, killer, killingUnitWeapon )
		end
	end)

    -- HandleDeath Override --

	ModUtil.BaseOverride("HandleDeath", function ( currentRun, killer, killingUnitWeapon ) 
	
		if GetConfigOptionValue({ Name = "EditingMode" }) then
			SetAnimation({ Name = "ZagreusDeadStartBlood", DestinationId = currentRun.Hero.ObjectId })
			return
		end
	
		SendSaveFileEmail({ })
	
		AddTimerBlock( currentRun, "HandleDeath" )
		if ScreenAnchors.TraitTrayScreen ~= nil then
			CloseAdvancedTooltipScreen()
		end
		ClearHealthShroud()
		CurrentRun.Hero.HandlingDeath = true
		CurrentRun.Hero.IsDead = true
		CurrentRun.ActiveBiomeTimer = false
		if ConfigOptionCache.EasyMode and not currentRun.Cleared then
			GameState.EasyModeLevel = GameState.EasyModeLevel + 1
		end
		if not CurrentRun.Cleared then -- Already recorded if cleared
			RecordRunStats()
		end
	
		InvalidateCheckpoint()
	
		ZeroSuperMeter()
		FinishTargetMarker( killer )
	
		local deathPresentationName = currentRun.DeathPresentationFunctionName or "DeathPresentation"
		local deathPresentationFunction = _G[deathPresentationName]
		if HeroHasTrait( "EPC_CharacterHandlerTrait" )
        then deathPresentationName = "CurrentCharacterDeathPresentation" else
			deathPresentationName = currentRun.DeathPresentationFunctionName or "DeathPresentation"
		end

		deathPresentationFunction( currentRun, killer, killingUnitWeapon )
		AddInputBlock({ Name = "MapLoad" })
	
		currentRun.CurrentRoom.EndingHealth = currentRun.Hero.Health
		currentRun.EndingMoney = currentRun.Money
		table.insert( currentRun.RoomHistory, currentRun.CurrentRoom )
		UpdateRunHistoryCache( currentRun, currentRun.CurrentRoom )
	
		currentRun.Money = 0
		currentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade")
	
		ResetObjectives()
		ActiveScreens = {}
	
		CurrentRun.Hero.HandlingDeath = false
		CurrentRun.Hero.Health = CurrentRun.Hero.MaxHealth
	
		local currentRoom = currentRun.CurrentRoom
		local deathMap = "DeathArea"
		GameState.LocationName = "Location_Home"
		RandomSetNextInitSeed()
		SaveCheckpoint({ StartNextMap = deathMap, DevSaveName = CreateDevSaveName( currentRun, { StartNextMap = deathMap } ) })
		ClearUpgrades()
	
		SetConfigOption({ Name = "FlipMapThings", Value = false })
	
		local runNumber = (GetCompletedRuns()+1)
		local runDepth = GetRunDepth( currentRun )
	
		LoadMap({ Name = deathMap, ResetBinks = true, ResetWeaponBinks = true })
	end)

    -- DeathPresentation Override --

	ModUtil.BaseOverride("DeathPresentation", function ( currentRun, killer, killingUnitWeapon )

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

		
	    local currentWeaponInSlot = GetEquippedWeapon()
		local traitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
		local CurrentCharacterDeathVoicelines = TraitData[traitName].DeathVoiceLines or GlobalVoiceLines.DeathVoiceLines
		local CurrentCharacterRunClearedVoicelines = TraitData[traitName].RunClearedVoiceLines or GlobalVoiceLines.DeathVoiceLines
		local CurrentCharacterDeathAnimation = TraitData[traitName].DeathAnimation or "ZagreusDeathFullscreen"
		local CurrentCharacterPostEndingDeathAnimation = TraitData[traitName].PostEndingDeathAnimation or "ZagreusDeathPostEndingFullscreen"
		local CurrentCharacterDeathIdleAnimation = TraitData[traitName].DeathIdleAnimation or "ZagreusOnHitFinal"
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
	
		
		if CurrentRun.Cleared then 
			thread( PlayVoiceLines, CurrentCharacterRunClearedVoicelines ) else
				thread( PlayVoiceLines, CurrentCharacterDeathVoicelines )
			end
	
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
			deathAnimation = CurrentCharacterPostEndingDeathAnimation
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
	end)

	--WindowDropEntrance Override--
	ModUtil.BaseOverride("WindowDropEntrance", function ( currentRun, currentRoom )

		ZeroMouseTether( "RoomEntranceOpening" )
		wait(0.03)
	
		FadeIn({ Duration = 1.0 })
		SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0 })
		thread( InvalidatePerfectLanding )
	
		if( currentRun.Hero.AttachedLightId ~= nil ) then
			SetAlpha({ Id = currentRun.Hero.AttachedLightId, Fraction = 0 })
		end
		FullScreenFadeInAnimation()
		if currentRoom.HeroEndPoint ~= nil then
			if HeroHasTrait("EPCHadesTrait") and HeroHasTrait("EPC_CharacterHandlerTrait") then thread(HadesIntroPresentation, currentRun.Hero.ObjectId, currentRun.Hero.AttachedLightId) 
			elseif HeroHasTrait( "EPC_CharacterHandlerTrait" ) then	
			thread(DoCurrentCharacterIntroLanding, currentRun.Hero.ObjectId, currentRun.Hero.AttachedLightId, currentRoom.HeroEndPoint, true, 1, 1.8, 50 )
			else
			thread( DropHeroToRoomPosition, currentRun.Hero.ObjectId, currentRun.Hero.AttachedLightId, currentRoom.HeroEndPoint, true, 1, 1.8, 50 )
		end
		AdjustZoom({ Fraction = 0.5, LerpTime = 0.02 })
		LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0.0, OffsetX = 0 })
		wait(0.02)
		AdjustZoom({ Fraction = currentRun.CurrentRoom.ZoomFraction or 0.75, LerpTime = 8.0 })
		wait(1.2)
		thread( PlayVoiceLines, currentRoom.EnterVoiceLines )
		thread( PlayVoiceLines, GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true )
		thread( RoomOpeningUIDelay )
		wait(1.28)
		--thread( CheckPerfectLanding )
		wait(1.22)
		UnzeroMouseTether( "RoomEntranceOpening" )
	end
end)

	    -- DropHeroToRoomPosition Override --

		ModUtil.BaseOverride("DropHeroToRoomPosition", function ( heroId, lightId, heroDestination, disableCollision, dropDelay, landDelay, speedAdjustment )
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
			SetAnimation({ Name = "ZagreusHeroLanding_Air", DestinationId = heroId })
			SetThingProperty({ DestinationId = heroId, Property = "TouchdownGraphic", Value = "ZagreusHeroLanding_ReturnToIdle" })
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
				SetUnitProperty({ DestinationId = heroId, Property = "Speed", Value = 540 })
			end
			thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.2, Duration = 0.15 }, } )
			RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
			RemoveTimerBlock( CurrentRun, "MoveHeroToRoomPosition" )
		end)

		--RoomEntranceHades Override--
		ModUtil.BaseOverride("RoomEntranceHades", function ( currentRun, currentRoom )
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
		
			if HeroHasTrait( "EPC_CharacterHandlerTrait" ) then
			SetCurrentCharacterHadesEntranceAnimations()
			else

			SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusWalk", DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = currentRun.Hero.ObjectId })
			end

			--Place check for character handler trait here, this will check for
			--character voicelines--
		
			thread( PlayVoiceLines, currentRoom.EnterVoiceLines, true )
			thread( PlayVoiceLines, GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true )
		
			if currentRoom.HeroEndPoint ~= nil then
				Move({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Mode = "Precise" })
		
				local notifyName = "WithinDistance"..currentRoom.HeroEndPoint
				NotifyWithinDistance({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Distance = 30, Notify = notifyName })
				waitUntil( notifyName )
			end
			Stop({ Id = currentRun.Hero.ObjectId })

			if HeroHasTrait("EPC_CharacterHandlerTrait") then
			ResetCurrentCharacterAnimations() else
		
			SetUnitProperty({ Property = "StartGraphic", Value = "ZagreusStart", DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusRun", DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "StopGraphic", Value = "ZagreusStop", DestinationId = currentRun.Hero.ObjectId })
			SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = currentRun.Hero.ObjectId })
		end
			SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
			RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
		
			wait( 0.3 )
			--LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
			UnzeroMouseTether("BossEntrance")
			UnblockCombatUI("BossEntrance")end)

		--SetupHeroObject Function Override--

		ModUtil.BaseOverride("SetupHeroObject", function ( currentRun, applyLuaUpgrades )

			local heroIds = GetIdsByType({ Name = "_PlayerUnit" })
			DebugAssert({ Condition = #heroIds <= 1, Text = "Too many _PlayerUnit objects on map!" })
			currentRun.Hero.ObjectId = heroIds[1]
			AttachLua({ Id = currentRun.Hero.ObjectId, Table = currentRun.Hero})
		
			AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "HeroTeam" })
		
			GatherAndEquipWeapons( currentRun )

            --Moved To SetupHeroAttachedThings()--
		
			-- Laurel Crown VFX
		-- 	if currentRun.Hero.AttachedAnimationName ~= nil then
		-- 		CreateAnimation({ Name = currentRun.Hero.AttachedAnimationName, DestinationId = currentRun.Hero.ObjectId })
		-- 	end
		
		-- Hero Light
		-- 	if currentRun.Hero.AttachedLightName ~= nil and not currentRun.CurrentRoom.BlockHeroLight then
		-- 		local heroGroup = GetGroupName({ Id = currentRun.Hero.ObjectId, DrawGroup = true })
		-- 		local heroLightGroup = "HeroLight"
		-- 		local heroLightId = SpawnObstacle({ Name = currentRun.Hero.AttachedLightName, DestinationId = currentRun.Hero.ObjectId, Group = heroLightGroup })
		-- 		InsertGroupBehind({ Name = heroLightGroup, DestinationName = heroGroup })
		-- 		SetScale({ Id = heroLightId, Fraction = currentRun.Hero.AttachedLightScale })
		-- 		SetColor({ Id = heroLightId, Color = currentRun.Hero.AttachedLightColor })
		-- 		Attach({ Id = heroLightId, DestinationId = currentRun.Hero.ObjectId })
		-- 		currentRun.Hero.AttachedLightId = heroLightId
		-- 	end
		
			-- Clear per-room state dictionaries
			CurrentRun.Hero.InvulnerableFlags = {}
			CurrentRun.InvulnerableFlags = {}
			CurrentRun.PhasingFlags = {}
		
			-- Easy mode Check
			if ConfigOptionCache.EasyMode then
				if not HeroHasTrait( "GodModeTrait") then
					AddTraitToHero({ TraitName = "GodModeTrait", SkipUIUpdate = true })
				end
			else
				RemoveTrait( currentRun.Hero, "GodModeTrait" )
			end

			

			-- Build all upgrades.
			UpdateHeroTraitDictionary()
			ApplyTraitSetupFunctions( currentRun.Hero )
			ApplyMetaUpgrades( currentRun.Hero, applyLuaUpgrades )
			ApplyTraitAutoRamp( currentRun.Hero )
			ApplyTraitUpgrade( currentRun.Hero, applyLuaUpgrades )
			
			ApplyMetaModifierHeroUpgrades( currentRun.Hero, applyLuaUpgrades )
			ApplyAllTraitWeapons( currentRun.Hero )
		
			for k, trait in pairs( currentRun.Hero.Traits ) do
				if trait.RoomCooldown ~= nil then
					IncrementTraitCooldown( trait )
				end
				if trait.TimeCooldown ~= nil then
					IncrementTraitCooldown( trait, trait.TimeCooldown)
				end
			end
			-- Completes setup
			SetHeroProperties( currentRun )

			if HeroHasTrait( "EPC_CharacterHandlerTrait" )
            then DebugPrint({ Text = "Playing as different character, doing character setup..." })
            else SetupDefaultCharacter() DebugPrint({ Text = "Playing as Zagreus, doing default setup..." })
            end

			-- Hero Light
			if currentRun.Hero.AttachedLightName ~= nil and not currentRun.CurrentRoom.BlockHeroLight then
				local heroGroup = GetGroupName({ Id = currentRun.Hero.ObjectId, DrawGroup = true })
				local heroLightGroup = "HeroLight"
				local heroLightId = SpawnObstacle({ Name = currentRun.Hero.AttachedLightName, DestinationId = currentRun.Hero.ObjectId, Group = heroLightGroup })
				InsertGroupBehind({ Name = heroLightGroup, DestinationName = heroGroup })
				SetScale({ Id = heroLightId, Fraction = currentRun.Hero.AttachedLightScale })
				SetColor({ Id = heroLightId, Color = currentRun.Hero.AttachedLightColor })
				Attach({ Id = heroLightId, DestinationId = currentRun.Hero.ObjectId })
				currentRun.Hero.AttachedLightId = heroLightId
			end

		

			currentRun.Hero.PlayingVoiceLines = false
			currentRun.Hero.QueuedVoiceLines = {}
			currentRun.Hero.LastKillTime = nil
			currentRun.Hero.StatusAnimation = nil
			currentRun.Hero.PrevStatusAnimation = nil
			currentRun.Hero.BlockStatusAnimations = nil
			currentRun.Hero.FreezeInputKeys = {}
			currentRun.Hero.DisableCombatControlsKeys = {}
			currentRun.Hero.ActiveEffects = {}
			currentRun.Hero.Frozen = false
			currentRun.Hero.Mute = false
			currentRun.Hero.Reloading = false
			currentRun.Hero.KillStealVictimId = nil
			currentRun.Hero.KillStolenFromId = nil
			currentRun.Hero.ComboCount = 0
			currentRun.Hero.ComboReady = false
			currentRun.Hero.VacuumRush = false
			currentRun.Hero.WeaponSpawns = nil
			CurrentRun.Hero.TriggersOnDamageEffects = true
		    CurrentRun.Hero.TriggersOnHitEffects = true
		
			SetLightBarColor({ PlayerIndex = 1, Color = currentRun.Hero.LightBarColor or HeroData.DefaultHero.LightBarColor });
		
		end)

		--CheckAmmDrop Override--
		ModUtil.BaseOverride("CheckAmmoDrop", function ( currentRun, targetId, ammoDropData, numDrops )
			if HeroHasTrait("EPCHadesTrait") then 
				EPCCheckAmmoDropHades(currentRun, targetId, ammoDropData, numDrops) return end

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

			
		
			local consumableName = "AmmoPack"
			for i = 1, numDrops do
				ammoDropData.Count = ammoDropData.Count - 1
			end
		
			if IsMetaUpgradeActive("ReloadAmmoMetaUpgrade") then
				return
			end
		
			for i = 1, numDrops do
				local offset = {}
				if ammoDropData.Angle ~= nil then
					offset = CalcOffset( math.rad(ammoDropData.Angle + 180), 48 )
				end
				local consumableId = SpawnObstacle({ Name = consumableName, DestinationId = targetId, LocationX = ammoDropData.LocationX, LocationY = ammoDropData.LocationY, OffsetX = offset.X, OffsetY = offset.Y, Group = "Standing" })
				local consumable = CreateConsumableItem( consumableId, consumableName )
				consumable.AddAmmo = 1



				ApplyUpwardForce({ Id = consumableId, Speed = RandomFloat( ammoDropData.UpwardForceMin or 500, ammoDropData.UpwardForceMax or 700 ) })
				if ammoDropData.ForceMax ~= nil then
					ApplyForce({ Id = consumableId, Speed = RandomFloat( ammoDropData.ForceMin, ammoDropData.ForceMax ), Angle = ammoDropData.Angle or RandomFloat( 0, 360 ), SelfApplied = true })
				end
				local delay = GetTotalHeroTraitValue("AmmoDropUseDelay")
				if delay > 0 then
					SetInteractProperty({ DestinationId = consumableId, Property = "Cooldown", Value = delay })
					thread( DoUseDelay, consumableId, delay )
				end
		
				for i, data in pairs(GetHeroTraitValues("AmmoFieldWeapon")) do
					thread( FireAmmoWeapon, consumableId, data )
				end
				thread( EscalateMagnetism, consumable )
			end
		end)

		--Room entrance/exit function overrides--

		--PlayerEnterSecretDoorPresentation Override--

ModUtil.BaseOverride("PlayerEnterSecretDoorPresentation", function ( secretDoor )
    
    if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then DoCurrentCharacterSecretDoorEntrance() else
    SetAnimation({ Name = "ZagreusSecretDoorDive", DestinationId = CurrentRun.Hero.ObjectId })
	end

	thread( DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.7 }, } )
	Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 0.5, MinFraction = 0, MaxFraction = 1.0, Color = Color.White, Duration = 1.0, ExpireAfterCycle = false })
	AdjustColorGrading({ Name = secretDoor.EntranceColorGrade or "Chaos", Duration = 0.7 })
	wait(0.7)
	CreateAnimation({ Name = secretDoor.EntranceVfx or "ZagreusSecretDoorDiveFadeFx", DestinationId = CurrentRun.Hero.ObjectId })
	SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 0, Duration = 0.13 })
end)

--RoomEntrancePortal Override--
ModUtil.BaseOverride("RoomEntrancePortal", function ( currentRun, currentRoom )

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
	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then DoCurrentCharacterLeaveRoomAnim() else

    SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "TouchdownGraphic", Value = "ZagreusHeroLanding_ReturnToIdle" })

	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 1.0, Duration = 1.0 })
	SetAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = currentRoom.EntranceAnimation or RoomData.BaseSecret.EntranceAnimation })
	end

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
end)

--DelayedRemoveInputBlock Override (Just incase :P)--

ModUtil.BaseOverride("DelayedRemoveInputBlock", function ( delay, inputBlockName )
	wait( delay )
	RemoveInputBlock({ Name = inputBlockName })
end)

--LeaveRoomPresentation Override--

ModUtil.BaseOverride("LeaveRoomPresentation", function ( currentRun, exitDoor )

	

	local exitDoorId = exitDoor.ObjectId
	local door = OfferedExitDoors[exitDoorId]

	AddInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	HideCombatUI()

	if door ~= nil then
		if door.AdditionalIcons ~= nil and not IsEmpty( door.AdditionalIcons ) then
			Destroy({ Ids = door.AdditionalIcons })
			door.AdditionalIcons = nil
		end
		DestroyDoorRewardPresenation( door )
		if door.ExitDoorOpenAnimation ~= nil then
			SetAnimation({ DestinationId = exitDoorId, Name = door.ExitDoorOpenAnimation })
			thread( DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.4 }, } )
			wait( 0.7 )
		end
	end

	local heroExitIds = GetIdsByType({ Name = "HeroExit" })
	local heroExitPointId = GetClosest({ Id = exitDoorId, DestinationIds = heroExitIds, Distance = 600 })
	if heroExitPointId > 0 then

		local angleToExit = GetAngleBetween({ Id = exitDoorId, DestinationId = heroExitPointId })
		if angleToExit < 90 or angleToExit > 270 then
			currentRun.CurrentRoom.ExitDirection = "Right"
		else
			currentRun.CurrentRoom.ExitDirection = "Left"
		end

		PanCamera({ Id = heroExitPointId, Duration = 10.0 })
		SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
		local args = {}
		args.NodeSuccessDistance = 30
		local exitPath = exitDoor.ExitPath or currentRun.CurrentRoom.ExitPath or {}
		if door ~= nil and door.ExitThroughCenter then
			table.insert( exitPath, door.ObjectId )
		end
		table.insert( exitPath, heroExitPointId )
		thread( MoveHeroAlongPath, exitPath, args )
	else
		if exitDoorId ~= nil then
			AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = exitDoorId })
		end
		
		if HeroHasTrait( "EPC_CharacterHandlerTrait" )
        then DoCurrentCharacterLeaveRoomAnim() else

	    SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "TouchdownGraphic", Value = "ZagreusHeroLanding_ReturnToIdle" })

		SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0, Duration = 1.0 })
		SetAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = currentRun.CurrentRoom.ExitAnimation or RoomData.BaseSecret.ExitAnimation })
		end
		
		CreateAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = currentRun.CurrentRoom.ExitVfx or RoomData.BaseSecret.ExitVfx })
		if door ~= nil and door.ExitPortalSound then
			PlaySound({ Name = door.ExitPortalSound or "/SFX/Menu Sounds/ChaosRoomEnterExit" })
		end
	end

	--[[local nextZoom = exitDoor.Room.ZoomFraction or exitDoor.Room.PreviousRoomAdjustToZoomFraction
	if currentRun.CurrentRoom.ZoomFractionAdjustForWeights then
		nextZoom = 1 + (1 - nextZoom)
	end
	if nextZoom ~= nil then
		AdjustZoom({ Fraction = nextZoom or 1.0, LerpTime = currentRun.CurrentRoom.ZoomFractionAdjustTime or 1.4 })
	end]]

	LeaveRoomAudio( currentRun, exitDoor )

	wait(0.4)

	if door ~= nil and door.ExitDoorCloseAnimation ~= nil then
		SetAnimation({ DestinationId = exitDoorId, Name = door.ExitDoorCloseAnimation })
		thread( DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.2 }, } )
	end

	wait(0.2)

	--SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0, Duration = 0.3 })
	FullScreenFadeOutAnimation( currentRun.CurrentRoom.FadeOutAnimation )
	ShowInterMapComponents()

	AllowShout = false

	RemoveInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
end)

--PlayInteractAnimation Override--

ModUtil.BaseOverride("PlayInteractAnimation", function ( interactableObjectId, args )args = args or {}

	if not args.SkipInputBlock then
		AddTimerBlock( CurrentRun, "ZagreusInteractEquip" )
		AddInputBlock({ Name = "ZagreusInteractEquip" })
	end

	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then PlayCurrentCharacterInteractAnimation() else
	SetAnimation({ Name = "ZagreusInteractEquip", DestinationId = CurrentRun.Hero.ObjectId })
	end

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = interactableObjectId })
	thread( DoRumble, { { ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.1 }, } )
	if interactableObjectId then
		wait( 0.08 )
	end
	if not args.SkipInputBlock then
		thread( RemoveInteractAnimationInputBlock )
	end
	wait( 0.08 )
end)

--RemoveInteractAnimationInputBlock Override--

ModUtil.BaseOverride("RemoveInteractAnimationInputBlock", function ()wait( 0.25 )
	RemoveInputBlock({ Name = "ZagreusInteractEquip" })
	RemoveTimerBlock( CurrentRun, "ZagreusInteractEquip" )
end)

--OpenUpgradeChoiceMenu Override--

ModUtil.BaseOverride("OpenUpgradeChoiceMenu", function ( lootData )
	local currentWeaponInSlot = GetEquippedWeapon()
   local TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
   local CurrentCharacterIdleAnimation = TraitData[TraitName].IdleAnimation
   local CurrentCharacterMoveStartAnimation = TraitData[TraitName].MoveStartAnimation
   local CurrentCharacterMoveAnimation = TraitData[TraitName].MoveAnimation
   local CurrentCharacterMoveStopAnimation = TraitData[TraitName].MoveStopAnimation
   local CurrentCharacterLowSpeedAnimation = TraitData[TraitName].LowSpeedAnimation
   local CurrentCharacterHighSpeedAnimation = TraitData[TraitName].HighSpeedAnimation
   local CurrentCharacterBaseSpeed = TraitData[TraitName].BaseSpeedValue
   local CurrentCharacterScale = TraitData[TraitName].ScaleFraction
   local CurrentCharacterRequiredPackages = TraitData[TraitName].RequiredPackages
   local CurrentCharacterDamagedAnimation = TraitData[TraitName].DamagedAnimation
   local CurrentCharacterDamagedSound = TraitData[TraitName].DamagedSound
   local CurrentCharacterHeroLandingAnimation = TraitData[TraitName].HeroLandingAnimation
   local CurrentCharacterHeroTouchDownGraphic = TraitData[TraitName].HeroTouchdownGraphic
   local CurrentCharacterUpgradeAcquiredAnimation = TraitData[TraitName].UpgradeAcquiredAnimation
   local CurrentCharacterSecretDoorDiveAnimation = TraitData[TraitName].SecretDoorDiveAnimation
   local CurrentCharacterSecretRoomEntranceExitAnimation = TraitData[TraitName].SecretRoomEntranceExitAnimation
   local CurrentCharacterChargingEmote = TraitData[TraitName].ChargingEmote
   local CurrentCharacterPowerUpEmote = TraitData[TraitName].PowerUpEmote
   local CurrentCharacterLastStandAnimation = TraitData[TraitName].LastStandAnimation
   local CurrentCharacterLastStandVoiceLines = TraitData[TraitName].LastStandVoicelines
   local CurrentCharacterLastStandLastLifeVoiceLines = TraitData[TraitName].LastStandLastLifeVoiceLines
   local CurrentCharacterDeathIdleAnimation = TraitData[TraitName].DeathIdleAnimation
   local CurrentCharacterDeathAnimation = TraitData[TraitName].DeathAnimation
   local CurrentCharacterDeathVoicelines = TraitData[TraitName].DeathVoiceLines
   local CurrentCharacterInteractAnimation = TraitData[TraitName].InteractAnimation
   local CurrentCharacterAttachedAnimationName = TraitData[TraitName].AttachedAnimationName or "null"
   local CurrentCharacterAttachedAnimationScale = TraitData[TraitName].AttachedAnimationScale or 1.0
   local CurrentCharacterAttachedAnimation2Name = TraitData[TraitName].AttachedAnimation2Name or "null"
   local CurrentCharacterAttachedAnimationOffsetZ = TraitData[TraitName].AttachedAnimationOffsetZ or "null"
   local CurrentCharacterBoonBox = TraitData[TraitName].BoonBox
   local CurrentCharacterBoonSelectInGraphic = TraitData[TraitName].BoonSelectInGraphic
   local CurrentCharacterBoonSelectLightingGraphic = TraitData[TraitName].BoonSelectLightingGraphic
   local CurrentCharacterBoonOffset = TraitData[TraitName].BoonOffset
   local CurrentCharacterBoonSelectInFrontFxOffset = TraitData[TraitName].BoonSelectInFrontFxOffset

	local upgradeName = lootData.Name
	local upgradeChoiceData = LootData[upgradeName]
	-- Not allowed to quit after seeing otherwise hidden choices
	InvalidateCheckpoint()

	OnScreenOpened({Flag = "BoonMenu", PersistCombatUI = true })
	FreezePlayerUnit("BoonMenuOpen", { DisableTray = false })
	SetPlayerInvulnerable("BoonMenuOpen")
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = true })
	SetConfigOption({ Name = "ExclusiveInteractGroup", Value = nil })

	ScreenAnchors.ChoiceScreen = { Components = {} }
	local screen = ScreenAnchors.ChoiceScreen
	screen.Name = "UpgradeChoice_"..upgradeName
	local components = screen.Components

	EnableShopGamepadCursor( screen.Name )

	if HeroHasTrait("EPC_CharacterHandlerTrait") then
		screen.SubjectName = upgradeName
	components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	components.ShopBackgroundSplatter = CreateScreenComponent({ Name = "BoonBackground", Group = "Combat_Menu" })
		components.ShopBackground = CreateScreenComponent({ Name = CurrentCharacterBoonBox, Group = "Combat_Menu" })
	else

	screen.SubjectName = upgradeName
	components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	components.ShopBackgroundSplatter = CreateScreenComponent({ Name = "BoonBackground", Group = "Combat_Menu" })
	components.ShopBackground = CreateScreenComponent({ Name = "BoonBox", Group = "Combat_Menu" })
	end
    -- if HeroHasTrait("EPC_CharacterHandlerTrait") then 
	-- 	SetThingProperty({ Property = "Graphic", DestinationId = "BoonBox", Value = CurrentCharacterBoonSelectInGraphic }) end

	SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 4 })
	SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.15, 0.15, 0.15, 0.7} })

	wait(0.25)

	components.ShopFrontFx = CreateScreenComponent({ Name = "BoonSelectInFrontFx", Group = "Combat_Menu" })

	components.ShopBoonIcon = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu", X = 182, Y = 160 })
	SetAnimation({ DestinationId = components.ShopBoonIcon.Id, Name = upgradeChoiceData.Icon, Scale = 1.0 })

	-- components.ShopFrontHand = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	-- SetAnimation({ DestinationId = components.ShopFrontHand.Id, Name = "BoonSelectFrontHand" })
    if HeroHasTrait("EPC_CharacterHandlerTrait") then
		components.ShopLighting = CreateScreenComponent({ Name = CurrentCharacterBoonSelectLightingGraphic, Group = "Combat_Menu_Additive" })
	SetColor({ Id = components.ShopLighting.Id, Color = upgradeChoiceData.LightingColor }) else
	components.ShopLighting = CreateScreenComponent({ Name = "BoonSelectLighting", Group = "Combat_Menu_Additive" })
	SetColor({ Id = components.ShopLighting.Id, Color = upgradeChoiceData.LightingColor }) end

	-- Title
	CreateTextBox({ Id = components.ShopBackground.Id, Text = upgradeChoiceData.MenuTitle or "UpgradeChoiceMenu_Title_"..upgradeName,
		FontSize = 32,
		OffsetX = 0, OffsetY = -465,
		Color = Color.White,
		Font = "SpectralSCLightTitling",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3},
		OutlineThickness = 3,
		Justification = "Center"
	})
	if CurrentRun.LootTypeHistory then
		RandomSynchronize( CurrentRun.LootTypeHistory[upgradeName] )
	else
		RandomSynchronize()
	end
	-- Flavor Text
	if upgradeChoiceData.FlavorTextIds ~= nil then
		local flavorText = GetRandomValue( upgradeChoiceData.FlavorTextIds )
		CreateTextBox(MergeTables({ Id = components.ShopBackground.Id, Text = flavorText,
				FontSize = 16,
				OffsetY = -410, Width = 1040,
				Color = {0.698, 0.702, 0.514, 1.0},
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Center" }, LocalizationData.UpgradeChoice.FlavorText))
	end

	CreateBoonLootButtons( lootData )

	-- Short delay to let animations finish and prevent accidental input
	wait(0.5)

	screen.KeepOpen = true
	thread( HandleWASDInput, screen )
	HandleScreenInput( screen )

end )

--CloseUpgradeChoiceScreen Override--

ModUtil.BaseOverride("CloseUpgradeChoiceScreen", function ( screen, button )
	local currentWeaponInSlot = GetEquippedWeapon()
    local TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
	local CurrentCharacterBoonSelectOutGraphic = TraitData[TraitName].BoonSelectOutGraphic

	DisableShopGamepadCursor( screen.Name )
	SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
	if HeroHasTrait("EPC_CharacterHandlerTrait") then
	SetAnimation({ DestinationId = screen.Components.ShopBackground.Id, Name = CurrentCharacterBoonSelectOutGraphic }) else
		SetAnimation({ DestinationId = screen.Components.ShopBackground.Id, Name = "BoonSelectOut" }) end
	if ScreenAnchors.ChoiceScreen.ActivateSwapId ~= nil then
		Destroy({ Id = ScreenAnchors.ChoiceScreen.ActivateSwapId })
		ScreenAnchors.ChoiceScreen.ActivateSwapId = nil
	end

	
	local useableOffButtonIds = {}
	for index = 1, 3 do
		if screen.Components["PurchaseButton"..index] and screen.Components["PurchaseButton"..index].Id then
			table.insert(useableOffButtonIds, screen.Components["PurchaseButton"..index].Id)
		end
	end
	UseableOff({ Ids = useableOffButtonIds, ForceHighlightOff = true })

	CloseScreen( GetAllIds( screen.Components ), 0.25 )
	if not LootData[screen.SubjectName].SelectionSound then
		PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
	else
		PlaySound({ Name = LootData[screen.SubjectName].SelectionSound })
	end
	UnfreezePlayerUnit("BoonMenuOpen")
	SetPlayerVulnerable("BoonMenuOpen")
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	screen.KeepOpen = false
	OnScreenClosed({Flag = "BoonMenu"})

	NotifyResultsTable[ UIData.BoonMenuId ] = screen.SubjectName
	notifyExistingWaiters( UIData.BoonMenuId )

	if CurrentRun.Hero.IsDead then
		HideCombatUI()
		return
	end

	CheckObjectiveSet("AdvancedTooltipPrompt")

	if not IsEmpty(LootObjects)  then
		for itemId, item in pairs( LootObjects ) do
			if IsAlive({ Id = itemId }) then
				if not item.ForceCommon then
					RandomSynchronize()
					item.RarityChances = GetRarityChances( item )
				end
				item.UpgradeOptions = nil
			end
		end
	end
	ScreenAnchors.ChoiceScreen = nil
end )

--UpgradeAcquiredPresentation Override--

ModUtil.BaseOverride("UpgradeAcquiredPresentation", function ( upgradeName, buttonId )
	local upgradeData = LootData[upgradeName]
	CreateAnimation({ Name = "HitSparkA", DestinationId = buttonId })
	if not upgradeData.ConfirmSound then
		PlaySound({ Name = "/SFX/Menu Sounds/GodBoonChoiceConfirm" })
	else
		PlaySound({ Name = upgradeData.ConfirmSound })
	end

	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then PlayCurrentCharacterUpgradeAcquiredVoicelines() else
	thread( PlayFirstEligibleVoiceLines, { HeroVoiceLines.SwapUpgradePickedVoiceLines, upgradeData.SwapUpgradePickedVoiceLines, upgradeData.UpgradePickedVoiceLines, HeroVoiceLines.UpgradePickedVoiceLines, HeroVoiceLines.GenericUpgradePickedVoiceLines } )
	end

	wait( 0.02 )
	ShakeScreen({ Speed = 1000, Distance = 2, Duration = 0.3 })
	thread( DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.3, Duration = 0.3 }, } )
	AdjustColorGrading({ Name = upgradeData.ColorGrade or "ItemGet", Duration = 0.2 })

	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then DoCurrentCharacterUpgradeAcquiredAnimation() else
	SetAnimation({ Name = "ZagreusLanding", DestinationId = CurrentRun.Hero.ObjectId })
	end

	CreateAnimation({ Name = "ItemGet", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })
	CreateAnimation({ Name = "ItemGetVignette", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })
	wait( 0.25 )
	AdjustColorGrading({ Name = "Off", Duration = 0.5 })
end)

--PlayerLastStandPresentationStart Override--
ModUtil.BaseOverride("PlayerLastStandPresentationStart", function ( args )
	wait( 0.06, RoomThreadName )
	local secondChanceFxInTime = 0.08

	-- put up screen vfx
	ScreenAnchors.LastStandVignette = SpawnObstacle({ Name = "BlankObstacle", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	CreateAnimation({ Name = "LastStandVignette", DestinationId = ScreenAnchors.LastStandVignette })
	AdjustColorGrading({ Name = "DeathDefianceSubtle", Duration = secondChanceFxInTime, Delay = 0.0, })

	RemoveFromGroup({ Id = CurrentRun.Hero.ObjectId, Names = { "Standing" } })
	AddToGroup({ Id = CurrentRun.Hero.ObjectId, Name = "Combat_Menu", DrawGroup = true })

	-- camera
	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 0.01 })
	FocusCamera({ Fraction = 1.03, Duration = 0.045, ZoomType = "Ease" })

	-- pause the game
	AddSimSpeedChange( "LastStand", { Fraction = 0.005, LerpTime = 0.0001, Priority = true } )

	-- play voiceover
	thread( PlayerLastStandVoicelines, args )
	thread( PlayerLastStandSFX )
	waitScreenTime( 0.3, RoomThreadName )

	thread( CrowdReactionPresentation, { AnimationNames = { "StatusIconGrief", "StatusIconOhBoy", "StatusIconEmbarrassed" }, Sound = "/SFX/TheseusCrowdBoo", ReactionChance = 0.05, Requirements = { RequiredRoom = "C_Boss01" }, Delay = 1, Shake = true, RadialBlur = true } )

	-- pop the death defiance
	LostLastStandPresentation()
	UpdateLifePips()
	thread( PlayerLastStandProcText )

	waitScreenTime( 1.1, RoomThreadName )

end)



--PlayerLastStandVoicelines Override--
ModUtil.BaseOverride("PlayerLastStandVoicelines", function ( args )
	
	if args.HasLastStand or GetNumMetaUpgradeLastStands() <= 1 then
	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then PlayCurrentCharacterLastStandVoicelines() else
		thread( PlayVoiceLines, HeroVoiceLines.LastStandVoiceLines, true )
	end
	else
	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then PlayCurrentCharacterLastStandLastLifeVoicelines() else
		thread( PlayVoiceLines, HeroVoiceLines.LastStandLastLifeVoiceLines, true )
	end
end
	for k, enemy in pairs( ActiveEnemies ) do
		if enemy.LastStandReactionVoiceLines ~= nil then
			if not enemy.LastStandReactionVoiceLineMinHealthThreshold or (( enemy.Health / enemy.MaxHealth ) > enemy.LastStandReactionVoiceLineMinHealthThreshold ) then
				thread( PlayVoiceLines, enemy.LastStandReactionVoiceLines, true, enemy )
			end
		end
	end
end)

--PlayerLastStandSFX Override--
ModUtil.BaseOverride("PlayerLastStandSFX", function ( )
	
	local currentRun = CurrentRun
	local hasLastStand = HasLastStand( CurrentRun.Hero )
	if hasLastStand then
	
	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then DoCurrentCharacterLastStandSFX() else
		PlaySound({ Name = "/SFX/DeathDefianceActivate", Id = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmoteCharging", Id = CurrentRun.Hero.ObjectId })
	end
else
	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then DoCurrentCharacterLastStandSFX() else
		PlaySound({ Name = "/SFX/DeathDefianceActivate", Id = CurrentRun.Hero.ObjectId })
		PlaySound({ Name = "/VO/ZagreusEmotes/EmoteCharging", Id = CurrentRun.Hero.ObjectId })
	end
	end
end)

--PlayerLastStandHealingPresentation Override--
ModUtil.BaseOverride("PlayerLastStandHealingPresentation", function ( )
	if HeroHasTrait( "EPC_CharacterHandlerTrait" )
    then DoCurrentCharacterLastHealingPresentation() else

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 4.5, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	PlaySound({ Name = "/VO/ZagreusEmotes/EmotePoweringUp", Id = CurrentRun.Hero.ObjectId })
	SetAnimation({ Name = "ZagreusWrath", DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ZagreusWrathFire", DestinationId = CurrentRun.Hero.ObjectId, Color = Color.White })
	CreateAnimation({ Name = "DeathDefianceShockwave", DestinationId = CurrentRun.Hero.ObjectId })
	end
	--waitScreenTime( 0.3)
	--PlaySound({ Name = "/VO/ZagreusEmotes/EmoteRangedALT5", Id = CurrentRun.Hero.ObjectId })
	thread( PlayerLastStandHealingText, args )
end)

--PlayerLastStandPresentationEnd Override--
ModUtil.BaseOverride("PlayerLastStandPresentationEnd", function ()
	RemoveFromGroup({ Id = CurrentRun.Hero.ObjectId, Names = { "Combat_Menu" } })
	AddToGroup({ Id = CurrentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
	waitScreenTime( 1.0, RoomThreadName )
	local secondChanceFxOutTime = 0.4
	AdjustRadialBlurStrength({ Fraction = 0, Duration = secondChanceFxOutTime  })
	AdjustFrame({ Duration = secondChanceFxOutTime, Fraction = 0 })
	RemoveSimSpeedChange( "LastStand", { LerpTime = secondChanceFxOutTime } )
	AdjustFullscreenBloom({ Name = "DeathDefiance", Duration = secondChanceFxOutTime * 0.1 })
	local colorGrade = "Off"
	if not IsEmpty(ActiveEnemies) then
		for id, enemy in pairs(ActiveEnemies) do
			if enemy.PermanentEnraged and enemy.PermanentEnragedColorGrade then
				colorGrade = enemy.PermanentEnragedColorGrade
			end
		end
	end
	AdjustColorGrading({ Name = colorGrade, Duration = secondChanceFxOutTime * 1.5, Delay = secondChanceFxOutTime * 0.1 })
	AdjustFullscreenBloom({ Name = "Off", Duration = secondChanceFxOutTime * 0.5, Delay = secondChanceFxOutTime * 0.1 })
	SetAlpha({ Id = ScreenAnchors.LastStandVignette, Fraction = 0, Duration = 0.06 })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	FocusCamera({ Fraction = CurrentRun.CurrentRoom.ZoomFraction or 1.0, Duration = secondChanceFxOutTime, ZoomType = "Ease" })
	if HeroHasTrait("EPCHadesTrait") then
		thread(HadesLastStandBlast)
	end
end)

 ModUtil.BaseOverride("PlayVoiceLine", function ( line, prevLine, parentLine, source, args )

	--if HeroHasTrait("EPC_CharacterHandlerTrait") and source == CurrentRun.Hero.ObjectId then return end
--     DebugPrint({ Text = cue })
--    cue = nil
--    end

	local playedSomething = false

	if parentLine == nil then
		parentLine = line
	end

	args = args or {}
	args.ThreadName = line.ThreadName or args.ThreadName
	args.Queue = line.Queue or args.Queue
	args.BreakIfPlayed = line.BreakIfPlayed or args.BreakIfPlayed
	args.PlayOnceContext = line.PlayOnceContext or args.PlayOnceContext
	args.SubtitleMinDistance = line.SubtitleMinDistance or args.SubtitleMinDistance
	args.Actor = line.Actor or args.Actor
	args.AllowTalkOverTextLines = line.AllowTalkOverTextLines or args.AllowTalkOverTextLines
	-- By default, the player object is the ListenerId, though could be something else
	args.ListenerId = line.ListenerId or args.ListenerId or CurrentRun.Hero.ObjectId

	source = GetLineSource( line, source, args )
	if source == nil then
		-- Never play a line if the source doesn't exist
		return
	end

	-- if HeroHasTrait("EPC_CharacterHandlerTrait") and source == CurrentRun.Hero
	-- --and args.Actor == "Zagreus" --or "Defualt" 
	-- then return end

	if line.SetFlagTrue ~= nil then
		GameState.Flags[line.SetFlagTrue] = true
	end
	if line.SetFlagFalse ~= nil then
		GameState.Flags[line.SetFlagFalse] = false
	end

	if line.TriggerCooldowns ~= nil then
		for k, cooldownName in pairs( line.TriggerCooldowns ) do
			TriggerCooldown( cooldownName )
		end
	end

	-- Play this line
	if line.Cue ~= nil then

		if HeroHasTrait("EPC_CharacterHandlerTrait") and source == CurrentRun.Hero
		--and args.Actor == "Zagreus" --or "Defualt" 
		then return end
		if args.OnPlayedSomethingFunctionName ~= nil and not args.PlayedSomething then
			local onPlayedSomethingFunction = _G[args.OnPlayedSomethingFunctionName]
			if onPlayedSomethingFunction ~= nil then
				thread( onPlayedSomethingFunction, source, args.OnPlayedSomethingFunctionArgs )
			end
		end

		if line.PreLineThreadedFunctionName ~= nil then
			local preLineThreadedFunction = _G[line.PreLineThreadedFunctionName]
			thread(preLineThreadedFunction, source, line.PreLineThreadedFunctionArgs )
		end
		wait( line.PreLineWait or parentLine.PreLineWait, args.ThreadName )
		local preLineAnim = line.PreLineAnim or parentLine.PreLineAnim
		if preLineAnim ~= nil then
			SetAnimation({ Name = preLineAnim, DestinationId = source.ObjectId })
		end

		local playedSpeechId = 0
		local useSubtitles = false
		if not source.Mute then
			if args.SubtitleMinDistance then
				local dist = GetDistance({ Id = args.ListenerId, DestinationId = source.ObjectId })
				if dist > args.SubtitleMinDistance then
					useSubtitles = false
				else
					useSubtitles = true
				end
			else
				useSubtitles = true
			end
			if line.NoTarget or parentLine.NoTarget then
				playedSpeechId = PlaySpeech({ Name = line.Cue, Queue = args.Queue, SubtitleColor = source.SubtitleColor, UseSubtitles = useSubtitles, Actor = args.Actor })
			elseif line.SkipAnim or parentLine.SkipAnim then
				if HeroHasTrait("EPC_CharacterHandlerTrait") and source == CurrentRun.Hero
				--and args.Actor == "Zagreus" --or "Defualt" 
				then return end
				playedSpeechId = PlaySpeechCueFromSource( line.Cue, source, false, args.Queue, useSubtitles, source.SubtitleColor, args )
			else
				playedSpeechId = PlaySpeechCueFromSource( line.Cue, source, true, args.Queue, useSubtitles, source.SubtitleColor, args )
			end
		end
		if line.UseOcclusion then
			SetSoundCueValue({ Id = playedSpeechId, Names = { "VoiceOcclusion" }, Value = 1.0, Duration = 0.01 })
		end
		if playedSpeechId > 0 then
			prevLine = line
			LastLinePlayed = line.Cue
			table.insert( CurrentRun.CurrentRoom.VoiceLinesPlayed, line.Cue )
			playedSomething = true
			args.PlayedSomething = true
			-- @refactor The SpeechRecord recording is pretty scattered / redundant
			SpeechRecord[line.Cue] = true
			CurrentRun.SpeechRecord[line.Cue] = true
			if args.PlayOnceContext ~= nil then
				GameState.SpeechRecordContexts[args.PlayOnceContext] = GameState.SpeechRecordContexts[args.PlayOnceContext] or {}
				GameState.SpeechRecordContexts[args.PlayOnceContext][line.Cue] = true
			end
			-- Intentionally leaving this on raw data for now to be wiped out on load
			line.LastPlayTime = _worldTime
			parentLine.LastPlayTime = _worldTime
			waitUntil( line.Cue )
			wait( line.PostLineWait or parentLine.PostLineWait, args.ThreadName )
			if line.PostLineFunctionName ~= nil then
				local postLineFunction = _G[line.PostLineFunctionName]
				postLineFunction( source, line.PostLineFunctionArgs )
			end
			if args.BreakIfPlayed then
				return playedSomething
			end
		else
			--DebugAssert({ Condition = playedSpeechId > 0, Text = "Speech failed to play: "..line.Cue })
		end
	end

	-- Play sublines
	if line.RandomRemaining then
		local eligibleUnplayedLines = {}
		local allEligibleLines = {}
		for k, subLine in ipairs( line ) do
			if IsVoiceLineEligible( CurrentRun, subLine, prevLine, line, source, args ) then
				table.insert( allEligibleLines, subLine )
				if not PlayedRandomLines[subLine.Cue] then
					table.insert( eligibleUnplayedLines, subLine )
				end
			end
		end
		if not IsEmpty( allEligibleLines ) then
			local randomLine = nil
			if IsEmpty( eligibleUnplayedLines ) then
				-- All lines played, start the record over
				for k, subLine in ipairs( line ) do
					PlayedRandomLines[subLine.Cue] = nil
				end
				randomLine = GetRandomValue( allEligibleLines )
			else
				randomLine = GetRandomValue( eligibleUnplayedLines )
			end
			PlayedRandomLines[randomLine.Cue] = true
			-- Effectively pass down by value rather than reference
			local subLineArgs = ShallowCopyTable( args )
			if HeroHasTrait("EPC_CharacterHandlerTrait") and source == CurrentRun.Hero
			--and args.Actor == "Zagreus" --or "Defualt" 
			then return end
			if PlayVoiceLine( randomLine, prevLine, line, source, subLineArgs ) then
				prevLine = randomLine
				playedSomething = true
				args.PlayedSomething = true
				if args.BreakIfPlayed or randomLine.BreakIfPlayed or subLineArgs.BreakIfPlayed then
					return playedSomething
				end
			end
		end
	else
		for k, subLine in ipairs( line ) do
			if IsVoiceLineEligible( CurrentRun, subLine, prevLine, line, source, args ) then
				-- Effectively pass down by value rather than reference
				local subLineArgs = ShallowCopyTable( args )
				-- if HeroHasTrait("EPC_CharacterHandlerTrait") and source == CurrentRun.Hero
				-- --and args.Actor == "Zagreus" --or "Defualt" 
				-- then return end
				if PlayVoiceLine( subLine, prevLine, line, source, subLineArgs ) then
					prevLine = subLine
					playedSomething = true
					args.PlayedSomething = true
					if args.BreakIfPlayed or subLine.BreakIfPlayed or subLineArgs.BreakIfPlayed then
						return playedSomething
					end
				end
			end
		end
	end

	return playedSomething

end)

--ParryAttackPresentation Override--
ModUtil.BaseOverride( "ParryAttackPresentation", function ( unitId )
	local currentWeaponInSlot = GetEquippedWeapon()
   local TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
   local CurrentCharacterParryEmote = TraitData[TraitName].ParryEmote or "/EmptyCue"
	if unitId ~= CurrentRun.Hero.ObjectId then
		return
	end
	--if not CanStartBudgetedPresentation("ParryAttackPresentation") then
		--return
	--end
	if HeroHasTrait("EPC_CharacterHandlerTrait") then
	PlaySound({ Name = "/Leftovers/Menu Sounds/LevelUpFlash", Id = unitId })
	PlaySound({ Name = CurrentCharacterParryEmote, Id = unitId })
	else
	PlaySound({ Name = "/Leftovers/Menu Sounds/LevelUpFlash", Id = unitId })
	PlaySound({ Name = "/VO/ZagreusEmotes/EmotePowerAttacking", Id = unitId })
	end
	Flash({ Id = unitId, Speed = 0.85, MinFraction = 0.7, MaxFraction = 0.0, Color = Color.White, Duration = 0.15, ExpireAfterCycle = true })
	thread( InCombatText, unitId, "ParryHit", 0.5 , { SkipShadow = true } )

	wait(0.15)
	--ExitBudgetedPresentation("ParryAttackPresentation")
end )

--StartDeathLoopPresentation Override--

--AddTraitToHero Override--
-- ModUtil.BaseOverride("AddTraitToHero", function (args)
-- 	local traitData = args.TraitData
-- 	if traitData == nil then
-- 		traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = args.TraitName, Rarity = args.Rarity })
-- 	end
	

-- 	GameState.LastPickedTraitName = traitData.Name

-- 	if not args.PreProcessedForDisplay then
-- 		ExtractValues(CurrentRun.Hero, traitData, traitData)
-- 	end

-- 	if traitData.Slot and CurrentRun.CurrentRoom then
-- 		CurrentRun.CurrentRoom.AcquiredSlot = traitData.Slot
-- 	end
-- 	-- traits may have information that acts on weapons, so we must first equip all associated weapons to the player
-- 	EquipReferencedWeapons( traitData )
-- 	AddTraitData( CurrentRun.Hero, traitData, args )

-- 	EquipSpecialWeapons( CurrentRun.Hero, traitData )
-- 	AddAssistWeapons( CurrentRun.Hero, traitData )
-- 	for weaponName, v in pairs( CurrentRun.Hero.Weapons ) do
-- 		AddWallSlamWeapons( CurrentRun.Hero, traitData )
-- 		AddOnDamageWeapons(CurrentRun.Hero, weaponName, traitData)
-- 		AddOnFireWeapons(CurrentRun.Hero, weaponName, traitData)
-- 		if traitData.UpgradeHeroWeapon ~= nil and Contains(traitData.UpgradeHeroWeapon.WeaponNames, weaponName) then
-- 			AddHeroWeaponUpgrade(weaponName, traitData.UpgradeHeroWeapon.UpgradeName)
-- 		end
-- 	end

-- 	if ( traitData.EnemyPropertyChanges or traitData.AddEnemyOnDeathWeapons ) and ActiveEnemies ~= nil then
-- 		for enemyId, enemy in pairs( ActiveEnemies ) do
-- 			EquipReferencedEnemyWeapons( currentRun, traitData, enemy )
-- 			ApplyEnemyTrait( CurrentRun, traitData, enemy )
-- 		end
-- 	end

-- 	if traitData.AddShout then
-- 		if traitData.AddShout.Cost then
-- 			CurrentRun.Hero.SuperCost = traitData.AddShout.Cost
-- 		else
-- 			CurrentRun.Hero.SuperCost = 25
-- 		end
-- 		ShowSuperMeter()
-- 	end
-- 	if traitData.TraitName == "AthenaRushTrait" then
-- 		AddTraitToHero("AthenaRushTrait1") end
-- end)

ModUtil.BaseOverride( "AddLastStand", function ( args )
	local unit = args.Unit or CurrentRun.Hero
	args.Unit = nil
	local count = args.Count or 1
	if not unit.LastStands then
		unit.LastStands = {}
	end

	for i = 1, count do
		if args.IncreaseMax then
			unit.MaxLastStands = unit.MaxLastStands or 0
			unit.MaxLastStands = unit.MaxLastStands + 1
			if ScreenAnchors.LifePipIds then
				local obstacleId = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI", X = 70 + unit.MaxLastStands * 32, Y = ScreenHeight - 95})
				SetAnimation({ Name = "ExtraLifeEmpty", DestinationId = obstacleId })
				table.insert(ScreenAnchors.LifePipIds, obstacleId )
			end
		end

		if unit.MaxLastStands and TableLength( unit.LastStands ) >= unit.MaxLastStands and not args.Silent then
			UpdateLifePips( unit )
			AtLastStandMaxPresentation( unit )
			return
		end

		if args.InsertAtEnd or ( IsMetaUpgradeActive("ExtraChanceReplenishMetaUpgrade") and args.Name ~= "ExtraChanceReplenishMetaUpgrade" ) then
			table.insert( unit.LastStands, 1, args )
			if not args.Silent then
				GainLastStandPresentation(1)
			end
		else
			table.insert( unit.LastStands, args )

			if not args.Silent then
				GainLastStandPresentation()
			end
		end
	end

	if not args.Silent then
		UpdateLifePips( unit )
	end
	UpdateLifePips( )
end )

ModUtil.BaseOverride( "UpdateLifePips", function ( heroUnit )
	if not IsCustomHero == true then local TraitName = "DefaultCharacterTrait"
	local CurrentCharacterExtraLifeIcon = "ExtraLifeZag" else
	 local currentWeaponInSlot = GetEquippedWeapon()
   local TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
   local CurrentCharacterExtraLifeIcon = TraitData[TraitName].ExtraLifeIcon or "ExtraLifeZag"
	end
	--if not IsCustomHero == true then
	
	--end

	local unit = heroUnit or CurrentRun.Hero
	if not ScreenAnchors.LifePipIds or not unit.LastStands then
		return
	end
	local lastSeenLives = UIData.LastSeenLives or 0
	local numLives = TableLength( unit.LastStands )
	for i, lifePipId in pairs( ScreenAnchors.LifePipIds ) do
		local lastStandData = unit.LastStands[i]
		if lastStandData then
			SetAnimation({ Name = lastStandData.Icon, DestinationId = ScreenAnchors.LifePipIds[i] })
		else
			if unit.IsDead then
				if IsMetaUpgradeActive("ExtraChanceReplenishMetaUpgrade") then
					SetAnimation({ Name = "ExtraLifeReplenish", DestinationId = ScreenAnchors.LifePipIds[i] })
				else
					SetAnimation({ Name = CurrentCharacterExtraLifeIcon or "ExtraLifeZag", DestinationId = ScreenAnchors.LifePipIds[i] })
				--else
					--SetAnimation({ Name = "ExtraLifeZag", DestinationId = ScreenAnchors.LifePipIds[i] })
				--end
				end
			else
				SetAnimation({ Name = "ExtraLifeEmpty", DestinationId = ScreenAnchors.LifePipIds[i] })
			end
		end
	end
end )

ModUtil.BaseOverride( "InitHeroLastStands", function ( newHero )
	local currentWeaponInSlot = GetEquippedWeapon()
   local TraitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) or "null"
   local CurrentCharacterExtraLifeIcon = TraitData[TraitName].ExtraLifeIcon or "ExtraLifeZag"

	for s = 1, GetNumMetaUpgrades("ExtraChanceMetaUpgrade" ) do
		for i = 1, MetaUpgradeData["ExtraChanceMetaUpgrade"].ChangeValue do
			AddLastStand({
				Unit = newHero,
				IncreaseMax = true,
				Icon = CurrentCharacterExtraLifeIcon,
				WeaponName = "LastStandMetaUpgradeShield",
				HealFraction = 0.5,
				Silent = true
			})
		end
	end
	for s = 1, GetNumMetaUpgrades("ExtraChanceReplenishMetaUpgrade" ) do
		for i = 1, MetaUpgradeData["ExtraChanceReplenishMetaUpgrade"].ChangeValue do
			AddLastStand({
				Name = "ExtraChanceReplenishMetaUpgrade",
				Unit = newHero,
				IncreaseMax = true,
				Icon = "ExtraLifeReplenish",
				WeaponName = "LastStandMetaUpgradeShield",
				HealFraction = MetaUpgradeData.ExtraChanceReplenishMetaUpgrade.HealPercent,
				Silent = true
			})
		end
	end
end )