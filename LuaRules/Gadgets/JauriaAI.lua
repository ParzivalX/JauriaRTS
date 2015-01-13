-- In-game, type /luarules ai in the console to toggle the ai debug messages
function gadget:GetInfo()
    return {
        name    = "JauriaAI",
        desc    = "An AI that knows how to play Mod X",
        author  = "TurBoss",
        date    = "2014-08-25",
        license = "GNU GPL ver 2 or later",
        version = "0.1",
        layer   = 82,
        enabled = true
    }
end


-- synced only
if (gadgetHandler:IsSyncedCode()) then

local faction = ""

--Jauria
local RC			= -4
local IT0			= -6
local NM1			= -12
local RK2			= -18
local NK3			= -22
local TKT4			= -33
local LZ5			= -36 
local DT6			= -41

--Heiks

--Chaos
local ADEPT			= -1
local RAIDER		= -8
local MARAUDER		= -11
local BESIEGER		= -14
local PUTRIS		= -23
local DESOLATOR		= -30
local JUGGERNAUT	= -35 
local ARCHAON		= -39

--Europe
local PROSPECTOR	= -3
local MILITIA		= -7
local BERSERKER		= -9
local OVERKRAFT		= -17
local VALKYRIA		= -25
local SCORPIO		= -32
local TAURUS		= -37 
local ATLAS			= -40

local AI_Debug_Mode = 0 -- Must be 0 or 1

local function ChangeAIDebugVerbosity(cmd,line,words,player)
	local lvl=tonumber(words[1])
	if lvl then
		AI_Debug_Mode=lvl
		Spring.Echo("AI debug verbosity set to "..AI_Debug_Mode)
	else
		if AI_Debug_Mode>0 then
			AI_Debug_Mode=0
		else
			AI_Debug_Mode=1
		end
		Spring.Echo("AI debug verbosity toggled to "..AI_Debug_Mode)
	end
	return true
end

local function AIDebugMessage(t,message)
	if(AI_Debug_Mode>0) then
		Spring.Echo("Team["..t.."] "..message)
	end
end

local function SetupCmdChangeAIDebugVerbosity()
	--Spring.Echo("Add cmd")
	local cmd,func,help
	cmd  = "ai"
	func = ChangeAIDebugVerbosity
	help = " [0|1]: make the LUA AI shut up or fill your infolog"
	gadgetHandler:AddChatAction(cmd,func,help)
	Script.AddActionFallback(cmd..' ',help)
end

function gadget:GameFrame(frame)
	if (frame % 30 ==0) then
		AIDebugMessage("all","test MSG EVERY 30 Frames ".. frame)
	end
end

function gadget:GameStart()

	SetupCmdChangeAIDebugVerbosity()
	
    -- Initialise AI for all teams that are set to use it
    for _,t in ipairs(Spring.GetTeamList()) do
        local _,_,_,isAI,side = Spring.GetTeamInfo(t)
        if Spring.GetTeamLuaAI(t) == gadget:GetInfo().name then
            Spring.Echo("Team "..t.." assigned to "..gadget:GetInfo().name)
            local pos = {}
            local home_x,home_y,home_z = Spring.GetTeamStartPosition(t)
            local factory,factionName = Spring.GetSideData(side)
            makefirstunits(factionName,t)
        end
    end
end

function gadget:Initialize()
end

function gadget:UnitCreated(u,ud,team,builder)
end

function gadget:UnitDamaged(u,ud,team, damage, para, weapon,attacker,aud,ateam)
end

function gadget:UnitFinished(u, ud, team, builder)
end

function gadget:UnitDestroyed(u,ud,team)
end

function gadget:RecvLuaMsg(msg, playerID)
end


function makefirstunits(faction, teamID)
	local units = Spring.GetTeamUnits(teamID)
	local fac =units[1]
	
	if faction == "Jauria" then
		Spring.GiveOrderToUnit(fac, RC,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, NM1,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, NM1,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, NM1,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, NM1,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, NM1,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
	elseif faction == "Chaos" then
		Spring.GiveOrderToUnit(fac, ADEPT,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, RAIDER,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, RAIDER,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, RAIDER,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, RAIDER,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, RAIDER,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
	elseif faction == "Europe" then
		Spring.GiveOrderToUnit(fac, PROSPECTOR,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, MILITIA,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, MILITIA,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, MILITIA,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, MILITIA,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
		Spring.GiveOrderToUnit(fac, MILITIA,{0,0,0,0},{}) -- uid, id {pos x, pos y, pos z, dir}
	end
end
else
end
