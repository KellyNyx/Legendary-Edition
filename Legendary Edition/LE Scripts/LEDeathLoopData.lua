DeathLoopData.DeathAreaBedroom.UnthreadedEvents =
{
   {
    FunctionName = "RemoveLastAwardTrait",
    Args = {},
   },
   {
    FunctionName = "EquipWeaponUpgrade",
    Args = {},
   },
   {
    FunctionName = "RemoveLastAssistTrait",
    Args = {},
   },
   {
    FunctionName = "DisableWeapons",
    Args = {},
   }
}
DeathLoopData.DeathArea.UnthreadedEvents =
{
   {
    FunctionName = "RemoveLastAwardTrait",
    Args = {},
   },
   {
    FunctionName = "EquipWeaponUpgrade",
    Args = {},
   },
   {
    FunctionName = "RemoveLastAssistTrait",
    Args = {},
   },
   {
    FunctionName = "DisableWeapons",
    Args = {},
   }
}

table.insert(DeathLoopData.RoomPreRun.StartUnthreadedEvents, {
    FunctionName = "SpawnContractExchangeObstacle1",
    Args = {},
})
function SpawnContractExchangeObstacle1()
   
    local CharManager = DeepCopyTable( DeathLoopData.DeathAreaOffice.ObstacleData[488699] ) or {}
    CharManager.Name = "LECharManager"
	CharManager.ObjectId = SpawnObstacle({
		Name = "HouseDesk_ContractExchange_02",
		Group = "Standing",
		DestinationId = CurrentRun.Hero.ObjectId,
		AttachedTable = CharManager,
		OffsetX = 0,
		OffsetY = -300,
      LocationX = 17540,
      LocationY = 4500,
      
	})
   CharManager.UseText = "Exchange Contracts"
   CharManager.OnUsedFunctionName = "OpenContractExchangeScreen"
   CharManager.InteractDistance = 150
   SetScale({ Id = CharManager.ObjectId, Fraction = 1.3 })
	CharManager.ActivateIds = { CharManager.ObjectId }
   SetupObstacle( CharManager )
    DebugPrint({ Text = "BLAHBLAHBLAH" })
    --SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
end