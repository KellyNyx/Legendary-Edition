table.insert(WeaponUpgradeData.SpearWeapon,
{
	Costs = { 0, 1, 1, 1, 1 },
	MaxUpgradeLevel = 5,
	TraitName = "EPCHadesTrait",
	UnequipFunctionName = "RemoveEPCHadesWeapons",
	EquippedKitAnimation = "WeaponSpearAlt02FloatingIdleOff",
	UnequippedKitAnimation = "WeaponSpearAlt02FloatingIdleOff",
	BonusUnequippedKitAnimation = "WeaponSpearAlt02FloatingIdleBonus",
	BonusEquippedKitAnimation = "WeaponSpearAlt02FloatingIdleOffBonus",
	Image = "Codex_Portrait_Hades"
})

function RemoveEPCHadesWeapons()
	--Unequip Character Weapons
	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroWeaponSets.EPCHadesBidentArcCombo1 })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "EPCHadesBidentArcCombo1" })
	--Equip Zagreus Dash And Cast Back
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", PreLoadBinks = true })
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, PreLoadBinks = true })
	--Set Unit Properties And Binks Back to Default (Zagreus)
	SetThingProperty({ Property = "Graphic", Value = "ZagreusIdle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "ZagreusStart", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "ZagreusStop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = "ZagreusWalk", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = "ZagreusRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 540.0, DestinationId = CurrentRun.Hero.ObjectId })
	SetScale({ Fraction = 1.0, Id = CurrentRun.Hero.ObjectId })
	StopAnimation({ Names = "LaurelCindersSpawnerHades", DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MedusaShadow", DestinationId = CurrentRun.Hero.ObjectId })
	RemoveTrait( CurrentRun.Hero, "EPC_CharacterHandlerTrait" )
	SetupDefaultCharacter()
end