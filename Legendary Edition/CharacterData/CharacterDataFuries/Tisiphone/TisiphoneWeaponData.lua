WeaponData.HarpyWhipSlash1 =
{
    InheritFrom = { "BaseUnlockableWeapon", },
    DashWeapon = "EPCHarpyWhipCombo3",
    DashSwaps = { "HarpyWhipSlash1", },
    ExpireDashWeaponOnDash = true,
    SecondaryWeapon = "EPCHarpyWhipLasso",
    SkipAttackNotReadySounds = true,
    ShortName = "HarpyWhipSlash1",
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
                --{ Cue = "/VO/ZagreusField_0153", PlayOnce = true },
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

                -- Murderrr!!
				{ Cue = "/VO/Tisiphone_0034" },
				-- Murrrr...!
				{ Cue = "/VO/Tisiphone_0035" },
				-- Mmmurder!
				{ Cue = "/VO/Tisiphone_0036" },
				-- Mmmm!!!
				{ Cue = "/VO/Tisiphone_0037" },
				-- Murderrerr!
				{ Cue = "/VO/Tisiphone_0038" },
				-- Murderrr!!
				{ Cue = "/VO/Tisiphone_0039" },
            },
            [3] = GlobalVoiceLines.MiscWeaponEquipVoiceLines,
        },
        [2] = GlobalVoiceLines.SkellyWeaponEquipReactionVoiceLines,
    },

    Sounds =
    {
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            -- { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastStartup",
            -- StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteAttacking" }
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
    PreAttackVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.15,
				CooldownTime = 60,
                Queue = "Interrupt",
		        Source = {SubtitleColor = Color.TisiphoneVoice},

				-- Murr....
				{ Cue = "/VO/Tisiphone_0046" },
				-- Murrrr....
				{ Cue = "/VO/Tisiphone_0047" },
				-- Mmmrrrr....
				{ Cue = "/VO/Tisiphone_0048" },
				-- Mrrnngh!
				{ Cue = "/VO/Tisiphone_0049" },
				-- Zrnngh....
				--{ Cue = "/VO/Tisiphone_0142", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zurrrr....
				--{ Cue = "/VO/Tisiphone_0143", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zzahhh...
				--{ Cue = "/VO/Tisiphone_0144", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zrrnngh!
				--{ Cue = "/VO/Tisiphone_0145", RequiredTextLines = { "Fury3Encounter08" } },
			},
}
WeaponData.HarpyWhipSlash2 =
{
        --DashWeapon = "EPCHarpyWhipCombo3",
    
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
                { Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteAttacking" }
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
WeaponData.HarpyWhipSlash3 =
{
        --DashWeapon = "EPCHarpyWhipCombo3",
    
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
                { Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmotePowerAttacking" }
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
WeaponData.TisiphoneRushWeaponControl =
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
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        -- FireSounds =
        -- {
        --     { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteEvading" },
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
WeaponData.EPCTisiphoneRushWeapon =
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
        --     { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteCharging",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
        --     { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRushAttack",
        --     StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        -- },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteEvading" },
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
WeaponData.TisiphoneDash =
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
            -- { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteCharging",
            -- StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            -- { Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastStartup",
            -- StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteEvading" },
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
WeaponData.EPCHarpyWhipCombo2 =
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
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteAttacking" },
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
WeaponData.EPCHarpyWhipCombo3 =
{
   -- DashWeapon = nil,
    StartingWeapon = false,

    MaxChargeText = { Text = "SpearSpinMaxMessage", Duration = 0.4, OffsetY = -160, SkipShadow = true },
    SkipAttackNotReadySounds = true,
    CompleteObjectivesOnFire = { "SpearWeaponSpinRanged" },

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 5,

	-- 	HitSimSlowParameters =
	-- 	{
	-- 		{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
	-- 		{ ScreenPreWait = 0.20, Fraction = 1.0, LerpTime = 0 },
	-- 	},

    -- HitSimSlowCooldown = 0.2,

    FireRumbleParameters =
    {
        { ScreenPreWait = 0.02, Fraction = 0.16, Duration = 0.3 },
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmotePowerAttacking" },
            { Name = "/SFX/Player Sounds/ZagreusShieldRush" },
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
WeaponData.EPCHarpyLightningLine2 =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    Sounds =
    {
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteSustainedAttacking", Cooldown = 1.0 },
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
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.15,
				CooldownTime = 60,
                Queue = "Interrupt",
		        Source = {SubtitleColor = Color.TisiphoneVoice},

				-- Murderrr!!
				{ Cue = "/VO/Tisiphone_0039" },
				-- Murdererrrrrr...!!
				{ Cue = "/VO/Tisiphone_0040" },
				-- MurdereRRRR...!!
				{ Cue = "/VO/Tisiphone_0041" },
				-- Mur, der, rerrr!!
				{ Cue = "/VO/Tisiphone_0042" },
				-- Murrrnnngghh!!
				{ Cue = "/VO/Tisiphone_0043" },
				-- Mrrnnnhhhhhh!
				{ Cue = "/VO/Tisiphone_0044" },
				-- Mrr, hrrnnn...
				{ Cue = "/VO/Tisiphone_0045" },
				-- Zagreusssss!
				--{ Cue = "/VO/Tisiphone_0136", RequiredTextLines = { "Fury3Encounter10" } },
				-- ZagreUSSSS...!!
				--{ Cue = "/VO/Tisiphone_0137", RequiredTextLines = { "Fury3Encounter10" } },
				-- Zag, re, uss...!!
				--{ Cue = "/VO/Tisiphone_0138", RequiredTextLines = { "Fury3Encounter10" } },
				-- Zurrrnnngghh!!
				--{ Cue = "/VO/Tisiphone_0139", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zrrnnnhhhhhh!
				--{ Cue = "/VO/Tisiphone_0140", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zrr, hrrnnn...
				--{ Cue = "/VO/Tisiphone_0141", RequiredTextLines = { "Fury3Encounter08" } },
			},
}
WeaponData.EPCHarpyLightningLine =
{
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    AttackSlotsPerTick = 5,
    AttackSlotsPerTickMin = 5,
	AttackSlotsPerTickMax = 5,
	AttackSlotInterval = 0.05,
    LockOnRange = 1500,
	AttackSlots =
	{
		{ UseAngleBetween = true, OffsetDistance = 300, OffsetScaleY = 0.48, OffsetFromAttacker = true },
		{ UseAngleBetween = true, OffsetDistance = 600, OffsetScaleY = 0.48, OffsetFromAttacker = true },
		{ UseAngleBetween = true, OffsetDistance = 900, OffsetScaleY = 0.48, OffsetFromAttacker = true },
		{ UseAngleBetween = true, OffsetDistance = 1200, OffsetScaleY = 0.48, OffsetFromAttacker = true },
		{ UseAngleBetween = true, OffsetDistance = 1500, OffsetScaleY = 0.48, OffsetFromAttacker = true },
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
WeaponData.EPCHarpyWhipLasso =
{
    -- DashWeapon = "EPCHarpyWhipCombo3",
    -- DashSwaps = { "EPCHarpyWhipLasso", },
    StartingWeapon = false,
    SkipAttackNotReadySounds = true,
    Sounds =
    {
        ChargeSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmoteCharging",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, },
            { Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack",
            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" }, }
        },
        FireSounds =
        {
            { Name = "/SFX/Enemy Sounds/Tisiphone/EmotePowerAttacking", },
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
    },
    PreAttackVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.15,
				CooldownTime = 60,
                Queue = "Interrupt",
		        Source = {SubtitleColor = Color.TisiphoneVoice},

				-- Murr....
				{ Cue = "/VO/Tisiphone_0046" },
				-- Murrrr....
				{ Cue = "/VO/Tisiphone_0047" },
				-- Mmmrrrr....
				{ Cue = "/VO/Tisiphone_0048" },
				-- Mrrnngh!
				{ Cue = "/VO/Tisiphone_0049" },
				-- Zrnngh....
				--{ Cue = "/VO/Tisiphone_0142", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zurrrr....
				--{ Cue = "/VO/Tisiphone_0143", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zzahhh...
				--{ Cue = "/VO/Tisiphone_0144", RequiredTextLines = { "Fury3Encounter08" } },
				-- Zrrnngh!
				--{ Cue = "/VO/Tisiphone_0145", RequiredTextLines = { "Fury3Encounter08" } },
			},
}
WeaponData.EPCHarpyLungeSurgeBeam =
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
ProjectileData.EPCHarpyLassoLunge =
	{
		DamagedFx = "FuryTisiphoneGhosts",
	}
    ProjectileData.EPCHarpyWhipRage =
	{
		DamagedFx = "FuryTisiphoneGhosts",
	}
    ProjectileData.EPCHarpyWhipLasso =
	{
		DamagedFx = "FuryTisiphoneGhosts",
	}
    ProjectileData.EPCTisiphoneRushWeapon =
	{
		DamagedFx = "TisiphoneLunge",
	}
    ProjectileData.EPCTisiphoneDash =
	{
		DamagedFx = "TisiphoneLunge",
	}
