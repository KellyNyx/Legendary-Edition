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

--Dash boon fixes

-- TraitData.ZeusRushTrait =
-- 	{
-- 		Icon = "Boon_Zeus_06",
-- 		InheritFrom = { "ShopTier1Trait" },
-- 		God = "Zeus",
-- 		Slot = "Rush",
-- 		PreEquipWeapons = { "LightningDash" },

-- 		AddRush =
-- 		{
-- 			FunctionName = "ZeusDash",
-- 			RunOnce = true,
-- 		},
-- 		RarityLevels =
-- 		{
-- 			Common =
-- 			{
-- 				MinMultiplier = 1.00,
-- 				MaxMultiplier = 1.00,
-- 			},
-- 			Rare =
-- 			{
-- 				MinMultiplier = 1.5,
-- 				MaxMultiplier = 1.5,
-- 			},
-- 			Epic =
-- 			{
-- 				MinMultiplier = 2.0,
-- 				MaxMultiplier = 2.0,
-- 			},
-- 			Heroic =
-- 			{
-- 				MinMultiplier = 2.5,
-- 				MaxMultiplier = 2.5,
-- 			},
-- 		},
-- 		PropertyChanges =
-- 		{
-- 			{
-- 				WeaponName = "LightningDash",
-- 				ProjectileProperty = "DamageLow",
-- 				BaseMin = 10,
-- 				BaseMax = 10,
-- 				DepthMult = DepthDamageMultiplier,
-- 				IdenticalMultiplier =
-- 				{
-- 					Value = DuplicateVeryStrongMultiplier,
-- 				},
-- 				ExtractValue =
-- 				{
-- 					ExtractAs = "TooltipDamage",
-- 				}
-- 			},
-- 			{
-- 				WeaponName = "LightningDash",
-- 				ProjectileProperty = "DamageHigh",
-- 				DeriveValueFrom = "DamageLow"
-- 			},
-- 			{
-- 				WeaponName = "RushWeapon",
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Zeus",
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponName = "RushWeapon",
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Zeus",
-- 				ChangeType = "Absolute",
-- 			},


-- 		},
-- 	}

-- 	TraitData.PoseidonRushTrait =
-- 	{
-- 		InheritFrom = { "ShopTier1Trait" },
-- 		God = "Poseidon",
-- 		Slot = "Rush",
-- 		Icon = "Boon_Poseidon_03",
-- 		RarityLevels =
-- 		{
-- 			Common =
-- 			{
-- 				Multiplier = 1.00,
-- 			},
-- 			Rare =
-- 			{
-- 				Multiplier = 1.20,
-- 			},
-- 			Epic =
-- 			{
-- 				Multiplier = 1.40,
-- 			},
-- 			Heroic =
-- 			{
-- 				Multiplier = 1.60,
-- 			}
-- 		},
-- 		PropertyChanges =
-- 		{
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "Projectile",
-- 				ChangeValue = "PoseidonRushProjectile",
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "CancelAttachedProjectiles",
-- 				ChangeValue = false,
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponName = "RushWeapon",
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Poseidon",
-- 				ChangeType = "Absolute",
-- 			},

-- 			{
-- 				WeaponName = "RushWeapon",
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Poseidon",
-- 				ChangeType = "Absolute",
-- 			},

-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "BlinkDetonateAtOrigin",
-- 				ChangeValue = false,
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "BlinkDetonateAtEndpoint",
-- 				ChangeValue = true,
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "BlinkDetonateAtEndpointDelay",
-- 				ChangeValue = -0.1,
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				ProjectileProperty = "DamageLow",
-- 				BaseMin = 35,
-- 				BaseMax = 35,
-- 				DepthMult = DepthDamageMultiplier,
-- 				IdenticalMultiplier =
-- 				{
-- 					Value = DuplicateStrongMultiplier,
-- 				},
-- 				ExtractValue =
-- 				{
-- 					ExtractAs = "TooltipDamage",
-- 				}
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				ProjectileProperty = "DamageHigh",
-- 				DeriveValueFrom = "DamageLow"
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				EffectName = "OnHitStun",
-- 				EffectProperty = "Active",
-- 				ChangeValue = true,
-- 			},
-- 		},
-- 	}

-- TraitData.AthenaRushTrait.RequiredFalseTraits = { "EPC_CharacterHandlerTrait" }

-- TraitData.AthenaRushTrait1 = 
-- {
-- 	RequiredTrait = { "EPC_CharacterHandlerTrait" },
-- 	Icon = "Boon_Athena_03",
-- 		InheritFrom = { "ShopTier1Trait" },
-- 		God = "Athena",
-- 		Slot = "Rush",
-- 		RarityLevels =
-- 		{
-- 			Common =
-- 			{
-- 				Multiplier = 1.0,
-- 			},
-- 			Rare =
-- 			{
-- 				Multiplier = 1.2,
-- 			},
-- 			Epic =
-- 			{
-- 				Multiplier = 1.4,
-- 			},
-- 			Heroic =
-- 			{
-- 				Multiplier = 1.6,
-- 			}
-- 		},
-- 		PropertyChanges =
-- 		{
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "Projectile",
-- 				ChangeValue = "AthenaRushProjectile",
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrail-AthenaDark",
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Athena",
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				WeaponProperty = "BlinkDetonateOnInterval",
-- 				ChangeValue = 60,
-- 				ChangeType = "Absolute",
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				EffectName = "AthenaDashShieldReflection",
-- 				EffectProperty = "Active",
-- 				ChangeValue = true,
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				EffectName = "AthenaDashShieldReflect",
-- 				EffectProperty = "Active",
-- 				ChangeValue = true,
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				ProjectileProperty = "DamageLow",
-- 				BaseMin = 10,
-- 				BaseMax = 10,
-- 				AsInt = true,
-- 				MinMultiplier = 0.2,
-- 				IdenticalMultiplier =
-- 				{
-- 					Value = DuplicateStrongMultiplier,
-- 				},
-- 				ExtractValue =
-- 				{
-- 					ExtractAs = "TooltipDamage",
-- 				}
-- 			},
-- 			{
-- 				WeaponNames = WeaponSets.HeroRushWeapons,
-- 				ProjectileProperty = "DamageHigh",
-- 				DeriveValueFrom = "DamageLow"
-- 			},
-- 		},
-- }
-- table.insert( LootData.AthenaUpgrade.PriorityUpgrades, "AthenaRushTrait1" )
-- table.insert( LootData.AthenaUpgrade.WeaponUpgrades, "AthenaRushTrait1" )
-- table.insert( LootData.AthenaUpgrade.LinkedUpgrades.AthenaBackstabDebuffTrait.OneOf, "AthenaRushTrait1" )
-- table.insert( LootData.AthenaUpgrade.LinkedUpgrades.AthenaShieldTrait.OneOf, "AthenaRushTrait1" )
	-- TraitData.AphroditeRushTrait =
	-- {
	-- 	InheritFrom = { "ShopTier1Trait" },
	-- 	God = "Aphrodite",
	-- 	Slot = "Rush",
	-- 	Icon = "Boon_Aphrodite_03",
	-- 	RarityLevels =
	-- 	{
	-- 		Common =
	-- 		{
	-- 			Multiplier = 1.00,
	-- 		},
	-- 		Rare =
	-- 		{
	-- 			Multiplier = 1.20,
	-- 		},
	-- 		Epic =
	-- 		{
	-- 			Multiplier = 1.40,
	-- 		},
	-- 		Heroic =
	-- 		{
	-- 			Multiplier = 1.60,
	-- 		}
	-- 	},
	-- 	PropertyChanges =
	-- 	{
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "Projectile",
	-- 			ChangeValue = "AphroditeRushProjectile",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileProperty = "DamageLow",
	-- 			BaseMin = 20,
	-- 			BaseMax = 20,
	-- 			AsInt = true,
	-- 			DepthMult = DepthDamageMultiplier,
	-- 			IdenticalMultiplier =
	-- 			{
	-- 				Value = DuplicateVeryStrongMultiplier,
	-- 			},
	-- 			ExtractValue =
	-- 			{
	-- 				ExtractAs = "TooltipDamage",
	-- 			}
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileProperty = "DamageHigh",
	-- 			DeriveValueFrom = "DamageLow"
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtOrigin",
	-- 			ChangeValue = false,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtEndpoint",
	-- 			ChangeValue = true,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtEndpointDelay",
	-- 			ChangeValue = 0.01,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			EffectName = "ReduceDamageOutput",
	-- 			EffectProperty = "Active",
	-- 			ChangeValue = true,
	-- 		},
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireFx",
	-- 			ChangeValue = "BlinkTrailVerticalB-Aphrodite",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireGraphic",
	-- 			ChangeValue = "ZagreusDashNoCollide_Aphrodite",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 	},
	-- 	ExtractValues =
	-- 	{
	-- 		{
	-- 			ExtractAs = "TooltipWeakDuration",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "ReduceDamageOutput",
	-- 			BaseProperty = "Duration",
	-- 		},
	-- 		{
	-- 			ExtractAs = "TooltipWeakPower",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "ReduceDamageOutput",
	-- 			BaseProperty = "Modifier",
	-- 			Format = "NegativePercentDelta"
	-- 		}
	-- 	}
	-- }

	-- TraitData.ArtemisRushTrait =
	-- {
	-- 	InheritFrom = { "ShopTier1Trait" },
	-- 	RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
	-- 	God = "Artemis",
	-- 	Icon = "Boon_Artemis_03",
	-- 	Slot = "Rush",
	-- 	RarityLevels =
	-- 	{
	-- 		Common =
	-- 		{
	-- 			Multiplier = 1.00,
	-- 		},
	-- 		Rare =
	-- 		{
	-- 			Multiplier = 1.20,
	-- 		},
	-- 		Epic =
	-- 		{
	-- 			Multiplier = 1.40,
	-- 		},
	-- 		Heroic =
	-- 		{
	-- 			Multiplier = 1.60,
	-- 		}
	-- 	},
	-- 	AddOutgoingDamageModifiers =
	-- 	{
	-- 		ValidWeaponMultiplier = {
	-- 			BaseValue = 1.5,
	-- 			SourceIsMultiplier = true,
	-- 			IdenticalMultiplier =
	-- 			{
	-- 				Value = -0.8,
	-- 			},
	-- 		},
	-- 		ValidWeapons = WeaponSets.HeroDashWeapons,
	-- 		ExcludeLinked = true,
	-- 		ExtractValues =
	-- 		{
	-- 			{
	-- 				Key = "ValidWeaponMultiplier",
	-- 				ExtractAs = "TooltipDamageBonus",
	-- 				Format = "PercentDelta",
	-- 			},
	-- 		}
	-- 	},
	-- 	PropertyChanges =
	-- 	{
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireFx",
	-- 			ChangeValue = "BlinkTrailVerticalB-Artemis",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireGraphic",
	-- 			ChangeValue = "ZagreusDashNoCollide_Artemis",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 	},
	-- }

	-- TraitData.AresRushTrait =
	-- {
	-- 	Icon = "Boon_Ares_03",
	-- 	InheritFrom = { "ShopTier1Trait" },
	-- 	God = "Ares",
	-- 	Slot = "Rush",
	-- 	RarityLevels =
	-- 	{
	-- 		Common =
	-- 		{
	-- 			Multiplier = 1.0,
	-- 		},
	-- 		Rare =
	-- 		{
	-- 			Multiplier = 1.2,
	-- 		},
	-- 		Epic =
	-- 		{
	-- 			Multiplier = 1.4,
	-- 		},
	-- 		Heroic =
	-- 		{
	-- 			Multiplier = 1.6,
	-- 		}
	-- 	},
	-- 	PropertyChanges =
	-- 	{
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "Projectile",
	-- 			ChangeValue = "AresRushProjectile",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireGraphic",
	-- 			ChangeValue = "ZagreusDashNoCollide_Ares",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireFx",
	-- 			ChangeValue = "BlinkTrailVerticalB-Ares",
	-- 			ChangeType = "Absolute",
	-- 		},

	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileProperty = "DamageLow",
	-- 			BaseMin = 10,
	-- 			BaseMax = 10,
	-- 			AsInt = true,
	-- 			MinMultiplier = 0.2,
	-- 			DepthMult = DepthDamageMultiplier,
	-- 			IdenticalMultiplier =
	-- 			{
	-- 				Value = DuplicateStrongMultiplier,
	-- 			},
	-- 			ExtractValue =
	-- 			{
	-- 				ExtractAs = "TooltipDamage",
	-- 			}
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileProperty = "DamageHigh",
	-- 			DeriveValueFrom = "DamageLow"
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtOrigin",
	-- 			ChangeValue = true,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtEndpoint",
	-- 			ChangeValue = false,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 	},
	-- }

	-- TraitData.DionysusRushTrait =
	-- {
	-- 	InheritFrom = { "ShopTier1Trait" },
	-- 	God = "Dionysus",
	-- 	Slot = "Rush",
	-- 	Icon = "Boon_Dionysus_03",
	-- 	RarityLevels =
	-- 	{
	-- 		Common =
	-- 		{
	-- 			MinMultiplier = 1.0,
	-- 			MaxMultiplier = 1.0,
	-- 		},
	-- 		Rare =
	-- 		{
	-- 			MinMultiplier = 1.5,
	-- 			MaxMultiplier = 1.5,

	-- 		},
	-- 		Epic =
	-- 		{
	-- 			MinMultiplier = 2.0,
	-- 			MaxMultiplier = 2.0,
	-- 		},
	-- 		Heroic =
	-- 		{
	-- 			MinMultiplier = 2.5,
	-- 			MaxMultiplier = 2.5,
	-- 		}
	-- 	},
	-- 	WeaponDataOverride =
	-- 	{
	-- 		RushWeapon =
	-- 		{
	-- 			CauseImpactReaction = false,
	-- 			ImpactReactionHitsOverride = 0,
	-- 		},
	-- 	},
	-- 	PropertyChanges =
	-- 	{
	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireFx",
	-- 			ChangeValue = "BlinkTrailVerticalB-Dionysus",
	-- 			ChangeType = "Absolute",
	-- 		},

	-- 		{
	-- 			WeaponName = "RushWeapon",
	-- 			WeaponProperty = "FireGraphic",
	-- 			ChangeValue = "ZagreusDashNoCollide_Dionysus",
	-- 			ChangeType = "Absolute",
	-- 		},

	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "Projectile",
	-- 			ChangeValue = "DionysusDashProjectile",
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		--[[
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateOnInterval",
	-- 			ChangeValue = 120,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		]]
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtOrigin",
	-- 			ChangeValue = true,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "BlinkDetonateAtEndpoint",
	-- 			ChangeValue = false,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		--[[
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileProperty = "Range",
	-- 			ChangeValue = 0.0,
	-- 			ChangeType = "Absolute",
	-- 		},
	-- 		]]
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			EffectName = "DamageOverTime",
	-- 			EffectProperty = "Active",
	-- 			ChangeValue = true,
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			EffectName = "DamageOverTime",
	-- 			EffectProperty = "Amount",
	-- 			BaseMin = 2,
	-- 			BaseMax = 2,
	-- 			ChangeType = "Add",
	-- 			AsInt = true,
	-- 			MinMultiplier = 0.5,
	-- 			IdenticalMultiplier =
	-- 			{
	-- 				Value = -0.8,
	-- 			},
	-- 			ExtractValue =
	-- 			{
	-- 				ExtractAs = "TooltipDamage",
	-- 			}
	-- 		},
	-- 	},
	-- 	ExtractValues =
	-- 	{
	-- 		{
	-- 			ExtractAs = "TooltipPoisonDuration",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "DamageOverTime",
	-- 			BaseProperty = "Duration",
	-- 		},
	-- 		{
	-- 			ExtractAs = "TooltipPoisonStacks",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "DamageOverTime",
	-- 			BaseProperty = "MaxStacks",
	-- 		},
	-- 		{
	-- 			ExtractAs = "TooltipPoisonRate",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "DamageOverTime",
	-- 			BaseProperty = "Cooldown",
	-- 			DecimalPlaces = 1,
	-- 		}
	-- 	}
	-- }

	-- TraitData.DemeterRushTrait =
	-- {
	-- 	Icon = "Boon_Demeter_03",
	-- 	InheritFrom = { "ShopTier1Trait" },
	-- 	God = "Demeter",
	-- 	Slot = "Rush",
	-- 	RarityLevels =
	-- 	{
	-- 		Common =
	-- 		{
	-- 			Multiplier = 1.0,
	-- 		},
	-- 		Rare =
	-- 		{
	-- 			Multiplier = 1.5,
	-- 		},
	-- 		Epic =
	-- 		{
	-- 			Multiplier = 2.0,
	-- 		},
	-- 		Heroic =
	-- 		{
	-- 			Multiplier = 2.5,
	-- 		}
	-- 	},
	-- 	PropertyChanges =
	-- 	{
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			WeaponProperty = "Projectile",
	-- 			ChangeValue = "DemeterRushProjectile",
	-- 			ChangeType = "Absolute",
	-- 		},

	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileName = "DemeterIce",
	-- 			ProjectileProperty = "DamageLow",
	-- 			BaseMin = 15,
	-- 			BaseMax = 15,
	-- 			AsInt = true,
	-- 			MinMultiplier = 0.2,
	-- 			IdenticalMultiplier =
	-- 			{
	-- 				Value = DuplicateStrongMultiplier,
	-- 			},
	-- 			ExtractValue =
	-- 			{
	-- 				ExtractAs = "TooltipDamage",
	-- 			}
	-- 		},
	-- 		{
	-- 			WeaponNames = WeaponSets.HeroRushWeapons,
	-- 			ProjectileName = "DemeterIce",
	-- 			ProjectileProperty = "DamageHigh",
	-- 			DeriveValueFrom = "DamageLow"
	-- 		},
	-- 	},
	-- 	ExtractValues =
	-- 	{
	-- 		{
	-- 			ExtractAs = "TooltipChillDuration",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "DemeterSlow",
	-- 			BaseProperty = "Duration",
	-- 		},
	-- 		{
	-- 			ExtractAs = "TooltipChillPower",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "DemeterSlow",
	-- 			BaseProperty = "ElapsedTimeMultiplier",
	-- 			Format = "NegativePercentDelta"
	-- 		},
	-- 		{
	-- 			ExtractAs = "TooltipChillStacks",
	-- 			SkipAutoExtract = true,
	-- 			External = true,
	-- 			BaseType = "Effect",
	-- 			WeaponName = "SwordWeapon",
	-- 			BaseName = "DemeterSlow",
	-- 			BaseProperty = "MaxStacks",
	-- 		},
	-- 	}
	-- }

--Cast boon support


