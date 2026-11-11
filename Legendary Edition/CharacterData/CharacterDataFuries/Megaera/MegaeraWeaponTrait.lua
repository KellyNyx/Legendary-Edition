TraitData.EPCMegaeraTrait =
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
    Icon = "CharacterTrait_Megaera",
    CustomTrayText = "SpearSpinTravel_Tray",
	WeaponBinks =
		{
			"Enemy_Fury_Idle_Bink",
			"Enemy_Fury_Run_Bink",
			"Enemy_Fury_StartStop_Bink",
			"Enemy_Fury_Lunge_Bink",
			"Enemy_Fury_Beam_Bink",
			"Enemy_Fury_Lightning_Bink",
			"Enemy_Fury_WhipWhirl_Bink",
			"Enemy_Fury_Shielded_Bink",
			"Enemy_Fury_Dead_Bink",
			"Enemy_Fury_Taunt_Bink",

			"Enemy_Alecto_Taunt_Bink",
			"Enemy_Tisiphone_Taunt_Bink",
			"Enemy_AlectoMultiFuryHover_Bink",
			"Enemy_AlectoMultiFuryTakeOff_Bink",
			"Enemy_AlectoMultiFurySkyDive_Bink",
			"Enemy_TisiphoneMultiFuryHover_Bink",
			"Enemy_TisiphoneMultiFuryTakeOff_Bink",
			"Enemy_TisiphoneMultiFurySkyDive_Bink",
		},
		SwapAnimations = {
	--talk denial--
	["ZagreusTalkDenial"] = "FuryIdleInHouseFidgetGreeting_ArmFoldLoop",
	["ZagreusTalkDenialStart"] = "FuryIdleInHouseFidgetGreeting_ArmFold",
	["ZagreusTalkDenialReturnToIdle"] = "FuryIdleInHouseFidgetGreeting_ReturnToIdle",
	["ZagreusTalkDenial_Full"] = "FuryIdleInHouseFidgetGreeting",
	--talk empathy--
	["ZagreusTalkEmpathy"] = "FuryIdle",
	["ZagreusTalkEmpathyStart"] = "FuryIdle",
	["ZagreusTalkEmpathy_Return"] = "FuryIdle",
	--Interact thoughtful--
	["ZagreusInteractionThoughtful"] = "FuryIdleInHouseFidgetGreeting",
	--Interact Come Hither--
	["ZagreusInteractionComeHither_Start"] = "FuryIdleInHouseFidgetWhipTaunt_Start",
	["ZagreusInteractionComeHither"] = "FuryIdleInHouseFidgetWhipTaunt_TappingLoop",
	["ZagreusInteractionComeHither_End"] = "FuryIdleInHouseFidgetWhipTaunt_ReturnToIdle",
	--Interact Fishing--
	["ZagreusInteractionFishing_Start"] = "FuryIdle",
	["ZagreusInteractionFishing_PullSuccess"] = "FuryIdle",
	["ZagreusInteractionFishing_PullFailure"] = "FuryIdle",
	--cosmetic purchase--
	["ZagreusCosmeticPurchase"] = "FuryIdle",
	--secret door dive--
	["ZagreusSecretDoorDive"] = "FuryLungeReturnToIdle",
	--stunned--
	["ZagreusStun"] = "EPCMegaeraOnHit",
	},
    PostWeaponUpgradeScreenAnimation = "FuryLungeReturnToIdle",
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
	HeroTouchdownGraphic = "EPCMegaeraHeroLanding_ReturnToIdle",
	AttachedAnimationName = "MedusaShadow",
	IdleAnimation = "FuryIdle",
	MoveStartAnimation = "EPCFuryStart",
	MoveAnimation = "EPCFuryRun",
	MoveStopAnimation = "EPCFuryStop",
	LowSpeedAnimation = "EPCFuryRun",
	HighSpeedAnimation = "EPCFuryRun",
	ParryEmote = "/SFX/Enemy Sounds/Megaera/EmoteLaugh",
	BaseSpeedValue = 600.0,
	ScaleFraction = 1.3,
	RequiredPackages = "Tartarus",
	DeathIdleAnimation = "FuryIdle",
	DeathAnimation = "EPCFuryDead",
	ExtraLifeIcon = "ExtraLifeMeg",
	PostEndingDeathAnimation = "MegaeraMultiFuryTakeOff",
	DamagedAnimation = "EPCMegaeraOnHit",
	InteractAnimation = "FuryIdle",
	BoonBox = "BoonBoxMeg",
	BoonSelectInGraphic = "BoonSelectInMeg",
	BoonSelectOutGraphic = "BoonSelectOutMeg",
	BoonSelectLightingGraphic = "BoonSelectLighting_Meg",
	BoonOffset = 0.0,
	BoonSelectInFrontFxOffset = 0.0,
	UpgradeAcquiredAnimation = "FuryLungeReturnToIdle",
	IntroPresentationFunction = "DoCurrentCharacterIntroLanding",
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
		-- {
		-- 	{ Cue = "/EmptyCue" }
		-- },
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

				-- It's all part of the job.
				{ Cue = "/VO/MegaeraField_0662" },
				-- Finally.
				{ Cue = "/VO/MegaeraField_0296" },
				-- I think we're finished here.
				{ Cue = "/VO/MegaeraField_0133" },
				-- <Laughter>
				{ Cue = "/VO/MegaeraField_0373" },
				-- Still got it in me after all this time.
				{ Cue = "/VO/MegaeraField_0679" },
			},
    SetupFunction =
    {
        Name = "EquipEPCMegaeraWeaponsTEST"
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


--Equip Megaera Weapons And Swap Binks--

--Equip Megaera Weapons--

function EquipEPCMegaeraWeapons()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
	MegAllWeapons =
{ "MegaeraDash", 
  --"MegRushWeaponControl", "EPCMegaeraRushWeapon",
  "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3", 
  "EPCHarpyBeam4", "EPCHarpyBeam5",
  "EPCHarpyBeam6", "EPCHarpyBeam7", 
  "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
  "EPCHarpyBeam11", "EPCHarpyBeam12", 
  "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
  "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash", "EPCHarpyLightning2", "EPCHarpyLightning3", "EPCHarpyLightning4", "EPCHarpyLightning", "EPCHarpyLightning_2", "EPCHarpyLightning_3",
  "MegWhipLash1", "MegWhipLash2", "MegWhipLash3", }
    local MegaeraWeaponSet = MegAllWeapons
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = MegaeraWeaponSet, PreLoadBinks = true })
	--SetWeaponProperty({ Names = SpearWeapon, Property = "Enabled", Value = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
   -- EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyWhipWhirlDash", "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirl2", "EPCHarpyWhipWhirl3", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "MegaeraDash" })
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
	LECharacterData.LastCharacter = TraitData.EPCMegaeraTrait
	UpdateLifePips()

	-- local unit = CurrentRun.Hero
	-- if not ScreenAnchors.LifePipIds or not unit.LastStands then
	-- 	return
	-- end
	-- local lastSeenLives = UIData.LastSeenLives or 0
	-- local numLives = TableLength( unit.LastStands )
	-- for i, lifePipId in pairs( ScreenAnchors.LifePipIds ) do
	-- 	local lastStandData = unit.LastStands[i]
	-- 	if lastStandData then
	-- 		SetAnimation({ Name = lastStandData.Icon, DestinationId = ScreenAnchors.LifePipIds[i] })
	-- 	else
	-- 		if unit.IsDead then
	-- 			if IsMetaUpgradeActive("ExtraChanceReplenishMetaUpgrade") then
	-- 				SetAnimation({ Name = "ExtraLifeReplenish", DestinationId = ScreenAnchors.LifePipIds[i] })
	-- 			else
	-- 				SetAnimation({ Name = "ExtraLifeMeg", DestinationId = ScreenAnchors.LifePipIds[i] })
	-- 			end
	-- 		else
	-- 			SetAnimation({ Name = "ExtraLifeEmpty", DestinationId = ScreenAnchors.LifePipIds[i] })
	-- 		end
	-- 	end
	-- end
	
    --EquipPlayerWeapon( WeaponData.MegWhipLash1, { PreLoadBinks = true } )
end

function EquipEPCMegaeraWeaponsTEST()
    local herospearweapon = WeaponSets.HeroWeaponSets.SpearWeapon
    local heroswordweapon = WeaponSets.HeroWeaponSets.SwordWeapon
	MegAllWeapons =
{ "MegaeraDash", 
  --"MegRushWeaponControl", "EPCMegaeraRushWeapon",
  "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3", 
  "EPCHarpyBeam4", "EPCHarpyBeam5",
  "EPCHarpyBeam6", "EPCHarpyBeam7", 
  "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
  "EPCHarpyBeam11", "EPCHarpyBeam12", 
  "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
  "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash", "EPCHarpyLightning2", "EPCHarpyLightning3", "EPCHarpyLightning4", "EPCHarpyLightning", "EPCHarpyLightning_2", "EPCHarpyLightning_3",
  "MegWhipLash1", "MegWhipLash2", "MegWhipLash3", }
    local MegaeraWeaponSet = MegAllWeapons
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = herospearweapon, UnloadPackages = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "MegaeraDash", PreLoadBinks = true })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, UnloadPackages = false })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyLightning2", PreLoadBinks = true })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyLightning3", PreLoadBinks = true })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyLightning4", PreLoadBinks = true })
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyLightning", PreLoadBinks = true })
    --EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = MegaeraWeaponSet, PreLoadBinks = true })
	--SetWeaponProperty({ Names = SpearWeapon, Property = "Enabled", Value = false })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "SpearWeapon", UnloadPackages = false })
   -- EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "EPCHarpyWhipWhirlDash", "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirl2", "EPCHarpyWhipWhirl3", PreLoadBinks = true })
    SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "PriorityWeapon", Value = "MegaeraDash" })
	StopAnimation({ Name = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	SetupCharacterHandler()
	
    if CurrentRun.Hero.AttachedAnimationName == "LaurelCindersSpawner" then
		StopAnimation({ Names = "LaurelCindersSpawner", DestinationId = CurrentRun.Hero.ObjectId })
	end
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	if IsCustomHero == false then
	EquipPlayerWeapon( WeaponData.MegWhipLash1, { PreLoadBinks = true } )
	end
	--make sure to let the game know that we are playing as a custom character
	IsCustomHero = true
	LECharacterData.LastCharacter = TraitData.EPCMegaeraTrait
	LECharacterData.LastCharTraitName = "EPCMegaeraTrait"
	SetupCurrentCharacter()
	UpdateLifePips()  
	SwapCharAnimations()
	SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "SubtitleColor", Value = 0.14, 0.48, 1.0, DataValue = false })
end
--function EquipEPCMegaeraWeapons()
  --  UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponSpin", "SpearWeaponDash", "SpearWeaponThrow" })
	--EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash", "SwordParry", LoadPackages = true })
    --SwapWeapon({ Name = "SpearWeaponDash", SwapWeaponName = "SwordWeaponDash", DestinationId = CurrentRun.Hero.ObjectId, StompOriginalWeapon = true })
    --SwapWeapon({ Name = "SpearWeaponThrow", SwapWeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId, StompOriginalWeapon = true })
	--	end
function EquipEPCMegaeraWeapon()
    local ZagreusRushWeapon = WeaponSets.HeroRushWeapons
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", UnloadPackages = false })
    EquipPlayerWeapon( WeaponData.EPCHarpyBeam, { PreLoadBinks = true } )
    LoadPackages{ Name = "Tartarus" }
end

TraitData.EPC_CharacterHandlerTrait =
{
	InheritFrom = { "WeaponEnchantmentTrait" },
    Icon = "Keepsake_Unknown",
}