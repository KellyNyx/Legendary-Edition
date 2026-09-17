--TraitData.AthenaRushTrait.RequiredFalseTraits = { "EPC_CharacterHandlerTrait" }

TraitData.AthenaRushTrait1 = 
{
	--RequiredTrait = { "EPC_CharacterHandlerTrait" },
	Icon = "Boon_Athena_03",
		--InheritFrom = { "ShopTier1Trait" },
		--God = "Athena",
		--Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AthenaRushProjectile",
				ChangeType = "Absolute",
			},
			-- {
			-- 	WeaponName = "RushWeapon",
			-- 	WeaponProperty = "FireFx",
			-- 	ChangeValue = "BlinkTrail-AthenaDark",
			-- 	ChangeType = "Absolute",
			-- },
			-- {
			-- 	WeaponName = "RushWeapon",
			-- 	WeaponProperty = "FireGraphic",
			-- 	ChangeValue = "ZagreusDashNoCollide_Athena",
			-- 	ChangeType = "Absolute",
			-- },
			{
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 60,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = ModdedRushWeapons,
				EffectName = "AthenaDashShieldReflection",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = ModdedRushWeapons,
				EffectName = "AthenaDashShieldReflect",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
}
-- table.insert( LootData.AthenaUpgrade.PriorityUpgrades, "AthenaRushTrait1" )
-- table.insert( LootData.AthenaUpgrade.WeaponUpgrades, "AthenaRushTrait1" )
-- table.insert( LootData.AthenaUpgrade.LinkedUpgrades.AthenaBackstabDebuffTrait.OneOf, "AthenaRushTrait1" )
-- table.insert( LootData.AthenaUpgrade.LinkedUpgrades.AthenaShieldTrait.OneOf, "AthenaRushTrait1" )

--Greater Reflex support--

table.insert( MetaUpgradeData.StaminaMetaUpgrade.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "ClipSize",
				ChangeValue = 1,
				ChangeType = "Add",
			} )

--Dash/Cast boons support--

--Dash--

--Zeus--
-- table.insert( TraitData.ZeusRushTrait.PropertyChanges,  {
-- 				WeaponName = "LightningDash",
-- 				ProjectileProperty = "DamageLow",
-- 				BaseMin = 10,
-- 				BaseMax = 10,
-- 				-- DepthMult = DepthDamageMultiplier,
-- 				-- IdenticalMultiplier =
-- 				-- {
-- 				-- 	Value = DuplicateVeryStrongMultiplier,
-- 				-- },
-- 				ExtractValue =
-- 				{
-- 					ExtractAs = "TooltipDamage",
-- 				}
-- 			})
-- table.insert( TraitData.ZeusRushTrait.PropertyChanges,  {
-- 				WeaponName = "LightningDash",
-- 				ProjectileProperty = "DamageHigh",
-- 				DeriveValueFrom = "DamageLow"
-- 			})
-- table.insert( TraitData.ZeusRushTrait.PropertyChanges,  {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Zeus",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.ZeusRushTrait.PropertyChanges,  {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Zeus",
-- 				ChangeType = "Absolute",
-- 			})

--Poseidon--
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "PoseidonRushProjectile",
				ChangeType = "Absolute",
			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "CancelAttachedProjectiles",
				ChangeValue = false,
				ChangeType = "Absolute",
			})
-- table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Poseidon",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Poseidon",
-- 				ChangeType = "Absolute",
-- 			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = true,
				ChangeType = "Absolute",
			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpointDelay",
				ChangeValue = -0.1,
				ChangeType = "Absolute",
			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 35,
				BaseMax = 35,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})
table.insert( TraitData.PoseidonRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			})

--Athena--
table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AthenaRushProjectile",
				ChangeType = "Absolute",
			})
-- table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrail-AthenaDark",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Athena",
-- 				ChangeType = "Absolute",
-- 			})
table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 60,
				ChangeType = "Absolute",
			})
table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				EffectName = "AthenaDashShieldReflection",
				EffectProperty = "Active",
				ChangeValue = true,
			})
table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				EffectName = "AthenaDashShieldReflect",
				EffectProperty = "Active",
				ChangeValue = true,
			})
table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.2,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.AthenaRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})

--Aphrodite--
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AphroditeRushProjectile",
				ChangeType = "Absolute",
			})
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 20,
				AsInt = true,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateVeryStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			})
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = true,
				ChangeType = "Absolute",
			})
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpointDelay",
				ChangeValue = 0.01,
				ChangeType = "Absolute",
			})
table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			})
-- table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Aphrodite",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.AphroditeRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Aphrodite",
-- 				ChangeType = "Absolute",
-- 			})

--Artemis--
-- table.insert( TraitData.ArtemisRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Artemis",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.ArtemisRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Artemis",
-- 				ChangeType = "Absolute",
-- 			})

--Ares--
table.insert( TraitData.AresRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AresRushProjectile",
				ChangeType = "Absolute",
			})
-- table.insert( TraitData.AresRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Ares",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.AresRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Ares",
-- 				ChangeType = "Absolute",
-- 			})
table.insert( TraitData.AresRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.2,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.AresRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})
table.insert( TraitData.AresRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = true,
				ChangeType = "Absolute",
			})
table.insert( TraitData.AresRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = false,
				ChangeType = "Absolute",
			})

--Dionysus--
-- table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "BlinkTrailVerticalB-Dionysus",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
-- 				WeaponNames = ModdedRushWeapons,
-- 				WeaponProperty = "FireGraphic",
-- 				ChangeValue = "ZagreusDashNoCollide_Dionysus",
-- 				ChangeType = "Absolute",
-- 			})
table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DionysusDashProjectile",
				ChangeType = "Absolute",
			})
table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = true,
				ChangeType = "Absolute",
			})
table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = false,
				ChangeType = "Absolute",
			})
table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			})
table.insert( TraitData.DionysusRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 2,
				BaseMax = 2,
				ChangeType = "Add",
				AsInt = true,
				MinMultiplier = 0.5,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})

--Hermes--
table.insert( TraitData.BonusDashTrait.PropertyChanges,  {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "ClipSize",
				BaseValue = 1,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			})

--Demeter--
table.insert( TraitData.DemeterRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterRushProjectile",
				ChangeType = "Absolute",
			} )
table.insert( TraitData.DemeterRushTrait.PropertyChanges,  {
				WeaponNames = ModdedRushWeapons,
				ProjectileName = "DemeterIce",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
				AsInt = true,
				MinMultiplier = 0.2,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.DemeterRushTrait.PropertyChanges, {
				WeaponNames = ModdedRushWeapons,
				ProjectileName = "DemeterIce",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			} )

--Cast--

--Zeus--

--Poseidon--
-- table.insert( TraitData.PoseidonRangedTrait.PropertyChanges,  {
-- 				WeaponNames = ModdedCastWeapons,
-- 				WeaponProperty = "Projectile",
-- 				ChangeValue = "PoseidonProjectile",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.PoseidonRangedTrait.PropertyChanges,  {
-- 				WeaponNames = ModdedCastWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "ProjectileFireRing-Poseidon",
-- 				ChangeType = "Absolute",
-- 			})
table.insert( TraitData.PoseidonRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				--ProjectileName = "PoseidonProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.PoseidonRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				--ProjectileName = "PoseidonProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			})

--Athena--
-- table.insert( TraitData.AthenaRangedTrait.PropertyChanges,  {
-- 				WeaponNames = ModdedCastWeapons,
-- 				WeaponProperty = "Projectile",
-- 				ChangeValue = "AthenaDeflectingProjectile",
-- 				ChangeType = "Absolute",
-- 			})
-- table.insert( TraitData.AthenaRangedTrait.PropertyChanges,  {
-- 				WeaponNames = ModdedCastWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "ProjectileFireRing-Athena",
-- 				ChangeType = "Absolute",
-- 			})
table.insert( TraitData.AthenaRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 85,
				BaseMax = 85,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.AthenaRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})
table.insert( TraitData.AthenaRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ChangeType = "Absolute"
			})

--Aphrodite--
-- table.insert( TraitData.AphroditeRangedTrait, {
-- 				WeaponNames = ModdedCastWeapons,
-- 				WeaponProperty = "FireFx",
-- 				ChangeValue = "ProjectileFireRing-Aphrodite",
-- 				ChangeType = "Absolute",
-- 			} )
table.insert( TraitData.AphroditeRangedTrait.PropertyChanges, {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 90,
				BaseMax = 90,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			} )
table.insert( TraitData.AphroditeRangedTrait.PropertyChanges, {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})

--Artemis--
table.insert( TraitData.ArtemisRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateStrongMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.ArtemisRangedTrait.PropertyChanges, {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			} )
table.insert( TraitData.ArtemisRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			})

--Ares--
table.insert( TraitData.AresRangedTrait.PropertyChanges, {
				WeaponNames = ModdedCastWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			} )
table.insert( TraitData.AresRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 60,
				BaseMax = 60,
				IdenticalMultiplier =
				{
					Value = -0.34,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})

--Dionysus--
table.insert( TraitData.DionysusRangedTrait.PropertyChanges, {
				WeaponNames = ModdedCastWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			} )
table.insert( TraitData.DionysusRangedTrait.PropertyChanges, {
				WeaponNames = ModdedCastWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.25,
				ChangeType = "Add",
				-- DepthMult = DepthDamageMultiplier,
				-- IdenticalMultiplier =
				-- {
				-- 	Value = DuplicateMultiplier,
				-- },
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			} )

--Demeter--
table.insert( TraitData.DemeterRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				AsInt = true,
				MinMultiplier = 0.1,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			})
table.insert( TraitData.DemeterRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			})
table.insert( TraitData.DemeterRangedTrait.PropertyChanges,  {
				WeaponNames = ModdedCastWeapons,
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			})