TraitData.EPCAlectoTrait =
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
    Icon = "CharacterTrait_Alecto",
    CustomTrayText = "SpearSpinTravel_Tray",
	WeaponBinks =
		{
			"Enemy_Alecto_Idle_Bink",
			"Enemy_Alecto_Run_Bink",
			"Enemy_Alecto_StartStop_Bink",
			"Enemy_Alecto_Lunge_Bink",
			"Enemy_Alecto_Beam_Bink",
			"Enemy_Alecto_Lightning_Bink",
			"Enemy_Alecto_WhipWhirl_Bink",
			"Enemy_Alecto_Shielded_Bink",
			"Enemy_Fury2_Dead_Bink",
			"Enemy_Alecto_Taunt_Bink",
			"Enemy_Alecto_TauntIdleLoop_Bink",
			"Enemy_Alecto_Rage_Bink",

			"Enemy_Fury_Idle_Bink",
			"Enemy_Tisiphone_Taunt_Bink",
			"Enemy_MegaeraMultiFuryHover_Bink",
			"Enemy_MegaeraMultiFuryTakeOff_Bink",
			"Enemy_MegaeraMultiFurySkyDive_Bink",
			"Enemy_TisiphoneMultiFuryHover_Bink",
			"Enemy_TisiphoneMultiFuryTakeOff_Bink",
			"Enemy_TisiphoneMultiFurySkyDive_Bink",
		},
    PostWeaponUpgradeScreenAnimation = "Fury2LungeReturnToIdle",
    RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
    RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
	HeroLandingAnimation = "EPCAlectoHeroLanding_Air",
	HeroTouchdownGraphic = "EPCAlectoHeroLanding_ReturnToIdle",
	AttachedAnimationName = "MedusaShadow",
	IdleAnimation = "Fury2Idle",
	MoveStartAnimation = "EPCFury2Start",
	MoveAnimation = "EPCFury2Run",
	MoveStopAnimation = "EPCFury2Stop",
	LowSpeedAnimation = "EPCFury2Run",
	HighSpeedAnimation = "EPCFury2Run",
	ParryEmote = "/SFX/Enemy Sounds/Alecto/EmoteLaugh",
	BaseSpeedValue = 600.0,
	RageData = {
		EnragedPresentation = "EPCHarpyEnragedPresentation",
		RageDecayRate = 0.00,
		RageDecayStartDuration = 4.0,
		LastRageGainTime = 0,
		RageChargeMultiplier = 0.0,
		EnragedDuration = 12,
		EnragedWaitMultiplier = 0.65,
		EnragedSpeedValue = 800.0,
		EnragedMoveSpeedBonus = 200,
		RequiredMaxLastStandsForPermaRage = 0,
		PermaRageHealthThreshold = 0.30,
		RageWeapon = "EPCHarpyEnrage",
		RageFullSound = "/SFX/SurvivalChallengeStart",
		RageFullVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.25,
			CooldownTime = 20,
			Source = {SubtitleColor = Color.AlectoVoice},

			-- That's it!
			{ Cue = "/VO/Alecto_0166" },
			-- My turn.
			{ Cue = "/VO/Alecto_0167" },
			-- That does it!
			{ Cue = "/VO/Alecto_0168" },
			-- Now you've done it.
			{ Cue = "/VO/Alecto_0169" },
			-- Graahhh!
			{ Cue = "/VO/Alecto_0170" },
			-- Rrryaah!
			{ Cue = "/VO/Alecto_0171" },
			-- Raaahh!
			{ Cue = "/VO/Alecto_0172" },
			-- Enough of this!
			{ Cue = "/VO/Alecto_0173" },
			-- Why, you!
			{ Cue = "/VO/Alecto_0175" },
			-- Enough!
			{ Cue = "/VO/Alecto_0176" },
		},

		RageExpiredSound = "/Leftovers/World Sounds/MapZoomInShortHigh",
		RageExpiredVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.25,
			RequiresInRun = true,
			SuccessiveChanceToPlay = 0.33,
			Source = {SubtitleColor = Color.AlectoVoice},

			-- Whew.
			{ Cue = "/VO/Alecto_0177" },
			-- Whew!
			{ Cue = "/VO/Alecto_0178" },
			-- Nrrgghh...
			{ Cue = "/VO/Alecto_0179" },
			-- Mmph.
			{ Cue = "/VO/Alecto_0180" },
		},
	},
	ScaleFraction = 1.3,
	RequiredPackages = "Tartarus",
    DeathAnimation = "EPCFuryDeadAlecto",
	PostEndingDeathAnimation = "AlectoMultiFuryTakeOff",
    DeathIdleAnimation = "Fury2Idle",
	ExtraLifeIcon = "ExtraLifeAlecto",
	DamagedAnimation = "EPCAlectoOnHit",
	InteractAnimation = "Fury2Idle",
	BoonBox = "BoonBoxAlecto",
	BoonSelectInGraphic = "BoonSelectInAlecto",
	BoonSelectOutGraphic = "BoonSelectOutAlecto",
	BoonSelectLightingGraphic = "BoonSelectLighting_Alecto",
	BoonOffset = 0.0,
	BoonSelectInFrontFxOffset = 0.0,
	UpgradeAcquiredAnimation = "Fury2LungeReturnToIdle",
	IntroPresentationFunction = "DoCurrentCharacterIntroLanding",
	UpgradeAcquiredVoicelines = {
		RandomRemaining = true,
		CooldownTime = 30,
		SuccessiveChanceToPlayAll = 10,
		Queue = "Interrupt",
		Source = {SubtitleColor = Color.AlectoVoice},

		-- Interesting...!
		{ Cue = "/VO/Alecto_0144" },
		-- Oho, hoh...!
		{ Cue = "/VO/Alecto_0145" },
		-- Oh! good.
		{ Cue = "/VO/Alecto_0391" },
		-- Good.
		{ Cue = "/VO/Alecto_0389" },
	},
	SecretDoorDiveAnimation = "Fury2LungeReturnToIdle",
	SecretRoomEntranceExitAnimation = "EPCAlectoLanding_Air",
	ChargingEmote = "/SFX/Enemy Sounds/Alecto/EmoteCharging",
	PowerUpEmote = "/EmptyCue",
	LastStandAnimation = "EPCFury2ShieldedStart",
	DamagedSound = "/SFX/Enemy Sounds/Alecto/EmoteHurt",
	LastStandVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 16,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.AlectoVoice},

		-- T'hah.
		{ Cue = "/VO/Alecto_0186", },
		-- You trash.
		{ Cue = "/VO/Alecto_0187", },
		-- Piece of trash.
		{ Cue = "/VO/Alecto_0188", },
		-- Tsch.
		{ Cue = "/VO/Alecto_0189", },
		-- Tsch, heh.
		{ Cue = "/VO/Alecto_0190", },
		-- Huh.
		{ Cue = "/VO/Alecto_0191", },
		-- Pff.
		{ Cue = "/VO/Alecto_0192", },
		-- You little.
		{ Cue = "/VO/Alecto_0193", },
		-- Really.
		{ Cue = "/VO/Alecto_0194", },
		-- Really?
		{ Cue = "/VO/Alecto_0195", },
		-- Felt that.
		{ Cue = "/VO/Alecto_0198", },
		-- Ow.
		{ Cue = "/VO/Alecto_0199", },
		-- Not bad.
		{ Cue = "/VO/Alecto_0200", },
		-- Pfah!
		{ Cue = "/VO/Alecto_0205", },

		-- How dare you.
		{ Cue = "/VO/Alecto_0201", },
		-- Gah!
		{ Cue = "/VO/Alecto_0206", },
		-- Damn.
		{ Cue = "/VO/Alecto_0196", },
		-- Damn it.
		{ Cue = "/VO/Alecto_0197", },
		-- Urgh no.
		{ Cue = "/VO/Alecto_0202", },
		-- Augh damn!
		{ Cue = "/VO/Alecto_0203", },
		-- Ungh, you!
		{ Cue = "/VO/Alecto_0204", },
		-- Urgh.
		{ Cue = "/VO/Alecto_0184", },
		-- Hrrr.
		{ Cue = "/VO/Alecto_0185", },
	}},
	LastStandLastLifeVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		SuccessiveChanceToPlay = 0.33,
		CooldownTime = 16,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.AlectoVoice},

		-- T'hah.
		{ Cue = "/VO/Alecto_0186", },
		-- You trash.
		{ Cue = "/VO/Alecto_0187", },
		-- Piece of trash.
		{ Cue = "/VO/Alecto_0188", },
		-- Tsch.
		{ Cue = "/VO/Alecto_0189", },
		-- Tsch, heh.
		{ Cue = "/VO/Alecto_0190", },
		-- Huh.
		{ Cue = "/VO/Alecto_0191", },
		-- Pff.
		{ Cue = "/VO/Alecto_0192", },
		-- You little.
		{ Cue = "/VO/Alecto_0193", },
		-- Really.
		{ Cue = "/VO/Alecto_0194", },
		-- Really?
		{ Cue = "/VO/Alecto_0195", },
		-- Felt that.
		{ Cue = "/VO/Alecto_0198", },
		-- Ow.
		{ Cue = "/VO/Alecto_0199", },
		-- Not bad.
		{ Cue = "/VO/Alecto_0200", },
		-- Pfah!
		{ Cue = "/VO/Alecto_0205", },

		-- How dare you.
		{ Cue = "/VO/Alecto_0201", },
		-- Gah!
		{ Cue = "/VO/Alecto_0206", },
		-- Damn.
		{ Cue = "/VO/Alecto_0196", },
		-- Damn it.
		{ Cue = "/VO/Alecto_0197", },
		-- Urgh no.
		{ Cue = "/VO/Alecto_0202", },
		-- Augh damn!
		{ Cue = "/VO/Alecto_0203", },
		-- Ungh, you!
		{ Cue = "/VO/Alecto_0204", },
		-- Urgh.
		{ Cue = "/VO/Alecto_0184", },
		-- Hrrr.
		{ Cue = "/VO/Alecto_0185", },
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
				Source = {SubtitleColor = Color.AlectoVoice},

				-- No way...!
				{ Cue = "/VO/Alecto_0244" },
				-- Damn, I--!
				{ Cue = "/VO/Alecto_0245" },
				-- How...!
				{ Cue = "/VO/Alecto_0246" },
				-- How...?!
				{ Cue = "/VO/Alecto_0247" },
				-- What...?!
				{ Cue = "/VO/Alecto_0248" },
				-- Gaah!
				{ Cue = "/VO/Alecto_0249" },
				-- I can't--!
				{ Cue = "/VO/Alecto_0250" },
				-- Again?!
				{ Cue = "/VO/Alecto_0251" },
				-- Ahh, why--!
				{ Cue = "/VO/Alecto_0252" },
				-- Why, you--!
				{ Cue = "/VO/Alecto_0253" },
				-- Ungh, damn...
				{ Cue = "/VO/Alecto_0254" },
				-- Damn you...
				{ Cue = "/VO/Alecto_0255" },
				-- Argh, how--!
				{ Cue = "/VO/Alecto_0256" },
			},
		},
		RunClearedVoiceLines = {
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.3,
				Queue = "Interrupt",
				NoTarget = true,
				SkipAnim = true,
				Source = { SubtitleColor = Color.AlectoVoice },

				-- Finally.
				{ Cue = "/VO/Alecto_0226" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0231" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0229" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0230" },
				-- Finally, whew.
				{ Cue = "/VO/Alecto_0238" },
				-- Was just a matter of time I guess.
				{ Cue = "/VO/Alecto_0239" },
				-- I guess we're finished here.
				{ Cue = "/VO/Alecto_0305" },
			},
    SetupFunction =
    {
        Name = "EquipEPCAlectoWeaponsTEST"
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
		DashWeapon = "EPCHarpyWhipWhirlAlectoDash",
		DashSwaps = { "AlectoWhipLash1", "AlectoWhipLash2", "AlectoWhipLash3",
	                  "AlectoWhipLash4", "AlectoWhipLash5", "AlectoWhipLash6", },
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "EPCHarpyWhipShot",
		ResourceName = "LockKeys",
		UnlockCost = 4,
		LockKeyTextOffsetY = -125,
		--DashWeaponWindow = 0.6,
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearThrowFireReturn",
		PostWeaponUpgradeScreenAngle = 230,
		PostWeaponUpgradeScreenFunctionName = "null",
		EquipVoiceLines =
    {
        {
            Cooldowns =
            {
                { Name = "ZagreusWeaponEquipSpeech", Time = 40 },
            },
            {
                BreakIfPlayed = true,
                PreLineWait = 0.35,

                ExplicitRequirements = true,
                GameStateRequirements =
                {
                    -- None
                },

                -- Varatha, the Eternal Spear; join my pursuit.
                { Cue = "/VO/ZagreusField_0153", PlayOnce = true },
            },
            {
                RandomRemaining = true,
                PreLineWait = 0.35,
                SuccessiveChanceToPlay = 0.33,
                TriggerCooldowns = { "ZagreusMiscWeaponEquipSpeech", },

                ExplicitRequirements = true,
                GameStateRequirements =
                {
                    -- None
                },

                -- Pain...
				{ Cue = "/VO/Alecto_0110" },
				-- My turn.
				{ Cue = "/VO/Alecto_0167" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0309" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0310" },
            },
            [3] = GlobalVoiceLines.MiscWeaponEquipVoiceLines,
        },
        [2] = GlobalVoiceLines.SkellyWeaponEquipReactionVoiceLines,
    }
					},
},
}


--Equip Alecto Weapons And Swap Binks--

--Equip Alecto Weapons

function EquipEPCAlectoWeapons()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
    local AlectoWeaponSet = AlectoAllWeapons

	AlectoAllWeapons =
{ --"EPCHarpyWhipArc", "EPCHarpyWhipArc2", "AlectoWhipSlash"
"AlectoWhipLash1", "AlectoWhipLash2", "AlectoWhipLash3", "AlectoWhipLash4", "AlectoWhipLash5", "AlectoWhipLash6", 
"EPCHarpyWhipRageBeam",
"AlectoDash", "EPCHarpyWhipShot", "EPCHarpyLightningChase",  }
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpySlowBeam360", "EPCHarpySlowBeam3602", "EPCHarpySlowBeam3603", PreLoadBinks = true })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = AlectoWeaponSet, PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HarpyLightningLine", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "EPCAlectoRushWeapon" })
	StopAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	SetupCharacterHandler()
	IsCustomHero = true
	LECharacterData.LastCharacter = TraitData.EPCAlectoTrait
	LECharacterData.LastCharTraitName = "EPCAlectoTrait"
	SetupCurrentCharacter()
	CreatePlayerRageMeter(CurrentRun.Hero)
	if CurrentRun.Hero.AttachedAnimationName == "LaurelCindersSpawner" then
		StopAnimation({ Names = "LaurelCindersSpawner", DestinationId = CurrentRun.Hero.ObjectId })
	end
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	--make sure to let the game know that we are playing as a custom character
	
	UpdateLifePips()
	
end

function EquipEPCAlectoWeaponsTEST()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
    local AlectoWeaponSet = AlectoAllWeapons

	AlectoAllWeapons =
{ --"EPCHarpyWhipArc", "EPCHarpyWhipArc2", "AlectoWhipSlash"
"AlectoWhipLash1", "AlectoWhipLash2", "AlectoWhipLash3", "AlectoWhipLash4", "AlectoWhipLash5", "AlectoWhipLash6", 
"EPCHarpyWhipRageBeam",
"AlectoDash", "EPCHarpyWhipShot", "EPCHarpyLightningChase",  }
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "AlectoDash", PreLoadBinks = true })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "EPCHarpyLightningChase", PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpySlowBeam360", "EPCHarpySlowBeam3602", "EPCHarpySlowBeam3603", PreLoadBinks = true })
    --UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = AlectoWeaponSet, PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HarpyLightningLine", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "EPCAlectoRushWeapon" })
	StopAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	SetupCharacterHandler()
	if IsCustomHero == false then
	EquipPlayerWeapon( WeaponData.AlectoWhipLash1, { PreLoadBinks = true } )
	end
	IsCustomHero = true
	LECharacterData.LastCharacter = TraitData.EPCAlectoTrait
	LECharacterData.LastCharTraitName = "EPCAlectoTrait"
	SetupCurrentCharacter()
	CreatePlayerRageMeter(CurrentRun.Hero)
	if CurrentRun.Hero.AttachedAnimationName == "LaurelCindersSpawner" then
		StopAnimation({ Names = "LaurelCindersSpawner", DestinationId = CurrentRun.Hero.ObjectId })
	end
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	--make sure to let the game know that we are playing as a custom character
	
	UpdateLifePips()
	
end

function SetupEPCAlectoCharacter()
	--Remove Zagreus Binks To Set Current Character Binks
	-- SetThingProperty({ Property = "Graphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "MoveGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	-- SetUnitProperty({ Property = "StopGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	--Set Current Character Binks
	SetThingProperty({ Property = "Graphic", Value = "Fury2Idle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "Fury2Start", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "Fury2Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "Fury2Stop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = "Fury2Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = "Fur2Run", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 600, DestinationId = CurrentRun.Hero.ObjectId })
	SetScale({ Fraction = 1.3, Id = CurrentRun.Hero.ObjectId })
    --SetThingProperty({ Property = "SubtitleColor", Value = { Red = 0.22, Green = 1.0, Blue = 0.22 }, DestinationId = CurrentRun.Hero.ObjectId })
end