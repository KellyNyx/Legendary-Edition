TraitData.LECharonTrait =
{
    InheritFrom = { "WeaponEnchantmentTrait" },
	--PreEquipWeapons = { "EPCHarpyLightning2" },
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
    Icon = "CharacterTrait_Charon_Alt",
    CustomTrayText = "SpearSpinTravel_Tray",
	WeaponBinks =
		{
			"CharonIdleBattle_Bink",
			"CharonMove_Bink",
			"CharonMeleeFront_Bink",
			"CharonMeleeFrontLRTI_Bink",
			"CharonMeleeBackSwing_Bink",
			"CharonCast_Bink",
			"CharonRadialPush_Bink",
			"CharonGhostCharge_Bink",
			"CharonTaunt_Bink",
		},
		SwapAnimations = {
	--talk denial--
	["ZagreusTalkDenial"] = "Charon_IdleBattle",
	["ZagreusTalkDenialStart"] = "Charon_IdleBattle",
	["ZagreusTalkDenialReturnToIdle"] = "Charon_IdleBattle",
	["ZagreusTalkDenial_Full"] = "Charon_IdleBattle",
	--talk empathy--
	["ZagreusTalkEmpathy"] = "Charon_IdleBattle",
	["ZagreusTalkEmpathyStart"] = "Charon_IdleBattle",
	["ZagreusTalkEmpathy_Return"] = "Charon_IdleBattle",
	--Interact thoughtful--
	["ZagreusInteractionThoughtful"] = "Charon_IdleBattle",
	--Interact Come Hither--
	["ZagreusInteractionComeHither_Start"] = "Charon_IdleBattle",
	["ZagreusInteractionComeHither"] = "Charon_IdleBattle",
	["ZagreusInteractionComeHither_End"] = "Charon_IdleBattle",
	--Interact Fishing--
	["ZagreusInteractionFishing_Start"] = "Charon_IdleBattle",
	["ZagreusInteractionFishing_PullSuccess"] = "CharonMeleeFront_ReturnToIdleLeft",
	["ZagreusInteractionFishing_PullFailure"] = "CharonMeleeFront_ReturnToIdleLeft",
	--cosmetic purchase--
	["ZagreusCosmeticPurchase"] = "Charon_IdleBattle",
	--secret door dive--
	["ZagreusSecretDoorDive"] = "Charon_IdleBattle",
	--stunned--
	["ZagreusStun"] = "Charon_IdleBattle",
	},
    PostWeaponUpgradeScreenAnimation = "Charon_IdleBattle",
    --RequiredWeapons = {"MegWhipLash1", "EPCHarpyBeam",},
-- 	PreEquipWeapons = {"MegaeraDash", 
--   --"MegRushWeaponControl", "EPCMegaeraRushWeapon",
--   "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3", 
--   "EPCHarpyBeam4", "EPCHarpyBeam5",
--   "EPCHarpyBeam6", "EPCHarpyBeam7", 
--   "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
--   "EPCHarpyBeam11", "EPCHarpyBeam12", 
--   "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
--   "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash", "EPCHarpyLightning2", "EPCHarpyLightning",
--   "MegWhipLash1", "MegWhipLash2", "MegWhipLash3",},
	RequiredWeapons = { "SpearWeapon", "SpearWeaponThrow" },
    RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
	HeroLandingAnimation = "EPCMegaeraHeroLanding_Air",
	HeroTouchdownGraphic = "Charon_IdleGreeting",
	AttachedAnimationName = "CharonShadow",
	IdleAnimation = "Charon_IdleBattle",
	MoveStartAnimation = "Charon_Move",
	MoveAnimation = "Charon_Move",
	MoveStopAnimation = "Charon_IdleBattle",
	LowSpeedAnimation = "Charon_Move",
	HighSpeedAnimation = "Charon_Move",
	ParryEmote = "/SFX/Enemy Sounds/Charon/EmoteAttacking",
	BaseSpeedValue = 600.0,
	ScaleFraction = 1.4,
	RequiredPackages = "Charon",
	DeathIdleAnimation = "Charon_IdleBattle",
	DeathAnimation = "EPCFuryDead",
	ExtraLifeIcon = "ExtraLifeHeart",
	PostEndingDeathAnimation = "MegaeraMultiFuryTakeOff",
	DamagedAnimation = "Charon_IdleBattle",
	InteractAnimation = "CharonCast_Attack",
	BoonBox = "BoonBoxMeg",
	BoonSelectInGraphic = "BoonSelectInMeg",
	BoonSelectOutGraphic = "BoonSelectOutMeg",
	BoonSelectLightingGraphic = "BoonSelectLighting_Meg",
	BoonOffset = 0.0,
	BoonSelectInFrontFxOffset = 0.0,
	UpgradeAcquiredAnimation = "Charon_IdleBattle",
	IntroPresentationFunction = "CharonIntroPresentation",
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
	UpgradeAcquiredVoicelines = {
		RandomRemaining = true,
		PreLineWait = 0.5,
		CooldownTime = 20,
		SuccessiveChanceToPlayAll = 10,
		Queue = "Interrupt",
		Source = {SubtitleColor = Color.MegVoice},

		-- Ch'hehhh....
		{ Cue = "/VO/Charon_0056" },
		-- Hrnmm..
		{ Cue = "/VO/Charon_0057" },
		-- Krrr...
		{ Cue = "/VO/Charon_0058" },
		-- Nrrrhh...
		{ Cue = "/VO/Charon_0059" },
	},
	SecretDoorDiveAnimation = "Charon_IdleGreeting",
	SecretRoomEntranceExitAnimation = "Charon_IdleGreeting",
	--RoomEntrancePortalFunction = "LECharonTeleportToRoom",
	DamagedSound = "/SFX/Enemy Sounds/Charon/EmoteHurt",
	ChargingEmote = "/EmptyCue",
	PowerUpEmote = "/EmptyCue",
	LastStandAnimation = "CharonRadialPush_PreAttack",
	LastStandVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 12,
		PreLineWait = 0.35,
		Source = {SubtitleColor = Color.MegVoice},

		-- Hrraaauuggh!!
				{ Cue = "/VO/Charon_0100" },
				-- Hyyeeeh!
				{ Cue = "/VO/Charon_0101" },
				-- Nyaaaahh!
				{ Cue = "/VO/Charon_0102" },
				-- Hrrrnnn!
				{ Cue = "/VO/Charon_0103" },
				-- Hoh, hoohhh!
				{ Cue = "/VO/Charon_0104" },
				-- Rrrraauuggghhh....
				{ Cue = "/VO/Charon_0060" },
				-- Urrraaauuhggghh...
				{ Cue = "/VO/Charon_0061" },
				-- Hrrrnngaaaaugh!!
				{ Cue = "/VO/Charon_0062" },
				-- Krraaugghhh....
				{ Cue = "/VO/Charon_0063" },
	}},
	LastStandLastLifeVoicelines = {{
		BreakIfPlayed = true,
		RandomRemaining = true,
		CooldownTime = 12,
		PreLineWait = 0.35,
		SuccessiveChanceToPlay = 0.05,
		Source = {SubtitleColor = Color.MegVoice},

	-- Hrraaauuggh!!
				{ Cue = "/VO/Charon_0100" },
				-- Hyyeeeh!
				{ Cue = "/VO/Charon_0101" },
				-- Nyaaaahh!
				{ Cue = "/VO/Charon_0102" },
				-- Hrrrnnn!
				{ Cue = "/VO/Charon_0103" },
				-- Hoh, hoohhh!
				{ Cue = "/VO/Charon_0104" },
				-- Rrrraauuggghhh....
				{ Cue = "/VO/Charon_0060" },
				-- Urrraaauuhggghh...
				{ Cue = "/VO/Charon_0061" },
				-- Hrrrnngaaaaugh!!
				{ Cue = "/VO/Charon_0062" },
				-- Krraaugghhh....
				{ Cue = "/VO/Charon_0063" },
	}},
	DeathVoiceLines =
	{
		Queue = "Interrupt",
		-- {
		-- 	{ Cue = "/EmptyCue" }
		-- },
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.45,
			SkipAnim = true,
			Source = {SubtitleColor = Color.MegVoice},

					-- Hrraaauuggh!!
				{ Cue = "/VO/Charon_0100" },
				-- Hyyeeeh!
				{ Cue = "/VO/Charon_0101" },
				-- Nyaaaahh!
				{ Cue = "/VO/Charon_0102" },
				-- Hrrrnnn!
				{ Cue = "/VO/Charon_0103" },
				-- Hoh, hoohhh!
				{ Cue = "/VO/Charon_0104" },
				-- Rrrraauuggghhh....
				{ Cue = "/VO/Charon_0060" },
				-- Urrraaauuhggghh...
				{ Cue = "/VO/Charon_0061" },
				-- Hrrrnngaaaaugh!!
				{ Cue = "/VO/Charon_0062" },
				-- Krraaugghhh....
				{ Cue = "/VO/Charon_0063" },
		},
	},
	RunClearedVoiceLines = 
	{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.4,
				Queue = "Interrupt",
				NoTarget = true,
				SkipAnim = true,
				Source = { SubtitleColor = Color.MegVoice },
				RequiredTextLines = { "MegaeraGift10" },

				-- Hrreehhh, hehh....
				{ Cue = "/VO/Charon_0048" },
				-- Hrrooooaaauugghh...
				{ Cue = "/VO/Charon_0049" },
				-- Grraauugggh....
				{ Cue = "/VO/Charon_0050" },
				-- Hooaaaahh...!
				{ Cue = "/VO/Charon_0051" },
			},
    SetupFunction =
    {
        Name = "EquipLECharonWeapons"
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
		DashSwaps = { "MegWhipLash1", "MegWhipLash2", "MegWhipLash3", },
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "EPCHarpyBeam",
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


--Equip Charon Weapons And Swap Binks--

--Equip Charon Weapons--

function EquipLECharonWeapons()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
	CharonAllWeapons =
{ "LECharonDash", "LECharonMeleeLeft", "LECharonMeleeRight",
  "LECharonRadialPush", "LECharonWaveStraight", }
    local CharonWeaponSet = CharonAllWeapons
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "LECharonDash", PreLoadBinks = true })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "LECharonWaveStraight", PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = MegaeraWeaponSet, PreLoadBinks = true })
	--SetWeaponProperty({ Names = SpearWeapon, Property = "Enabled", Value = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
   -- EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyWhipWhirlDash", "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirl2", "EPCHarpyWhipWhirl3", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "LECharonDash" })
	StopAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	SetupCharacterHandler()
	
    if CurrentRun.Hero.AttachedAnimationName == "LaurelCindersSpawner" then
		StopAnimation({ Names = "LaurelCindersSpawner", DestinationId = CurrentRun.Hero.ObjectId })
	end
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	if IsCustomHero == false then
	EquipPlayerWeapon( WeaponData.LECharonMeleeLeft, { PreLoadBinks = true } )
	end
	--make sure to let the game know that we are playing as a custom character
	IsCustomHero = true
	LECharacterData.LastCharacter = TraitData.LECharonTrait
	LECharacterData.LastCharTraitName = "LECharonTrait"
	SetupCurrentCharacter()
	UpdateLifePips()  
	SwapCharAnimations()
    LoadPackages({ Name = "Charon" })
end