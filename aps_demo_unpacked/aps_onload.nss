// Name     : Avlis Persistence System OnModuleLoad
// Purpose  : Initialize APS on module load event
// Authors  : Ingmar Stieger
// Modified : January 27, 2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    // init NWNX2
    SetLocalString(GetModule(),"NWNX!INIT","1");
    GetLocalObject(GetModule(), "NWNX!INIT");
    // Init placeholders for ODBC gateway
    SQLInit();
}

