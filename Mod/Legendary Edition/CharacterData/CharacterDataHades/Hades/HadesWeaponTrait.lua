TraitData.EPCHadesTrait =
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
    Icon = "CharacterTrait_Hades_Alt",
    CustomTrayText = "SpearSpinTravel_Tray",
	WeaponBinks =
		{
			"HadesBattleIdle_Bink",
			"HadesBattleIntro_Bink",
			"HadesBattleIntroIdle_Bink",
			"HadesBattleRun_Bink",
			"HadesBattleDash_Bink",
			"HadesBattleAttackSpin_Bink",
			"HadesBattleBidentFlurry_Bink",
			"HadesBattleAttackRange_Bink",
			"HadesBattleSpawn_Bink",
			"HadesBattleWrathTwo_Bink",
			"HadesBattleKnockDown_Bink",
			"HadesBattleInvisibility_Bink",
			"HadesBattleCastBeam_Bink",
			"HadesBattleAttackArcOne_Bink",
			"HadesBattleAttackArcTwo_Bink",
			"HadesDeathFullscreen",
			"HadesBattleKnockDownTwo_Bink",
			"HadesBattleDeath_Bink",
			"HadesBattleKnockDownRecover_Bink",

			"HadesBattleAttackSpin2_Bink",
			"HadesBattleBidentThrow_Bink",
			"HadesBattleBidentDashRecover_Bink",
			"HadesBattleHeal_Bink",
			"HadesBattleKnockDownPreRecover_Bink",

			"Cerberus_HadesAssistJumpIn_Bink",
			"Cerberus_HadesAssistRun_Bink",
			"Cerberus_HadesAssistJumpFromRun_Bink",
		},
    PostWeaponUpgradeScreenAnimation = "HadesBattleBidentDash_Recover",
    RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
    RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
	IntroPresentationFunction = "HadesIntroPresentation",
	HeroLandingAnimation = "EPCAlectoHeroLanding_Air",
	HeroTouchdownGraphic = "EPCHadesBattleAttackRange_Fire",
	AttachedAnimationName = "LaurelCindersSpawnerHades",
	AttachedAnimationScale = 1.3,
	AttachedAnimationOffsetZ = 150,
	AttachedAnimation2Name = "MedusaShadow",
	IdleAnimation = "HadesBattleIdle",
	MoveStartAnimation = "EPCHadesBattleRun",
	MoveAnimation = "EPCHadesBattleRun",
	MoveStopAnimation = "HadesBattleIdle",
	LowSpeedAnimation = "EPCHadesBattleRun",
	HighSpeedAnimation = "EPCHadesBattleRun",
	BaseSpeedValue = 600.0,
	ScaleFraction = 1.4,
	RequiredPackages = "Styx",
    DeathAnimation = "HadesDeathFullscreen",
    DeathIdleAnimation = "HadesBattleKnockDownTwo",
	DamagedAnimation = "HadesBattleIdle",
	InteractAnimation = "EPCHadesBattleAttackRange_Fire",
	UpgradeAcquiredAnimation = "HadesBattleIdle",
	UpgradeAcquiredVoicelines = {
		RandomRemaining = true,
		CooldownTime = 30,
		SuccessiveChanceToPlayAll = 10,
		Queue = "Interrupt",
		Source = {SubtitleColor = Color.HadesVoice},

        --All right!
        { Cue = "/VO/HadesField_0577", RequiredPlayed = { "/VO/HadesField_0650" }, },
	},
	SecretDoorDiveAnimation = "EPCHadesBattleHeal_Start",
	SecretRoomEntranceExitAnimation = "EPCHadesBattleAttackRange_Fire",
	ChargingEmote = "/SFX/Enemy Sounds/Hades/EmoteCharging",
	PowerUpEmote = "/SFX/Enemy Sounds/Hades/EmotePoweringUp",
	LastStandAnimation = "HadesBattleKnockDownRecover",
	DamagedSound = "/SFX/Enemy Sounds/Hades/EmoteHurt",
	LastStandVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 16,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.HadesVoice},

		-- Enough of this!!
		{ Cue = "/VO/HadesField_0053" },
		-- You asked for this!
		{ Cue = "/VO/HadesField_0055", },
		-- Enough!!
		{ Cue = "/VO/HadesField_0057", },
		-- We're... not... finished!
		{ Cue = "/VO/HadesField_0651", },
		-- Let's see you deal with this!
		{ Cue = "/VO/HadesField_0652", },
		-- You... can't... kill... me!
		{ Cue = "/VO/HadesField_0653", },
		-- Come on and die!
		{ Cue = "/VO/HadesField_0654", },
		-- We're not finished!
		{ Cue = "/VO/HadesField_0571", },
		-- Blast you!
		{ Cue = "/VO/HadesField_0572", },
		-- That does it!
		{ Cue = "/VO/HadesField_0573", },
		-- You truly dare?
		{ Cue = "/VO/HadesField_0574", },
		-- Do not hold back!
		-- { Cue = "/VO/HadesField_0575", RequiredPlayed = { "/VO/HadesField_0650" }, },
		-- No holding back!
		{ Cue = "/VO/HadesField_0576", },
		-- All right!
		-- { Cue = "/VO/HadesField_0577", RequiredPlayed = { "/VO/HadesField_0650" }, },
		-- Try that again!
		{ Cue = "/VO/HadesField_0578", },
	}},
	LastStandLastLifeVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		SuccessiveChanceToPlay = 0.33,
		CooldownTime = 16,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.HadesVoice},

		-- I... can... still... fight!
		{ Cue = "/VO/HadesField_0650" },
		-- Then, this is it!
		{ Cue = "/VO/HadesField_0655", },
		-- Fight me for real, damn you!
		{ Cue = "/VO/HadesField_0656", },
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
				Source = {SubtitleColor = Color.HadesVoice},

				-- Charon... take me home.
				{ Cue = "/VO/HadesField_0138", },
				-- Fare... well.
				{ Cue = "/VO/HadesField_0140", },
				-- Good... riddance...
				{ Cue = "/VO/HadesField_0141", },
				-- Ungh... no...
				{ Cue = "/VO/HadesField_0142", },
				-- Blast... you...
				{ Cue = "/VO/HadesField_0311", },
				-- How... dare... you...
				{ Cue = "/VO/HadesField_0313", },
				-- You'll... pay... for...
				{ Cue = "/VO/HadesField_0314", },
				-- You... shall... not...
				{ Cue = "/VO/HadesField_0315", },
				-- Why... you... how...?
				{ Cue = "/VO/HadesField_0316", },
				-- I... cannot... remain.
				{ Cue = "/VO/HadesField_0374", },
				-- My... strength... fails...
				{ Cue = "/VO/HadesField_0375", },
				-- Blast... I... urgh...
				{ Cue = "/VO/HadesField_0376", },
				-- I shall... remember... this...
				{ Cue = "/VO/HadesField_0379", },
				-- Are you... yet... satisfied...
				{ Cue = "/VO/HadesField_0380", },
				-- Let's... do... this... again...
				{ Cue = "/VO/HadesField_0492", },
				-- I'll... get... you... yet...
				{ Cue = "/VO/HadesField_0493", },
				-- I... must... go...
				{ Cue = "/VO/HadesField_0497", RequiredPlayed = { "/VO/HadesField_0139" }, RequiredTextLines = { "Ending01" }, },
			},
		},
    SetupFunction =
    {
        Name = "EquipEPCHadesWeapons"
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
		DashWeapon = "EPCHadesBidentStrike",
		DashSwaps = { "EPCHadesBidentArcCombo1", "EPCHadesBidentArcCombo2", "EPCHadesBidentArcCombo3" },
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "EPCHadesBidentThrow",
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

function EquipEPCHadesWeapons()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
    local HadesWeaponSet = WeaponSets.HeroWeaponSets.EPCHadesBidentArcCombo1
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpySlowBeam360", "EPCHarpySlowBeam3602", "EPCHarpySlowBeam3603", PreLoadBinks = true })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = HadesWeaponSet, PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HarpyLightningLine", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "EPCHadesDash" })
	--StopAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	SetupCharacterHandler()
	SetupCurrentCharacter()
	if CurrentRun.Hero.AttachedAnimationName == "LaurelCindersSpawner" then
		StopAnimation({ Names = "LaurelCindersSpawner", DestinationId = CurrentRun.Hero.ObjectId })
	end
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