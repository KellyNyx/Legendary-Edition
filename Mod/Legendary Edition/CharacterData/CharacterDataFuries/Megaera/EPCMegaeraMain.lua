if not LegendaryEdition.Config.Enabled then return end
OnAnyLoad{ "DeathArea",
    function(triggerArgs)
	CheckForEPCMegaeraTrait()
	end}

ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
	if CurrentRun == nil then return end
    LoadPackages{ Name = "LEGUI" }
return baseFunc()
end)

function CheckForEPCMegaeraTrait()
	ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
		if HeroHasTrait('EPCMegaeraTrait') then
			local mod = "LegendaryEdition" 
		DebugPrint({ Text = "Player Has Character Trait, Setting all Unit Properties..." })
		SetThingProperty({ Property = "Graphic", Value = "FuryIdle", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "StartGraphic", Value = "FuryStart", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "MoveGraphic", Value = "FuryRun", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "StopGraphic", Value = "FuryStop", DestinationId = CurrentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "Speed", Value = 600.0, DestinationId = CurrentRun.Hero.ObjectId })
		SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = CurrentRun.Hero.ObjectId })
		LoadPackages{ Name = "Tartarus" }
			end
	return baseFunc()
	end)
end
-- OnAnyLoad{ "DeathArea",
--     function(triggerArgs)
-- 	CheckForEPCCharacterTrait()
-- 	end}

-- 	OnAnyLoad{  function(triggerArgs)
-- 	CheckForEPCCharacterTrait()
-- 	end}
-- ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
   
-- return baseFunc()
-- end)

--ModUtil.WrapBaseFunction( 'SetupMap', function(baseFunc)
  --if not HeroHasTrait('EPCMegaeraTrait') then
    --  return baseFunc()
  --end
  
--return baseFunc()
--end, LegendaryEdition)

--function HeroHasWeapon( WeaponName )
	--if weaponSetNames == nil then
		--return false
	--end
	--if TraitData[traitName] == nil then
		--DebugAssert({ Condition = (TraitData[traitName] ~= nil), Text = "TraitData is missing value for '"..traitName.."'" })
	--end

	--if CurrentRun.Hero.TraitDictionary then
	--	if CurrentRun.Hero.TraitDictionary[traitName] ~= nil then
	--		return true
	--	end
	--	return false
	--end

	--for i, trait in pairs( CurrentRun.Hero.Traits ) do
	--	if trait.Name == traitName then
	--		return true
	--	end
	--end
	--return false
--end

--ModUtil.WrapBaseFunction( 'UnequipWeaponUpgrade', function(baseFunc)
   -- if RemoveTrait('EPCMegaeraTrait') then
   --     return baseFunc()
  --  end
    --- Load Tartarus packages
  --function LoadTartarusPackages(CurrentTrait) 
    --CurrentTrait =
    --LoadPackages{ Name = "Tartarus" }
    --RequiredFalseBiome = "Tartarus"
--LoadPackages{ Name = "Tartarus" }
--UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "RushWeapon", UnloadPackages = false })
--EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCMegaeraRushWeapon", PreLoadBinks = true })
--SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "EPCMegaeraRushWeapon" })
--return baseFunc()
--end, LegendaryEdition)

--ModUtil.BaseOverride( "UnequipWeaponUpgrade", function(args)
  --local currentWeaponInSlot = GetEquippedWeapon()
	--if GameState.LastWeaponUpgradeData[currentWeaponInSlot] ~= nil and GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) then
	--	if GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) then
	--		RemoveTrait( CurrentRun.Hero, GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index) )
--
			--local upgradeData = WeaponUpgradeData[currentWeaponInSlot][GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index]
			--if upgradeData ~= nil and upgradeData.UnequipFunctionName and _G[upgradeData.UnequipFunctionName] then
			--	_G[upgradeData.UnequipFunctionName]( CurrentRun.Hero )
			--end
		--end
	--end

--return baseFunc()
--end, LegendaryEdition)
function SetupEPCMegaeraCharacter()
	--Remove Zagreus Binks To Set Current Character Binks
	-- SetThingProperty({ Property = "Graphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "MoveGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "StopGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	--Set Current Character Binks
	SetThingProperty({ Property = "Graphic", Value = "FuryIdle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "FuryStart", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "FuryRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "FuryStop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = "FuryRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = "FuryRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 600.0, DestinationId = CurrentRun.Hero.ObjectId })
	SetScale({ Fraction = 1.3, Id = CurrentRun.Hero.ObjectId })
	LoadPackages{ Name = "Tartarus" }
	AddTraitToHero({ SkipNewTraitHighlight = true, TraitName = "EPC_CharacterHandlerTrait", Rarity = "Common" })
end

--EPCCharacter.Data =
--	{
--		EPCCharacterTraitNames =
--		{
--			"EPCMegaeraTrait"
--		},
--		EPCCharacterSetupFunctionNames =
--		{
--			"SetupEPCMegaeraCharacter"
--		}
--	}

--function SetupEPCCharacter()
  --  local EPCMegSetup = SetupEPCMegaeraCharacter()
    --local EPCCharSetupFunctionNames = { EPCMegSetup }
    --local EPCCharTraitNames = { "EPCMegaeraTrait" }
	--if HeroHasTrait( EPCCharacter.Data.EPCCharacterTraitNames ) then 


function CheckForEPCCharacterTrait()
	if not HeroHasTrait('EPCMegaeraTrait') then
		local existingHero = currentRun.Hero or hero
		local currentWeaponInSlot = GetEquippedWeapon()
		local traitName = GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
		local mod = "LegendaryEdition" 
		GetWeaponUpgradeTrait(currentWeaponInSlot, GameState.LastWeaponUpgradeData[currentWeaponInSlot].Index)
		if traitName == "EPCMegaeraTrait" then
		DebugPrint({ Text = "@"..mod.. "Equipped Character Trait And Set All Unit Properties!" })
		--Remove Zagreus Binks To Set Current Character Binks
		SetThingProperty({ Property = "Graphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	    SetUnitProperty({ Property = "MoveGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	    SetUnitProperty({ Property = "StopGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
        --Set Current Character Binks
		SetThingProperty({ Property = "Graphic", Value = "FuryIdle", DestinationId = currentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "StartGraphic", Value = "FuryStart", DestinationId = currentRun.Hero.ObjectId })
	    SetUnitProperty({ Property = "MoveGraphic", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	    SetUnitProperty({ Property = "StopGraphic", Value = "FuryStop", DestinationId = currentRun.Hero.ObjectId })
		SetUnitProperty({ Property = "LowSpeedAnimation", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	    SetUnitProperty({ Property = "HighSpeedAnimation", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	    SetUnitProperty({ Property = "Speed", Value = 600.0, DestinationId = currentRun.Hero.ObjectId })
		SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = currentRun.Hero.ObjectId })
		LoadPackages{ Name = "Tartarus" }
		EquipWeaponUpgrade( existingHero )
        else
			if HeroHasTrait( 'EPCMegaeraTrait' ) then
	DebugPrint({ Text = "Player Already Has Character Trait, Setting all Unit Properties..." })

	SetThingProperty({ Property = "Graphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = nil, DestinationId = currentRun.Hero.ObjectId })

	SetThingProperty({ Property = "Graphic", Value = "FuryIdle", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "FuryStart", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "FuryStop", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 600.0, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = "FuryRun", DestinationId = currentRun.Hero.ObjectId })
	SetThingProperty({ Property = "Scale", Value = 1.0, DestinationId = currentRun.Hero.ObjectId })
    LoadPackages{ Name = "Tartarus" }
		end
	end
end
end

--V For Debug purposes V--

OnControlPressed{ "Assist",
	function(triggerArgs)
		--UnequipWeaponUpgrade()
		--EquipWeaponUpgrade( currentRun.Hero )
		local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
		local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
		UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = heroswordweapon, UnloadPackages = false })
		EquipPlayerWeapon( WeaponData.SpearWeapon )
		ShowWeaponUpgradeScreen({ WeaponName = "SpearWeapon" })
	end
}

-- OnControlPressed{ "Shout",
-- 	function( triggerArgs )
-- 		testplayerspawn()
-- 	end
-- }
-- function testplayerspawn()
-- 	SpawnUnit({
-- 					Name = "Hades",
-- 					Group = "Standing","HeroTeam",
-- 					DestinationId = CurrentRun.Hero.ObjectId, OffsetX = 400, OffsetY = 200 })
-- 					wait( 0.5 )
-- 	InitUnit({ Id = CurrentRun.Hero.ObjectId })
-- 	end

-- Megaera Weapon Scripts --

-- EPCHarpyWhipWhirl --
OnWeaponFired{ "EPCHarpyWhipWhirl",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}

OnWeaponCharging{ "EPCHarpyWhipWhirl",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyWhipWhirl.PreAttackVoiceLines, true, nil)
end
}

function PlayMegWhipWhirlVoiceLines(weaponData, args)
	local targetId = GetNearestEnemyArgs({ Arc = 90, Range = 500 })
	if not targetId == 0 then
		thread(PlayVoiceLines, WeaponData.EPCHarpyWhipWhirl.PreAttackVoiceLines)
	end
end
-- EPCHarpyWhipWhirlDash --
OnWeaponFired{ "EPCHarpyWhipWhirlDash",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}
-- EPCMegWhipLash1 --
OnWeaponCharging{ "MegWhipLash1",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.MegWhipLash1.PreAttackVoiceLines, true, nil)
end
}

OnWeaponFired{ "MegWhipLash1",
    function( triggerArgs )
		thread(PlayMegWhipWhirlFireSound)
end
}
-- EPCMegWhipLash2 --
OnWeaponFired{ "MegWhipLash2",
    function( triggerArgs )
		thread(PlayMegWhipLashFireSound)
end
}
-- EPCMegWhipLash3 --
OnWeaponFired{ "MegWhipLash3",
    function( triggerArgs )
		local fireticks = 4
		for fireticks = 1, fireticks, 1 do
			thread(PlayMegWhipLashFireSound)
			wait(0.1)
		end
		
end
}

OnWeaponCharging{ "MegWhipLash1",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.MegWhipLash1.PreAttackVoiceLines, true, nil)
end
}

--EpcHarpyBeam--
OnWeaponCharging{ "EPCHarpyBeam",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyBeam.PreAttackVoiceLines, true, nil)
end
}

--EpcHarpyLightning2--
OnWeaponCharging{ "EPCHarpyLightning2",
    function( triggerArgs )
		thread(PlayVoiceLines, WeaponData.EPCHarpyLightning2.PreAttackVoiceLines, true, nil)
end
}

-- OnWeaponFired{ "EPCHarpyLightning2",
--     function( triggerArgs )
-- 		--wait( 0.3 )
-- 		FireWeaponFromUnit({ Weapon = "EPCHarpyLightning_2", Id = CurrentRun.Hero.ObjectId, DestinationIds = CurrentRun.Hero.ObjectId, AutoEquip = true })
-- end
-- }

-- function PlayPreAttackVoiceLines(args)
-- 	local WeaponData.EPCHarpyLightning = args.WeaponName
-- 	thread(PlayVoiceLines, WeaponData.EPCHarpyLightning.PreAttackVoiceLines, true, nil)
-- end

function PlayMegWhipWhirlFireSound()
	--PlaySound({ Name = "/SFX/Player Sounds/ZagreusShieldRush" })
	--PlaySound({ Name = "/SFX/Player Sounds/ZagreusCriticalFire" })
	MegWhipWhirlSoundId = PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack", Id = CurrentRun.Hero.ObjectId })
	SetSoundPosition({ Id = MegWhipWhirlSoundId, Position = 1.1 })
	--SetSoundCueValue({ Names = { "Pitch" }, Id = soundId, Value = propertyValue })
end
function PlayMegWhipLashFireSound()
	--PlaySound({ Name = "/SFX/Player Sounds/ZagreusShieldRush" })
	--PlaySound({ Name = "/SFX/Player Sounds/ZagreusCriticalFire" })
	MegWhipLashSoundId = PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack", Id = CurrentRun.Hero.ObjectId })
	SetSoundPosition({ Id = MegWhipLashSoundId, Position = 1.3 })
	--SetSoundCueValue({ Names = { "Pitch" }, Id = soundId, Value = propertyValue })
end


-- EPCMegaeraRushWeapon --

OnWeaponCharging{ "MegRushWeaponControl",
    function( triggerArgs )
		Destroy({ Ids = GetIdsByType({ Name = "BlankObstacle1" }) })
end
}

OnWeaponFired{ "MegRushWeaponControl",
    function( triggerArgs )
		thread(EPCMegRushBlink)
end
}

function EPCMegRushBlink()
	--rushobstacle = "BlankObstacle"
	wait(0.01)
	FireWeaponFromUnit({ Weapon = "EPCMegaeraRushWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true })
	--Destroy({ Ids = GetIdsByType({ Name = "LEInvisibleTarget" }) })
	-- if rushobstacle then
	-- Destroy({ Id = "BlankObstacle" })
	-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 5, Duration = 0.5 })
	-- wait(0.5)
	-- AdjustZLocation({ Id = CurrentRun.Hero.ObjectId, Distance = 1, Duration = 0.0 })
	--end
end

function EPCMegRushBlinksetoffsetz1()
	SetThingProperty({ Property = "OffsetZ", Value = 30, DestinationId = CurrentRun.Hero.ObjectId })
end

function EPCMegRushBlinksetoffsetz2()
		SetThingProperty({ Property = "OffsetZ", Value = 0, DestinationId = CurrentRun.Hero.ObjectId })
end

-- EPCHarpyLightning --
OnWeaponFired{ "EPCHarpyLightningCONTROL",
    function( triggerArgs )
		
    EPCProcessAttackSlotsMegaera()    
end
}

local HarpyBeamWeapons = { "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3",
 "EPCHarpyBeam4", "EPCHarpyBeam5", "EPCHarpyBeam6", "EPCHarpyBeam7", "EPCHarpyBeam8",
 "EPCHarpyBeam9", "EPCHarpyBeam10", "EPCHarpyBeam11", "EPCHarpyBeam12",
 "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",}

OnWeaponCharging{ "EPCHarpyLightning2",
    function( triggerArgs )
		
		SetWeaponProperty({ WeaponNames = HarpyBeamWeapons, DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = false })    
end
}

OnWeaponCharging{ "EPCHarpyLightning2",
    function( triggerArgs )
		
		Destroy({ Ids = GetIdsByType({ Name = "BlankObstacle1" }) })
		Destroy({ Ids = GetIdsByType({ Name = "BlankObstacle2" }) })
		Destroy({ Ids = GetIdsByType({ Name = "BlankObstacle3" }) })
end
}

--Boss HarpyLightning--
-- OnWeaponFired{ "EPCHarpyLightning2",
--     function( triggerArgs )
-- 		local targetId = GetIdsByType({ Name = "BlankObstacle2" })
-- 		wait( 0.01 )
-- 		FireWeaponFromUnit({ Weapon = "EPCHarpyLightning", Id = CurrentRun.Hero.ObjectId, DestinationId = targetId, AutoEquip = true })
-- end
-- }

        
OnWeaponFired{ "EPCHarpyLightning3",
    function( triggerArgs )
		local WeaponName = triggerArgs.WeaponName
		wait( 0.01 )
		LEProcessAttackSlotsMeg()
end
}

OnWeaponFired{ "EPCHarpyLightning4",
    function( triggerArgs )
		local WeaponName = triggerArgs.WeaponName
		wait( 0.01 )
		LEProcessAttackSlotsMeg2()
end
}

--bug fix--
OnWeaponFired{ "EPCHarpyLightning3",
    function( triggerArgs )
		UnequipWeapon({ WeaponName = "EPCHarpyLightning2", DestinationId = CurrentRun.Hero.ObjectId })  
		wait( 1.25 )
		EquipWeapon({ WeaponName = "EPCHarpyLightning2", DestinationId = CurrentRun.Hero.ObjectId })  

end
}

OnWeaponFired{ "EPCHarpyLightning4",
    function( triggerArgs )
		UnequipWeapon({ WeaponName = "EPCHarpyLightning2", DestinationId = CurrentRun.Hero.ObjectId })  
		wait( 1.25 )
		EquipWeapon({ WeaponName = "EPCHarpyLightning2", DestinationId = CurrentRun.Hero.ObjectId })    

end
}

--Charge--
OnWeaponCharging{ "EPCHarpyLightning2",
	function( triggerArgs )

		DoEPCHarpyLightningCharge()
	end
}

function DoEPCHarpyLightningCharge()
	local spearDisplayOffsetY = -240
	thread( DoRumble, {{ RightFraction = 0.17, Duration = 0.3 }} )

	local spearWeaponStages =
	{
		{ OverrideFire = "EPCHarpyLightning3", Wait = 0.20 },
		{ OverrideFire = "EPCHarpyLightning4", Wait = 0.40 },
	}

	-- if HeroHasTrait( "SpearSpinChargeLevelTime" ) then
	-- 	spearWeaponStages =
	-- 		{
	-- 			{ OverrideFire = "SpearWeaponSpin2", Wait = 0.15 },
	-- 			{ OverrideFire = "SpearWeaponSpin3", Wait = 0.30 },
	-- 		}
	-- end

	local notifyName = "EmptyEPCHarpyLightningCharge"
	local stageReached = 0
	local maxStage = #spearWeaponStages
	for stage = 1, maxStage do
		local stageData = spearWeaponStages[stage]

		NotifyOnWeaponCharge({ Id = CurrentRun.Hero.ObjectId, Notify = notifyName, WeaponName = "EPCHarpyLightning2", ChargeFraction = 0.0, Comparison = "<=", Timeout = stageData.Wait })
		waitUntil( notifyName )
		if not _eventTimeoutRecord[notifyName] then
			EmptyEPCHarpyLightningCharge( stageReached )
			return
		end

		

		PlaySound({ Name = "/Leftovers/SFX/AuraOnLoud" })
		Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 4, MinFraction = 0.5, MaxFraction = 0.6, Color = Color.White, Duration = 0.3 })
		local updateString = tostring(stage + 1)
		if stage == maxStage then
			WeaponData.SpearWeaponSpin.MaxChargeText.TargetId = CurrentRun.Hero.ObjectId
			thread( InCombatTextArgs, WeaponData.SpearWeaponSpin.MaxChargeText )
		end
		thread( DoRumble, {{ RightFraction = 0.17, Duration = 0.3 }} )

		OverrideWeaponFire({ Id = CurrentRun.Hero.ObjectId, InitialWeaponName = "EPCHarpyLightning2", OverrideWeaponName = stageData.OverrideFire })
		stageReached = stage
	end

	NotifyOnWeaponCharge({ Id = CurrentRun.Hero.ObjectId, Notify = notifyName, WeaponName = "EPCHarpyLightning2", ChargeFraction = 0.0, Comparison = "<=" })
	waitUntil( notifyName )

	EmptyEPCHarpyLightningCharge( stageReached )
    
end

function EmptyEPCHarpyLightningCharge( stageReached )
	if stageReached >= 1 then
		Rumble({ RightFraction = 0.7, Duration = 0.3 })
	end
	OverrideWeaponFire({ Id = CurrentRun.Hero.ObjectId, InitialWeaponName = "EPCHarpyLightning2", OverrideWeaponName = nil })
end

OnWeaponTriggerRelease{ "EPCHarpyLightning2",
    function( triggerArgs )
		
		--UnEquipWeapon({ Name = WeaponData.EPCHarpyLightning, DestinationId = newCurrentRun.Hero.ObjectId })    
end
}

function DoHarpyBeamDisable()
	SetWeaponProperty({ WeaponName = "EPCHarpyLightning2", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = false })
--wait(0.35)
--SetWeaponProperty({ WeaponName = "EPCHarpyLightning2", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
end

-- OnWeaponFired{ "EPCHarpyLightning2",
--     function( triggerArgs )
-- 		thread(dotripplehellfire)
-- end
-- }

function dotripplehellfire()
	local targetObstacle = "BlankObstacle"
		wait(1.02)
		FireWeaponFromUnit({ Weapon = "EPCHarpyLightning", Id = CurrentRun.Hero.ObjectId, DestinationId = targetObstacle, AutoEquip = true })
		Destroy({ Id = targetObstacle })
end

-- Attack Slots --

 function LEProcessAttackSlotsMeg( )
	--WeaponData.EPCHarpyLightning = triggerArgs.WeaponName
	local targetId = GetIdsByType({ Name = "BlankObstacle2" })
	local enemyOriginalPosition = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = CurrentRun.Hero.ObjectId, Group = "Scripting" })
	local targetOriginalPosition = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = targetId, Group = "Scripting" })
	local numAttacks = WeaponData.EPCHarpyLightning_2.AttackSlotsPerTick or RandomInt(WeaponData.EPCHarpyLightning_2.AttackSlotsPerTickMin, WeaponData.EPCHarpyLightning_2.AttackSlotsPerTickMax)

	local attackSlots = DeepCopyTable(WeaponData.EPCHarpyLightning_2.AttackSlots)
	local removeNum = TableLength(WeaponData.EPCHarpyLightning_2.AttackSlots) - numAttacks
	local skipIndexes = {}
	for k = 1, removeNum, 1 do
		table.insert(skipIndexes, RemoveRandomKey(attackSlots))
	end

	local randomAngle = nil
	if WeaponData.EPCHarpyLightning_2.UseRandomAngle then
		randomAngle = RandomFloat(0, 360)
	end

	for k, attackSlot in ipairs(WeaponData.EPCHarpyLightning_2.AttackSlots) do
		if not Contains(skipIndexes, k) then
			local angle = attackSlot.Angle or randomAngle or 0
			if attackSlot.UseAngleBetween then
				angle = GetAngleBetween({ Id = enemyOriginalPosition, DestinationId = targetOriginalPosition })
			end
			if attackSlot.UseAttackerAngle then
				angle = GetAngle({ Id = CurrentRun.Hero.ObjectId })
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
				Teleport({ Id = CurrentRun.Hero.ObjectId, DestinationId = attackSlot.TeleportToId })
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
				AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = targetOffset })
			end

			wait( WeaponData.EPCHarpyLightning_2.AttackSlotPreFireWait or 0.01)
			FireWeaponFromUnit({ Weapon = "EPCHarpyLightning_2", Id = CurrentRun.Hero.ObjectId, DestinationId = targetOffset, AutoEquip = true })
			Destroy({ Id = targetOffset })
			-- if attackSlot.PauseDuration then
			-- 	wait( CalcEnemyWait( CurrentRun.Hero.ObjectId, attackSlot.PauseDuration), enemy.AIThreadName )
			-- end
			-- wait( CalcEnemyWait( CurrentRun.Hero.ObjectId, WeaponData.EPCHarpyLightning.AttackSlotInterval or 0.01), enemy.AIThreadName )

			-- if ReachedAIStageEnd(CurrentRun.Hero.ObjectId) then
			-- 	WeaponData.EPCHarpyLightning.ForcedEarlyExit = true
			-- 	return true
			-- end
		end
	end
	Destroy({ Id = enemyOriginalPosition })
	Destroy({ Id = targetOriginalPosition })
	Destroy({ Id = targetId })
end

--second charge stage--
function LEProcessAttackSlotsMeg2( )
	--WeaponData.EPCHarpyLightning = triggerArgs.WeaponName
	local targetId = GetIdsByType({ Name = "BlankObstacle3" })
	local enemyOriginalPosition = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = CurrentRun.Hero.ObjectId, Group = "Scripting" })
	local targetOriginalPosition = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = targetId, Group = "Scripting" })
	local numAttacks = WeaponData.EPCHarpyLightning.AttackSlotsPerTick or RandomInt(WeaponData.EPCHarpyLightning.AttackSlotsPerTickMin, WeaponData.EPCHarpyLightning.AttackSlotsPerTickMax)

	local attackSlots = DeepCopyTable(WeaponData.EPCHarpyLightning.AttackSlots)
	local removeNum = TableLength(WeaponData.EPCHarpyLightning.AttackSlots) - numAttacks
	local skipIndexes = {}
	for k = 1, removeNum, 1 do
		table.insert(skipIndexes, RemoveRandomKey(attackSlots))
	end

	local randomAngle = nil
	if WeaponData.EPCHarpyLightning.UseRandomAngle then
		randomAngle = RandomFloat(0, 360)
	end

	for k, attackSlot in ipairs(WeaponData.EPCHarpyLightning.AttackSlots) do
		if not Contains(skipIndexes, k) then
			local angle = attackSlot.Angle or randomAngle or 0
			if attackSlot.UseAngleBetween then
				angle = GetAngleBetween({ Id = enemyOriginalPosition, DestinationId = targetOriginalPosition })
			end
			if attackSlot.UseAttackerAngle then
				angle = GetAngle({ Id = CurrentRun.Hero.ObjectId })
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
				Teleport({ Id = CurrentRun.Hero.ObjectId, DestinationId = attackSlot.TeleportToId })
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
				AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = targetOffset })
			end

			wait( WeaponData.EPCHarpyLightning.AttackSlotPreFireWait or 0.01)
			FireWeaponFromUnit({ Weapon = "EPCHarpyLightning_3", Id = CurrentRun.Hero.ObjectId, DestinationId = targetOffset, AutoEquip = true })
			Destroy({ Id = targetOffset })
			-- if attackSlot.PauseDuration then
			-- 	wait( CalcEnemyWait( CurrentRun.Hero.ObjectId, attackSlot.PauseDuration), enemy.AIThreadName )
			-- end
			-- wait( CalcEnemyWait( CurrentRun.Hero.ObjectId, WeaponData.EPCHarpyLightning.AttackSlotInterval or 0.01), enemy.AIThreadName )

			-- if ReachedAIStageEnd(CurrentRun.Hero.ObjectId) then
			-- 	WeaponData.EPCHarpyLightning.ForcedEarlyExit = true
			-- 	return true
			-- end
		end
	end
	Destroy({ Id = enemyOriginalPosition })
	Destroy({ Id = targetOriginalPosition })
	Destroy({ Id = targetId })
end