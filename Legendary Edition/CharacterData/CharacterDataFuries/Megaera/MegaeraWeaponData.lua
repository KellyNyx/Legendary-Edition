WeaponData.EPCHarpyBeam =
{
    

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

    Sounds =
    {
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging" },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastStartup",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteSustainedAttacking" }
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
        },
    },

    Upgrades = { },

    -- WeaponBinks =
    -- {
    --     "Enemy_Fury_Idle_Bink",
	-- 	"Enemy_Fury_Run_Bink",
	-- 	"Enemy_Fury_StartStop_Bink",
	-- 	"Enemy_Fury_Lunge_Bink",
	-- 	"Enemy_Fury_Beam_Bink",
	-- 	"Enemy_Fury_Lightning_Bink",
	-- 	"Enemy_Fury_WhipWhirl_Bink",
	-- 	"Enemy_Fury_Shielded_Bink",
	-- 	"Enemy_Fury_Dead_Bink",
	-- 	"Enemy_Fury_Taunt_Bink",
    -- },
    PreAttackVoiceLines =
			{
                Queue = "Interrupt",
				{
					RandomRemaining = true,
					BreakIfPlayed = true,
					PreLineWait = 0.15,
					CooldownTime = 35,
                    Source = {SubtitleColor = Color.MegVoice},

					-- Take this!
					{ Cue = "/VO/MegaeraField_0064" },
					-- Try this!
					{ Cue = "/VO/MegaeraField_0065" },
					-- Catch this!
					{ Cue = "/VO/MegaeraField_0066" },
					-- Dodge this!
					{ Cue = "/VO/MegaeraField_0067" },
					-- Eat this!
					{ Cue = "/VO/MegaeraField_0068" },
					-- Here!
					{ Cue = "/VO/MegaeraField_0069" },
					-- Here!
					{ Cue = "/VO/MegaeraField_0760" },
					-- Die!
					{ Cue = "/VO/MegaeraField_0070" },
					-- Kill!
					{ Cue = "/VO/MegaeraField_0071" },
					-- Suffer!
					{ Cue = "/VO/MegaeraField_0072" },
					-- Catch!
					{ Cue = "/VO/MegaeraField_0073" },
					-- Here then!
					{ Cue = "/VO/MegaeraField_0241" },
					-- I said die!
					{ Cue = "/VO/MegaeraField_0242" },
					-- Catch, Zagreus!
					--{ Cue = "/VO/MegaeraField_0243" },
					-- How about this!
					{ Cue = "/VO/MegaeraField_0244" },
				}
			},
}

WeaponData.EPCHarpyBeam2 =
{
    StartingWeapon = false,
   -- DashWeapon = "EPCHarpyWhipWhirlDash",

    CodexWeaponName = "SpearWeapon",

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

    Sounds =
    {
        FireSounds =
        {
            { Name = "null" }
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
        },
    },
    Upgrades = { },

}

WeaponData.EPCHarpyBeam3 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam4 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam5 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam6 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam7 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam8 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam9 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam10 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam11 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam12 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam13 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam14 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyBeam15 =
{
 InheritFrom = { "EPCHarpyBeam2" },
 Upgrades = { },
}

WeaponData.EPCHarpyWhipWhirlDash =
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
            { Name = "/SFX/Enemy Sounds/Megaera/EmotePowerAttacking" },
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
WeaponData.EPCHarpyWhipWhirl =
{
    --DashWeapon = "EPCHarpyWhipWhirlDash",
   -- DashSwaps = { "EPCHarpyWhipWhirl", },
    StartingWeapon = false,

    CodexWeaponName = "SpearWeapon",
    MaxChargeText = { Text = "SpearSpinMaxMessage", Duration = 0.4, OffsetY = -160, SkipShadow = true },
    SkipAttackNotReadySounds = true,
    CompleteObjectivesOnFire = { "SpearWeaponSpinRanged" },

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 5,

    FireScreenshake = { Distance = 6, Speed = 400, FalloffSpeed = 1400, Duration = 0.4 },

		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.20, Fraction = 1.0, LerpTime = 0 },
		-- },

    HitSimSlowCooldown = 0.2,

    FireRumbleParameters =
    {
        { ScreenPreWait = 0.02, Fraction = 0.16, Duration = 0.3 },
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmotePowerAttacking" },
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

        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
        },
    },

    Upgrades = { },
    PreAttackVoiceLines =
			{
                Queue = "Interrupt",
				{
					RandomRemaining = true,
					BreakIfPlayed = true,
					PreLineWait = 0.35,
					CooldownTime = 30,
                    Source = {SubtitleColor = Color.MegVoice},
					--SuccessiveChanceToPlay = 0.2,

					-- You are a waste of time.
					{ Cue = "/VO/MegaeraField_0083" },
					-- Hold it right there.
					{ Cue = "/VO/MegaeraField_0084" },
					-- I'll make this quick.
					{ Cue = "/VO/MegaeraField_0085" },
					-- Beg me for mercy, fool.
					{ Cue = "/VO/MegaeraField_0086" },
					-- You want a taste of this?
					{ Cue = "/VO/MegaeraField_0087" },
					-- Come closer, Zagreus.
					--{ Cue = "/VO/MegaeraField_0088" },
					-- You stay right there.
					{ Cue = "/VO/MegaeraField_0089" },
					-- Come closer.
					{ Cue = "/VO/MegaeraField_0256" },
					-- Don't go anywhere.
					{ Cue = "/VO/MegaeraField_0257" },
					-- One lash is not enough.
					{ Cue = "/VO/MegaeraField_0258" },
					-- You like my whip?
					{ Cue = "/VO/MegaeraField_0259" },
					-- Here's my whip!
					{ Cue = "/VO/MegaeraField_0260" },
					-- I'll make you hurt.
					{ Cue = "/VO/MegaeraField_0261" },
				},  
    }
}

WeaponData.MegWhipLash1 =
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
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteAttacking" },
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
                Queue = "Interrupt",
				{
					RandomRemaining = true,
					BreakIfPlayed = true,
					PreLineWait = 0.35,
					CooldownTime = 30,
                    Source = {SubtitleColor = Color.MegVoice},
					--SuccessiveChanceToPlay = 0.2,

					-- You are a waste of time.
					{ Cue = "/VO/MegaeraField_0083" },
					-- Hold it right there.
					{ Cue = "/VO/MegaeraField_0084" },
					-- I'll make this quick.
					{ Cue = "/VO/MegaeraField_0085" },
					-- Beg me for mercy, fool.
					{ Cue = "/VO/MegaeraField_0086" },
					-- You want a taste of this?
					{ Cue = "/VO/MegaeraField_0087" },
					-- Come closer, Zagreus.
					--{ Cue = "/VO/MegaeraField_0088" },
					-- You stay right there.
					{ Cue = "/VO/MegaeraField_0089" },
					-- Come closer.
					{ Cue = "/VO/MegaeraField_0256" },
					-- Don't go anywhere.
					{ Cue = "/VO/MegaeraField_0257" },
					-- One lash is not enough.
					{ Cue = "/VO/MegaeraField_0258" },
					-- You like my whip?
					{ Cue = "/VO/MegaeraField_0259" },
					-- Here's my whip!
					{ Cue = "/VO/MegaeraField_0260" },
					-- I'll make you hurt.
					{ Cue = "/VO/MegaeraField_0261" },
				},  
    }

    --Upgrades = { },
}
WeaponData.MegWhipLash2 =
{
 InheritFrom = { "MegWhipLash1" }
}
WeaponData.MegWhipLash3 =
{
    --DashWeapon = "EPCHarpyWhipWhirlDash",
   -- DashSwaps = { "EPCHarpyWhipWhirl", },
    StartingWeapon = false,

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
            { Name = "/SFX/Enemy Sounds/Megaera/EmotePowerAttacking" },
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

    Upgrades = { },
}

-- WeaponData.EPCHarpyWhipWhirl2 =
-- {
--     InheritFrom = { "EPCHarpyWhipWhirl" },
--     CompleteObjectivesOnFire = { "SpearWeaponSpin", "SpearWeaponSpinRanged" },
-- }

-- WeaponData.EPCHarpyWhipWhirl3 =
-- {
--     InheritFrom = { "EPCHarpyWhipWhirl" },
--     CompleteObjectivesOnFire = { "SpearWeaponSpin", "SpearWeaponSpinRanged" },
-- }
WeaponData.MegRushWeaponControl =
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
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        -- FireSounds =
        -- {
        --     { Name = "/SFX/Enemy Sounds/Megaera/EmoteAttacking" },
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

WeaponData.MegaeraDash =
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
        --     { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
        --     { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        -- },
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteEvading" },
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

WeaponData.EPCMegaeraRushWeapon =
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
        --     { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
        --     { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        -- },
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteAttacking" },
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


WeaponData.EPCMegaeraRushWeapon2 =
{
    CauseImpactReaction = true,
	ImpactReactionHitsOverride = 5,
    InheritFrom = { "EPCMegaeraRushWeapon" },

    AIData =
    {
            FireAnimation = "FuryLungeFire",
			PostAttackAnimation = "FuryLungeReturnToIdle",

			RemoveFromGroups = { "GroundEnemies" },

			FireDuration = 0.3,
            PostAttackDuration = 1.2
    }
}

WeaponData.EPCHarpyLightningCONTROL =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteSustainedAttacking", Cooldown = 5.0 },
            { Name = "/SFX/Player Sounds/ElectricZapSmall" },
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
    }
}
WeaponData.EPCHarpyLightning2 =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    Sounds =
    {
        ChargeSounds = 
        {
            { Name = "/SFX/Enemy Sounds/Megaera/EmoteSustainedAttacking", Cooldown = 5.0 },
            { Name = "/SFX/Player Sounds/ElectricZapSmall" },
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
                Queue = "Interrupt",
				{
					RandomRemaining = true,
					BreakIfPlayed = true,
					PreLineWait = 0.15,
					CooldownTime = 60,
                    Source = {SubtitleColor = Color.MegVoice},

					-- Blood and darkness!
					{ Cue = "/VO/MegaeraField_0074" },
					-- You asked for this!
					{ Cue = "/VO/MegaeraField_0075" },
					-- Start running, fool!
					{ Cue = "/VO/MegaeraField_0076" },
					-- I'll kill you where you stand!
					{ Cue = "/VO/MegaeraField_0077" },
					-- Enough!
					{ Cue = "/VO/MegaeraField_0078" },
					-- Run for it, little man!
					{ Cue = "/VO/MegaeraField_0079" },
					-- Have some of this...!
					{ Cue = "/VO/MegaeraField_0081" },
					-- I'll make you pay...!
					{ Cue = "/VO/MegaeraField_0082" },
					-- You better run.
					{ Cue = "/VO/MegaeraField_0245" },
					-- Run.
					{ Cue = "/VO/MegaeraField_0246" },
					-- Run!
					{ Cue = "/VO/MegaeraField_0247" },
					-- Hold still.
					{ Cue = "/VO/MegaeraField_0248" },
					-- Hold still!
					{ Cue = "/VO/MegaeraField_0249" },
					-- Suffer in darkness!
					{ Cue = "/VO/MegaeraField_0250" },
					-- Look out below.
					{ Cue = "/VO/MegaeraField_0251" },
					-- Why won't you give up?
					{ Cue = "/VO/MegaeraField_0252" },
					-- Stand still for me.
					{ Cue = "/VO/MegaeraField_0253" },
					-- Stand still!
					{ Cue = "/VO/MegaeraField_0254" },
					-- I'll get you.
					-- { Cue = "/VO/MegaeraField_0255" },
					-- Pin him down!
					--{ Cue = "/VO/MegaeraField_0766", RequiredAnyActiveEnemyTypes = { "HeavyMelee", "LightRanged" } },
					-- Get him!
					--{ Cue = "/VO/MegaeraField_0767", RequiredAnyActiveEnemyTypes = { "HeavyMelee", "LightRanged" } },
				},
			},
}
WeaponData.EPCHarpyLightning =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    AttackSlotsPerTickMin = 5,
	AttackSlotsPerTickMax = 5,
    AttackSlotPreFireWait = 0.01,
    LockOnRange = 950,
	AttackSlots =
	{
		{ Angle = 0, OffsetDistance = 0, OffsetScaleY = 0.48 },
		{ Angle = 0, OffsetDistance = 425, OffsetScaleY = 0.48 },
		{ Angle = 90, OffsetDistance = 425, OffsetScaleY = 0.48 },
		{ Angle = 180, OffsetDistance = 425, OffsetScaleY = 0.48 },
		{ Angle = 270, OffsetDistance = 425, OffsetScaleY = 0.48 },
	},
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Player Sounds/ElectricZapSmall" },
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
    }
}
WeaponData.EPCHarpyLightning_2 =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    AttackSlotsPerTickMin = 5,
	AttackSlotsPerTickMax = 5,
    AttackSlotPreFireWait = 0.01,
    LockOnRange = 950,
	AttackSlots =
	{
		{ Angle = 0, OffsetDistance = 0, OffsetScaleY = 0.48 },
		--{ Angle = 0, OffsetDistance = 425, OffsetScaleY = 0.48 },
		{ Angle = 90, OffsetDistance = 425, OffsetScaleY = 0.48 },
		-- { Angle = 180, OffsetDistance = 425, OffsetScaleY = 0.48 },
		 { Angle = 270, OffsetDistance = 425, OffsetScaleY = 0.48 },
	},
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Player Sounds/ElectricZapSmall" },
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
    }
}
WeaponData.EPCHarpyLightning_3 =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    AttackSlotsPerTickMin = 5,
	AttackSlotsPerTickMax = 5,
    AttackSlotPreFireWait = 0.01,
    LockOnRange = 950,
	AttackSlots =
	{
		{ Angle = 0, OffsetDistance = 0, OffsetScaleY = 0.48 },
		--{ Angle = 0, OffsetDistance = 425, OffsetScaleY = 0.48 },
		{ Angle = 90, OffsetDistance = 425, OffsetScaleY = 0.48 },
		-- { Angle = 180, OffsetDistance = 425, OffsetScaleY = 0.48 },
		 { Angle = 270, OffsetDistance = 425, OffsetScaleY = 0.48 },
	},
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Player Sounds/ElectricZapSmall" },
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
    }
}
ProjectileData.EPCMegaeraRushWeapon =
	{
		DamagedFx = "EnemyHeavySlashStretch",
	}
