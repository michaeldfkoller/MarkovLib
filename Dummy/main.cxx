#include <stdio.h>
#include "annuity.cpp"
#include <math.h>

int main(int iNrArgs, char ** pcArg)
{
  int iAge, iSAge, iLastAge;
  ANNUITYLV * psymA;  
  int iC1;
 
  psymA = new ANNUITYLV(250, 0.375);

  printf("\n Alter =? \n");
  scanf("%d", &iAge);
  psymA->vSetStopTime(iAge);

  printf("\n SAlter =? \n");
  scanf("%d", &iSAge);
  psymA->vSetSAge(iSAge);
 
  printf("\n StartZeit =? \n");
  scanf("%d", &iLastAge);
  psymA->vSetStartTime(iLastAge);

  psymA->dSetBaseYear(2010);
  psymA->dSetActualYear(2010);
  psymA->dSetPre(0.375); 

  for(iC1=0; iC1<2200; ++iC1)
    psymA->dSetDisc(iC1, 0.96);

  for(iC1=50; iC1<120; ++iC1)
    { double dTemp;
      dTemp = exp(-9.13275+0.0809438*iC1-0.000110180*iC1*iC1);
      if (dTemp > 1) dTemp = 1.;
      printf("Qx: %d --> %lf \n", iC1, dTemp);
      psymA->dSetQx(iC1, dTemp);
    }
  psymA->dSetQx(120, 1.);

  for(iC1=20; iC1<120; iC1+=5)
    {
      printf("DK: %d --> %lf \n", iC1, psymA->dGetDK(iC1));
    }
return(0);
}
