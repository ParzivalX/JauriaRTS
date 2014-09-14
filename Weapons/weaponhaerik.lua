
local weaponName = "weaponhaerik"

local weaponDef = {
	
	name                    = "metralletaNM-1",
	weaponType              = "Cannon",
	
	Accuracy=50,
	movingAccuracy=80,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 160,
		heavyarmor = 650,
		lightarmor = 580,
		torrearmor = 0,
	},
	areaOfEffect            = 0,
	
	--physics
	
	weaponVelocity          = 500,
	reloadtime              = 1,
	range                   = 340,
--	sprayAngle              = 45,
	weaponaceleration       = 250,
	tolerance               = 10000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
--	burst                   = 2,
--	burstrate               = 0.08,
	--proyectiles             = 2,
	
	--apperance
	
	rgbColor                = [[0 1 0.1]],
	size                    = 8,
	stages                  = 4,
	intensity               = 1.5,
	separation              = 0.5,
	explosionScar			= true,
	
	--explosionGenerator		= "custom:humo",
	--explosiongenerator			= [[custom:genericshellexplosion-small]],
	--sounds
	
	soundStart              = "disparo_gfx",
	
	collideFriendly=true,
}
return lowerkeys({[weaponName] = weaponDef})
