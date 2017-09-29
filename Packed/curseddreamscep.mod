MOD V1.0         �   �     u     ����                                                                                                                            aps_include         �  aps_onload         �  aps_onload         �  area001            �  area001            �  area001            �  cd_onmoduleload    �  cd_onmoduleload    �  creaturepalcus     �  doorpalcus      	   �  encounterpalcus 
   �  itempalcus         �  module             �  nwnx_chat          �  nwnx_dmactions     �  nwnx_events        �  nwnx_odbc          �  placeablepalcus    �  Repute             �  soundpalcus        �  storepalcus        �  triggerpalcus      �  waypointpalcus     �  _handler_chat      �  _handler_chat      �  _handler_dmact     �  _handler_dmact     �                                                                                                                                                                                                                          �  �V  �[  /  �\  t  9^  i  �o  �  bq  �	  I{  T  �|  �  ��  �  >�    J�  �  �  P  B�  6  x�  �  U�  �  ��  �  � �V  }b �  a� a   �  �� �  �� l  � �  ֒   � �  �� e  � �  // Name     : Avlis Persistence System include
// Purpose  : Various APS/NWNX2 related functions
// Authors  : Ingmar Stieger, Adam Colon, Josh Simon
// Modified : January 1st, 2005

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

/************************************/
/* Return codes                     */
/************************************/

const int SQL_ERROR = 0;
const int SQL_SUCCESS = 1;

/************************************/
/* Function prototypes              */
/************************************/

// Setup placeholders for ODBC requests and responses
void SQLInit();

// Execute statement in sSQL
void SQLExecDirect(string sSQL);

// Position cursor on next row of the resultset
// Call this before using SQLGetData().
// returns: SQL_SUCCESS if there is a row
//          SQL_ERROR if there are no more rows
int SQLFetch();

// * deprecated. Use SQLFetch instead.
// Position cursor on first row of the resultset and name it sResultSetName
// Call this before using SQLNextRow() and SQLGetData().
// returns: SQL_SUCCESS if result set is not empty
//          SQL_ERROR is result set is empty
int SQLFirstRow();

// * deprecated. Use SQLFetch instead.
// Position cursor on next row of the result set sResultSetName
// returns: SQL_SUCCESS if cursor could be advanced to next row
//          SQL_ERROR if there was no next row
int SQLNextRow();

// Return value of column iCol in the current row of result set sResultSetName
string SQLGetData(int iCol);

// Return a string value when given a location
string APSLocationToString(location lLocation);

// Return a location value when given the string form of the location
location APSStringToLocation(string sLocation);

// Return a string value when given a vector
string APSVectorToString(vector vVector);

// Return a vector value when given the string form of the vector
vector APSStringToVector(string sVector);

// Set oObject's persistent string variable sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration =
                         0, string sTable = "pwdata");

// Set oObject's persistent integer variable sVarName to iValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration =
                      0, string sTable = "pwdata");

// Set oObject's persistent float variable sVarName to fValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration =
                        0, string sTable = "pwdata");

// Set oObject's persistent location variable sVarName to lLocation
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
//   This function converts location to a string for storage in the database.
void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration =
                           0, string sTable = "pwdata");

// Set oObject's persistent vector variable sVarName to vVector
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
//   This function converts vector to a string for storage in the database.
void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration =
                         0, string sTable = "pwdata");

// Set oObject's persistent object with sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwobjdata)
void SetPersistentObject(object oObject, string sVarName, object oObject2, int iExpiration =
                         0, string sTable = "pwobjdata");

// Get oObject's persistent string variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: ""
string GetPersistentString(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent integer variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
int GetPersistentInt(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent float variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
float GetPersistentFloat(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent location variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
location GetPersistentLocation(object oObject, string sVarname, string sTable = "pwdata");

// Get oObject's persistent vector variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
vector GetPersistentVector(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent object sVarName
// Optional parameters:
//   sTable: Name of the table where object is stored (default: pwobjdata)
// * Return value on error: 0
object GetPersistentObject(object oObject, string sVarName, object oOwner = OBJECT_INVALID, string sTable = "pwobjdata");

// Delete persistent variable sVarName stored on oObject
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
void DeletePersistentVariable(object oObject, string sVarName, string sTable = "pwdata");

// (private function) Replace special character ' with ~
string SQLEncodeSpecialChars(string sString);

// (private function)Replace special character ' with ~
string SQLDecodeSpecialChars(string sString);

/************************************/
/* Implementation                   */
/************************************/

// Functions for initializing APS and working with result sets

void SQLInit()
{
    int i;

    // Placeholder for ODBC persistence
    string sMemory;

    for (i = 0; i < 8; i++)     // reserve 8*128 bytes
        sMemory +=
            "................................................................................................................................";

    SetLocalString(GetModule(), "NWNX!ODBC!SPACER", sMemory);
}

void SQLExecDirect(string sSQL)
{
    SetLocalString(GetModule(), "NWNX!ODBC!EXEC", sSQL);
}

int SQLFetch()
{
    string sRow;
    object oModule = GetModule();

    SetLocalString(oModule, "NWNX!ODBC!FETCH", GetLocalString(oModule, "NWNX!ODBC!SPACER"));
    sRow = GetLocalString(oModule, "NWNX!ODBC!FETCH");
    if (GetStringLength(sRow) > 0)
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", sRow);
        return SQL_SUCCESS;
    }
    else
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", "");
        return SQL_ERROR;
    }
}

// deprecated. use SQLFetch().
int SQLFirstRow()
{
    return SQLFetch();
}

// deprecated. use SQLFetch().
int SQLNextRow()
{
    return SQLFetch();
}

string SQLGetData(int iCol)
{
    int iPos;
    string sResultSet = GetLocalString(GetModule(), "NWNX_ODBC_CurrentRow");

    // find column in current row
    int iCount = 0;
    string sColValue = "";

    iPos = FindSubString(sResultSet, "�");
    if ((iPos == -1) && (iCol == 1))
    {
        // only one column, return value immediately
        sColValue = sResultSet;
    }
    else if (iPos == -1)
    {
        // only one column but requested column > 1
        sColValue = "";
    }
    else
    {
        // loop through columns until found
        while (iCount != iCol)
        {
            iCount++;
            if (iCount == iCol)
                sColValue = GetStringLeft(sResultSet, iPos);
            else
            {
                sResultSet = GetStringRight(sResultSet, GetStringLength(sResultSet) - iPos - 1);
                iPos = FindSubString(sResultSet, "�");
            }

            // special case: last column in row
            if (iPos == -1)
                iPos = GetStringLength(sResultSet);
        }
    }

    return sColValue;
}

// These functions deal with various data types. Ultimately, all information
// must be stored in the database as strings, and converted back to the proper
// form when retrieved.

string APSVectorToString(vector vVector)
{
    return "#POSITION_X#" + FloatToString(vVector.x) + "#POSITION_Y#" + FloatToString(vVector.y) +
        "#POSITION_Z#" + FloatToString(vVector.z) + "#END#";
}

vector APSStringToVector(string sVector)
{
    float fX, fY, fZ;
    int iPos, iCount;
    int iLen = GetStringLength(sVector);

    if (iLen > 0)
    {
        iPos = FindSubString(sVector, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sVector, iPos, iCount));
    }

    return Vector(fX, fY, fZ);
}

string APSLocationToString(location lLocation)
{
    object oArea = GetAreaFromLocation(lLocation);
    vector vPosition = GetPositionFromLocation(lLocation);
    float fOrientation = GetFacingFromLocation(lLocation);
    string sReturnValue;

    if (GetIsObjectValid(oArea))
        sReturnValue =
            "#AREA#" + GetTag(oArea) + "#POSITION_X#" + FloatToString(vPosition.x) +
            "#POSITION_Y#" + FloatToString(vPosition.y) + "#POSITION_Z#" +
            FloatToString(vPosition.z) + "#ORIENTATION#" + FloatToString(fOrientation) + "#END#";

    return sReturnValue;
}

location APSStringToLocation(string sLocation)
{
    location lReturnValue;
    object oArea;
    vector vPosition;
    float fOrientation, fX, fY, fZ;

    int iPos, iCount;
    int iLen = GetStringLength(sLocation);

    if (iLen > 0)
    {
        iPos = FindSubString(sLocation, "#AREA#") + 6;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        oArea = GetObjectByTag(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sLocation, iPos, iCount));

        vPosition = Vector(fX, fY, fZ);

        iPos = FindSubString(sLocation, "#ORIENTATION#") + 13;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fOrientation = StringToFloat(GetSubString(sLocation, iPos, iCount));

        lReturnValue = Location(oArea, vPosition, fOrientation);
    }

    return lReturnValue;
}

// These functions are responsible for transporting the various data types back
// and forth to the database.

void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration =
                         0, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    sValue = SQLEncodeSpecialChars(sValue);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val='" + sValue +
            "',expire=" + IntToString(iExpiration) + " WHERE player='" + sPlayer +
            "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
        SQLExecDirect(sSQL);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sVarName + "','" +
            sValue + "'," + IntToString(iExpiration) + ")";
        SQLExecDirect(sSQL);
    }
}

string GetPersistentString(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
        return SQLDecodeSpecialChars(SQLGetData(1));
    else
    {
        return "";
        // If you want to convert your existing persistent data to APS, this
        // would be the place to do it. The requested variable was not found
        // in the database, you should
        // 1) query it's value using your existing persistence functions
        // 2) save the value to the database using SetPersistentString()
        // 3) return the string value here.
    }
}

void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration =
                      0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, IntToString(iValue), iExpiration, sTable);
}

int GetPersistentInt(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", "-2147483647");
    return StringToInt(GetLocalString(oModule, "NWNX!ODBC!FETCH"));
}

void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration =
                        0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, FloatToString(fValue), iExpiration, sTable);
}

float GetPersistentFloat(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", "-340282306073709650000000000000000000000.000000000");
    return StringToFloat(GetLocalString(oModule, "NWNX!ODBC!FETCH"));
}

void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration =
                           0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, APSLocationToString(lLocation), iExpiration, sTable);
}

location GetPersistentLocation(object oObject, string sVarName, string sTable = "pwdata")
{
    return APSStringToLocation(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration =
                         0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, APSVectorToString(vVector), iExpiration, sTable);
}

vector GetPersistentVector(object oObject, string sVarName, string sTable = "pwdata")
{
    return APSStringToVector(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentObject(object oOwner, string sVarName, object oObject, int iExpiration =
                         0, string sTable = "pwobjdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oOwner))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oOwner));
        sTag = SQLEncodeSpecialChars(GetName(oOwner));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oOwner);
    }
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val=%s,expire=" + IntToString(iExpiration) +
            " WHERE player='" + sPlayer + "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
        SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
        StoreCampaignObject ("NWNX", "-", oObject);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sVarName + "',%s," + IntToString(iExpiration) + ")";
        SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
        StoreCampaignObject ("NWNX", "-", oObject);
    }
}

object GetPersistentObject(object oObject, string sVarName, object oOwner = OBJECT_INVALID, string sTable = "pwobjdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);

    if (!GetIsObjectValid(oOwner))
        oOwner = oObject;
    return RetrieveCampaignObject ("NWNX", "-", GetLocation(oOwner), oOwner);
}

void DeletePersistentVariable(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    string sSQL = "DELETE FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);
}

// Problems can arise with SQL commands if variables or values have single quotes
// in their names. These functions are a replace these quote with the tilde character

string SQLEncodeSpecialChars(string sString)
{
    if (FindSubString(sString, "'") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "'")
            sReturn += "~";
        else
            sReturn += sChar;
    }
    return sReturn;
}

string SQLDecodeSpecialChars(string sString)
{
    if (FindSubString(sString, "~") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "~")
            sReturn += "'";
        else
            sReturn += sChar;
    }
    return sReturn;
}


NCS V1.0B  /                ����  ��������         �����  �................................................................................................................................#����  �������� $���� ���� ���:����  NWNX!ODBC!SPACER  �   9 ����  // Name     : Avlis Persistence System OnModuleLoad
// Purpose  : Initialize APS on module load event
// Authors  : Ingmar Stieger
// Modified : January 27, 2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    // Init placeholders for ODBC gateway
    SQLInit();
}

ARE V3.28        �   |
  4   �  =   �  (  !  H   ����    *      �   
      �   
      �   
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
          ����      ����         
                         '   
      /                         	          
                       dd�                  22d                 22d       ���                  h~�                                        2           4B                                                                                      !          "         #         $   3      %   4      &   5      '   6      (   7      )         *   �     +         ,           -           .           /           0           1          2          3         *        +         ,           -           .           /           0           1          2          3         *   �     +         ,          -           .           /           0           1          2          3         *        +         ,          -           .           /           0           1          2          3         *   U     +         ,           -           .           /           0           1          2          3         *        +         ,           -           .           /           0           1          2          3         *        +         ,           -           .           /           0           1          2          3         *        +         ,           -           .           /           0           1          2          3         *   V     +         ,           -           .           /           0           1          2          3         *   U     +         ,           -           .           /           0           1          2          3         *   ?     +         ,           -           .           /           0           1          2          3         *   x     +         ,           -           .           /           0           1          2          3         *   V     +         ,           -           .           /           0           1          2          3         *   A      +         ,           -           .           /           0           1          2          3         *   A     +         ,           -           .           /           0           1          2          3         *   t     +         ,           -           .           /           0           1          2          3      ID              Creator_ID      Version         Tag             Name            ResRef          Comments        Expansion_List  Flags           ModSpotCheck    ModListenCheck  MoonAmbientColorMoonDiffuseColorMoonFogAmount   MoonFogColor    MoonShadows     SunAmbientColor SunDiffuseColor SunFogAmount    SunFogColor     SunShadows      IsNight         LightingScheme  ShadowOpacity   FogClipDist     SkyBox          DayNightCycle   ChanceRain      ChanceSnow      ChanceLightning WindPower       LoadScreenID    PlayerVsPlayer  NoRest          Width           Height          OnEnter         OnExit          OnHeartbeat     OnUserDefined   Tileset         Tile_List       Tile_ID         Tile_OrientationTile_Height     Tile_MainLight1 Tile_MainLight2 Tile_SrcLight1  Tile_SrcLight2  Tile_AnimLoop1  Tile_AnimLoop2  Tile_AnimLoop3     Area001   ����          Area 001area001        ttf01                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                  	   
                     GIC V3.28      P   
   �   
   h     t  $   �  (   ����    	                                
                                                                    	   $   Creature List   Door List       Comment         Encounter List  List            SoundList       StoreList       TriggerList     WaypointList    Placeable List     CaveExit                         	                                         GIT V3.28      \   H   �  H   <  W   �  ,  �	  (   ����  
   d       	      0   5                   3         5                                      #                        	   �_    
                
                                  $                               3                                                                                                                                                         !       
   "   4       #         $   9      %   P      &   P       '          (          )           *          +   8      ,   9      -   :      .   H      /   I      0   J      1   K      2   L      3   M      4   N      5   O      6   P      7   Q   
   8   R       9          :          ;          <   V      =   �Q�@   >   ��@   ?   �G�   @   �I�   A         B         C         D         E         F          G   $   AreaProperties  AmbientSndDay   AmbientSndNight AmbientSndDayVolAmbientSndNitVolEnvAudio        MusicBattle     MusicDay        MusicNight      MusicDelay      Creature List   Door List       Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         LinkedTo        LinkedToFlags   LoadScreenID    GenericType_New OnFailToOpen    X               Y               Z               Bearing         Encounter List  List            SoundList       StoreList       TriggerList     WaypointList    Placeable List     CaveExit   �         ����    nw_door_ttr_12       x2_door_death                                       	       
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @       
      A   B   C   D   E   F   G                                         NCS V1.0B  T       dmbPC_ dmbID*     +  ����            ����  ��������         �����  �................................................................................................................................#����  �������� $���� ���� ���:����  NWNX!ODBC!SPACER  �   9 ����  /*
Filename:           cd_onmoduleload
System:
Author:             Phoosy
Date Created:       Sep. 3, 2017
Summary:
Main wrapper for the Cursed Dreams module, to be inserted into OnModuleLoad
event in Module Properties. Still building this one out.
*/

#include "nwnx_chat"
#include "nwnx_dmactions"
#include "nwnx_events"
#include "nwnx_odbc"
#include "x2_inc_switches"

void main()
{
/*  This shit don't work right apparently?
    SetLocalString(GetModule(),"NWNX!INIT","1");
    GetLocalObject(GetModule(), "NWNX!INIT");

    SetDMActionScript(DM_ACTION_GIVE_XP, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_LEVEL, "_handler_dmact");
    SetDMActionScript(DM_ACTION_GIVE_GOLD, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_OBJECT, "_handler_dmact");
    SetDMActionScript(DM_ACTION_CREATE_ITEM_ON_AREA, "_handler_dmact");

    SetGlobalEventHandler(EVENT_TYPE_PICKPOCKET, "_handler_event");
*/
    // init nwnx_chat
//  dmb_ChatInit();
    SQLInit();
}
ITP V3.28   �   �  M  T     �      �  0  �  �  ����                                                    $          ,          4          <          H          P          X          d          l          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         4         <         D         L         T         \         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                              (         0         8         @         H         T         \         d         l         t         |         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (                      J�               j�       �         0                   �         !         �         "         �         #         �         $         �         L�       4         H         h�       �         i�       �         &         9         h                   F         !         G         "         H         #         I         $         J         %         8         �                   A         !         B         "         C         #         D         $         E         e�       P         �                   �         !         �         "         �         #         �         $         �         K         :         �                   K         !         L         "         M         #         N         $         O                  ;         �                   <         !         =         "         >         #         ?         $         @         M�       5         �         h�       �         i�       �         &         �                            �         !         �         "         �         #         �         $         �         %         �                           �         !         �         "         �         #         �         $         �         e�       Q         0                  �         !         �         "         �         #         �         $         �         K         �         H                  �         !         �         "         �         #         �         $         �                  �         `                  �         !         �         "         �         #         �         $         �         Z�       6         x        i�       �         `�       �         c�       �         d�       �         a�       �         �          �         b�       �         7�       3         %        �        �         0         &        �        '                  (                  �z        d         )                  *                  �z        u         �          	         �z        e         �z        f         �z        g         �z        k         8                  9                  :                                  G         "         H         #         I         $         J         %         1                2                  3                  4                  5                  6                                    �          2         ,        <        �z        h         -         
         �z        i         �z        j         .                  �         1         8                  �z        t         ;        T        <                  �z        l         =                  >                  +         /         ?                  �z        m         /                  #        p        
                  B                  �                   D                  C                  k                   E         !         K        �        �z        n         �z        r         �z        p                   &                   '                   (                   *                   )         !          +         #          ,         �          -         �z        q         �z        o                 �                            !                  "                  #                  $                  L         .   MAIN            STRREF          LIST            ID                                      	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L        R   S   �   �   �            )   J                        	   
               #                                                                      !   "      $   %   &   '   (      *   +   ,   2   8   >   D      -   .   /   0   1      3   4   5   6   7      9   :   ;   <   =      ?   @   A   B   C      E   F   G   H   I      K   L   M   N   O   P   Q      T   U   `   a   b   c   d   i   q   w   x   y   z   �   �   �   
   V   W   X   Y   Z   [   \   ]   ^   _      e   f   g   h      j   k   l   m   n   o   p      r   s   t   u   v      {   |   }   ~      �      �   �   �   �   �   �   �      �   �   �   �   �   �   �   �   �   �   �   �   �      �   �   �   �   �   ITP V3.28      �      $     d      d  h   �  @   ����                                                               (          0          8          @          H          P          X          `                                                            !                  "                  #                  $                  N                  O        (         ��        
         P                  �          	         Q                  R            MAIN            STRREF          LIST            ID                                      	   
                                                                                    	   
            ITP V3.28      �      �             X   t  4   ����                                                               (          0          8          @          H          P                       �                  �         	         �                  �                                                       !                  "                  #                  $                  �            MAIN            STRREF          ID              LIST                                    	   
                                                                        	   
   ITP V3.28   �   �  F  �     H     `    t  �  ����                                                     (          0          8          @          L          T          \          d          l          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         ,         4         <         D         L         T         \         d         l         t         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                             $         ,         4         <         D         L         T         \         d         l         t         |         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                             $         ,         4         <         D         L         T         \         d         l         t         |         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                        J�       {         (         j�       �         @                   �         !         �         "         �         #         �         $         �         L�       |         X         h�       �         i�       �         O         �         �          �         y         �         8         �         7�       �         �         f�       �         :�       �         =�       �         +         �         A�       �         b         �                  �         �                   �         !         �         "         �         #         �         $         �         �         �         M�       }         �         i�       �         U�       �         S�       �         8         �         7�       �         �         f�       �         :�       �         =�       �         +         �         A�       �         b         �         ]�       �         ^�       �         _�       �                  �         �                   �         !         �         "         �         #         �         $         �         N�                        h�       �         g�       �         P�       �         O�       �         8         �         R�       �         Q�       �         [�       ~         0        `�       �         c�       �         d�       �         a�       �         �          �         b�       �         O        L        �                   �                  S         	         �                                    �         :         T        l        �                  U         
         V                  W        |        �         7         X                  �         ?         �         ;         �                  �         8         �  
                         8        �        �         <         �         �        Y                  �                  Z                  [                  \u        d         �                  :�       �         �F        @         {u        e         �         9         ?�       �         |u        f         ]                ^                  _                  =�       �         \                  @�       �         }u        g         +                  >�       �         <�       �         a                  b                  7�       A         �         6                                             !                  "                  #                  $                  L         5         �        ,        d        `        e                  f                  g                  �        p        j                   h                  i                  k        �        l         !         m         "         ~u        h         n         #         o         $         +         %         p         &         �        �        q         '         r         (         s         )         t         *         �         =         w         .         x         /         y        �        z         0         {         1         |         2         zu        j         �         3         �        �        v         +         �         ,         �         -         �         >         �         4         u        i   MAIN            STRREF          ID              LIST            NAME            RESREF             Slam1d4it_crewpb003                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  	      A   L   T   o   p   q   w   x               2   :                     	   	   
                                                               	             !   "   )   *   +   ,      #   $   %   &   '   (      -   .   /   0   1      3   4   5   6   7   8   9      ;   <   =   >   ?   @      B   C   D   E   F   G   H      I   J   K      M   N   O   P   Q   R      S      U   V   ]   ^   _   `   a   b   c   f   g   h   i   j   k   l   m   n      W   X   Y   Z   [   \      d   e      r   s   t   u   v      y   }   �   �   �   �   �   �   �   �   �   �      z   {   |      ~      �      �   �   �   �   �   �   �      �   �   �   �   �      �   �   �      �   �   �   �   IFO V3.28      4  E   p  3   �  j  

  �   �
  h   ����    1      /         1         2         3         4         5         6         7         8         9         :         ;         <         =         >         ?         @         A         B         C                 
                                             
      ?         O              
   	   c      
   m           �A         A        @@      �{Ͼ      �	j?                                                                            \         
         u         v         �         �         �         �         �          �      !   �      "   �      #   �      $   �      %   �      &   �      '   �      (        )         *   !     +   "     ,         -         .         /   #     0      
   1   +  
   1   =  
   1   O  
   1   c  
   1   w  
   1   �  
   1   �  
   1   �  
   1   �  
   1   �  
   1   �  
   1   �  
   1     
   1     
   1   $  
   1   2  
   1   @  
   1   N  
   1   \     2   d   Mod_ID          Mod_MinGameVer  Mod_Creator_ID  Mod_Version     Expansion_Pack  Mod_Name        Mod_Tag         Mod_Description Mod_IsSaveGame  Mod_CustomTlk   Mod_Entry_Area  Mod_Entry_X     Mod_Entry_Y     Mod_Entry_Z     Mod_Entry_Dir_X Mod_Entry_Dir_Y Mod_Expan_List  Mod_DawnHour    Mod_DuskHour    Mod_MinPerHour  Mod_StartMonth  Mod_StartDay    Mod_StartHour   Mod_StartYear   Mod_XPScale     Mod_OnHeartbeat Mod_OnModLoad   Mod_OnModStart  Mod_OnClientEntrMod_OnClientLeavMod_OnActvtItem Mod_OnAcquirItemMod_OnUsrDefinedMod_OnUnAqreItemMod_OnPlrDeath  Mod_OnPlrDying  Mod_OnPlrEqItm  Mod_OnPlrLvlUp  Mod_OnSpawnBtnDnMod_OnPlrRest   Mod_OnPlrUnEqItmMod_OnCutsnAbortMod_OnPlrChat   Mod_StartMovie  Mod_CutSceneListMod_GVar_List   Mod_Area_list   Area_Name       Mod_HakList     Mod_Hak         Mod_CacheNSSList   ֝!e���rH���fNn   1.69   ����          curseddreamscep   curseddreams   ����              cep260area001 cd_onmoduleload x3_mod_def_enter x2_mod_def_actx2_mod_def_aqu x2_mod_def_unaqunw_o0_deathnw_o0_dyingx2_mod_def_equ nw_o0_respawnx2_mod_def_restx2_mod_def_unequ   area001   cep2_add_doors   cep2_add_loads   cep2_add_phenos1   cep2_add_phenos2   cep2_add_phenos3   cep2_add_phenos4   cep2_add_skies   cep2_ext_tiles   cep2_add_tiles1   cep2_add_tiles2   cep2_top_2_60
   cep2_core0
   cep2_core1
   cep2_core2
   cep2_core3
   cep2_core4
   cep2_core5
   cep2_core6
   cep2_core7                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   0   D                                             	   
                                     /*
Filename:           nwnx_chat
System:             nwnx plugin
Author:             virusman
Date Created:       Sep. 3, 2017
Summary:
Formerly dmb_chat, contains all the functions for the NWNX chat plugin

Copyright (c) 2005 dumbo (dumbo@nm.ru)
Copyright (c) 2006-2007 virusman (virusman@virusman.ru)
*/

string dmb_LIST_ITEM_NAME = "dmbPC_";
string dmb_PC_ID_NAME = "dmbID";

const int CHAT_CHANNEL_TALK        = 1;
const int CHAT_CHANNEL_SHOUT       = 2;
const int CHAT_CHANNEL_WHISPER     = 3;
const int CHAT_CHANNEL_PRIVATE     = 4;
const int CHAT_CHANNEL_SERVER_MSG  = 5;
const int CHAT_CHANNEL_PARTY       = 6;
const int CHAT_CHANNEL_DM          = 14;

//Send chat message
//nChannel - CHAT_CHANNEL_*
void dmb_SendMessage(object oSender, int nChannel, string sMessage, object oRecipient=OBJECT_INVALID);

void dmb_ChatInit()
{
    int i;
    object oMod = GetModule();
    // memory for chat text
    string sMemory;
    for (i = 0; i < 8; i++) // reserve 8*128 bytes
        sMemory += "................................................................................................................................";
    SetLocalString(oMod, "NWNX!INIT", "1");
    SetLocalString(oMod, "NWNX!CHAT!SPACER", sMemory);
}

string dmb_GetStringFrom(string s, int from = 1)
{
    return GetStringRight(s, GetStringLength(s) - from);
}

string dmb_GetSpacer()
{
    return GetLocalString(GetModule(), "NWNX!CHAT!SPACER");
}

void dmb_PCin(object oPC)
{
  if (!GetIsObjectValid(oPC)) return;
  object oMod = GetModule();
  SetLocalString(oPC, "NWNX!CHAT!GETID", ObjectToString(oPC)+"        ");
  string sID = GetLocalString(oPC, "NWNX!CHAT!GETID");
  int nID = StringToInt(sID);
  if (nID != -1)
  {
    SetLocalObject(oMod, dmb_LIST_ITEM_NAME + sID, oPC);
    SetLocalInt(oPC, dmb_PC_ID_NAME, nID);
  }
  DeleteLocalString(oPC, "NWNX!CHAT!GETID");
}

int dmb_GetClientID(object oPC)
{
    if (!GetIsObjectValid(oPC)) return -1;
    if (!GetIsPC(oPC)&&!GetIsPossessedFamiliar(oPC)&&!GetIsDM(oPC)&&!GetIsDMPossessed(oPC)) return -1;
    SetLocalString(oPC, "NWNX!CHAT!GETID", ObjectToString(oPC)+"        ");
    string sID = GetLocalString(oPC, "NWNX!CHAT!GETID");
    int nID = StringToInt(sID);
    return nID;
}

int dmb_SendMessage(object oSender, int nChannel, string sMessage, object oRecipient=OBJECT_INVALID)
{
    if (!GetIsObjectValid(oSender)) return FALSE;
    if (FindSubString(sMessage, "?")!=-1) return FALSE;
    if (nChannel == CHAT_CHANNEL_PRIVATE && !GetIsObjectValid(oRecipient)) return FALSE;
    SetLocalString(oSender, "NWNX!CHAT!SPEAK", ObjectToString(oSender)+"?"+ObjectToString(oRecipient)+"?"+IntToString(nChannel)+"?"+sMessage);
    if(GetLocalString(oSender, "NWNX!CHAT!SPEAK")=="1") return TRUE;
    else return FALSE;
}

void dmb_PCout(object oPC)
{
  if (!GetIsObjectValid(oPC)) return;
  int nID = GetLocalInt(oPC, dmb_PC_ID_NAME);
  DeleteLocalInt(oPC, dmb_PC_ID_NAME);
  DeleteLocalObject(GetModule(), dmb_LIST_ITEM_NAME + IntToString(nID));
}

object dmb_getPC(int nID)
{
  return GetLocalObject(GetModule(), dmb_LIST_ITEM_NAME + IntToString(nID));
}

string dmb_getChannelText(int mode)
{
    switch (mode)
    {
        case CHAT_CHANNEL_TALK:
            return "TALK";
        case CHAT_CHANNEL_SHOUT:
            return "SHOUT";
        case CHAT_CHANNEL_WHISPER:
            return "WHISPER";
        case CHAT_CHANNEL_PRIVATE:
            return "TELL";
        case CHAT_CHANNEL_SERVER_MSG:
            return "SERVER_MSG";
        case CHAT_CHANNEL_PARTY:
            return "PARTY";
        case CHAT_CHANNEL_DM:
            return "DM";
        default:
            return "UNKNOWN:" + IntToString(mode);
    }
    return "ERROR";
}

/*
Filename:           nwnx_dmactions
System:             nwnx plugin
Author:             virusman
Date Created:       Sep. 3, 2017
Summary:
Contains all the functions for a NWNX plugin, not sure which...

Copyright (c) 2005 dumbo (dumbo@nm.ru)
Copyright (c) 2006-2007 virusman (virusman@virusman.ru)
*/

const int
    DM_ACTION_MESSAGE_TYPE           = 1,
    DM_ACTION_GIVE_XP                = 2,
    DM_ACTION_GIVE_LEVEL             = 3,
    DM_ACTION_GIVE_GOLD              = 4,
    DM_ACTION_CREATE_ITEM_ON_OBJECT  = 5,
    DM_ACTION_CREATE_ITEM_ON_AREA    = 6,
    DM_ACTION_HEAL_CREATURE          = 7,
    DM_ACTION_REST_CREATURE          = 8,
    DM_ACTION_RUNSCRIPT              = 9,
    DM_ACTION_CREATE_PLACEABLE       = 10;

// Set script name called on specified action
void SetDMActionScript(int nAction, string sScript);

// Get ID of DM Action
int nGetDMActionID();

// Prevent action
void PreventDMAction();

// Get int param of DM Action
int nGetDMAction_Param(int bSecond=FALSE);

// Get string param of DM Action
string sGetDMAction_Param();

// Get target object of DM Action
object oGetDMAction_Target(int bSecond=FALSE);

// Get target position of DM Action
vector vGetDMAction_Position();

// Get total targets number in multiselection
int nGetDMAction_TargetsCount();

// Get current target number in multiselection.
int nGetDMAction_TargetsCurrent();

void SetDMActionScript(int nAction, string sScript) {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!SET_ACTION_SCRIPT", IntToString(nAction)+":"+sScript);
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!SET_ACTION_SCRIPT");
}

int nGetDMActionID() {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETACTIONID", "                ");
    string sAction = GetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETACTIONID");
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETACTIONID");
    return StringToInt(sAction);
}

void PreventDMAction() {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!PREVENT", "1");
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!PREVENT");
}

int nGetDMAction_Param(int bSecond=FALSE) {
    string sNth = bSecond?"2":"1";
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETPARAM_"+sNth, "                ");
    string sVal = GetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETPARAM_"+sNth);
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETPARAM_"+sNth);
    return StringToInt(sVal);
}

string sGetDMAction_Param() {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETSTRPARAM1", "                                ");
    string sVal = GetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETSTRPARAM1");
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETSTRPARAM1");
    return sVal;
}

object oGetDMAction_Target(int bSecond=FALSE) {
    string sNth = bSecond?"2":"1";
    return GetLocalObject(OBJECT_SELF, "NWNX!DMACTIONS!TARGET_"+sNth);
}

vector vGetDMAction_Position() {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETPOS", "                                              ");
    string sVector = GetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETPOS");
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETPOS");
    float x, y, z;

    //Get X
    int nPos = FindSubString(sVector, "�");
    if(nPos == -1) return Vector();
    x = StringToFloat(GetStringLeft(sVector, nPos));
    sVector = GetStringRight(sVector, GetStringLength(sVector) - nPos - 1);

    //Get Y
    nPos = FindSubString(sVector, "�");
    if(nPos == -1) return Vector();
    y = StringToFloat(GetStringLeft(sVector, nPos));
    sVector = GetStringRight(sVector, GetStringLength(sVector) - nPos - 1);

    //Get Z
    nPos = FindSubString(sVector, "�");
    if(nPos == -1) {
        z = StringToFloat(sVector);
    } else return Vector();

    return Vector(x, y, z);
}

int nGetDMAction_TargetsCount() {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETTARGETSCOUNT", "                ");
    string sVal = GetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETTARGETSCOUNT");
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETTARGETSCOUNT");
    return StringToInt(sVal);
}

int nGetDMAction_TargetsCurrent() {
    SetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETTARGETSCURRENT", "                ");
    string sVal = GetLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETTARGETSCURRENT");
    DeleteLocalString(OBJECT_SELF, "NWNX!DMACTIONS!GETTARGETSCURRENT");
    return StringToInt(sVal);
}
/*
Filename:           nwnx_events
System:             nwnx plugin
Author:             virusman
Date Created:       Sep. 3, 2017
Summary:
Contains all the functions for the NWNX events plugin

Copyright (c) 2005 dumbo (dumbo@nm.ru)
Copyright (c) 2006-2007 virusman (virusman@virusman.ru)
*/

const int EVENT_TYPE_ALL                = 0;
const int EVENT_TYPE_SAVE_CHAR          = 1;
const int EVENT_TYPE_PICKPOCKET         = 2;
const int EVENT_TYPE_ATTACK             = 3;
const int EVENT_TYPE_USE_ITEM           = 4;
const int EVENT_TYPE_QUICKCHAT          = 5;
const int EVENT_TYPE_EXAMINE            = 6;
const int EVENT_TYPE_USE_SKILL          = 7;
const int EVENT_TYPE_USE_FEAT           = 8;
const int EVENT_TYPE_TOGGLE_MODE        = 9;
const int EVENT_TYPE_CAST_SPELL         = 10;
const int EVENT_TYPE_TOGGLE_PAUSE       = 11;
const int EVENT_TYPE_POSSESS_FAMILIAR   = 12;
const int EVENT_TYPE_VALIDATE_CHARACTER = 13;
const int EVENT_TYPE_DESTROY_OBJECT     = 14;
const int EVENT_TYPE_CREATE_OBJECT      = 15;

// DEPRECATED
// For backwards compatibility only - use above constants instead
const int EVENT_SAVE_CHAR = 1;
const int EVENT_PICKPOCKET = 2;
const int EVENT_ATTACK = 3;
const int EVENT_USE_ITEM = 4;
const int EVENT_QUICKCHAT = 5;
const int EVENT_EXAMINE = 6;
const int EVENT_USE_SKILL = 7;
const int EVENT_USE_FEAT = 8;
const int EVENT_TOGGLE_MODE = 9;

const int NODE_TYPE_STARTING_NODE = 0;
const int NODE_TYPE_ENTRY_NODE    = 1;
const int NODE_TYPE_REPLY_NODE    = 2;

const int LANGUAGE_ENGLISH              = 0;
const int LANGUAGE_FRENCH               = 1;
const int LANGUAGE_GERMAN               = 2;
const int LANGUAGE_ITALIAN              = 3;
const int LANGUAGE_SPANISH              = 4;
const int LANGUAGE_POLISH               = 5;
const int LANGUAGE_KOREAN               = 128;
const int LANGUAGE_CHINESE_TRADITIONAL  = 129;
const int LANGUAGE_CHINESE_SIMPLIFIED   = 130;
const int LANGUAGE_JAPANESE             = 131;

int GetEventType();
int GetEventSubType();
object GetEventTarget();
object GetEventItem();
vector GetEventPosition();
void BypassEvent();
void SetReturnValue(int nRetVal);
void SetGlobalEventHandler(int nEventID, string sHandler);

int GetCurrentNodeType();
int GetCurrentNodeID();
int GetCurrentAbsoluteNodeID();
string GetCurrentNodeText(int nLangID = LANGUAGE_ENGLISH, int nGender = GENDER_MALE);
void SetCurrentNodeText(string sText, int nLangID = LANGUAGE_ENGLISH, int nGender = GENDER_MALE);
int GetSelectedNodeID();
int GetSelectedAbsoluteNodeID();
string GetSelectedNodeText(int nLangID = LANGUAGE_ENGLISH, int nGender = GENDER_MALE);
int GetScriptReturnValue();

int GetEventType()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_EVENT_ID", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_EVENT_ID"));
}

int GetEventSubType()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_EVENT_SUBID", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_EVENT_SUBID"));
}

object GetEventTarget()
{
    return GetLocalObject(GetModule(), "NWNX!EVENTS!TARGET");
}

// DEPRECATED
// For backwards compatibility only - use GetEventTarget instead
object GetActionTarget()
{
    return GetEventTarget();
}

object GetEventItem()
{
    return GetLocalObject(GetModule(), "NWNX!EVENTS!ITEM");
}

vector GetEventPosition()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_EVENT_POSITION", "                                              ");
    string sVector = GetLocalString(GetModule(), "NWNX!EVENTS!GET_EVENT_POSITION");
    float x, y, z;

    //Get X
    int nPos = FindSubString(sVector, "?");
    if(nPos == -1) return Vector();
    x = StringToFloat(GetStringLeft(sVector, nPos));
    sVector = GetStringRight(sVector, GetStringLength(sVector) - nPos - 1);

    //Get Y
    nPos = FindSubString(sVector, "?");
    if(nPos == -1) return Vector();
    y = StringToFloat(GetStringLeft(sVector, nPos));
    sVector = GetStringRight(sVector, GetStringLength(sVector) - nPos - 1);

    //Get Z
    nPos = FindSubString(sVector, "?");
    if(nPos == -1)
    {
        z = StringToFloat(sVector);
    }
    else return Vector();
    return Vector(x, y, z);
}

void BypassEvent()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!BYPASS", "1");
}

void SetReturnValue(int nRetVal)
{
    SetLocalString(GetModule(), "NWNX!EVENTS!RETURN", IntToString(nRetVal));
}

void SetGlobalEventHandler(int nEventID, string sHandler)
{
    if (sHandler == "")
        sHandler = "-";

    string sKey = "NWNX!EVENTS!SET_EVENT_HANDLER_" + IntToString(nEventID);
    SetLocalString(GetModule(), sKey, sHandler);
    DeleteLocalString(GetModule(), sKey);
}

int GetCurrentNodeType()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_NODE_TYPE", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_NODE_TYPE"));
}

int GetCurrentNodeID()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_NODE_ID", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_NODE_ID"));
}

int GetCurrentAbsoluteNodeID()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_ABSOLUTE_NODE_ID", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_ABSOLUTE_NODE_ID"));
}

int GetSelectedNodeID()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_SELECTED_NODE_ID", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_SELECTED_NODE_ID"));
}

int GetSelectedAbsoluteNodeID()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_SELECTED_ABSOLUTE_NODE_ID", "      ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_SELECTED_ABSOLUTE_NODE_ID"));
}

string GetSelectedNodeText(int nLangID, int nGender)
{
    if (nGender != GENDER_FEMALE) nGender = GENDER_MALE;
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_SELECTED_NODE_TEXT", IntToString(nLangID*2 + nGender));
    return GetLocalString(GetModule(), "NWNX!EVENTS!GET_SELECTED_NODE_TEXT");
}

string GetCurrentNodeText(int nLangID, int nGender)
{
    if (nGender != GENDER_FEMALE) nGender = GENDER_MALE;
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_NODE_TEXT", IntToString(nLangID*2 + nGender));
    return GetLocalString(GetModule(), "NWNX!EVENTS!GET_NODE_TEXT");
}

void SetCurrentNodeText(string sText, int nLangID, int nGender)
{
    if (nGender != GENDER_FEMALE) nGender = GENDER_MALE;
    SetLocalString(GetModule(), "NWNX!EVENTS!SET_NODE_TEXT", IntToString(nLangID*2 + nGender)+"?"+sText);
}

int GetScriptReturnValue()
{
    SetLocalString(GetModule(), "NWNX!EVENTS!GET_SCRIPT_RETURN_VALUE", "         ");
    return StringToInt(GetLocalString(GetModule(), "NWNX!EVENTS!GET_SCRIPT_RETURN_VALUE"));
}
/*
Filename:           nwnx_chat
System:             nwnx plugin
Author:             Ingmar Stieger, Adam Colon, Josh Simon
Date Created:       January 1st, 2005
Summary:
Various APS/NWNX2 related functions

This file is licensed under the terms of the
GNU GENERAL PUBLIC LICENSE (GPL) Version 2

/************************************/
/* Return codes                     */
/************************************/

const int SQL_ERROR = 0;
const int SQL_SUCCESS = 1;

/************************************/
/* Function prototypes              */
/************************************/

// Setup placeholders for ODBC requests and responses
void SQLInit();

// Execute statement in sSQL
void SQLExecDirect(string sSQL);

// Position cursor on next row of the resultset
// Call this before using SQLGetData().
// returns: SQL_SUCCESS if there is a row
//          SQL_ERROR if there are no more rows
int SQLFetch();

// * deprecated. Use SQLFetch instead.
// Position cursor on first row of the resultset and name it sResultSetName
// Call this before using SQLNextRow() and SQLGetData().
// returns: SQL_SUCCESS if result set is not empty
//          SQL_ERROR is result set is empty
int SQLFirstRow();

// * deprecated. Use SQLFetch instead.
// Position cursor on next row of the result set sResultSetName
// returns: SQL_SUCCESS if cursor could be advanced to next row
//          SQL_ERROR if there was no next row
int SQLNextRow();

// Return value of column iCol in the current row of result set sResultSetName
string SQLGetData(int iCol);

// Return a string value when given a location
string APSLocationToString(location lLocation);

// Return a location value when given the string form of the location
location APSStringToLocation(string sLocation);

// Return a string value when given a vector
string APSVectorToString(vector vVector);

// Return a vector value when given the string form of the vector
vector APSStringToVector(string sVector);

// Set oObject's persistent string variable sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration =
                         0, string sTable = "pwdata");

// Set oObject's persistent integer variable sVarName to iValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration =
                      0, string sTable = "pwdata");

// Set oObject's persistent float variable sVarName to fValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration =
                        0, string sTable = "pwdata");

// Set oObject's persistent location variable sVarName to lLocation
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
//   This function converts location to a string for storage in the database.
void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration =
                           0, string sTable = "pwdata");

// Set oObject's persistent vector variable sVarName to vVector
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
//   This function converts vector to a string for storage in the database.
void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration =
                         0, string sTable = "pwdata");

// Set oObject's persistent object with sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwobjdata)
void SetPersistentObject(object oObject, string sVarName, object oObject2, int iExpiration =
                         0, string sTable = "pwobjdata");

// Get oObject's persistent string variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: ""
string GetPersistentString(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent integer variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
int GetPersistentInt(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent float variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
float GetPersistentFloat(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent location variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
location GetPersistentLocation(object oObject, string sVarname, string sTable = "pwdata");

// Get oObject's persistent vector variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
vector GetPersistentVector(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent object sVarName
// Optional parameters:
//   sTable: Name of the table where object is stored (default: pwobjdata)
// * Return value on error: 0
object GetPersistentObject(object oObject, string sVarName, object oOwner = OBJECT_INVALID, string sTable = "pwobjdata");

// Delete persistent variable sVarName stored on oObject
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
void DeletePersistentVariable(object oObject, string sVarName, string sTable = "pwdata");

// (private function) Replace special character ' with ~
string SQLEncodeSpecialChars(string sString);

// (private function)Replace special character ' with ~
string SQLDecodeSpecialChars(string sString);

/************************************/
/* Implementation                   */
/************************************/

// Functions for initializing APS and working with result sets

void SQLInit()
{
    int i;

    // Placeholder for ODBC persistence
    string sMemory;

    for (i = 0; i < 8; i++)     // reserve 8*128 bytes
        sMemory +=
            "................................................................................................................................";

    SetLocalString(GetModule(), "NWNX!ODBC!SPACER", sMemory);
}

void SQLExecDirect(string sSQL)
{
    SetLocalString(GetModule(), "NWNX!ODBC!EXEC", sSQL);
}

int SQLFetch()
{
    string sRow;
    object oModule = GetModule();

    SetLocalString(oModule, "NWNX!ODBC!FETCH", GetLocalString(oModule, "NWNX!ODBC!SPACER"));
    sRow = GetLocalString(oModule, "NWNX!ODBC!FETCH");
    if (GetStringLength(sRow) > 0)
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", sRow);
        return SQL_SUCCESS;
    }
    else
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", "");
        return SQL_ERROR;
    }
}

// deprecated. use SQLFetch().
int SQLFirstRow()
{
    return SQLFetch();
}

// deprecated. use SQLFetch().
int SQLNextRow()
{
    return SQLFetch();
}

string SQLGetData(int iCol)
{
    int iPos;
    string sResultSet = GetLocalString(GetModule(), "NWNX_ODBC_CurrentRow");

    // find column in current row
    int iCount = 0;
    string sColValue = "";

    iPos = FindSubString(sResultSet, "�");
    if ((iPos == -1) && (iCol == 1))
    {
        // only one column, return value immediately
        sColValue = sResultSet;
    }
    else if (iPos == -1)
    {
        // only one column but requested column > 1
        sColValue = "";
    }
    else
    {
        // loop through columns until found
        while (iCount != iCol)
        {
            iCount++;
            if (iCount == iCol)
                sColValue = GetStringLeft(sResultSet, iPos);
            else
            {
                sResultSet = GetStringRight(sResultSet, GetStringLength(sResultSet) - iPos - 1);
                iPos = FindSubString(sResultSet, "�");
            }

            // special case: last column in row
            if (iPos == -1)
                iPos = GetStringLength(sResultSet);
        }
    }

    return sColValue;
}

// These functions deal with various data types. Ultimately, all information
// must be stored in the database as strings, and converted back to the proper
// form when retrieved.

string APSVectorToString(vector vVector)
{
    return "#POSITION_X#" + FloatToString(vVector.x) + "#POSITION_Y#" + FloatToString(vVector.y) +
        "#POSITION_Z#" + FloatToString(vVector.z) + "#END#";
}

vector APSStringToVector(string sVector)
{
    float fX, fY, fZ;
    int iPos, iCount;
    int iLen = GetStringLength(sVector);

    if (iLen > 0)
    {
        iPos = FindSubString(sVector, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sVector, iPos, iCount));
    }

    return Vector(fX, fY, fZ);
}

string APSLocationToString(location lLocation)
{
    object oArea = GetAreaFromLocation(lLocation);
    vector vPosition = GetPositionFromLocation(lLocation);
    float fOrientation = GetFacingFromLocation(lLocation);
    string sReturnValue;

    if (GetIsObjectValid(oArea))
        sReturnValue =
            "#AREA#" + GetTag(oArea) + "#POSITION_X#" + FloatToString(vPosition.x) +
            "#POSITION_Y#" + FloatToString(vPosition.y) + "#POSITION_Z#" +
            FloatToString(vPosition.z) + "#ORIENTATION#" + FloatToString(fOrientation) + "#END#";

    return sReturnValue;
}

location APSStringToLocation(string sLocation)
{
    location lReturnValue;
    object oArea;
    vector vPosition;
    float fOrientation, fX, fY, fZ;

    int iPos, iCount;
    int iLen = GetStringLength(sLocation);

    if (iLen > 0)
    {
        iPos = FindSubString(sLocation, "#AREA#") + 6;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        oArea = GetObjectByTag(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sLocation, iPos, iCount));

        vPosition = Vector(fX, fY, fZ);

        iPos = FindSubString(sLocation, "#ORIENTATION#") + 13;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fOrientation = StringToFloat(GetSubString(sLocation, iPos, iCount));

        lReturnValue = Location(oArea, vPosition, fOrientation);
    }

    return lReturnValue;
}

// These functions are responsible for transporting the various data types back
// and forth to the database.

void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration =
                         0, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    sValue = SQLEncodeSpecialChars(sValue);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val='" + sValue +
            "',expire=" + IntToString(iExpiration) + " WHERE player='" + sPlayer +
            "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
        SQLExecDirect(sSQL);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sVarName + "','" +
            sValue + "'," + IntToString(iExpiration) + ")";
        SQLExecDirect(sSQL);
    }
}

string GetPersistentString(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
        return SQLDecodeSpecialChars(SQLGetData(1));
    else
    {
        return "";
        // If you want to convert your existing persistent data to APS, this
        // would be the place to do it. The requested variable was not found
        // in the database, you should
        // 1) query it's value using your existing persistence functions
        // 2) save the value to the database using SetPersistentString()
        // 3) return the string value here.
    }
}

void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration =
                      0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, IntToString(iValue), iExpiration, sTable);
}

int GetPersistentInt(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", "-2147483647");
    return StringToInt(GetLocalString(oModule, "NWNX!ODBC!FETCH"));
}

void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration =
                        0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, FloatToString(fValue), iExpiration, sTable);
}

float GetPersistentFloat(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", "-340282306073709650000000000000000000000.000000000");
    return StringToFloat(GetLocalString(oModule, "NWNX!ODBC!FETCH"));
}

void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration =
                           0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, APSLocationToString(lLocation), iExpiration, sTable);
}

location GetPersistentLocation(object oObject, string sVarName, string sTable = "pwdata")
{
    return APSStringToLocation(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration =
                         0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, APSVectorToString(vVector), iExpiration, sTable);
}

vector GetPersistentVector(object oObject, string sVarName, string sTable = "pwdata")
{
    return APSStringToVector(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentObject(object oOwner, string sVarName, object oObject, int iExpiration =
                         0, string sTable = "pwobjdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oOwner))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oOwner));
        sTag = SQLEncodeSpecialChars(GetName(oOwner));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oOwner);
    }
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val=%s,expire=" + IntToString(iExpiration) +
            " WHERE player='" + sPlayer + "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
        SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
        StoreCampaignObject ("NWNX", "-", oObject);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sVarName + "',%s," + IntToString(iExpiration) + ")";
        SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
        StoreCampaignObject ("NWNX", "-", oObject);
    }
}

object GetPersistentObject(object oObject, string sVarName, object oOwner = OBJECT_INVALID, string sTable = "pwobjdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);

    if (!GetIsObjectValid(oOwner))
        oOwner = oObject;
    return RetrieveCampaignObject ("NWNX", "-", GetLocation(oOwner), oOwner);
}

void DeletePersistentVariable(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    string sSQL = "DELETE FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);
}

// Problems can arise with SQL commands if variables or values have single quotes
// in their names. These functions are a replace these quote with the tilde character

string SQLEncodeSpecialChars(string sString)
{
    if (FindSubString(sString, "'") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "'")
            sReturn += "~";
        else
            sReturn += sChar;
    }
    return sReturn;
}

string SQLDecodeSpecialChars(string sString)
{
    if (FindSubString(sString, "~") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "~")
            sReturn += "'";
        else
            sReturn += sChar;
    }
    return sReturn;
}


ITP V3.28   �   �  >  |     �  X   $  �    �  ����                                                     (          0          8          @          L          T          \          d          l          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �                      J�       �         T         j�       �         d                   �         !         �         "         �         #         �         $         �         i�       �         |                   �         !         �         "         �         #         �         $         �         7�       �                 �         ۂ        d         �   
                    
                   
      -             
      D                   ڂ        c         ق        b         ܂                 ؂        a   
      M                   _�        ;         �       �         	�       �         �        �         �        �         �        �         �        �         �        �         
�        }         �        �         �        �         �                 �        �         �        ~         �        |         �        E         �        ?         �        @         �               �        G         �        H         �        I         �        J         �        K         �        {         +�       ,        ,�        X         -�        Y         2�        N         1�        ]         5�       d        6�        1         7�        2         8�        3         0�        \         /�        [         3�        ^         9�       t        :�                  <�        #         >�        %         ;�        "         =�        $         ?�        &         @�        '         .�        Z         A�        V         4�        `         B�       �        C�        5         E�        7         F�        8         G�        9         D�        6         ~                   �       �        #�        Q         '�        �         $�        R         %�        S         !�        O         )�        �         &�        U         *�        /         "�        P         (�        �         �                  8         	         �         
         �        �        �        i         ��        o         �                 �        j         �        D         �        n         �        m         �        k         �        h         ݂               ނ        q         ߂        r         ��        s         �        �         �        u         �       $        �        z         �        x         �        v         �        w         �        y         �        l         �        <        ��        �         ��                 �        �         ��        �         �        �         �#                  �#                  ;�       �                 T                            !                  "                  #                  $                  �       l        �        -         �        +         �        .         �        *         �        )         �        ,         �        �        ��        �         ��        �         ��        �         ��        �         ��        �         ��        �         ��                 �                 �        �                  �                                   ��                  <                 }        �        ��        �          �           MAIN            STRREF          ID              LIST            DELETE_ME          Corpses - Monsters   Corpses - NPC Human   Corpses - NPC Other   Misc.   Weapons                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =                 3   P   Q   \   ]   ^   _   v   |   }   ~      �   �   �   �                                    	   
                                                      (   )   *   +   ,                   !   "   #   $   %   &   '      -   .   /   0   1   2      4   5   6   7   8   <   =   >   ?   G   H   I   J      9   :   ;      @   A   B   C   D   E   F      K   L   M   N   O   
   R   S   T   U   V   W   X   Y   Z   [      `   a   b   c   d   e   f   g   h   i   u      j   k   l   m   n   o      p   q   r   s   t      w   x   y   z   {      �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �   �      �   �   �   �   �      �   �   FAC V3.28      p  M        �  5   �  4  �  l   ����<                                      $         0          D         P         \         h         t         �         �         �         �      	   �      
   �         �         �         �         �         �                                 (                      ����
                         ����
                        ����
                        ����
                        ����
      )                                                                           2                            2                            2                           d                                                                                                                                           d                           2                           d                                                       2                           d                           d                                                       2                           d                           d   FactionList     FactionParentID FactionName     FactionGlobal   RepList         FactionID1      FactionID2      FactionRep         PC   Hostile   Commoner   Merchant   Defender                        	   
                                                                          !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L                                 	   
                                                ITP V3.28      �            @      @  `   �  8   ����                                                               (          0          8          @          H          P          X                       &                  9�                  �                  �                  �                                                        !                  "                  #                  $                  �            MAIN            STRREF          ID              LIST                                    	   
                                                                              	   
      ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                       �                                                       !                  "                  #                  $            MAIN            STRREF          ID              LIST                                    	   
                                          ITP V3.28      �      l     �      �  x   $  H   ����                                                               (          0          8          @          H          P          X          `          h          p                       :                  �                  �#                                                       !                  "                  #                  $                  �        0         ��                  �                  �                  �                  ��            MAIN            STRREF          ID              LIST                                    	   
                                                                              
                  	                     ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                                                            !                  "                  #                  $                  �            MAIN            STRREF          LIST            ID                                      	   
                                          NCS V1.0B         dmbPC_ dmbID*     +  ����         J NWNX!CHAT!TEXT����   9 NWNX!CHAT!TEXT����   5   ����   ?  �   
   ����   A  �   ����    �����  ���� CHAT_����    # : (#����      s ) #          �#  | ##����  ��������     ���� %    ����            @@  ����         A   ����  ������������������������ $����            &����   *    �����   )���� !����     ���� ���� "     >����     ����   � :##����  ����    -      ���1 ����   - ����         -����  (ALL)#����  ����   �- ����         �        |����  ��������   *    ]����     ����   � :##����  ����        }����  ���� ����   0- ����         s����    /����  ��������  (����  s# ) #    ����   �##����  ����    �-  $ ����  ��������   *    �����  �    W����   (����  s# ) #    ����   �# :##����  ���� % ����  ���� ���v����   | #����  ��������  
# NWNX!CHAT!LOG����   9  *** ���� # 
# NWNX!CHAT!LOG����   9���� ���� # 0 NWNX!CHAT!TEXT����   NWNX!CHAT!SUPRESS����   ����   NWNX!CHAT!SPACER  �   5����  ����      ����   ;����  ����   >����  ����     ����  ���� ����     %    �����     %    �����     %    �����     %    �����     %    �����     %    �����     %    �    � TALK����  ����   	 SHOUT����  ����    � WHISPER����  ����    � TELL����  ����    � 
SERVER_MSG����  ����    � PARTY����  ����    r DM����  ����    X UNKNOWN:����   \#����  ����    ) ���� ERROR����  ����     ����  '���� ����   \#  �   6����  ����     ����  /*
Filename:           _handler_chat
System:             nwnx plugin
Author:             rmilne
Date Created:       Sep. 3, 2017
Summary:
Adapted from chat_script.nss.sample by Dumbo
https://github.com/NWNX/nwnx2-linux/blob/master/plugins/chat/nwn/chat_script.nss.sample
*/

#include "nwnx_chat"

// Format : CHAT_[LEVL]:[SOURCE] | [DESTINATION] | [MESSAGE]

void main()
{
    // speaking object
    object oPC = OBJECT_SELF;
    object oPCn;
    // get text
    SetLocalString(oPC, "NWNX!CHAT!TEXT", dmb_GetSpacer());
    string sText = GetLocalString(oPC, "NWNX!CHAT!TEXT");
    int nMode = StringToInt(GetStringLeft(sText,2));
    int nTo = StringToInt(GetSubString(sText,2,10));
    // trim 12 off the front to get rid of the mode data
    sText = dmb_GetStringFrom(sText, 12);

    // Portion of format : CHAT_[LEVL]:[SOURCE] |
    string sMsg = "CHAT_" + dmb_getChannelText(nMode) + ": (";
    sMsg += GetPCPlayerName(OBJECT_SELF) + ") " + GetName(OBJECT_SELF) + " | ";

    // Portion of format : [DESTINATION]
    if (nMode == CHAT_CHANNEL_TALK || nMode == CHAT_CHANNEL_WHISPER)
    {
        int nIdx = 1;
        float fDst = 3.0;
        if (nMode == CHAT_CHANNEL_TALK)
            fDst = 10.0;

        // consider all players within fDst to be [DESTINATION]
        while (GetIsObjectValid(oPCn=GetNearestCreature(
                                                    CREATURE_TYPE_PLAYER_CHAR,
                                                    PLAYER_CHAR_IS_PC,
                                                    OBJECT_SELF,
                                                    nIdx++)))
        {
            if (GetDistanceToObject(oPCn) < fDst && oPCn != oPC)
                sMsg += GetName(oPCn)+":";
            else
                break;
        }
    }
    else if (nMode == CHAT_CHANNEL_SHOUT)
        sMsg += "(ALL)";
    else if (nMode == CHAT_CHANNEL_PARTY)
    {
        oPCn = GetFirstFactionMember(OBJECT_SELF, TRUE);
        while (GetIsObjectValid(oPCn))
        {
            sMsg += GetName(oPCn)+":";
            oPCn = GetNextFactionMember(OBJECT_SELF, TRUE);
        }
    }
    else if (nMode == CHAT_CHANNEL_PRIVATE)
    {
        oPCn = dmb_getPC(nTo);
        sMsg += "(" + GetPCPlayerName(oPCn) + ") " + GetName(oPCn);
    }
    else
    {
        oPCn = GetFirstPC();
        while (GetIsObjectValid(oPCn))
        {
            if (GetIsDM(oPCn))
                sMsg += " (" + GetPCPlayerName(oPCn)+") " + GetName(oPCn) + ":";
            oPCn = GetNextPC();
        }
    }
    // Portion of format : | [MESSAGE]
    sMsg += " | ";
    SetLocalString(oPC, "NWNX!CHAT!LOG", sMsg+"\n");
    SetLocalString(oPC, "NWNX!CHAT!LOG", " *** "+sText+"\n");

    // The internet never forgets
    WriteTimestampedLogEntry(sMsg + sText);

    // remove garbage
    DeleteLocalString(oPC, "NWNX!CHAT!TEXT");
    DeleteLocalString(oPC, "NWNX!CHAT!SUPRESS");
}
NCS V1.0B  e             -����         �       �       " XP_DM:    ����   �#  | #����  s#  | #    ����   �#  | #����   \#  | #����  �  \#����  0 ����   P- ����         �       �       K 	LEVEL_DM:    ����   �#  | #����  s#  | #    ����   �#  | #����   \#����  0 ����   �- ����         �       -       � GOLD_DM:    ����   �#  | #����  s#  | #    ����   �#  | #����   \#����  0 ����   �- ����         �       q      c ITEM_OBJ_DM:    ����   �#  | #    ����   �#  | #����  F#  | #    ����   �#����  0 ����   - ����         �       �      � ITEM_AREA_DM:    ����   �#  | #����  F#  | #    ����   �#  | #����  F#  | #    ����   �#����  0 ����    2- ����                 � ���� ����                    NWNX!DMACTIONS!GETACTIONID      9 NWNX!DMACTIONS!GETACTIONID      5 NWNX!DMACTIONS!GETACTIONID     ����   �����  ����     ����  ����      2     1 NWNX!DMACTIONS!TARGET_���� #      6����  ����     ���� ����  ����      2     1                  NWNX!DMACTIONS!GETPARAM_���� #      9 NWNX!DMACTIONS!GETPARAM_���� #      5 NWNX!DMACTIONS!GETPARAM_���� #     ����   �����  ����     ���� ����  /*
Filename:           _handler_dmact
System:             nwnx plugin
Author:             Schmidt-A/amcguiga
Date Created:       Sep. 3, 2017
Summary:
Tracks actions taken by DM radial menu, such as XP/Gold granted, and
items created from the Creator menu.
*/

#include "nwnx_dmactions"

void main() {
    object oDM = OBJECT_SELF;
    int iAction = nGetDMActionID();

    if(iAction == DM_ACTION_GIVE_XP)
    {
        object oTarget = oGetDMAction_Target();
        int iXP = nGetDMAction_Param();

        // Format : XP_DM:[dm name] | [player account] | [character] | [xp amount] | [xp cumulative]
        // Example: XP_DM:Tweek | Aez | Meero Isesi | 100 | 3512
        string sLog = "XP_DM:" + GetName(oDM) + " | " +
                        GetPCPlayerName(oTarget) + " | " +
                        GetName(oTarget) + " | " +
                        IntToString(iXP) + " | " +
                        IntToString(GetXP(oTarget));
        WriteTimestampedLogEntry(sLog);
    }
    else if(iAction == DM_ACTION_GIVE_LEVEL)
    {
        object oTarget = oGetDMAction_Target();
        int iLevels = nGetDMAction_Param();

        // Format : LEVEL_DM:[dm name] | [player account] | [character] | [level amount]
        // Example: LEVEL_DM:Tweek | Aez | Meero Isesi | 1
        string sLog = "LEVEL_DM:" + GetName(oDM) + " | " +
                        GetPCPlayerName(oTarget) + " | " +
                        GetName(oTarget) + " | " +
                        IntToString(iLevels);
        WriteTimestampedLogEntry(sLog);
    }
    else if(iAction == DM_ACTION_GIVE_GOLD)
    {
        object oTarget = oGetDMAction_Target();
        int iGold = nGetDMAction_Param();

        // Format : GOLD_DM:[dm name] | [player account] | [character] | [gold amount]
        // Example: GOLD_DM:Tweek | Aez | Meero Isesi | 50
        string sLog = "GOLD_DM:" + GetName(oDM) + " | " +
                        GetPCPlayerName(oTarget) + " | " +
                        GetName(oTarget) + " | " +
                        IntToString(iGold);
        WriteTimestampedLogEntry(sLog);
    }
    else if(iAction == DM_ACTION_CREATE_ITEM_ON_OBJECT) {
        object oTarget = oGetDMAction_Target();
        object oItem = oGetDMAction_Target(TRUE);

        // Format : ITEM_OBJ_DM:[dm name] | [object name] | [item resref] | [item name]
        // Example: ITEM_OBJ_DM:Tweek | Community Chest | item001 | Test Item
        string sLog = "ITEM_OBJ_DM:" + GetName(oDM) + " | " +
                        GetName(oTarget) + " | " +
                        GetResRef(oItem) + " | " +
                        GetName(oItem);
        WriteTimestampedLogEntry(sLog);
    }
    else if(iAction == DM_ACTION_CREATE_ITEM_ON_AREA) {
        object oArea = oGetDMAction_Target();
        object oItem = oGetDMAction_Target(TRUE);

        // Format : ITEM_AREA_DM:[dm name] | [area resref] | [area name] | [item resref] | [item name]
        // Example: ITEM_AREA_DM:Tweek | sundes | Sundered Desolation | item001 | Test Item
        string sLog = "ITEM_AREA_DM:" + GetName(oDM) + " | " +
                        GetResRef(oArea) + " | " +
                        GetName(oArea) + " | " +
                        GetResRef(oItem) + " | " +
                        GetName(oItem);
        WriteTimestampedLogEntry(sLog);
    }
    else if(iAction == DM_ACTION_HEAL_CREATURE) {
        object oCreature = oGetDMAction_Target();

    }
}
