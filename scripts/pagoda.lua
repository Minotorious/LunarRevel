--[[---------------------------------------------------------------------------\
| ||\\    //||       /|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\ |
| || \\  // ||  (o_ / |                  SUPPLEMENTARY FILE                  | |
| ||  \\//  ||  //\/  |                         ----                         | |
| ||   \/   ||  V_/_  |                        PAGODA                        | |
| ||        ||        |‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗/ |
\---------------------------------------------------------------------------]]--

local lunarRevel = ...

--[[--------------------------- PREFABS & MATERIALS ---------------------------]]--

lunarRevel:registerAssetId("models/pagoda.fbx/Prefab/PagodaPart", "PREFAB_PAGODA_PART")
lunarRevel:registerAssetId("models/pagoda.fbx/Materials/Material.Bison", "MATERIAL_BISON")

lunarRevel:override({
    Id = "MATERIAL_BISON",
    IsLighted = false
})

--[[---------------------------- CUSTOM COMPONENTS ----------------------------]]--

local COMP_ASSIGN_EMITTERS = {
    TypeName = "COMP_ASSIGN_EMITTERS",
    ParentType = "COMPONENT",
    Properties = {}
}

function COMP_ASSIGN_EMITTERS:update()
    self:getLevel():getComponentManager("COMP_BUILDING"):getAllComponent():forEach(
        function(building)
            if building:getOwner().Name == "HOUSE" then
                if building:getOwner():getComponent("COMP_PARTICLE_EMITTER") == nil then
                    building:getOwner():addComponent("COMP_PARTICLE_EMITTER", true)
                    --building:getOwner():addComponent("COMP_PARTICLE_EMITTER_TOGGLE", true)
                    --toggle = building:getOwner():getComponent("COMP_PARTICLE_EMITTER_TOGGLE")
                    emitter = building:getOwner():getComponent("COMP_PARTICLE_EMITTER")
                    emitter.ParticleSystem = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_HOUSING_RED"
                    emitter.IsPlaying = true
                    emitter.IsEmitting = true
                    
                    --buildingPart = building:getBuildingPartList()[1]
                    --table.insert(buildingPart.FeedbackComponentListToActivate, emitter)
                    --table.insert(buildingPart.FeedbackComponentListToActivate, toggle)
                    --lunarRevel:log("Emitter Enabled: " .. tostring(emitter:isEnabled()))
                    --lunarRevel:log("Toggle Enabled: " .. tostring(toggle:isEnabled()))
                end
            end
        end
    )
end

function COMP_ASSIGN_EMITTERS:onDestroy(isClearingLevel)
    self:getLevel():getComponentManager("COMP_BUILDING"):getAllComponent():forEach(
        function(building)
            if building:getOwner().Name == "HOUSE" then
                if building:getOwner():getComponent("COMP_PARTICLE_EMITTER") ~= nil then
                    emitter = building:getOwner():getComponent("COMP_PARTICLE_EMITTER")
                    emitterRemoved = building:getOwner():removeComponent(emitter)
                end
            end
        end
    )
end

lunarRevel:registerClass(COMP_ASSIGN_EMITTERS)

lunarRevel:registerPrefabComponent("models/pagoda.fbx/Prefab/PagodaPart", { DataType = "COMP_BUILDING_PART", FeedbackComponentListToActivate = { { "PREFAB_PAGODA_PART", "COMP_ASSIGN_EMITTERS" } } })
lunarRevel:registerPrefabComponent("models/pagoda.fbx/Prefab/PagodaPart", { DataType = "COMP_ASSIGN_EMITTERS", Enabled = true })

--[[--------------------- ASSET PROCESSOR & NODE HANDLING ---------------------]]--
--[[--------------------------- COMPONENT ASSIGNMENT --------------------------]]--
--[[-------------------------------- COLLIDERS --------------------------------]]--

lunarRevel:registerAssetProcessor("models/pagoda.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })

lunarRevel:configurePrefabFlagList("models/pagoda.fbx/Prefab/PagodaPart", { "PLATFORM" })

--[[------------------------ BUILDINGS & BUILDING PARTS -----------------------]]--

lunarRevel:register({
    DataType = "BUILDING",
    Id = "PAGODA",
    Name = "PAGODA_NAME",
    Description = "PAGODA_DESC",
    BuildingType = "DECORATION",
    AssetCoreBuildingPart = "PAGODA_PART"
})

lunarRevel:register({
    DataType = "BUILDING_PART",
    Id = "PAGODA_PART",
    Name = "PAGODA_PART_NAME",
    Description = "PAGODA_PART_DESC",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_PAGODA_PART"
    },
    BuildingZone = {
        ZoneEntryList = {
            {
            Polygon = polygon.createRectangle( { 16, 16 }, { 0, 0 } ),
            Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true }
            }
        }
    },
    ConstructionVisual = nil,
    AssetBuildingFunction = "BUILDING_FUNCTION_WELL",
    Cost = {
        RessourcesNeeded = {}
    },
    DesirabilityModifiers = {
        {
            Desirability = "DESIRABILITY_RESIDENTIAL",
            Type = "ADD",
            Radius = 25,
            Value = 0.5
        }
    },
    IsVisibleWhenBuilt = true
})

--[[----------------------------- PARTICLE SYSTEMS ----------------------------]]--

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_HOUSING_RED",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_RED",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	MinimumQuality = "LOW",
    Duration = 3,
	Looping = true,
	Delay = { 0, 1 },
	LifeTime = 3,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 0.33,
    SubEmitterList = {
        {
            DataType = "PARTICLE_SUB_EMITTER_DATA",
            Type = "ON_DEATH",
            System = "FIREWORKS_BURST_PARTICLE_SYSTEM_RED"
        }
    },
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_CONE",
        Angle = 90,
        Radius = 0.001
	},
	LinearVelocity = {
        DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0, 5, 0 },
		ValueB = { 0, 10, 0 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
            { T = 0, Color = {1, 1, 1, 1} }
        },
		AlphaList = {
            { T = 0, Alpha = 100 },
            { T = 0.9, Alpha = 100 },
            { T = 1, Alpha = 0 }
        },
	},
	SizeOverLifetime = {
        { T = 0, Value = 0.5 },
        { T = 0.5, Value = 1 },
        { T = 1, Value = 2 },
	},
	RotationOverLifetime = { 0, 0 }
})