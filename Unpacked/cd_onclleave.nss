/*
Filename:           cd_onclleave
System:
Author:             Phoosy
Date Created:       Oct. 6, 2017
Summary:
Main wrapper for the Cursed Dreams module, to be inserted into OnClientLeave
event in Module Properties. Still building this one out.
*/

#include "nwnx_chat"

void main()
{
    object oPC = GetExitingObject();
    dmb_PCout(oPC);
}
