--[[---------------------------------------------------------------------------\
| ||\\    //||       /|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\ |
| || \\  // ||  (o_ / |                     MAIN MOD FILE                    | |
| ||  \\//  ||  //\/  |                         ----                         | |
| ||   \/   ||  V_/_  |                      LUNAR REVEL                     | |
| ||        ||        |‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗/ |
\---------------------------------------------------------------------------]]--

local lunarRevel = foundation.createMod();

lunarRevel:log("Lunar Revel Mod Loading")

--[[---------------------------- GENERAL MATERIALS ----------------------------]]--

--[[------------------------------ MAIN MONUMENT ------------------------------]]--

lunarRevel:registerAssetId("models/pagoda.fbx/Prefab/PagodaPart", "PREFAB_PAGODA_1_PART")

lunarRevel:register({
	DataType = "BUILDING",
	Id = "PAGODA_1",
	Name = "PAGODA_1_NAME",
	Description = "PAGODA_1_DESC",
	BuildingType = "DECORATION",
	AssetCoreBuildingPart = "PAGODA_1_PART"
})

lunarRevel:register({
	DataType = "BUILDING_PART",
	Id = "PAGODA_1_PART",
    Name = "PAGODA_1_PART_NAME",
	Description = "PAGODA_1_PART_DESC",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_PAGODA_1_PART"
	},
	BuildingZone = {
		ZoneEntryList = {
            {
			Polygon = polygon.createCircle( 10 , { 0, 0 } , 36 ),
			Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true }
			}
        }
	},
	ConstructionVisual = nil,
	Cost = {
		RessourcesNeeded = {}
	},
    IsVisibleWhenBuilt = true
})



--[[------------------------------- MAIN EVENT --------------------------------]]--

--[[-------------------------------- DO FILES ---------------------------------]]--

lunarRevel:dofile("scripts/fireworks.lua")