--[[---------------------------------------------------------------------------\
| ||\\    //||       /|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\ |
| || \\  // ||  (o_ / |                  SUPPLEMENTARY FILE                  | |
| ||  \\//  ||  //\/  |                         ----                         | |
| ||   \/   ||  V_/_  |              FIREWORKS PARTICLE SYSTEM               | |
| ||        ||        |‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗/ |
\---------------------------------------------------------------------------]]--

local lunarRevel = ...

--[[--------------------------- PREFABS & MATERIALS ---------------------------]]--

lunarRevel:registerAssetId("models/LunarRevel.fbx/Prefab/FireworksEmitterPart", "PREFAB_FIREWORKS_EMITTER_PART")

lunarRevel:registerAssetId("models/fireworksTrailYellow.png", "FIREWORKS_TRAIL_YELLOW_TEXTURE")
lunarRevel:registerAssetId("models/fireworksBurstYellow.png", "FIREWORKS_BURST_YELLOW_TEXTURE")
lunarRevel:registerAssetId("models/fireworksTrailBlue.png", "FIREWORKS_TRAIL_BLUE_TEXTURE")
lunarRevel:registerAssetId("models/fireworksBurstBlue.png", "FIREWORKS_BURST_BLUE_TEXTURE")
lunarRevel:registerAssetId("models/fireworksTrailPurple.png", "FIREWORKS_TRAIL_PURPLE_TEXTURE")
lunarRevel:registerAssetId("models/fireworksBurstPurple.png", "FIREWORKS_BURST_PURPLE_TEXTURE")
lunarRevel:registerAssetId("models/fireworksTrailRed.png", "FIREWORKS_TRAIL_RED_TEXTURE")
lunarRevel:registerAssetId("models/fireworksBurstRed.png", "FIREWORKS_BURST_RED_TEXTURE")

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_YELLOW",
    AlbedoTexture = "FIREWORKS_TRAIL_YELLOW_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_BURST_PARTICLE_YELLOW",
    AlbedoTexture = "FIREWORKS_BURST_YELLOW_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_BLUE",
    AlbedoTexture = "FIREWORKS_TRAIL_BLUE_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_BURST_PARTICLE_BLUE",
    AlbedoTexture = "FIREWORKS_BURST_BLUE_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_PURPLE",
    AlbedoTexture = "FIREWORKS_TRAIL_PURPLE_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_BURST_PARTICLE_PURPLE",
    AlbedoTexture = "FIREWORKS_BURST_PURPLE_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_RED",
    AlbedoTexture = "FIREWORKS_TRAIL_RED_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

lunarRevel:register({
    DataType = "MATERIAL",
    Id = "MATERIAL_FIREWORKS_BURST_PARTICLE_RED",
    AlbedoTexture = "FIREWORKS_BURST_RED_TEXTURE",
    HasTransparency = true,
    IsLighted = false,
	HasShadow = false
})

--[[------------------------ BUILDINGS & BUILDING PARTS -----------------------]]--

lunarRevel:register({
	DataType = "BUILDING",
	Id = "FIREWORKS_EMITTER",
	Name = "FIREWORKS_EMITTER_NAME",
	Description = "FIREWORKS_EMITTER_DESC",
	BuildingType = "DECORATION",
	AssetCoreBuildingPart = "FIREWORKS_EMITTER_PART"
})

lunarRevel:register({
	DataType = "BUILDING_PART",
	Id = "FIREWORKS_EMITTER_PART",
    Name = "FIREWORKS_EMITTER_PART_NAME",
	Description = "FIREWORKS_EMITTER_PART_DESC",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FIREWORKS_EMITTER_PART"
	},
	BuildingZone = {
		ZoneEntryList = {
            {
			Polygon = polygon.createCircle( 0.25 , { 0, 0 } , 36 ),
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

--[[----------------------------- PARTICLE SYSTEMS ----------------------------]]--

--Yellow
lunarRevel:registerPrefabComponent("models/LunarRevel.fbx/Prefab/FireworksEmitterPart/FireworksEmitterYellow", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_YELLOW",
	IsPlaying = true,
	IsEmitting = true
})

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_YELLOW",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_YELLOW",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	MinimumQuality = "LOW",
    Duration = 3,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 3,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 10,
    SubEmitterList = {
        {
            DataType = "PARTICLE_SUB_EMITTER_DATA",
            Type = "ON_DEATH",
            System = "FIREWORKS_BURST_PARTICLE_SYSTEM_YELLOW"
        }
    },
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_CONE",
        Angle = 90,
        Radius = 50
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 10, 0 }
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

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_BURST_PARTICLE_SYSTEM_YELLOW",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_BURST_PARTICLE_YELLOW",
	BillboardBehavior = "FACE_CAMERA",
	MinimumQuality = "LOW",
    Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 100,
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_SPHERE",
        Radius = 5
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 3, 3, 3 },
		ValueB = { -3, -3, -3 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {},
		AlphaList = {},
	},
	SizeOverLifetime = {
        { T = 0, Value = 0 },
        { T = 0.25, Value = 0.5 },
        { T = 0.5, Value = 1 },
        { T = 0.75, Value = 0.5 },
        { T = 1, Value = 0 }
	},
	RotationOverLifetime = { -90, 90 }
})

--Blue
lunarRevel:registerPrefabComponent("models/LunarRevel.fbx/Prefab/FireworksEmitterPart/FireworksEmitterBlue", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_BLUE",
	IsPlaying = true,
	IsEmitting = true
})

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_BLUE",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_BLUE",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	MinimumQuality = "LOW",
    Duration = 3,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 3,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 10,
    SubEmitterList = {
        {
            DataType = "PARTICLE_SUB_EMITTER_DATA",
            Type = "ON_DEATH",
            System = "FIREWORKS_BURST_PARTICLE_SYSTEM_BLUE"
        }
    },
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_CONE",
        Angle = 90,
        Radius = 50
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 10, 0 }
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

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_BURST_PARTICLE_SYSTEM_BLUE",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_BURST_PARTICLE_BLUE",
	BillboardBehavior = "FACE_CAMERA",
	MinimumQuality = "LOW",
    Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 100,
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_SPHERE",
        Radius = 5
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 3, 3, 3 },
		ValueB = { -3, -3, -3 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {},
		AlphaList = {},
	},
	SizeOverLifetime = {
        { T = 0, Value = 0 },
        { T = 0.25, Value = 0.5 },
        { T = 0.5, Value = 1 },
        { T = 0.75, Value = 0.5 },
        { T = 1, Value = 0 }
	},
	RotationOverLifetime = { -90, 90 }
})

--Purple
lunarRevel:registerPrefabComponent("models/LunarRevel.fbx/Prefab/FireworksEmitterPart/FireworksEmitterPurple", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_PURPLE",
	IsPlaying = true,
	IsEmitting = true
})

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_PURPLE",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_PURPLE",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	MinimumQuality = "LOW",
    Duration = 3,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 3,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 10,
    SubEmitterList = {
        {
            DataType = "PARTICLE_SUB_EMITTER_DATA",
            Type = "ON_DEATH",
            System = "FIREWORKS_BURST_PARTICLE_SYSTEM_PURPLE"
        }
    },
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_CONE",
        Angle = 90,
        Radius = 50
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 10, 0 }
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

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_BURST_PARTICLE_SYSTEM_PURPLE",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_BURST_PARTICLE_PURPLE",
	BillboardBehavior = "FACE_CAMERA",
	MinimumQuality = "LOW",
    Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 100,
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_SPHERE",
        Radius = 5
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 3, 3, 3 },
		ValueB = { -3, -3, -3 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {},
		AlphaList = {},
	},
	SizeOverLifetime = {
        { T = 0, Value = 0 },
        { T = 0.25, Value = 0.5 },
        { T = 0.5, Value = 1 },
        { T = 0.75, Value = 0.5 },
        { T = 1, Value = 0 }
	},
	RotationOverLifetime = { -90, 90 }
})

--Red
lunarRevel:registerPrefabComponent("models/LunarRevel.fbx/Prefab/FireworksEmitterPart/FireworksEmitterRed", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_RED",
	IsPlaying = true,
	IsEmitting = true
})

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_TRAIL_PARTICLE_SYSTEM_RED",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_TRAIL_PARTICLE_RED",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	MinimumQuality = "LOW",
    Duration = 3,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 3,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 10,
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
        Radius = 50
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 10, 0 }
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

lunarRevel:register({
	DataType = "PARTICLE_SYSTEM",
	Id = "FIREWORKS_BURST_PARTICLE_SYSTEM_RED",
	Visual= {
		DataType = "PARTICLE_DEFAULT_VISUAL"
	},
	Material = "MATERIAL_FIREWORKS_BURST_PARTICLE_RED",
	BillboardBehavior = "FACE_CAMERA",
	MinimumQuality = "LOW",
    Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1,
	StartSpeed = { 0, 0 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 100,
	Shape = {
        DataType = "PARTICLE_EMITTER_SHAPE_SPHERE",
        Radius = 5
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 3, 3, 3 },
		ValueB = { -3, -3, -3 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {},
		AlphaList = {},
	},
	SizeOverLifetime = {
        { T = 0, Value = 0 },
        { T = 0.25, Value = 0.5 },
        { T = 0.5, Value = 1 },
        { T = 0.75, Value = 0.5 },
        { T = 1, Value = 0 }
	},
	RotationOverLifetime = { -90, 90 }
})