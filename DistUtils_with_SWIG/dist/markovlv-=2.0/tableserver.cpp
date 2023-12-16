////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#define MANN 0
#define FRAU 1
#include "statictable.c"
#include "tableserver.h"


TABLESERVER::TABLESERVER()
{
  iTableVal = ERROR;
  iX0Val = ERROR;
  iXOmegaVal = ERROR;
  iT0Val = ERROR;
  dITechVal = ERROR; 
  iGenderVal = ERROR;
  dLevel = 1.0;
  //printf("Level reset\n");
}
 
void TABLESERVER::vSetTable(char *pcTable)
{
  int iC;
  char * pcTemp;
  bool bLevel = false;
  iTableVal = ERROR;
  iX0Val = ERROR;
  iXOmegaVal = ERROR;
  iT0Val = ERROR;
  dITechVal = ERROR; 
  iGenderVal = ERROR;
  for (pcTemp = pcTable; * pcTemp; ++pcTemp)
    {
      if (*pcTemp == ';')
        {
        bLevel = true;
        *pcTemp = '\0';
        ++pcTemp;
        break;
        }
    }
  
  if (bLevel)
    {
      dLevel = atof(pcTemp);
      printf("Level set at %6.4f \n", dLevel);
    }

  for (iC=0; iC<iNrTables;++iC)
    {
      if (!strcmp(pcTable,pcId[iC]))
	break;
    }
  if (iC == iNrTables)
    return;
  iTableVal = iC;
  iX0Val = iLowX[iC];
  iXOmegaVal = iHighX[iC];
  iT0Val = iTo[iC];
  dITechVal = dITechArray[iC]; 
  iGenderVal = iGenderArray[iC];
}

double TABLESERVER::dGetValue(int iAge)
{ double dTemp;
  if (iTableVal == ERROR)
    {
      return(ERROR);
    }
  if (iAge < iX0Val)
    {
      return(0.);
    } 
  if(iAge>iXOmegaVal)
    {
      return(1.);
    }
  dTemp = ppdTable[iTableVal][iAge];
  if (dTemp >= 0.99999999) return(1.); // This ensures that omega remains omega
  dTemp *= dLevel;
  //printf ("\n %8.6f %8.6f %8.6f \n",  ppdTable[iTableVal][iAge], dLevel, dTemp);
  if (dTemp < 0) return(0.);
  return(dTemp);

}

int TABLESERVER::iTableNumber()
{
  return(iTableVal);
}

int TABLESERVER::iX0()
{
  if (iTableVal == ERROR)
    {
      return(ERROR);
    } 
  return(iX0Val);
}

int TABLESERVER::iXOmega()
{
  if (iTableVal == ERROR)
    {
      return(ERROR);
    } 
  return(iXOmegaVal);
}

int TABLESERVER::iT0()
{
  if (iTableVal == ERROR)
    {
      return(ERROR);
    } 
  return(iT0Val);
}
double TABLESERVER::dITech()
{
  if (iTableVal == ERROR)
    {
      return(ERROR);
    } 
  return(dITechVal);
}
int TABLESERVER::iGender()
{
  if (iTableVal == ERROR)
    {
      return(ERROR);
    } 
  return(iGenderVal);
}
char * TABLESERVER::pcAllTarifs()
{
  static char strBuffer[MAXCHARS];
  char * pcT1;
  char * pcT2;
  int iC;
  pcT1 = strBuffer;
  for (iC=0; iC< iNrTables; ++ iC)
    {
      for(pcT2 =pcId[iC]; *pcT2; ++pcT1, ++pcT2)
	{
	  *pcT1 = *pcT2;
	}
      *pcT1  = '\n';
      ++pcT1;
    }
  *pcT1 = '\0';
  return(strBuffer);
}

