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

--Megaera--
table.insert(DeathLoopData.RoomPreRun.StartUnthreadedEvents, {
    FunctionName = "SpawnMegaeraCharObstacle",
    Args = {},
})
function SpawnMegaeraCharObstacle()
   
    local LECharMeg = DeepCopyTable( DeathLoopData.DeathAreaOffice.ObstacleData[488699] ) or {}
    LECharMeg.Name = "LECharMeg"
	LECharMeg.ObjectId = SpawnObstacle({
		Name = "MegCharObstacle",
		Group = "Standing",
		DestinationId = CurrentRun.Hero.ObjectId,
		AttachedTable = LECharMeg,
		OffsetX = 1900,
		OffsetY = -700,
      LocationX = 7139,
      LocationY = 3855,
      
	})
   LECharMeg.UseText = "Exchange Contracts With Megaera?"
   LECharMeg.OnUsedFunctionName = "LE_EquipMegWeapon"
   LECharMeg.InteractDistance = 100
   SetScale({ Id = LECharMeg.ObjectId, Fraction = 1.3 })
	LECharMeg.ActivateIds = { LECharMeg.ObjectId }
   
   SetupObstacle( LECharMeg )
    DebugPrint({ Text = "Successfully spawned meg char obstacle" })
    --SetThingProperty({ Property = "Graphic", DestinationId = LECharMeg, Value = "FuryHellfirePreviewDecalDark" })
    --SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
end

--Alecto--
table.insert(DeathLoopData.RoomPreRun.StartUnthreadedEvents, {
    FunctionName = "SpawnAlectoCharObstacle",
    Args = {},
})
function SpawnAlectoCharObstacle()
   
    local LECharAlecto = DeepCopyTable( DeathLoopData.DeathAreaOffice.ObstacleData[488699] ) or {}
    LECharAlecto.Name = "LECharAlecto"
	LECharAlecto.ObjectId = SpawnObstacle({
		Name = "AlectoCharObstacle",
		Group = "Standing",
		DestinationId = CurrentRun.Hero.ObjectId,
		AttachedTable = LECharAlecto,
		OffsetX = 2200,
		OffsetY = -550,
      LocationX = 7139,
      LocationY = 3855,
      
	})
   LECharAlecto.UseText = "Exchange Contracts With Alecto?"
   LECharAlecto.OnUsedFunctionName = "LE_EquipAlectoWeapon"
   LECharAlecto.InteractDistance = 100
   SetScale({ Id = LECharAlecto.ObjectId, Fraction = 1.3 })
	LECharAlecto.ActivateIds = { LECharAlecto.ObjectId }
   
   SetupObstacle( LECharAlecto )
    DebugPrint({ Text = "Successfully spawned meg char obstacle" })
    --SetThingProperty({ Property = "Graphic", DestinationId = LECharMeg, Value = "FuryHellfirePreviewDecalDark" })
    --SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
end

--Tisiphone--
table.insert(DeathLoopData.RoomPreRun.StartUnthreadedEvents, {
    FunctionName = "SpawnTisiphoneCharObstacle",
    Args = {},
})
function SpawnTisiphoneCharObstacle()
   
    local LECharTis = DeepCopyTable( DeathLoopData.DeathAreaOffice.ObstacleData[488699] ) or {}
    LECharTis.Name = "LECharTis"
	LECharTis.ObjectId = SpawnObstacle({
		Name = "TisCharObstacle",
		Group = "Standing",
		DestinationId = CurrentRun.Hero.ObjectId,
		AttachedTable = LECharTis,
		OffsetX = 1800,
		OffsetY = -500,
      LocationX = 7139,
      LocationY = 3855,
      
	})
   LECharTis.UseText = "Exchange Contracts With Tisiphone?"
   LECharTis.OnUsedFunctionName = "LE_EquipTisiphoneWeapon"
   LECharTis.InteractDistance = 100
   SetScale({ Id = LECharTis.ObjectId, Fraction = 1.3 })
	LECharTis.ActivateIds = { LECharTis.ObjectId }
   
   SetupObstacle( LECharTis )
    DebugPrint({ Text = "Successfully spawned meg char obstacle" })
    --SetThingProperty({ Property = "Graphic", DestinationId = LECharMeg, Value = "FuryHellfirePreviewDecalDark" })
    --SetThingProperty({ Property = "Graphic", DestinationId = CharManager, Value = "HouseDesk01" })
end
