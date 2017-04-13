---
-- Name: TSK-100 - Cargo Pickup
-- Author: FlightControl
-- Date Created: 25 Mar 2017
--
-- # Situation:
-- 
-- This mission demonstrates the pickup of cargo.
-- 
-- # Test cases: 
-- 
-- 

do
  local HQ = GROUP:FindByName( "HQ", "Bravo HQ" )

  local CommandCenter = COMMANDCENTER:New( HQ, "Lima" )

  local Scoring = SCORING:New( "Pickup Demo" )

  local Mission = MISSION
    :New( CommandCenter, "Transport", "High", "Pickup the team", coalition.side.BLUE )
    :AddScoring( Scoring )

  local TransportHelicopters = SET_GROUP:New():FilterPrefixes( "Transport" ):FilterStart()

  local CargoEngineer = UNIT:FindByName( "Engineer" )
  InfantryCargo = AI_CARGO_UNIT:New( CargoEngineer, "Engineer", "Engineer Sven", "81", 500, 25 )
  
  local SetCargo = SET_CARGO:New():FilterTypes( "Engineer" ):FilterStart()

  Task_Cargo_Pickup = TASK_CARGO_TRANSPORT:New( Mission, TransportHelicopters, "Transport.001", SetCargo )
  
  Task_Cargo_Pickup:AddDeployZone( ZONE_POLYGON:New( "DeployZone1", GROUP:FindByName("DeployZone1") ) )
  Task_Cargo_Pickup:AddDeployZone( ZONE_POLYGON:New( "DeployZone2", GROUP:FindByName("DeployZone2") ) )

end	
					
