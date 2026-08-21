MegAllWeapons =
{ "MegaeraDash", 
  "MegRushWeaponControl", "EPCMegaeraRushWeapon",
  "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3", 
  "EPCHarpyBeam4", "EPCHarpyBeam5",
  "EPCHarpyBeam6", "EPCHarpyBeam7", 
  "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
  "EPCHarpyBeam11", "EPCHarpyBeam12", 
  "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
  "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash", "EPCHarpyLightning2", "EPCHarpyLightning",
  "MegWhipLash1", "MegWhipLash2", "MegWhipLash3", }

--Attack--
ModdedAttackWeapons.EPC_Meg_Attack =
{
    "MegWhipLash1",
}

--Special--
ModdedSpecialWeapons.EPC_Meg_Special =
{
    "EPCHarpyBeam",
}

--All Weapons-- (For boons that effect all weapons)
ModdedAllWeapons.EPC_Meg_All =
{
    "MegWhipLash1", "EPCHarpyBeam", "EPCHarpyLightning2", "EPCHarpyLightning", "MegaeraDash",
}

--Linked Weapon Upgrades--
-- ModdedLinkedWeaponUpgrades.MegWhipLash1 =
-- {
--   "MegWhipLash1", "MegWhipLash2", "MegWhipLash3", "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash",
-- }

-- MegWhipLash1 =
-- {
--     "MegaeraDash", "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3", "EPCHarpyBeam4", "EPCHarpyBeam5",
--   "EPCHarpyBeam6", "EPCHarpyBeam7", "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
--   "EPCHarpyBeam11", "EPCHarpyBeam12", "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
--   "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash", "EPCHarpyLightning2", "EPCHarpyLightning", "MegWhipLash2", "MegWhipLash3",
-- }

-- EPCLinkedWeaponUpgrades.MegWhipLash1 =
-- {
    
--  "MegWhipLash2", "MegWhipLash3", "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash",
-- }

--RubbleWeapons--
--insert here--

--HeroRushWeapons-- (Dash)
table.insert(ModdedRushWeapons, "MegaeraDash")

--HeroMeleeRangeWeapons--
table.insert(WeaponSets.HeroMeleeRangeWeapons, "MegWhipLash1")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "MegWhipLash2")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "MegWhipLash3")
table.insert(WeaponSets.HeroMeleeRangeWeapons, "EPCHarpyWhipWhirlDash")

--HeroMeleeWeapons--
table.insert(WeaponSets.HeroMeleeWeapons, "MegWhipLash1")

--HeroDashWeapons-- (Dash Strike)
table.insert(WeaponSets.HeroDashWeapons, "EPCHarpyWhipWhirlDash")

--HeroRangedWeapons-- (Cast)
table.insert(ModdedCastWeapons, "EPCHarpyLightning2")
table.insert(ModdedCastWeapons, "EPCHarpyLightning")
table.insert(ModdedCastWeapons, "EPCHarpyLightning_2")
table.insert(ModdedCastWeapons, "EPCHarpyLightning_3")
--insert here--

--HeroPhysicalWeapons-- (Attack)
table.insert(WeaponSets.HeroPhysicalWeapons, "MegWhipLash1")
-- table.insert(WeaponSets.HeroPhysicalWeapons, "MegWhipLash2")
-- table.insert(WeaponSets.HeroPhysicalWeapons, "MegWhipLash3")
-- table.insert(WeaponSets.HeroPhysicalWeapons, "EPCHarpyWhipWhirl")
-- table.insert(WeaponSets.HeroPhysicalWeapons, "EPCHarpyWhipWhirlDash")

--HeroPrimarySecondaryWeapons-- (Attack & Special) -- for boons that effect both the Attack & Special
table.insert(WeaponSets.HeroPrimarySecondaryWeapons, "MegWhipLash1")
table.insert(WeaponSets.HeroPrimarySecondaryWeapons, "EPCHarpyBeam")

--HeroAllWeapons-- for boons that effect all weapons
table.insert(WeaponSets.HeroAllWeapons, "MegWhipSlash1")
table.insert(WeaponSets.HeroAllWeapons, "EPCHarpyBeam")
table.insert(WeaponSets.HeroAllWeapons, "EPCHarpyLightning2")

--HeroSecondaryWeapons-- (Special)
table.insert(WeaponSets.HeroSecondaryWeapons, "EPCHarpyBeam")

--HeroNonPhysicalWeapons-- (Cast???)
--insert here--

--HeroTraitWeapons-- (???)
--insert here--

--HeroWeaponSets--
--table.insert(WeaponSets.HeroWeaponSets, MegWhipLash1)
WeaponSets.HeroWeaponSets.MegWhipLash1 =
{
  "MegWhipLash2", "MegWhipLash3", "EPCHarpyBeam", "EPCHarpyBeam2", "EPCHarpyBeam3", "EPCHarpyBeam4", "EPCHarpyBeam5",
  "EPCHarpyBeam6", "EPCHarpyBeam7", "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
  "EPCHarpyBeam11", "EPCHarpyBeam12", "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
  "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash", 
--   "EPCHarpyLightning2", "EPCHarpyLightning", 
}

--LinkedWeaponUpgrades--
--table.insert(WeaponSets.LinkedWeaponUpgrades, MegWhipLash1)
WeaponSets.LinkedWeaponUpgrades.MegWhipLash1 = 
{
 "MegWhipLash2", "MegWhipLash3", "EPCHarpyWhipWhirl", "EPCHarpyWhipWhirlDash",
}

WeaponSets.LinkedWeaponUpgrades.EPCHarpyBeam = 
{
 "EPCHarpyBeam2", "EPCHarpyBeam3", "EPCHarpyBeam4", "EPCHarpyBeam5",
  "EPCHarpyBeam6", "EPCHarpyBeam7", "EPCHarpyBeam8", "EPCHarpyBeam9", "EPCHarpyBeam10",
  "EPCHarpyBeam11", "EPCHarpyBeam12", "EPCHarpyBeam13", "EPCHarpyBeam14", "EPCHarpyBeam15",
}