TraitData.EPCTisiphoneTrait =
{
    InheritFrom = { "WeaponEnchantmentTrait" },
    RarityLevels =
    {
        Common =
        {
            MinMultiplier = 1,
            MaxMultiplier = 1,
        },
        Rare =
        {
            MinMultiplier = 0.65/0.7,
            MaxMultiplier = 0.65/0.7,
        },
        Epic =
        {
            MinMultiplier = 0.60/0.7,
            MaxMultiplier = 0.60/0.7,
        },
        Heroic =
        {
            MinMultiplier = 0.55/0.7,
            MaxMultiplier = 0.55/0.7,
        },
        Legendary =
        {
            MinMultiplier = 0.50/0.7,
            MaxMultiplier = 0.50/0.7,
        },
    },
    Icon = "CharacterTrait_Tisiphone",
    CustomTrayText = "SpearSpinTravel_Tray",
	WeaponBinks =
		{
			"Enemy_Tisiphone_Idle_Bink",
			"Enemy_Tisiphone_Run_Bink",
			"Enemy_Tisiphone_StartStop_Bink",
			"Enemy_Tisiphone_Lunge_Bink",
			"Enemy_Tisiphone_Beam_Bink",
			"Enemy_Tisiphone_Lightning_Bink",
			"Enemy_Tisiphone_WhipWhirl_Bink",
			"Enemy_Tisiphone_Shielded_Bink",
			"Enemy_Fury3_Dead_Bink",
			"Enemy_Tisiphone_Taunt_Bink",

			"Enemy_Fury_Idle_Bink",
			"Enemy_Alecto_Taunt_Bink",
			"Enemy_MegaeraMultiFuryHover_Bink",
			"Enemy_MegaeraMultiFuryTakeOff_Bink",
			"Enemy_MegaeraMultiFurySkyDive_Bink",
			"Enemy_AlectoMultiFuryHover_Bink",
			"Enemy_AlectoMultiFuryTakeOff_Bink",
			"Enemy_AlectoMultiFurySkyDive_Bink",
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "EPCHarpyWhipLasso" },
			FunctionName = "CheckVacuumNearbyEnemyTisiphone",
			FunctionArgs =
			{
				Range = 800,				-- Vacuum distance
				DistanceBuffer = 130,		-- Space to leave between player and enemy
				RushDistanceBuffer = 300,
				AutoLockArc = 60,
			},
		},
    PostWeaponUpgradeScreenAnimation = "Fury3LungeReturnToIdle",
    RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
    RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
	HeroLandingAnimation = "EPCTisiphoneHeroLanding_Air",
	HeroTouchdownGraphic = "EPCTisiphoneHeroLanding_ReturnToIdle",
	AttachedAnimationName = "MedusaShadow",
	IdleAnimation = "Fury3Idle",
	MoveStartAnimation = "EPCFury3Start",
	MoveAnimation = "EPCFury3Run",
	MoveStopAnimation = "EPCFury3Stop",
	LowSpeedAnimation = "EPCFury3Run",
	HighSpeedAnimation = "EPCFury3Run",
	ParryEmote = "/SFX/Enemy Sounds/Tisiphone/EmotePowerAttacking",
	BaseSpeedValue = 850.0,
	ScaleFraction = 1.3,
	RequiredPackages = "Tartarus",
	DeathIdleAnimation = "Fury3Idle",
	DeathAnimation = "EPCFuryDeadTisiphone",
	PostEndingDeathAnimation = "TisiphoneMultiFuryTakeOff",
	ExtraLifeIcon = "ExtraLifeTis",
	DamagedAnimation = "EPCTisiphoneOnHit",
	InteractAnimation = "Fury3Idle",
	BoonBox = "BoonBoxTis",
	BoonSelectInGraphic = "BoonSelectInTis",
	BoonSelectOutGraphic = "BoonSelectOutTis",
	BoonSelectLightingGraphic = "BoonSelectLighting_Tis",
	BoonOffset = 0.0,
	BoonSelectInFrontFxOffset = 0.0,
	UpgradeAcquiredAnimation = "Fury3LungeReturnToIdle",
	IntroPresentationFunction = "DoCurrentCharacterIntroLanding",
	UpgradeAcquiredVoicelines = {
		RandomRemaining = true,
		CooldownTime = 20,
		SuccessiveChanceToPlayAll = 10,
		Queue = "Interrupt",
		Source = {SubtitleColor = Color.TisiphoneVoice},

		-- Murder? murder...
		{ Cue = "/VO/Tisiphone_0028" },
		-- Hmmm...
		{ Cue = "/VO/Tisiphone_0061" },
		-- Murderer.
		{ Cue = "/VO/Tisiphone_0071" },
		-- Mmmuuur...
		{ Cue = "/VO/Tisiphone_0068" },
	},
	DamagedSound = "/SFX/Enemy Sounds/Tisiphone/EmoteHurt",
	SecretDoorDiveAnimation = "Fury3LungeReturnToIdle",
	SecretRoomEntranceExitAnimation = "EPCTisiphoneLanding_Air",
	ChargingEmote = "/SFX/Enemy Sounds/Tisiphone/EmoteCharging",
	PowerUpEmote = "/EmptyCue",
	LastStandAnimation = "EPCFury3ShieldedStart",
	LastStandVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 24,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.TisiphoneVoice},

		-- Mrr!
		{ Cue = "/VO/Tisiphone_0062" },
		-- Mmm.
		{ Cue = "/VO/Tisiphone_0063" },
		-- Rrr...
		{ Cue = "/VO/Tisiphone_0064" },
		-- Mrruu?
		{ Cue = "/VO/Tisiphone_0052" },
		-- Mrrngh...
		{ Cue = "/VO/Tisiphone_0065" },
		-- Mrhh!
		{ Cue = "/VO/Tisiphone_0066" },
		-- Rrngh!
		{ Cue = "/VO/Tisiphone_0067" },
	}},
	LastStandLastLifeVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 24,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.TisiphoneVoice},

		-- Mrr!
		{ Cue = "/VO/Tisiphone_0062" },
		-- Mmm.
		{ Cue = "/VO/Tisiphone_0063" },
		-- Rrr...
		{ Cue = "/VO/Tisiphone_0064" },
		-- Mrruu?
		{ Cue = "/VO/Tisiphone_0052" },
		-- Mrrngh...
		{ Cue = "/VO/Tisiphone_0065" },
		-- Mrhh!
		{ Cue = "/VO/Tisiphone_0066" },
		-- Rrngh!
		{ Cue = "/VO/Tisiphone_0067" },
	}},
	DeathVoiceLines =
		{
			Queue = "Interrupt",
			{
				{ Cue = "/EmptyCue" }
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.45,
				SkipAnim = true,
				Source = {SubtitleColor = Color.TisiphoneVoice},

				-- Mm, murderr....?
				{ Cue = "/VO/Tisiphone_0079" },
				-- Mrr, mur--!
				{ Cue = "/VO/Tisiphone_0080" },
				-- Mmurderr....
				{ Cue = "/VO/Tisiphone_0081" },
				-- Mmmuuu....
				{ Cue = "/VO/Tisiphone_0082" },
				-- Mur, der, err....
				{ Cue = "/VO/Tisiphone_0083" },
				-- Mmmmuunnngggh....
				{ Cue = "/VO/Tisiphone_0084" },
				-- Mm, mmrrr!
				{ Cue = "/VO/Tisiphone_0085" },
				-- Mrrr--?!
				{ Cue = "/VO/Tisiphone_0086" },
				-- Muurdderr...!
				{ Cue = "/VO/Tisiphone_0087" },
				-- Mur, murderr...
				{ Cue = "/VO/Tisiphone_0088" },
			},
		},
		RunClearedVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.6,
			Queue = "Interrupt",
			NoTarget = true,
			SkipAnim = true,
			Source = { SubtitleColor = Color.TisiphoneVoice },

			-- Murderer.
			{ Cue = "/VO/Tisiphone_0071" },
			-- Murdererrr....
			{ Cue = "/VO/Tisiphone_0072" },
			-- Mmurderer...
			{ Cue = "/VO/Tisiphone_0073" },
			-- Murderer!
			{ Cue = "/VO/Tisiphone_0074" },
			-- Murdererrr...!
			{ Cue = "/VO/Tisiphone_0076" },
			-- Murdererr.....
			{ Cue = "/VO/Tisiphone_0077" },
			-- Murdererr.
			{ Cue = "/VO/Tisiphone_0078" },
			-- <Laughter>
			-- { Cue = "/VO/Tisiphone_0075" },
			-- Murderer!
			{ Cue = "/VO/Tisiphone_0167" },
			-- Mmmurder....
			{ Cue = "/VO/Tisiphone_0168" },
			-- Mmmurrhrrhrhrhr...
			{ Cue = "/VO/Tisiphone_0170" },
		},
    SetupFunction =
    {
        Name = "EquipEPCTisiphoneWeapons"
    },
    WeaponDataOverride =
		{
			SpearWeapon =
	{
		InheritFrom = { "BaseUnlockableWeapon", },
		EquippedKitAnimation = "WeaponSpearFloatingIdleOff",
		UnequippedKitAnimation = "WeaponSpearFloatingIdle",
		BonusUnequippedKitAnimation = "WeaponSpearFloatingIdleBonus",
		BonusEquippedKitAnimation = "WeaponSpearFloatingIdleOffBonus",
		FirstTimeEquipAnimation = "ZagreusSpearThrowFireReturn",
		FirstTimeEquipSound = "/SFX/Player Sounds/ZagreusSpearSwipe",
		UpgradeChoiceText = "UpgradeChoiceMenu_Melee",
		ShortName = "SpearWeapon_Short",
		UnlockName = "SpearWeapon_Unlock",
		DashWeapon = "EPCHarpyWhipCombo3",
		DashSwaps = { "EPCHarpySlowBeam360" },
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "EPCHarpyWhipLasso",
		ResourceName = "LockKeys",
		UnlockCost = 4,
		LockKeyTextOffsetY = -125,
		--DashWeaponWindow = 0.6,
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearThrowFireReturn",
		PostWeaponUpgradeScreenAngle = 230,
		PostWeaponUpgradeScreenFunctionName = "null",
					},
},
}


--Equip Megaera Weapons And Swap Binks--

--Equip Megaera Weapons
function PermanentSwitchSecondaryWeapon( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroSecondaryWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchDashWeapon( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroDashWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchRangedWeapon( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroRangedWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchMeleeRangedWeapon( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroMeleeRangedWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchPhysicalWeapon( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroPhysicalWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchPrimarySecondaryWeapon( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroPrimarySecondaryWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchAllWeapons( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroAllWeapons ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function PermanentSwitchWeaponSet( unit, args )
	for k, weaponName in ipairs( WeaponSets.HeroWeaponSets ) do
		if unit.Weapons[weaponName] then
			SwapWeapon({ DestinationId = unit.ObjectId, Name = weaponName, SwapWeaponName = args, StompOriginalWeapon = true })
			return
		end
	end
end

function EquipEPCTisiphoneWeapons()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
    local TisiphoneWeaponSet = TisiphoneAllWeapons
	TisiphoneAllWeapons =
{ 
  --"TisiphoneRushWeaponControl", "EPCTisiphoneRushWeapon", 
  "HarpyWhipSlash1", "HarpyWhipSlash2", "HarpyWhipSlash3", 
 --"EPCHarpyLightningLineCONTROL", 
 "EPCHarpyLightningLine2", "EPCHarpyWhipLasso",
  "TisiphoneDash", "EPCHarpyWhipCombo3", "EPCHarpyLungeSurgeBeam",
}
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpySlowBeam360", "EPCHarpySlowBeam3602", "EPCHarpySlowBeam3603", PreLoadBinks = true })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = TisiphoneWeaponSet, PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HarpyLightningLine", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "EPCTisiphoneRushWeapon" })
	StopAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	SetupCharacterHandler()
	SetupCurrentCharacter()
	if CurrentRun.Hero.AttachedAnimationName == "LaurelCindersSpawner" then
		StopAnimation({ Names = "LaurelCindersSpawner", DestinationId = CurrentRun.Hero.ObjectId })
	end
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	--make sure to let the game know that we are playing as a custom character
	IsCustomHero = true
	UpdateLifePips()
end

function SetupEPCTisiphoneCharacter()
	--Remove Zagreus Binks To Set Current Character Binks
	-- SetThingProperty({ Property = "Graphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "MoveGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "StopGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	--Set Current Character Binks
	SetThingProperty({ Property = "Graphic", Value = "Fury3Idle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "Fury3Start", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "Fury3Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "Fury3Stop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = "Fury3Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = "Fury3Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 850.0, DestinationId = CurrentRun.Hero.ObjectId })
	SetScale({ Fraction = 1.3, Id = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = SubtitleColor, Value = Color.TisiphoneVoice, DestinationId = CurrentRun.Hero.ObjectId })
	LoadPackages{ Name = "Tartarus" }
end

TraitData.EPCDebugDamageTrait =
  {
    Icon = "extrememeasures",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			Multiplier = 1.34,
		},
		Epic =
		{
			Multiplier = 1.67,
		},
		Heroic =
		{
			Multiplier = 2.00,
		},
	},
	AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 10.0,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroWeaponSets.EPCHarpyBeam,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
}
