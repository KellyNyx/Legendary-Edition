EnemyData.EPCHadesAmmo =
	{
		InheritFrom = { "BaseVulnerableEnemy" },
		--IsBossDamage = true,

		MaxHealth = 250,
		HealthBarOffsetY = -210,
		HealthBarType = "Medium",

		DefaultAIData = {
			PreAttackDuration = 5.0,
			PostAttackCooldown = 0.0,
		},

		AIOptions = { AttackAndDie },
		DisplayAttackTimer = true,
		AttackTimerOffsetY = -200,

		RequiredKill = false,
		BlocksLootInteraction = false,
		OutgoingDamageModifiers =
		{
			{
				NonPlayerMultiplier = 1.0,
			},
		},

		WeaponOptions =
		{
			"EPCHadesAmmoWeapon",
		},

		MoneyDropOnDeath =
		{
			Chance = 0,
		},
	}
    EnemyData.EPCHadesTombstone =
	{
		InheritFrom = { "IsNeutral", "BaseVulnerableEnemy" },
		IsBossDamage = true,
		MaxHealth = 1,
		SkipDamageText = true,
		HideHealthBar = true,
		HideLevelDisplay = true,
		RequiredKill = false,

		MoneyDropOnDeath =
		{
			Chance = 0.0,
		},
	}