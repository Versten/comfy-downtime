/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

if (!hasInterface) exitWith {};
_isJip = _this select 1;

// Add JIP players to zeus
if (_isJip) then {
	[player, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
};

// Weapons cold and unit lock on mission start. Edit in config.sqf
/*
if (!isNil "FP_lockStarters" && {count FP_lockStarters > 0}) then {
	[] call FP_fnc_coldStart;
};
*/

// Delete grenades thrown in spawn
/*
player addEventHandler ["Fired", {
	if (_this select 2 == "HandGrenadeMuzzle") then {
		if ((_this select 0) distance (markerPos (["respawn_west","respawn_east","respawn_guerrila","respawn_civilian"] select ([WEST,EAST,independent,civilian] find side player))) < 80) then
		{
			[_this select 6] call ace_frag_fnc_addBlackList;
			deleteVehicle (_this select 6);
			titleText ["G IS FOR GRENADES", "PLAIN", 2];
		};
	};
}];
*/