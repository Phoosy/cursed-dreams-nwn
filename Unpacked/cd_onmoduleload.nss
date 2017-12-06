/*
Filename:           cd_onmoduleload
System:
Author:             Phoosy
Date Created:       Sep. 3, 2017
Summary:
Main wrapper for the Cursed Dreams module, to be inserted into OnModuleLoad
event in Module Properties. Still building this one out.
*/

//#include "nwnx_chat"
//#include "nwnx_odbc"
//#include "nwnx_dmactions"
//#include "nwnx_events"
//#include "x2_inc_switches"

void main()
{
/*  Commented out, not using yet so not configuring system to utilize until ready.

    SetLocalString(GetModule(),"NWNX!INIT","1");
    GetLocalObject(GetModule(), "NWNX!INIT");

    SetDMActionScript(DM_ACTION_GIVE_XP, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_LEVEL, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_GOLD, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_OBJECT, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_AREA, "_handler_dmact");

    SetGlobalEventHandler(EVENT_TYPE_PICKPOCKET, "_handler_event");

    // init nwnx_chat
    dmb_ChatInit();
    SQLInit();
    */

    /* Define DM actions for logging, disabled due to no NWNX
    SetDMActionScript(DM_ACTION_GIVE_XP, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_LEVEL, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_GOLD, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_OBJECT, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_AREA, "_handler_dmact");
    */
    // Set custom tokens for colored text (areas, conversations)
    SetCustomToken(100, "</c>"); // CLOSE tag
    SetCustomToken(102, "<c � >"); // green
    SetCustomToken(103, "<c  �>"); // blue
    SetCustomToken(105, "<c� �>"); // magenta
    SetCustomToken(106, "<c�� >"); // yellow
    SetCustomToken(107, "<c   >"); // black
    SetCustomToken(108, "<c�  >"); // dark red
    SetCustomToken(109, "<c � >"); // dark green
    SetCustomToken(110, "<c  �>"); // dark blue
    SetCustomToken(111, "<c ��>"); // dark cyan
    SetCustomToken(112, "<c� �>"); // dark magenta
    SetCustomToken(113, "<c�� >"); // dark yellow
    SetCustomToken(114, "<c���>"); // grey
    SetCustomToken(117, "<c���>"); // dark grey
    SetCustomToken(115, "<c�� >"); // orange
    SetCustomToken(116, "<c�� >"); // dark orange
    SetCustomToken(117, "<cڥ#>"); // brown
    SetCustomToken(118, "<c >"); // dark brown
    SetCustomToken(119, "<c�  >"); // red
    SetCustomToken(120, "<c ��>"); // cyan
    SetCustomToken(121, "<c � >"); // lime green
    SetCustomToken(122, "<c�� >"); // gold
    SetCustomToken(123, "<c��P>"); // Peach
    SetCustomToken(124, "<c��+>"); // Gold-Yellow

}
