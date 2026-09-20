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
	DeathIdleAnimation = "ZagreusOnHitFinal",
	DeathAnimation = "ZagreusDeathFullscreen",
    PostEndingDeathAnimation = "ZagreusDeathPostEndingFullscreen",
    ExtraLifeIcon = "ExtraLifeZag",
	DamagedAnimation = "ZagreusOnHit",
	InteractAnimation = "ZagreusInteractEquip",
	UpgradeAcquiredAnimation = "ZagreusLanding",
	IntroPresentationFunction = "DropHeroToRoomPosition",
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
	-- UpgradeAcquiredVoicelines = {
	-- 	RandomRemaining = true,
	-- 	PreLineWait = 0.5,
	-- 	CooldownTime = 20,
	-- 	SuccessiveChanceToPlayAll = 10,
	-- 	Queue = "Interrupt",
	-- 	Source = {SubtitleColor = Color.MegVoice},

	-- 	-- That's it.
	-- 	{ Cue = "/VO/MegaeraField_0290" },
	-- 	-- All right.
	-- 	{ Cue = "/VO/MegaeraField_0291" },
	-- 	-- Not bad.
	-- 	{ Cue = "/VO/MegaeraField_0628", },
	-- },
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
	RequiredFalseRooms = { "E_Story_01" },
	-- Unnggh!
	{ Cue = "/VO/ZagreusField_0079", RequiredCompletedRuns = 0, BreakIfPlayed = true, SkipAnim = true },
	{
		{
			RandomRemaining = true,
			-- BreakIfPlayed = true,
			-- PreLineWait = 0.25,
			SkipAnim = true,
			RequiredFalseRooms = { "E_Story_01" },

			-- No...!
			{ Cue = "/VO/ZagreusScratch_0009b"},
			-- No...
			{ Cue = "/VO/ZagreusField_0067" },
			-- Aahh!
			{ Cue = "/VO/ZagreusField_0068" },
			-- Wha--?
			{ Cue = "/VO/ZagreusField_0069" },
			-- Wha?!
			{ Cue = "/VO/ZagreusField_0070" },
			-- Again?!
			{ Cue = "/VO/ZagreusField_0071" },
			-- Anngh.
			{ Cue = "/VO/ZagreusField_0072" },
			-- Aarrgh!
			{ Cue = "/VO/ZagreusField_0073" },
			-- No, no!
			{ Cue = "/VO/ZagreusField_0074" },
			-- Ah, damn it!
			{ Cue = "/VO/ZagreusField_0075" },
			-- Why, you...!
			{ Cue = "/VO/ZagreusField_0076" },
			-- Unh, no!
			{ Cue = "/VO/ZagreusField_0077" },
			-- Wha, how?
			{ Cue = "/VO/ZagreusField_0078" },
			-- Unnggh!
			{ Cue = "/VO/ZagreusField_0079" },
			-- No, wait...!
			{ Cue = "/VO/ZagreusField_0080" },
			-- Ugh, no!
			{ Cue = "/VO/ZagreusField_0290" },
			-- Aughh!
			{ Cue = "/VO/ZagreusField_0292" },
			-- Gaaah!
			-- { Cue = "/VO/ZagreusField_4003" },
			-- Daaah!
			{ Cue = "/VO/ZagreusField_4004" },
			-- Graah!
			{ Cue = "/VO/ZagreusField_4005" },
			-- Argh, you!
			-- { Cue = "/VO/ZagreusField_4006" },
			-- No, you!
			-- { Cue = "/VO/ZagreusField_4007" },
			-- Guh, argh!
			{ Cue = "/VO/ZagreusField_4008" },
			-- Huh--?
			{ Cue = "/VO/ZagreusField_4009" },
		},
	},
},
    -- SetupFunction =
    -- {
    --     Name = "null"
    -- },
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