/*
Filename:           cd_onacquire
System:
Author:             Phoosy, Tweek, Aez
Date Created:       Oct. 6, 2017
Summary:
Main wrapper for the Cursed Dreams module, to be inserted into OnAcquire
event in Module Properties. Still building this one out.
*/

void main()
{
    object oItem = GetModuleItemAcquired();
    object oAcquirer = GetModuleItemAcquiredBy();
    string sRef = GetResRef(oItem);
    string sTag = GetTag(oItem);

    // None of the rest of this stuff is applicable to NPCs
    if(!GetIsPC(oAcquirer))
        return;

    object oArea = GetArea(oAcquirer);
    string sAreaName = GetName(oArea);
    string sAreaTag = GetTag(oArea);

   // Format : ITEM_ACQUIRE:[pc name] | [account name] | [item resref] | [item name] | [area name]
   // Example: ITEM_ACQUIRE:Seth | Tweek | item001 | Test Item  | Sundered Desolation
   string sLog = "ITEM_ACQUIRE:" + GetName(oAcquirer) + " | " +
                   GetPCPlayerName(oAcquirer) + " | " +
                   sRef + " | " +
                   GetName(oItem) + " | " +
                   sAreaName;
   WriteTimestampedLogEntry(sLog);
}
