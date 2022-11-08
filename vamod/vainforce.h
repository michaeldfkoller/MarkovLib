#ifndef __VAINFORCE
#define __VAINFORCE

class VAINFORCE
{
 public:
  VAINFORCE();
  ~VAINFORCE();
  void vGotoStart();
  void nNext();
  VAPERSON * pGetPerson(long lId);
  VAPERSON * pNewPerson();
  VAPERSON * psymCurrentPers;

 private:
  VAPERSON * psymAllPers;

};

class VAPROJECT:VAINFORCE,SIMLIB 
{
 public:
  void xxx();
 
 private:
  void yyy();

}VAPROJECT;

#endif
