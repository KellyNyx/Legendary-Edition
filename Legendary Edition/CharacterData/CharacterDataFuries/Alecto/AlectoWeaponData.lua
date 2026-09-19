WeaponData.EPCHarpyWhipArc =
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
    DashSwaps = { "EPCHarpyWhipArc", },
    ExpireDashWeaponOnDash = true,
    SecondaryWeapon = "null",
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
    HitSimSlowParameters =
    {
        { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
        { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.02 },
    },

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
				{ Name = "/SFX/Enemy Sounds/Alecto/EmoteCharging",
                StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
                { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastStartup",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
			},
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Alecto/EmoteAttacking" },
				{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
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
WeaponData.AlectoWhipLash1 =
{
    --DashWeapon = "EPCHarpyWhipWhirlDash",
   -- DashSwaps = { "EPCHarpyWhipWhirl", },
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
                      "AlectoWhipLash4", "AlectoWhipLash5", "AlectoWhipLash6",                                                       },
		ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "EPCHarpyBeam",
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

    StartingWeapon = false,

    --OnHitFunctionName = { "LEShoddyZeusAttackFix" },

    CodexWeaponName = "SpearWeapon",
    MaxChargeText = { Text = "SpearSpinMaxMessage", Duration = 0.4, OffsetY = -160, SkipShadow = true },
    SkipAttackNotReadySounds = true,
    CompleteObjectivesOnFire = { "SpearWeaponSpinRanged" },

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 5,

    HitSimSlowCooldown = 0.2,

    FireRumbleParameters =
    {
        { ScreenPreWait = 0.02, Fraction = 0.16, Duration = 0.3 },
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Alecto/EmoteAttacking" },
            --{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            --{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
            --{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
            --{ Name = "/Leftovers/SFX/AuraThrow" },
            --{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraFlipChargeup" },
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
    PreAttackVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.15,
				CooldownTime = 60,
				Queue = "Interrupt",
                Source = {SubtitleColor = Color.AlectoVoice},

				-- Pain...
				{ Cue = "/VO/Alecto_0110", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Hold it...
				{ Cue = "/VO/Alecto_0111", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Right here.
				{ Cue = "/VO/Alecto_0112", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Got you.
				{ Cue = "/VO/Alecto_0113", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Have another.
				{ Cue = "/VO/Alecto_0114", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Ready?
				{ Cue = "/VO/Alecto_0115", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Dodge this.
				{ Cue = "/VO/Alecto_0116" },
				-- Come closer.
				{ Cue = "/VO/Alecto_0117", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Don't move.
				{ Cue = "/VO/Alecto_0118", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Remember this?
				{ Cue = "/VO/Alecto_0119", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- I'll make you hurt.
				{ Cue = "/VO/Alecto_0120", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Stay there.
				{ Cue = "/VO/Alecto_0397", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Here!
				{ Cue = "/VO/Alecto_0398", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Why, you!
				{ Cue = "/VO/Alecto_0399", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Have this!
				{ Cue = "/VO/Alecto_0400", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Ready?!
				{ Cue = "/VO/Alecto_0401", RequiredPlayed = { "/VO/Alecto_0116" } },
				-- Want this?!
				{ Cue = "/VO/Alecto_0402", RequiredPlayed = { "/VO/Alecto_0116" } },
			},

    --Upgrades = { },
}
WeaponData.AlectoWhipLash2 =
{
 InheritFrom = { "AlectoWhipLash1" },
 Sounds = {
 FireSounds =
        {
            { Name = "/EmptyCue" },
            --{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            --{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
            --{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
            --{ Name = "/Leftovers/SFX/AuraThrow" },
            --{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraFlipChargeup" },
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
WeaponData.AlectoWhipLash3 =
{
 InheritFrom = { "AlectoWhipLash1" }
}
WeaponData.AlectoWhipLash4 =
{
 InheritFrom = { "AlectoWhipLash1" },
 Sounds = {
 FireSounds =
        {
            { Name = "/EmptyCue" },
            --{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            --{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
            --{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
            --{ Name = "/Leftovers/SFX/AuraThrow" },
            --{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraFlipChargeup" },
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
WeaponData.AlectoWhipLash5 =
{
 InheritFrom = { "AlectoWhipLash1" }
}
WeaponData.AlectoWhipLash6 =
{
 InheritFrom = { "AlectoWhipLash1" },
 Sounds = {
 FireSounds =
        {
            { Name = "/EmptyCue" },
            --{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            --{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
            --{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
            --{ Name = "/Leftovers/SFX/AuraThrow" },
            --{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraFlipChargeup" },
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
WeaponData.EPCHarpyWhipWhirlAlectoDash =
{
   -- DashWeapon = nil,
    StartingWeapon = false,
    --FireScreenshake = { Distance = 6, Speed = 300, FalloffSpeed = 0, Duration = 0.1, DynamicAngleOffset = 0 },
    CodexWeaponName = "SpearWeapon",

    HitSimSlowCooldown = 0.2,
    HitSimSlowParameters =
    {
        { ScreenPreWait = 0.02, Fraction = 0.05, LerpTime = 0 },
        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.02 },
    },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.2, Duration = 0.2 },
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Alecto/EmotePowerAttacking" },
            --{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
            --{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraFlipChargeup" },
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
    Upgrades = { },
}
WeaponData.EPCHarpyWhipRageBeam =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

    CodexWeaponName = "SpearWeapon",

    SkipAttackNotReadySounds = true,

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
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/HellFireImpact",
            Brick = "/SFX/HellFireImpact",
            Stone = "/SFX/HellFireImpact",
            Organic = "/SFX/HellFireImpact",
            StoneObstacle = "/SFX/HellFireImpact",
            BrickObstacle = "/SFX/HellFireImpact",
            MetalObstacle = "/SFX/HellFireImpact",
            BushObstacle = "/SFX/HellFireImpact",
        },
    },

}
WeaponData.AlectoRushWeaponControl =
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
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Alecto/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        -- FireSounds =
        -- {
        --     { Name = "/SFX/Enemy Sounds/Alecto/EmoteEvading" },
        --     { Name = "/SFX/Player Sounds/ZagreusShieldRush" },
        -- },

        -- ImpactSounds =
        -- {
        --     Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
        --     Bone = "/SFX/FistImpactMedium",
        --     Brick = "/SFX/FistImpactMedium",
        --     Stone = "/SFX/FistImpactMedium",
        --     Organic = "/SFX/FistImpactMedium",
        -- },

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
WeaponData.AlectoDash =
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
        -- ChargeSounds =
        -- {
        --     { Name = "/SFX/Enemy Sounds/Alecto/EmoteCharging",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
        --     { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        -- },
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Alecto/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Alecto/EmoteEvading" },
            { Name = "/SFX/Player Sounds/ZagreusShieldRush" },
        },

        ImpactSounds =
        {
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/FistImpactMedium",
            Brick = "/SFX/FistImpactMedium",
            Stone = "/SFX/FistImpactMedium",
            Organic = "/SFX/FistImpactMedium",
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
WeaponData.EPCHarpyLightningChase =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Alecto/EmoteSustainedAttacking", Cooldown = 5.0 },
        },

        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/HellFireImpact",
            Brick = "/SFX/HellFireImpact",
            Stone = "/SFX/HellFireImpact",
            Organic = "/SFX/HellFireImpact",
            StoneObstacle = "/SFX/HellFireImpact",
            BrickObstacle = "/SFX/HellFireImpact",
            MetalObstacle = "/SFX/HellFireImpact",
            BushObstacle = "/SFX/HellFireImpact",
        }
    },
    PreAttackVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.15,
				CooldownTime = 60,
				Queue = "Interrupt",
                Source = {SubtitleColor = Color.AlectoVoice},

				-- Pain...
				{ Cue = "/VO/Alecto_0110" },
				-- Now!!
				{ Cue = "/VO/Alecto_0174" },
				-- That's it!
				{ Cue = "/VO/Alecto_0166" },
				-- My turn.
				{ Cue = "/VO/Alecto_0167" },
				-- That does it!
				{ Cue = "/VO/Alecto_0168" },
				-- Eat this!
				{ Cue = "/VO/Alecto_0085" },
				-- Here!
				{ Cue = "/VO/Alecto_0086" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0309" },
				-- <Laughter>
				{ Cue = "/VO/Alecto_0310" },
			},
}
WeaponData.EPCHarpyWhipShot =
{
		StartingWeapon = false,

		FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.3, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
		-- },

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 5,

		Sounds =
		{
            ChargeSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Alecto/EmoteCharging",
                StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
                { Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack",
                StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
			},
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Alecto/EmotePowerAttacking" },
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

		Upgrades = { },
        PreAttackVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.35,
				CooldownTime = 60,
				Queue = "Interrupt",
                Source = {SubtitleColor = Color.AlectoVoice},

				-- I said die!
				{ Cue = "/VO/Alecto_0093" },
				-- Bleed!
				{ Cue = "/VO/Alecto_0091" },
				-- Nraaugh!
				{ Cue = "/VO/Alecto_0080" },
				-- Die!
				{ Cue = "/VO/Alecto_0087" },
				-- Kill!
				{ Cue = "/VO/Alecto_0088" },
			},
	}
    ProjectileData.EPCAlectoRushWeapon =
	{
		DamagedFx = "AlectoLunge",
	}