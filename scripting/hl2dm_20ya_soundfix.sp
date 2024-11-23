#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "HL2DM 20 year anniversary soundfix",
	author = "Alienmario",
	description = "Fixes sound playback by slightly modifying the pitch of sounds that have default pitch.",
	version = "1.0",
	url = "https://github.com/alienmario/"
};

public void OnPluginStart()
{
	AddNormalSoundHook(Hook_Sound);
	AddAmbientSoundHook(Hook_AmbientSound);
}

Action Hook_Sound(int clients[MAXPLAYERS], int &numClients, char sample[PLATFORM_MAX_PATH], int &entity, int &channel, float &volume,
						int &level, int &pitch, int &flags, char soundEntry[PLATFORM_MAX_PATH], int &seed)
{
	if (pitch == 100)
	{
		pitch = 99;
		return Plugin_Changed;
	}
	return Plugin_Continue;
}

Action Hook_AmbientSound(char sample[PLATFORM_MAX_PATH], int &entity, float &volume, int &level, int &pitch, float pos[3], int &flags, float &delay)
{
	if (pitch == 100)
	{
		pitch = 99;
		return Plugin_Changed;
	}
	return Plugin_Continue;
}