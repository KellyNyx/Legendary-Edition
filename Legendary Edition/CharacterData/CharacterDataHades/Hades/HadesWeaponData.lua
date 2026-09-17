WeaponData.EPCHadesBidentArcCombo1 =
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
    --DashWeapon = "EPCHarpyWhipWhirlDash",
    DashSwaps = { "EPCHadesBidentArcCombo1", "EPCHadesBidentArcCombo2", "EPCHadesBidentArcCombo3" },
    ExpireDashWeaponOnDash = true,
    SecondaryWeapon = "EPCHadesBidentThrow",
    ResourceName = "LockKeys",
    UnlockCost = 4,
    LockKeyTextOffsetY = -125,
    --DashWeaponWindow = 0.6,
    PostWeaponUpgradeScreenAnimation = "ZagreusSpearThrowFireReturn",
    PostWeaponUpgradeScreenAngle = 230,
    PostWeaponUpgradeScreenFunctionName = "RemoveSpearBase",

    KitInteractFunctionName = "WeaponKitSpecialInteractPresentation",
    KitInteractSpecialUnlockSound = "/Leftovers/Menu Sounds/EmoteAscendedGuzheng",
    KitInteractSpecialUnlockSound2 = "/SFX/Player Sounds/ZagreusGuanYuSpearSpin",
    KitInteractGameStateRequirements =
    {
        RequiredTextLines = { "AchillesRevealsGuanYuAspect01" },
        RequiredFalsePlayed = { "/VO/ZagreusHome_2027", },
    },

    --FireScreenshake = { Distance = 6, Speed = 300, FalloffSpeed = 0, Duration = 0.1, DynamicAngleOffset = 0 },

    SkipAttackNotReadySounds = true,

    HitSimSlowCooldown = 0.2,

    HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.16, Fraction = 1.0, LerpTime = 0 },
		-- },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

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

                -- Should take my spear...
                { Cue = "/VO/ZagreusField_1264" },
                -- It's time, Varatha.
                { Cue = "/VO/ZagreusField_1265" },
                -- Varatha hungers.
                { Cue = "/VO/ZagreusField_1156", GameStateRequirements = { RequiredOneOfTraits = { "UnusedWeaponBonusTrait", "UnusedWeaponBonusTraitAddGems" }, }, },
            },
            [3] = GlobalVoiceLines.MiscWeaponEquipVoiceLines,
        },
        [2] = GlobalVoiceLines.SkellyWeaponEquipReactionVoiceLines,
    },

    Sounds =
		{
			ChargeSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteCharging" },
			},
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" },
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteAttacking" },
			},
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

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
    },
}
WeaponData.EPCHadesBidentArcCombo2 =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

    CodexWeaponName = "SpearWeapon",

    SkipAttackNotReadySounds = true,

    HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.16, Fraction = 1.0, LerpTime = 0 },
		-- },

    -- HitSimSlowCooldown = 0.2,
    -- HitSimSlowParameters =
    -- {
    --     { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
    --     { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.02 },
    -- },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    Sounds =
    {
        FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" },
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteAttacking" },
			},
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

}
WeaponData.EPCHadesBidentArcCombo3 =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

    CodexWeaponName = "SpearWeapon",

    SkipAttackNotReadySounds = true,

    HitScreenshake = { Distance = 10, Speed = 1000, Duration = 0.2, FalloffSpeed = 3000 },

    FireScreenshake = { Distance = 10, Speed = 1000, Duration = 0.2, FalloffSpeed = 3000 },
    -- HitSimSlowParameters =
    -- {
    --     { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
    --     { ScreenPreWait = 0.15, Fraction = 0.30, LerpTime = 0.1 },
    --     { ScreenPreWait = 0.1, Fraction = 1.0, LerpTime = 0 },
    -- },

    -- HitSimSlowCooldown = 0.2,
    -- HitSimSlowParameters =
    -- {
    --     { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
    --     { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.02 },
    -- },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    Sounds =
    {
        ChargeSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteCharging" },
			},
        FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/EmotePowerAttacking" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
				{ Name = "/Leftovers/SFX/AuraThrow" }
			},
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

}
WeaponData.EPCHadesBidentStrike =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

   CauseImpactReaction = true,
   ImpactReactionHitsOverride = 5,

    CodexWeaponName = "SpearWeapon",

    SkipAttackNotReadySounds = true,

    FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.08, Fraction = 0.10, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		-- },

    -- HitSimSlowCooldown = 0.2,
    -- HitSimSlowParameters =
    -- {
    --     { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
    --     { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.02 },
    -- },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    Sounds =
    {
        FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/EmotePowerAttacking" },
				{ Name = "/SFX/Enemy Sounds/Hades/HadesSpearStab" },
			},
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

}
WeaponData.EPCHadesDash =
{
    StartingWeapon = false,
    UpgradeChoiceText = "UpgradeChoiceMenu_Rush",

    IgnoreCancelSimOnEffects = { "RushWeaponDisable", "RushWeaponDisableCancelable" },
    --[[
    CancelEffectSimSlowParameters =
    {
        { ScreenPreWait = 0.0, Fraction = 0.01, LerpTime = 0 },
        { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0.07 },
        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.1 },
    },
    ]]

    CompleteObjectivesOnFire = { "RushWeapon", "RushWeaponGilgamesh" },

    FireRumbleParameters =
    {
        --{ ScreenPreWait = 0.02, Fraction = 0.125, Duration = 0.1 },
    },

    SimSlowBlur =
    {
        Strength = 0.3,
        Distance = 1.6,
        FXInTime = 0.06,
        FXHoldTime = 0.4,
        FXOutTime = 0.4,
    },

    SkipAttackNotReadySounds = true,
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Hades/EmoteEvading" },
			{ Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
        },
        CancelEffectSounds =
        {
        },

        NearbyEnemyFireSounds =
        {
            { Name = "/Leftovers/Menu Sounds/TitanToggleShort" },
        },
    },

    NoExpressiveAnim = true,

    Upgrades = { },
}
WeaponData.EPCHadesBidentThrow =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

   CauseImpactReaction = true,
   ImpactReactionHitsOverride = 5,

    CodexWeaponName = "SpearWeapon",

    SkipAttackNotReadySounds = true,

    HitScreenshake = { Distance = 4, Speed = 1200, Duration = 0.12, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.18, Fraction = 1.0, LerpTime = 0 },
		-- },

    -- HitSimSlowCooldown = 0.2,
    -- HitSimSlowParameters =
    -- {
    --     { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
    --     { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.02 },
    -- },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    Sounds =
    {
        ChargeSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteCharging",
                StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
			},
        FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
				{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
				{ Name = "/Leftovers/SFX/AuraThrowLarge" },
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteSpearThrow" },
			},
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

}
WeaponData.EPCHadesBidentRecoveryDash =
{
    StartingWeapon = false,
    UpgradeChoiceText = "UpgradeChoiceMenu_Rush",

    IgnoreCancelSimOnEffects = { "RushWeaponDisable", "RushWeaponDisableCancelable" },
    --[[
    CancelEffectSimSlowParameters =
    {
        { ScreenPreWait = 0.0, Fraction = 0.01, LerpTime = 0 },
        { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0.07 },
        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.1 },
    },
    ]]

    CompleteObjectivesOnFire = { "RushWeapon", "RushWeaponGilgamesh" },

    FireRumbleParameters =
    {
        --{ ScreenPreWait = 0.02, Fraction = 0.125, Duration = 0.1 },
    },

    SimSlowBlur =
    {
        Strength = 0.3,
        Distance = 1.6,
        FXInTime = 0.06,
        FXHoldTime = 0.4,
        FXOutTime = 0.4,
    },

    SkipAttackNotReadySounds = true,
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Hades/EmoteSuperDash" },
			{ Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
			{ Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" },
			{ Name = "/Leftovers/SFX/AuraThrowSmall" },
        },
        CancelEffectSounds =
        {
        },

        NearbyEnemyFireSounds =
        {
            { Name = "/Leftovers/Menu Sounds/TitanToggleShort" },
        },
    },

    NoExpressiveAnim = true,

    Upgrades = { },
}
WeaponData.EPCHadesCast =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

   CauseImpactReaction = true,
   ImpactReactionHitsOverride = 5,

    CodexWeaponName = "SpearWeapon",

    SkipAttackNotReadySounds = true,

    StoreAmmoOnHit = 1,
	AmmoDropDelay = 6.5,
	StoredAmmoIcon = "AmmoEmbeddedInPlayerIcon",
	AmmoDropFireWeapon = "EPCHadesAmmoDrop",
	SkipAmmoDropOnMiss = true,
    SelfMultiplier = 3.0,
	StoreAmmoInLastHit = true,
	FireAmmoDropWeaponOnDeflect = true,

    HitScreenshake = { Distance = 3, Speed = 300, Duration = 0.06, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.25, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.16, Fraction = 1.0, LerpTime = 0.1 },
		-- },

    -- HitSimSlowCooldown = 0.2,
    -- HitSimSlowParameters =
    -- {
    --     { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
    --     { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.02 },
    -- },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    Sounds =
    {
        ChargeSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/HadesRangedPreAttack" },
			},
        FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteRanged" },
				{ Name = "/SFX/Player Sounds/BowFire" },
			},
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

}
ProjectileData.EPCHadesCast =
{
    AmmoDropKillForceMin = 900,
    AmmoDropKillForceMax = 950,
    AmmoDropKillUpwardForceMin = 300,
    AmmoDropKillUpwardForceMax = 300,
}