table.insert(WeaponUpgradeData.SpearWeapon,
{
	Costs = { 0, 1, 1, 1, 1 },
	MaxUpgradeLevel = 5,
	TraitName = "EPCAlectoTrait",
	UnequipFunctionName = "RemoveEPCAlectoWeapons",
	EquippedKitAnimation = "WeaponSwordFloatingIdleOff",
	UnequippedKitAnimation = "WeaponSwordFloatingIdle",
	BonusUnequippedKitAnimation = "WeaponSwordFloatingIdleBonus",
	BonusEquippedKitAnimation = "WeaponSwordFloatingIdleOffBonus",
	Image = "Character_Portrait_Alecto"
})

function RemoveEPCAlectoWeapons()
	--Unequip Character Weapons
	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = AlectoAllWeapons })
    UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "EPCHarpyWhipArc" })
	--Equip Zagreus Dash And Cast Back
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RushWeapon", PreLoadBinks = true })
    EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = WeaponSets.HeroRangedWeapons, PreLoadBinks = true })
	--Set Unit Properties And Binks Back to Default (Zagreus)--
	SetThingProperty({ Property = "Graphic", Value = "ZagreusIdle", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StartGraphic", Value = "ZagreusStart", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "ZagreusStop", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "LowSpeedAnimation", Value = "ZagreusWalk", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "HighSpeedAnimation", Value = "ZagreusRun", DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 540.0, DestinationId = CurrentRun.Hero.ObjectId })
	SetScale({ Fraction = 1.0, Id = CurrentRun.Hero.ObjectId })
	StopAnimation({ Names = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MedusaShadow", DestinationId = CurrentRun.Hero.ObjectId })
	
	RemoveTrait( CurrentRun.Hero, "EPC_CharacterHandlerTrait" )
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	SetupDefaultCharacter()
	--make sure to let the game know that we aren't playing as a custom
	--character anymore
	IsCustomHero = false
	UpdateLifePips()
	DestroyPlayerRageMeter()
end