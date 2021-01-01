--[[---------------------------------------------------------------------------\
| ||\\    //||       /|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\ |
| || \\  // ||  (o_ / |                  SUPPLEMENTARY FILE                  | |
| ||  \\//  ||  //\/  |                         ----                         | |
| ||   \/   ||  V_/_  |                     IGLOO HOUSING                    | |
| ||        ||        |‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗/ |
\---------------------------------------------------------------------------]]--

local lunarRevel = ...

--[[--------------------------- PREFABS & MATERIALS ---------------------------]]--

lunarRevel:registerAssetId("models/igloos.fbx/Prefab/iglooLevel1Density1Part", "IGLOO_LEVEL_1_DENSITY_1_PREFAB")
lunarRevel:registerAssetId("models/igloos.fbx/Prefab/iglooLevel1Density2Part", "IGLOO_LEVEL_1_DENSITY_2_PREFAB")

--[[--------------------- ASSET PROCESSOR & NODE HANDLING ---------------------]]--

lunarRevel:registerAssetProcessor("models/igloos.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })

--[[------------------------ BUILDINGS & BUILDING PARTS -----------------------]]--

lunarRevel:register({
	DataType = "BUILDING_PART",
	Id = "IGLOO_LEVEL_1_DENSITY_1_PART",
	Name = "IGLOO_LEVEL_1_DENSITY_1_PART_NAME",
	Description = "IGLOO_LEVEL_1_DENSITY_1_PART_DESC",
	Category = "CORE",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle(2.5 , { 0, 0 } , 36 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
            }
        },
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "IGLOO_LEVEL_1_DENSITY_1_PREFAB"
	},
    ConstructionVisual = nil,
	Cost = {
        RessourcesNeeded = {}
    },
    IsVisibleWhenBuilt = true
})

lunarRevel:register({
	DataType = "BUILDING_PART",
	Id = "IGLOO_LEVEL_1_DENSITY_2_PART",
	Name = "IGLOO_LEVEL_1_DENSITY_2_PART_NAME",
	Description = "IGLOO_LEVEL_1_DENSITY_2_PART_DESC",
	Category = "CORE",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle(5 , { 0, 0 } , 36 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
            }
        },
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "IGLOO_LEVEL_1_DENSITY_2_PREFAB"
	},
    ConstructionVisual = nil,
	Cost = {
        RessourcesNeeded = {}
    },
    IsVisibleWhenBuilt = true
})

lunarRevel:registerPrefabComponent("models/igloos.fbx/Prefab/iglooLevel1Density1Part", { DataType = "COMP_GROUNDED" })
lunarRevel:registerPrefabComponent("models/igloos.fbx/Prefab/iglooLevel1Density2Part", { DataType = "COMP_GROUNDED" })

--[[---------------------------- HOUSING ESSENTIALS ---------------------------]]--

lunarRevel:registerAssetId("models/igloos.fbx/Prefab/housePart", "HOUSE_CUBE_PREFAB")

lunarRevel:register({
	DataType = "BUILDING_PART",
	Id = "LEVEL_1_DENSITY_1_CUBE_PART",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "HOUSE_CUBE_PREFAB" },
        MandatoryBuildingPartList = {
            { BuildingPart = "IGLOO_LEVEL_1_DENSITY_1_PART" }
        }
	}
})

lunarRevel:override({
    Id = "BUILDING_PART_HOUSING_SERF_DENSITY_1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
            "LEVEL_1_DENSITY_1_CUBE_PART"
        }
	}
})

lunarRevel:register({
	DataType = "BUILDING_PART",
	Id = "LEVEL_1_DENSITY_2_CUBE_PART",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "HOUSE_CUBE_PREFAB" },
        MandatoryBuildingPartList = {
            { BuildingPart = "IGLOO_LEVEL_1_DENSITY_2_PART" }
        }
	}
})

lunarRevel:override({
    Id = "BUILDING_PART_HOUSING_SERF_DENSITY_2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
            "LEVEL_1_DENSITY_2_CUBE_PART"
        }
	}
})

--[[----------------------------- PARTICLE SYSTEMS ----------------------------]]--

lunarRevel:registerPrefabComponent("models/igloos.fbx/Prefab/iglooLevel1Density1Part/SmokeEmitterL1D1", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})

lunarRevel:registerPrefabComponent("models/igloos.fbx/Prefab/iglooLevel1Density2Part/SmokeEmitterL1D2", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})