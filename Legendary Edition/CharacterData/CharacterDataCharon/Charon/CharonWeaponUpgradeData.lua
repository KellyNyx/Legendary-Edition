WeaponUpgradeData.LECharonMeleeLeft =
{
	{
			Costs = { 0, 2, 3, 4, 5 },
			MaxUpgradeLevel = 5,
			--TraitName = "SwordAmmoWaveTrait"
			TraitName = "LECharonTrait",
			StartsUnlocked = true,
			UnequipFunctionName = "RemoveLECharonWeapons",
			EquippedKitAnimation = "WeaponSwordAlt01FloatingIdleOff",
			UnequippedKitAnimation = "WeaponSwordAlt01FloatingIdle",
			BonusUnequippedKitAnimation = "WeaponSwordAlt01FloatingIdleBonus",
			BonusEquippedKitAnimation = "WeaponSwordAlt01FloatingIdleOffBonus",
			Image = "Codex_Portrait_Charon"
		}
}

function RemoveLECharonWeapons()
	--Unequip Character Weapons
	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Names = CharonAllWeapons })
    --UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "EPCHarpyBeam" })
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
	StopAnimation({ Names = CurrentRun.Hero.AttachedAnimationName, DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "CharonShadow", DestinationId = CurrentRun.Hero.ObjectId })
	
	RemoveTrait( CurrentRun.Hero, "EPC_CharacterHandlerTrait" )
	--RemoveTrait( CurrentRun.Hero, "EPCMegaeraTrait" )
	SetupDefaultCharacter()
	if HeroHasTrait("StaminaMetaUpgrade") then
	SetWeaponProperty({ Names = WeaponSets.HeroRushWeapons, Property = "ClipSize", Value = 2 })
	end
	--make sure to let the game know that we aren't playing as a custom
	--character anymore
	IsCustomHero = false
	LECharacterData.LastCharacter = TraitData.DefaultCharacterTrait
	LECharacterData.LastCharTraitName = "DefaultCharacterTrait"
	UpdateLifePips()
	SwapCharAnimations()
	
end