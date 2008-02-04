local MIN = 600
local MAX = 800
local EMPTY_POTION = 7635

function onUse(cid, item, frompos, item2, topos)
	if(isPlayer(item2.uid) == FALSE) then
		return FALSE
	end

	if (not(isKnight(item2.uid)) or (getPlayerLevel(item2.uid) < 50)) and not(getPlayerAccess(cid) == 0) then
		doCreatureSay(item2.uid, "Only knights of level 80 or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return TRUE
	end

	if(doTargetCombatHealth(cid, item2.uid, COMBAT_HEALING, MIN, MAX, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
		return FALSE
	end

	doCreatureSay(item2.uid, "Aaaah...", TALKTYPE_ORANGE_1) 
	doTransformItem(item.uid, EMPTY_POTION)
	return TRUE
end