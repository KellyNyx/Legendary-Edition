CharonAllWeapons =
{
  "LECharonDash", "LECharonMeleeLeft", "LECharonMeleeRight",
  "LECharonRadialPush", "LECharonWaveStraight",
}

WeaponSets.HeroWeaponSets.LECharonMeleeLeft =
{
  "LECharonDash", "LECharonMeleeLeft", "LECharonMeleeRight",
  "LECharonRadialPush", "LECharonWaveStraight"
}

EPCLinkedWeaponUpgrades.LECharonMeleeLeft = 
{
  "LECharonMeleeRight",
}

--RubbleWeapons--
--insert here--

--HeroRushWeapons-- (Dash)
table.insert(ModdedRushWeapons, "LECharonDash")

--HeroMeleeRangeWeapons--
table.insert(WeaponSets.HeroMeleeRangeWeapons, "LECharonMeleeLeft")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "LECharonMeleeRight")

--HeroMeleeWeapons--
table.insert(WeaponSets.HeroMeleeWeapons, "LECharonMeleeLeft")

--HeroDashWeapons-- (Dash Strike)
--table.insert(WeaponSets.HeroDashWeapons, "EPCHarpyWhipCombo3")

--HeroRangedWeapons-- (Cast)
table.insert(ModdedCastWeapons, "LECharonWaveStraight")
--insert here--

--HeroPhysicalWeapons-- (Attack)
table.insert(WeaponSets.HeroPhysicalWeapons, "LECharonMeleeLeft")

--HeroPrimarySecondaryWeapons-- (Attack & Special) -- for boons that effect both the Attack & Special
table.insert(WeaponSets.HeroPrimarySecondaryWeapons, "LECharonMeleeLeft")
table.insert(WeaponSets.HeroPrimarySecondaryWeapons, "LECharonRadialPush")

--HeroAllWeapons-- for boons that effect all weapons
table.insert(WeaponSets.HeroAllWeapons, "LECharonMeleeLeft")
table.insert(WeaponSets.HeroAllWeapons, "LECharonRadialPush")

--HeroSecondaryWeapons-- (Special)
table.insert(WeaponSets.HeroSecondaryWeapons, "LECharonRadialPush")

--HeroNonPhysicalWeapons-- (Cast???)
--insert here--

--HeroTraitWeapons-- (???)
--insert here--

--HeroWeaponSets--
-- WeaponSets.HeroWeaponSets.HarpyWhipSlash1 = 
-- {
--     "HarpyWhipSlash2", 
--   "EPCHarpyWhipCombo3", "EPCHarpyLungeSurgeBeam", "EPCHarpyWhipLasso",
--   --  "EPCHarpyLightningLineCONTROL", "EPCHarpyLightningLine", "TisiphoneRushWeaponControl", "EPCTisiphoneRushWeapon","TisiphoneDash", 
-- }

--LinkedWeaponUpgrades--
WeaponSets.LinkedWeaponUpgrades.LECharonMeleeLeft = 
{
 "LECharonMeleeRight",
}