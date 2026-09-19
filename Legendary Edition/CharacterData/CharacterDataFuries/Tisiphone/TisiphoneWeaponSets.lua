TisiphoneAllWeapons =
{ 
  --"TisiphoneRushWeaponControl", "EPCTisiphoneRushWeapon", 
  "HarpyWhipSlash1", "HarpyWhipSlash2", "HarpyWhipSlash3", 
 --"EPCHarpyLightningLineCONTROL", 
 "EPCHarpyLightningLine2", "EPCHarpyWhipLasso",
  "TisiphoneDash", "EPCHarpyWhipCombo3", "EPCHarpyLungeSurgeBeam",
}

--Attack--
ModdedAttackWeapons.EPC_Tisiphone_Attack =
{
  "HarpyWhipSlash1",
}

--Special--
ModdedSpecialWeapons.EPC_Tisiphone_Special =
{
  "EPCHarpyWhipLasso",
}

--All Weapons-- (for boons that effect all weapons)
ModdedAllWeapons.EPC_Tisiphone_All =
{
  "HarpyWhipSlash1", "EPCHarpyWhipLasso", 
}

EPC_Tisiphone_Attack =
{
  "HarpyWhipSlash1"
}

HarpyWhipLash1 = 
{
  "TisiphoneRushWeaponControl", "EPCTisiphoneRushWeapon", "HarpyWhipSlash2", 
 "EPCHarpyLightningLineCONTROL", "EPCHarpyLightningLine", "EPCHarpyWhipLasso",
  "TisiphoneDash", "EPCHarpyWhipCombo3", "EPCHarpyLungeSurgeBeam",
}

EPCLinkedWeaponUpgrades.HarpyWhipLash1 = 
{
  "HarpyWhipSlash2",
  "EPCHarpyWhipCombo3",
}

--RubbleWeapons--
--insert here--

--HeroRushWeapons-- (Dash)
table.insert(ModdedRushWeapons, "TisiphoneDash")

--HeroMeleeRangeWeapons--
table.insert(WeaponSets.HeroMeleeRangeWeapons, "HarpyWhipSlash1")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "HarpyWhipSlash2")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "HarpyWhipSlash3")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "EPCHarpyWhipCombo3")

--HeroMeleeWeapons--
--table.insert(WeaponSets.HeroMeleeWeapons, "HarpyWhipSlash1")

--HeroDashWeapons-- (Dash Strike)
table.insert(WeaponSets.HeroDashWeapons, "EPCHarpyWhipCombo3")

--HeroRangedWeapons-- (Cast)
table.insert(ModdedCastWeapons, "EPCHarpyLightningLine2")
--insert here--

--HeroPhysicalWeapons-- (Attack)
table.insert(WeaponSets.HeroPhysicalWeapons, "HarpyWhipSlash1")

--HeroPrimarySecondaryWeapons-- (Attack & Special) -- for boons that effect both the Attack & Special
table.insert(WeaponSets.HeroPrimarySecondaryWeapons, "HarpyWhipSlash1")
table.insert(WeaponSets.HeroPrimarySecondaryWeapons, "EPCHarpyWhipLasso")

--HeroAllWeapons-- for boons that effect all weapons
table.insert(WeaponSets.HeroAllWeapons, "HarpyWhipSlash1")
table.insert(WeaponSets.HeroAllWeapons, "EPCHarpyWhipLasso")

--HeroSecondaryWeapons-- (Special)
table.insert(WeaponSets.HeroSecondaryWeapons, "EPCHarpyWhipLasso")

--HeroNonPhysicalWeapons-- (Cast???)
--insert here--

--HeroTraitWeapons-- (???)
--insert here--

--HeroWeaponSets--
WeaponSets.HeroWeaponSets.HarpyWhipSlash1 = 
{
    "HarpyWhipSlash2", 
  "EPCHarpyWhipCombo3", "EPCHarpyLungeSurgeBeam", "EPCHarpyWhipLasso",
  --  "EPCHarpyLightningLineCONTROL", "EPCHarpyLightningLine", "TisiphoneRushWeaponControl", "EPCTisiphoneRushWeapon","TisiphoneDash", 
}

--LinkedWeaponUpgrades--
WeaponSets.LinkedWeaponUpgrades.HarpyWhipSlash1 = 
{
 "HarpyWhipSlash2", 
 --"EPCHarpyLightningLineCONTROL",
 "EPCHarpyWhipCombo3",
 --"EPCHarpyWhipLasso",
}

