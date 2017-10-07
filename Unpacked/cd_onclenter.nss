/*
Filename:           cd_onclenter
System:
Author:             Phoosy
Date Created:       Oct. 6, 2017
Summary:
Main wrapper for the Cursed Dreams module, to be inserted into OnClientEnter
event in Module Properties. Still building this one out.
*/

#include "nwnx_chat"

void main()
{
  object oPC = GetEnteringObject();
  dmb_PCin(oPC);
}
