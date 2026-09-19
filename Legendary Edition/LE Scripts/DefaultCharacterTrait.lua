TraitData.DefaultCharacterTrait =
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
    Icon = "Keepsake_Unknown",
    CustomTrayText = "SpearSpinTravel_Tray",
	WeaponBinks =
		{
			"ZagreusIdle_Bink",
			"ZagreusOnHit_Bink",
			"ZagreusStart_Bink",
			"ZagreusStop_Bink",
			"ZagreusRun_Bink",
			"ZagreusStun_Bink",
			"ZagreusInteractionFishing_Bink",
			"ZagreusInteractionFishingFail_Bink",
			"ZagreusWalk_Bink",
			"ZagreusWalkStop_Bink",
			"ZagreusHeroLanding_Bink",
			"ZagreusInteractEquip_Bink",
			"RoomTransition",
			"ZagreusDash_Bink",
			"ZagreusDashVFX_Bink",
            "ZagreusWrath_Bink",
		},
    PostWeaponUpgradeScreenAnimation = "FuryLungeReturnToIdle",
    RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
    RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
	HeroLandingAnimation = "EPCMegaeraHeroLanding_Air",
	HeroTouchdownGraphic = "ZagreusHeroLanding_ReturnToIdle",
	AttachedAnimationName = "LaurelCindersSpawner",
	IdleAnimation = "ZagreusIdle",
	MoveStartAnimation = "ZagreusStart",
	MoveAnimation = "ZagreusRun",
	MoveStopAnimation = "ZagreusStop",
	LowSpeedAnimation = "ZagreusRun",
	HighSpeedAnimation = "ZagreusRun",
	BaseSpeedValue = 540.0,
	ScaleFraction = 0,
	RequiredPackages = "null",
	DeathIdleAnimation = "ZagreusIdle",
	DeathAnimation = "ZagreusDeathFullscreen",
	DamagedAnimation = "ZagreusOnHit",
	InteractAnimation = "ZagreusInteractEquip",
	UpgradeAcquiredAnimation = "ZagreusLanding",
	IntroPresentationFunction = "DropHeroToRoomPosition",
    ExtraLifeIcon = "ExtraLifeZag",
	UpgradeAcquiredVoicelines = {
		RandomRemaining = true,
		PreLineWait = 0.5,
		CooldownTime = 20,
		SuccessiveChanceToPlayAll = 10,
		Queue = "Interrupt",
		Source = {SubtitleColor = Color.MegVoice},

		-- That's it.
		{ Cue = "/VO/MegaeraField_0290" },
		-- All right.
		{ Cue = "/VO/MegaeraField_0291" },
		-- Not bad.
		{ Cue = "/VO/MegaeraField_0628", },
	},
	SecretDoorDiveAnimation = "FuryLungeReturnToIdle",
	SecretRoomEntranceExitAnimation = "EPCMegaeraLanding_Air",
	DamagedSound = "/SFX/Enemy Sounds/Megaera/EmoteHurt",
	ChargingEmote = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
	PowerUpEmote = "/EmptyCue",
	LastStandAnimation = "EPCFuryShieldedStart",
	LastStandVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 12,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.MegVoice},

		-- Bastard!
		{ Cue = "/VO/MegaeraField_0090", },
		-- You bastard!
		{ Cue = "/VO/MegaeraField_0091", },
		-- How dare you!
		{ Cue = "/VO/MegaeraField_0094", },
		-- You dare?
		{ Cue = "/VO/MegaeraField_0095", },
		-- Why, you!
		{ Cue = "/VO/MegaeraField_0096", },
		-- That hurt.
		{ Cue = "/VO/MegaeraField_0097", },
		-- Ungh, you!
		{ Cue = "/VO/MegaeraField_0264", },
		-- Pfah!
		{ Cue = "/VO/MegaeraField_0265", },
		-- Tsch, heh.
		{ Cue = "/VO/MegaeraField_0267", },
		-- That all you've got?
		{ Cue = "/VO/MegaeraField_0637", },
		-- Am I supposed to be impressed?
		{ Cue = "/VO/MegaeraField_0635", },
		-- What else?
		{ Cue = "/VO/MegaeraField_0638", },
		-- Pfah!
		{ Cue = "/VO/MegaeraField_0265", },
		-- Tsch, heh.
		{ Cue = "/VO/MegaeraField_0267", },
		-- Augh, hahaha.
		{ Cue = "/VO/MegaeraField_0626", },
		-- Oh-hoh...
		{ Cue = "/VO/MegaeraField_0627", },
		-- Really.
		{ Cue = "/VO/MegaeraField_0629", },
		-- Hmph.
		{ Cue = "/VO/MegaeraField_0630", },
		-- That's it.
		{ Cue = "/VO/MegaeraField_0631", },
		-- Not yet.
		{ Cue = "/VO/MegaeraField_0632", },
		-- Ungh, heh.
		{ Cue = "/VO/MegaeraField_0633", },
		-- My turn.
		{ Cue = "/VO/MegaeraField_0641", },
		-- Mm.
		{ Cue = "/VO/MegaeraField_0768", },
		-- Really...
		{ Cue = "/VO/MegaeraField_0769", },
		-- Damn...
		{ Cue = "/VO/MegaeraField_0771", },
		-- Oh, come on.
		{ Cue = "/VO/MegaeraField_0772", },
	}},
	LastStandLastLifeVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 12,
		PreLineWait = 0.35,
		SuccessiveChanceToPlay = 0.05,
		Source = {SubtitleColor = Color.MegVoice},

		-- Bastard!
		{ Cue = "/VO/MegaeraField_0090", },
		-- You bastard!
		{ Cue = "/VO/MegaeraField_0091", },
		-- How dare you!
		{ Cue = "/VO/MegaeraField_0094", },
		-- You dare?
		{ Cue = "/VO/MegaeraField_0095", },
		-- Why, you!
		{ Cue = "/VO/MegaeraField_0096", },
		-- That hurt.
		{ Cue = "/VO/MegaeraField_0097", },
		-- Ungh, you!
		{ Cue = "/VO/MegaeraField_0264", },
		-- Pfah!
		{ Cue = "/VO/MegaeraField_0265", },
		-- Tsch, heh.
		{ Cue = "/VO/MegaeraField_0267", },
		-- That all you've got?
		{ Cue = "/VO/MegaeraField_0637", },
		-- Am I supposed to be impressed?
		{ Cue = "/VO/MegaeraField_0635", },
		-- What else?
		{ Cue = "/VO/MegaeraField_0638", },
		-- Pfah!
		{ Cue = "/VO/MegaeraField_0265", },
		-- Tsch, heh.
		{ Cue = "/VO/MegaeraField_0267", },
		-- Augh, hahaha.
		{ Cue = "/VO/MegaeraField_0626", },
		-- Oh-hoh...
		{ Cue = "/VO/MegaeraField_0627", },
		-- Really.
		{ Cue = "/VO/MegaeraField_0629", },
		-- Hmph.
		{ Cue = "/VO/MegaeraField_0630", },
		-- That's it.
		{ Cue = "/VO/MegaeraField_0631", },
		-- Not yet.
		{ Cue = "/VO/MegaeraField_0632", },
		-- Ungh, heh.
		{ Cue = "/VO/MegaeraField_0633", },
		-- My turn.
		{ Cue = "/VO/MegaeraField_0641", },
		-- Mm.
		{ Cue = "/VO/MegaeraField_0768", },
		-- Really...
		{ Cue = "/VO/MegaeraField_0769", },
		-- Damn...
		{ Cue = "/VO/MegaeraField_0771", },
		-- Oh, come on.
		{ Cue = "/VO/MegaeraField_0772", },
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
			Source = {SubtitleColor = Color.MegVoice},

					-- No...!
					{ Cue = "/VO/MegaeraField_0149", PreLineWait = 0.3 },
					-- No!
					{ Cue = "/VO/MegaeraField_0150", PreLineWait = 0.3 },
					-- How...!
					{ Cue = "/VO/MegaeraField_0151", PreLineWait = 0.3 },
					-- How...?!
					{ Cue = "/VO/MegaeraField_0152", PreLineWait = 0.3 },
					-- What...?!
					{ Cue = "/VO/MegaeraField_0153", PreLineWait = 0.3 },
					-- Impossible!
					{ Cue = "/VO/MegaeraField_0154", },
					-- I can't--!
					{ Cue = "/VO/MegaeraField_0155", PreLineWait = 0.6 },
					-- Again?!
					{ Cue = "/VO/MegaeraField_0156", },
					-- Not again?!
					{ Cue = "/VO/MegaeraField_0157", },
					-- Ungh, damn...
					{ Cue = "/VO/MegaeraField_0316", PreLineWait = 0.3 },
					-- Damn you...
					{ Cue = "/VO/MegaeraField_0317", },
					-- Ngh, blood and--
					{ Cue = "/VO/MegaeraField_0318", },
					-- Lord Hades, I...
					{ Cue = "/VO/MegaeraField_0319", },
					-- Sisters...
					{ Cue = "/VO/MegaeraField_0320", },
					-- Why, you...
					{ Cue = "/VO/MegaeraField_0321", },
					-- This is...
					{ Cue = "/VO/MegaeraField_0322", },
					-- How could I--!
					{ Cue = "/VO/MegaeraField_0323", },
					-- Absurd...
					{ Cue = "/VO/MegaeraField_0324", },
					-- Why...
					{ Cue = "/VO/MegaeraField_0325", },
		},
	},
    SetupFunction =
    {
        Name = "null"
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
		DashWeapon = "EPCHarpyWhipWhirlDash",
		DashSwaps = { "EPCHarpyBeam" },
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "EPCHarpyWhipWhirl",
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