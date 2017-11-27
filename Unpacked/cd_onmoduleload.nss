/*
Filename:           cd_onmoduleload
System:
Author:             Phoosy
Date Created:       Sep. 3, 2017
Summary:
Main wrapper for the Cursed Dreams module, to be inserted into OnModuleLoad
event in Module Properties. Still building this one out.
*/

#include "nwnx_chat"
#include "nwnx_odbc"
//#include "nwnx_dmactions"
//#include "nwnx_events"
//#include "x2_inc_switches"

void main()
{
    // init NWNX2
    SetLocalString(GetModule(),"NWNX!INIT","1");
    GetLocalObject(GetModule(), "NWNX!INIT");
/*  Commented out, not using yet so not configuring system to utilize until ready.
    // Sets up DM Action logging
    SetDMActionScript(DM_ACTION_GIVE_XP, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_LEVEL, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_GOLD, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_OBJECT, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_AREA, "_handler_dmact");
    // Sets up pickpocket logging
    SetGlobalEventHandler(EVENT_TYPE_PICKPOCKET, "_handler_event");
*/
    // init nwnx_chat
    dmb_ChatInit();
    SQLInit();
}
