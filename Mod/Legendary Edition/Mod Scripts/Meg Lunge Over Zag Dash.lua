	RushWeapon =
	{
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
				{ Name = "/VO/Enemy Sounds/Megaera/EmoteAttacking" },
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

	SpearRushWeapon =
	{
		UpgradeChoiceText = "UpgradeChoiceMenu_Rush",
		FailToFireFunctionName = "SetSpearTeleportBuffer",
		IgnoreCancelSimOnEffects = { "RushWeaponDisable", "RushWeaponDisableCancelable" },
		--[[
		CancelEffectSimSlowParameters =
		{
			{ ScreenPreWait = 0.0, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0.07 },
			{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.1 },
		},
		]]

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
				{ Name = "/VO/Enemy Sounds/Megaera/EmoteAttacking" },
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

	RamWeapon =
	{
		UpgradeChoiceText = "UpgradeChoiceMenu_Rush",

		IgnoreCancelSimOnEffects = { "RushWeaponDisable", "RushWeaponDisableCancelable" },

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
				{ Name = "/VO/Enemy Sounds/Megaera/EmoteAttacking" },
				{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
			},

			CancelEffectSounds =
			{
				{ Name = "/Leftovers/Menu Sounds/TitanToggleShort" },
			},

			NearbyEnemyFireSounds =
			{
				{ Name = "/Leftovers/Menu Sounds/TitanToggleShort" },
			},
		},

		Upgrades = { },
	}