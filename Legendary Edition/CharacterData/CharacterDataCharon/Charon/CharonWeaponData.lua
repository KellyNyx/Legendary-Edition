WeaponData.LECharonMeleeLeft =
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
		ShortName = "LECharonMeleeLeft",
		UnlockName = "SpearWeapon_Unlock",
		--DashWeapon = "EPCHarpyWhipWhirlDash",
		--DashSwaps = { "MegWhipLash1", "MegWhipLash2", "MegWhipLash3", },
		--ExpireDashWeaponOnDash = true,
		SecondaryWeapon = "LECharonRadialPush",
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
            { Name = "/SFX/Enemy Sounds/Charon/CharonBigSwipe2" },
			{ Name = "/SFX/Enemy Sounds/Charon/EmoteAttacking" },
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

    --Upgrades = { },
}
WeaponData.LECharonMeleeRight =
{
 InheritFrom = { "LECharonMeleeLeft" }
}
WeaponData.LECharonWaveStraight =
{
		-- HitScreenshake = { Distance = 3, Speed = 300, Duration = 0.06, FalloffSpeed = 3000 },
		-- HitSimSlowParameters =
		-- {
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.02, Fraction = 0.25, LerpTime = 0 },
		-- 	{ ScreenPreWait = 0.16, Fraction = 1.0, LerpTime = 0.1 },
		-- },

		ChainedOnly = true,
		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 5,

		AIData =
		{
			DeepInheritance = true,
			PreAttackDuration = 0.0,
			FireDuration = 0.0,
			PostAttackDuration = 0.0,
			AIAttackDistance = 9999,
			AIAttackDistance = 9999,
			SkipMovement = true,
			SkipAngleTowardTarget = true,

			MaxConsecutiveUses = 3,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Charon/CharonGroundBlastFire" },
				{ Name = "/VO/Charon_0005" },
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
WeaponData.LECharonRadialPush =
{
    InheritFrom = { "CharonRadialPush" }
}