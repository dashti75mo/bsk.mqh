//+------------------------------------------------------------------+
//|                                   Basket6pairs_dollar_repeat.mq5 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#include <Trade\Trade.mqh>

#define Initial_Volume1 0.05
#define Initial_Volume2 0.03
#define Initial_Volume3 0.03
#define Initial_Volume4 0.05

#define CROSS_NUMBER    6
//#define CROSS4
//#define CROSS5
//#define CROSS6


#define MAX_LEVEL       70



#define MAXVOL_HIGH_REPEAT_THERESHOLD     0.0050
#define MAXVOL_LOW_REPEAT_THERESHOLD     -0.0080
#define MINVOL_HIGH_REPEAT_THERESHOLD     0.0050
#define MINVOL_LOW_REPEAT_THERESHOLD     -0.0080
#define MEDIANVOL_HIGH_REPEAT_THERESHOLD  0.0030
#define MEDIANVOL_LOW_REPEAT_THERESHOLD  -0.0050
//+------------------------------------------------------------------+
//| Expert Data Type Defenition                                      |
//+------------------------------------------------------------------+
enum crossNames   //// enumeration of named constants 
  {
   EURUSD,
   EURAUD,
   USDJPY,
   GBPUSD,
   EURJPY,
   GBPJPY,
   USDCHF,
   GBPCHF,
   EURGBP,
   CHFJPY,
   AUDUSD,
   USDCAD,
   GBPAUD,
   NZDUSD,
   AUDNZD,
   AUDCAD,
   AUDCHF,
   NZDCAD,
   EURCAD,
   CADJPY,
   CADCHF,
   Null
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum tradeType   //// enumeration type of trade 
  {
   BUY,
   SELL
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum swap   //// enumeration swap 
  {
   ON,
   OFF
  };
//+------------------------------------------------------------------+
//| Getting Inputs                                                   |
//+------------------------------------------------------------------+  
//---Geting Cross and Trade Type input
input int Magic=201991;
input double Spread=10;//spread in pips
input swap SWAP=0;
input bool ctr = 1;
input crossNames crossName1     =Null;
input tradeType  crossType1     =0;
input double     initVol1=0;

input crossNames crossName2     =Null;
input tradeType  crossType2     =0;
input double     initVol2=0;


input crossNames crossName3     =Null;
input tradeType  crossType3     =0;
input double     initVol3=0;


input crossNames crossName4     =Null;
input tradeType  crossType4     =0;
input double     initVol4=0;


input crossNames crossName5     =Null;
input tradeType  crossType5     =0;
input double     initVol5=0;


input crossNames crossName6     =Null;
input tradeType  crossType6     =0;
input double     initVol6=0;
input string     basketName1="B1";

double     repeatCoeff=1;
double     meanNegetiveCounter=-20;
double     pipNeg=-20;
input double     levelDev0       =20;//-------------levelDev1--------------
input crossNames crossName1a     =Null;
input tradeType  crossType1a     =0;
input double lot1a=0.01;

input crossNames crossName2a     =Null;
input tradeType  crossType2a     =0;
input double lot2a=0.01;

input crossNames crossName3a     =Null;
input tradeType  crossType3a     =0;
input double lot3a=0.01;

input crossNames crossName4a     =Null;
input tradeType  crossType4a     =0;
input double lot4a=0.01;

input crossNames crossName5a     =Null;
input tradeType  crossType5a     =0;
input double lot5a=0.01;

input crossNames crossName6a     =Null;
input tradeType  crossType6a     =0;
input double lot6a=0.01;
input string     basketName2="B2";

input double     levelDev1       =20;//-------------levelDev2--------------
input crossNames crossName1b     =Null;
input tradeType  crossType1b     =0;
input double lot1b=0.01;

input crossNames crossName2b     =Null;
input tradeType  crossType2b     =0;
input double lot2b=0.01;

input crossNames crossName3b     =Null;
input tradeType  crossType3b     =0;
input double lot3b=0.01;

input crossNames crossName4b     =Null;
input tradeType  crossType4b     =0;
input double lot4b=0.01;

input crossNames crossName5b     =Null;
input tradeType  crossType5b     =0;
input double lot5b=0.01;

input crossNames crossName6b     =Null;
input tradeType  crossType6b     =0;
input double lot6b=0.01;
input string     basketName3="B3";
input double     levelDev2       =20;//-------------levelDev3--------------
input crossNames crossName1c     =Null;
input tradeType  crossType1c     =0;
input double lot1c=0.01;

input crossNames crossName2c     =Null;
input tradeType  crossType2c     =0;
input double lot2c=0.01;

input crossNames crossName3c     =Null;
input tradeType  crossType3c     =0;
input double lot3c=0.01;

input crossNames crossName4c     =Null;
input tradeType  crossType4c     =0;
input double lot4c=0.01;

input crossNames crossName5c     =Null;
input tradeType  crossType5c     =0;
input double lot5c=0.01;

input crossNames crossName6c     =Null;
input tradeType  crossType6c     =0;
input double lot6c=0.01;
input string     basketName4="B4";
input double     levelDev3       =20;//-------------levelDev4--------------
input crossNames crossName1d     =Null;
input tradeType  crossType1d     =0;
input double lot1d=0.01;

input crossNames crossName2d     =Null;
input tradeType  crossType2d     =0;
input double lot2d=0.01;

input crossNames crossName3d     =Null;
input tradeType  crossType3d     =0;
input double lot3d=0.01;

input crossNames crossName4d     =Null;
input tradeType  crossType4d     =0;
input double lot4d=0.01;

input crossNames crossName5d     =Null;
input tradeType  crossType5d     =0;
input double lot5d=0.01;

input crossNames crossName6d     =Null;
input tradeType  crossType6d     =0;
input double lot6d=0.01;
input string     basketName5="B5";

input double     levelDev4       =20;//-------------levelDev5--------------
input crossNames crossName1e     =Null;
input tradeType  crossType1e     =0;
input double lot1e=0.01;

input crossNames crossName2e     =Null;
input tradeType  crossType2e     =0;
input double lot2e=0.01;

input crossNames crossName3e     =Null;
input tradeType  crossType3e     =0;
input double lot3e=0.01;

input crossNames crossName4e     =Null;
input tradeType  crossType4e     =0;
input double lot4e=0.01;

input crossNames crossName5e     =Null;
input tradeType  crossType5e     =0;
input double lot5e=0.01;

input crossNames crossName6e     =Null;
input tradeType  crossType6e     =0;
input double lot6e=0.01;
input string     basketName6="B6";

input double     levelDev5       =20;//-------------levelDev6--------------
input crossNames crossName1f     =Null;
input tradeType  crossType1f     =0;
input double lot1f=0.01;

input crossNames crossName2f     =Null;
input tradeType  crossType2f     =0;
input double lot2f=0.01;

input crossNames crossName3f     =Null;
input tradeType  crossType3f     =0;
input double lot3f=0.01;

input crossNames crossName4f     =Null;
input tradeType  crossType4f     =0;
input double lot4f=0.01;

input crossNames crossName5f     =Null;
input tradeType  crossType5f     =0;
input double lot5f=0.01;

input crossNames crossName6f     =Null;
input tradeType  crossType6f     =0;
input double lot6f=0.01;
input string     basketName7="B7";

input double     levelDev6       =20;//-------------levelDev7--------------
input crossNames crossName1g     =Null;
input tradeType  crossType1g     =0;
input double lot1g=0.01;

input crossNames crossName2g     =Null;
input tradeType  crossType2g     =0;
input double lot2g=0.01;

input crossNames crossName3g     =Null;
input tradeType  crossType3g     =0;
input double lot3g=0.01;

input crossNames crossName4g     =Null;
input tradeType  crossType4g     =0;
input double lot4g=0.01;

input crossNames crossName5g     =Null;
input tradeType  crossType5g     =0;
input double lot5g=0.01;

input crossNames crossName6g     =Null;
input tradeType  crossType6g     =0;
input double lot6g=0.01;
input string     basketName8="B8";

input double     levelDev7       =20;//-------------levelDev8--------------
input crossNames crossName1h     =Null;
input tradeType  crossType1h     =0;
input double lot1h=0.01;

input crossNames crossName2h     =Null;
input tradeType  crossType2h     =0;
input double lot2h=0.01;

input crossNames crossName3h     =Null;
input tradeType  crossType3h     =0;
input double lot3h=0.01;

input crossNames crossName4h     =Null;
input tradeType  crossType4h     =0;
input double lot4h=0.01;

input crossNames crossName5h     =Null;
input tradeType  crossType5h     =0;
input double lot5h=0.01;

input crossNames crossName6h     =Null;
input tradeType  crossType6h     =0;
input double lot6h=0.01;
input string     basketName9="B9";

input double     levelDev8       =20;//-------------levelDev9--------------
input crossNames crossName1i     =Null;
input tradeType  crossType1i     =0;
input double lot1i=0.01;

input crossNames crossName2i     =Null;
input tradeType  crossType2i     =0;
input double lot2i=0.01;

input crossNames crossName3i     =Null;
input tradeType  crossType3i     =0;
input double lot3i=0.01;

input crossNames crossName4i     =Null;
input tradeType  crossType4i     =0;
input double lot4i=0.01;

input crossNames crossName5i     =Null;
input tradeType  crossType5i     =0;
input double lot5i=0.01;

input crossNames crossName6i     =Null;
input tradeType  crossType6i     =0;
input double lot6i=0.01;
input string     basketName10="B10";

input double     levelDev9       =20;//-------------levelDev10--------------
input crossNames crossName1j     =Null;
input tradeType  crossType1j     =0;
input double lot1j=0.01;

input crossNames crossName2j     =Null;
input tradeType  crossType2j     =0;
input double lot2j=0.01;

input crossNames crossName3j     =Null;
input tradeType  crossType3j     =0;
input double lot3j=0.01;

input crossNames crossName4j     =Null;
input tradeType  crossType4j     =0;
input double lot4j=0.01;

input crossNames crossName5j     =Null;
input tradeType  crossType5j     =0;
input double lot5j=0.01;

input crossNames crossName6j     =Null;
input tradeType  crossType6j     =0;
input double lot6j=0.01;
input string     basketName11="B11";

input double     levelDev10       =20;//-------------levelDev11--------------
input crossNames crossName1k     =Null;
input tradeType  crossType1k     =0;
input double lot1k=0.01;

input crossNames crossName2k     =Null;
input tradeType  crossType2k     =0;
input double lot2k=0.01;

input crossNames crossName3k     =Null;
input tradeType  crossType3k     =0;
input double lot3k=0.01;

input crossNames crossName4k     =Null;
input tradeType  crossType4k     =0;
input double lot4k=0.01;

input crossNames crossName5k     =Null;
input tradeType  crossType5k     =0;
input double lot5k=0.01;

input crossNames crossName6k     =Null;
input tradeType  crossType6k     =0;
input double lot6k=0.01;
input string     basketName12="B12";

input double     levelDev11       =20;//-------------levelDev12--------------
input crossNames crossName1l     =Null;
input tradeType  crossType1l     =0;
input double lot1l=0.01;

input crossNames crossName2l     =Null;
input tradeType  crossType2l     =0;
input double lot2l=0.01;

input crossNames crossName3l     =Null;
input tradeType  crossType3l     =0;
input double lot3l=0.01;

input crossNames crossName4l     =Null;
input tradeType  crossType4l     =0;
input double lot4l=0.01;

input crossNames crossName5l     =Null;
input tradeType  crossType5l     =0;
input double lot5l=0.01;

input crossNames crossName6l     =Null;
input tradeType  crossType6l     =0;
input double lot6l=0.01;
input string     basketName13="B13";

input double     levelDev12       =20;//-------------levelDev13--------------
input crossNames crossName1m     =Null;
input tradeType  crossType1m     =0;
input double lot1m=0.01;

input crossNames crossName2m     =Null;
input tradeType  crossType2m     =0;
input double lot2m=0.01;

input crossNames crossName3m     =Null;
input tradeType  crossType3m     =0;
input double lot3m=0.01;

input crossNames crossName4m     =Null;
input tradeType  crossType4m     =0;
input double lot4m=0.01;

input crossNames crossName5m     =Null;
input tradeType  crossType5m     =0;
input double lot5m=0.01;

input crossNames crossName6m     =Null;
input tradeType  crossType6m     =0;
input double lot6m=0.01;
input string     basketName14="B14";

input double     levelDev13       =20;//-------------levelDev14--------------
input crossNames crossName1n     =Null;
input tradeType  crossType1n     =0;
input double lot1n=0.01;

input crossNames crossName2n     =Null;
input tradeType  crossType2n     =0;
input double lot2n=0.01;

input crossNames crossName3n     =Null;
input tradeType  crossType3n     =0;
input double lot3n=0.01;

input crossNames crossName4n     =Null;
input tradeType  crossType4n     =0;
input double lot4n=0.01;

input crossNames crossName5n     =Null;
input tradeType  crossType5n     =0;
input double lot5n=0.01;

input crossNames crossName6n     =Null;
input tradeType  crossType6n     =0;
input double lot6n=0.01;
input string     basketName15="B15";

input double     levelDev14       =20;//-------------levelDev15--------------
input crossNames crossName1o     =Null;
input tradeType  crossType1o     =0;
input double lot1o=0.01;

input crossNames crossName2o     =Null;
input tradeType  crossType2o     =0;
input double lot2o=0.01;

input crossNames crossName3o     =Null;
input tradeType  crossType3o     =0;
input double lot3o=0.01;

input crossNames crossName4o     =Null;
input tradeType  crossType4o     =0;
input double lot4o=0.01;

input crossNames crossName5o     =Null;
input tradeType  crossType5o     =0;
input double lot5o=0.01;

input crossNames crossName6o     =Null;
input tradeType  crossType6o     =0;
input double lot6o=0.01;
input string     basketName16="B16";

input double     levelDev15       =20;//-------------levelDev16--------------
input crossNames crossName1p     =Null;
input tradeType  crossType1p     =0;
input double lot1p=0.01;

input crossNames crossName2p     =Null;
input tradeType  crossType2p     =0;
input double lot2p=0.01;

input crossNames crossName3p     =Null;
input tradeType  crossType3p     =0;
input double lot3p=0.01;

input crossNames crossName4p     =Null;
input tradeType  crossType4p     =0;
input double lot4p=0.01;

input crossNames crossName5p     =Null;
input tradeType  crossType5p     =0;
input double lot5p=0.01;

input crossNames crossName6p     =Null;
input tradeType  crossType6p     =0;
input double lot6p=0.01;
input string     basketName17="B17";

input double     levelDev16       =20;//-------------levelDev17--------------
input crossNames crossName1q     =Null;
input tradeType  crossType1q     =0;
input double lot1q=0.01;

input crossNames crossName2q     =Null;
input tradeType  crossType2q     =0;
input double lot2q=0.01;

input crossNames crossName3q     =Null;
input tradeType  crossType3q     =0;
input double lot3q=0.01;

input crossNames crossName4q     =Null;
input tradeType  crossType4q     =0;
input double lot4q=0.01;

input crossNames crossName5q     =Null;
input tradeType  crossType5q     =0;
input double lot5q=0.01;

input crossNames crossName6q     =Null;
input tradeType  crossType6q     =0;
input double lot6q=0.01;
input string     basketName18="B18";

input double     levelDev17       =20;//-------------levelDev18--------------
input crossNames crossName1r     =Null;
input tradeType  crossType1r     =0;
input double lot1r=0.01;

input crossNames crossName2r     =Null;
input tradeType  crossType2r     =0;
input double lot2r=0.01;

input crossNames crossName3r     =Null;
input tradeType  crossType3r     =0;
input double lot3r=0.01;

input crossNames crossName4r     =Null;
input tradeType  crossType4r     =0;
input double lot4r=0.01;

input crossNames crossName5r     =Null;
input tradeType  crossType5r     =0;
input double lot5r=0.01;

input crossNames crossName6r     =Null;
input tradeType  crossType6r     =0;
input double lot6r=0.01;
input string     basketName19="B19";

input double     levelDev18       =20;//-------------levelDev19--------------
input crossNames crossName1s     =Null;
input tradeType  crossType1s     =0;
input double lot1s=0.01;

input crossNames crossName2s     =Null;
input tradeType  crossType2s     =0;
input double lot2s=0.01;

input crossNames crossName3s     =Null;
input tradeType  crossType3s     =0;
input double lot3s=0.01;

input crossNames crossName4s     =Null;
input tradeType  crossType4s     =0;
input double lot4s=0.01;

input crossNames crossName5s     =Null;
input tradeType  crossType5s     =0;
input double lot5s=0.01;

input crossNames crossName6s     =Null;
input tradeType  crossType6s     =0;
input double lot6s=0.01;
input string     basketName20="B20";

input double     levelDev19       =20;//-------------levelDev20--------------
input crossNames crossName1t     =Null;
input tradeType  crossType1t     =0;
input double lot1t=0.01;

input crossNames crossName2t     =Null;
input tradeType  crossType2t     =0;
input double lot2t=0.01;

input crossNames crossName3t     =Null;
input tradeType  crossType3t     =0;
input double lot3t=0.01;

input crossNames crossName4t     =Null;
input tradeType  crossType4t     =0;
input double lot4t=0.01;

input crossNames crossName5t     =Null;
input tradeType  crossType5t     =0;
input double lot5t=0.01;

input crossNames crossName6t     =Null;
input tradeType  crossType6t     =0;
input double lot6t=0.01;
input string     basketName21="B21";
///////////////////////////////////



double a=0;
double a1=0;
double a2=1;
double a3=1;
double a4=1;
double a5=1;
double a6=1;
double a7=1;
double a8=1;
double a9=1;
double a10=1;
double a11=1;
double a12=1;
double a13=1;
double a14=1;
double a15=1;
double a16=1;
double a17=1;
double a18=1;
double a19=1;
double a20=1;
double a21=1;
double a22=1;
double a23=1;
double a24=1;
double a25=1;
double a26=1;
double a27=1;
double a28=1;
double a29=1;
double a30=1;
double a31=1;
double a32=1;
double a33=1;
double a34=1;
double a35=1;
double a36=1;
double a37=1;
double a38=1;
double a39=1;
double a40=1;

double per0=0;
double per1=0;
double per2=1;
double per3=1;
double per4=1;
double per5=1;
double per6=1;
double per7=1;
double per8=1;
double per9=1;
double per10=1;
double per11=1;
double per12=1;
double per13=1;
double per14=1;
double per15=1;
double per16=1;
double per17=1;
double per18=1;
double per19=1;
double per20=1;

double spread1=0;
double spread2=0;
double spread3=0;
double spread4=0;
double spread5=0;
double spread6=0;
//---

//---Getting controling inputs
// input double    levelSpaceInit  =10;


input double     totalProfit;
 double     cumolativeProfit;
double           levelDiff[CROSS_NUMBER][MAX_LEVEL];          //two dimention arrays for each cross index and level 
int              pairIndex[CROSS_NUMBER];                      //for defining indexes in index array

int              repeatPairIndex[CROSS_NUMBER][MAX_LEVEL];     //to indicate the repeat pairs

double           repeatTheresholds[CROSS_NUMBER][MAX_LEVEL][2];           //two levels for high and low levels 
int              repeatNumber[CROSS_NUMBER][MAX_LEVEL];        //to indicate the number of repeating of a pair
int              negcntflag=0;
double           levelSpace[40];
double           levelSwitchLoss;
double           negetiveCount;
/*   
 double           positionVol[][6]= {{5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3},
                                     {5,2,3,5,2,3}
                                     
                                     };
*/
double  positionVol[CROSS_NUMBER][MAX_LEVEL];

//---Trade data types
CTrade           tradeObj[CROSS_NUMBER][MAX_LEVEL];

CTrade           closeObj;

string           positionComment[CROSS_NUMBER];
ENUM_ORDER_TYPE  nextLvlpositionType[CROSS_NUMBER];

ulong            baseTickets[CROSS_NUMBER][MAX_LEVEL];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   static int level;
   for(int i=0;i<CROSS_NUMBER;i++)
     {
      tradeObj[i][level].SetExpertMagicNumber(Magic);
     }
//---Start the first level basket

   levelSpace[0]=levelDev0;//;{levelDev0,20,20,50,80,130,150,180,200,250,300,380};  
   levelSpace[1]  = levelDev1;
   levelSpace[2]  = levelDev2;
   levelSpace[3]  = levelDev3;
   levelSpace[4]  = levelDev4;
   levelSpace[5]  = levelDev5;
   levelSpace[6]  = levelDev6;
   levelSpace[7]  = levelDev7;
   levelSpace[8]  = levelDev8;
   levelSpace[9]  = levelDev9;
   levelSpace[10] = levelDev10;
   levelSpace[11] = levelDev11;
   levelSpace[12]    = levelDev12;
   levelSpace[13]    = levelDev13;
   levelSpace[14]    = levelDev14;
   levelSpace[15]    = levelDev15;
   levelSpace[16]    = levelDev16;
   levelSpace[17]    = levelDev17;
   levelSpace[18]    = levelDev18;
   levelSpace[19]    = levelDev19;


   positionVol[0][0] = lot1a;
   positionVol[1][0] = lot2a;
   positionVol[2][0] = lot3a;
   positionVol[3][0] = lot4a;
   positionVol[4][0] = lot5a;
   positionVol[5][0] = lot6a;



   if(!level0Trade())
     {
      PrintFormat("Order Error NextLevel Error = %d",GetLastError());
      Sleep(600);
      return(OnInit());
     }

//---
   initVariable();
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   int numCause=0;
   static int currentlevel=0;
   static int level=0;
   int nextLvl;
   double totalPrft;

   totalPrft=totalProfitCal();
//---check profit if we have position
   while(1)
     {
      if(totalPrft>=totalProfit)
        {
         if(!closeAllPositions())
           {
            PrintFormat("Colse All Error = %d",GetLastError());
            while(1);
              }else if(!level0Trade()){
            PrintFormat("level0Trade Error = %d",GetLastError());
              }else {
            initVariable();
            currentlevel=0;
            nextLvl=0;
            negcntflag=0;
            per1=0;
            per2=1;
            per3=1;
            per4=1;
            per5=1;
            per6=1;
            per7=1;
            per8=1;
            per9=1;
            per10=1;
            per11=1;
            per12=1;
            per13=1;
            per14=1;
            per15=1;
            per16=1;
            per17=1;
            per18=1;
            per19=1;
            per20=1;
            per0=0;
            break;
           }

        }
if(per0==0){level0Trade();}
      //----
      if(per1==0 && totalProfitCal()<=-levelDev0){
         nextLevelOrder();
         if (per1==4){
      per1=1;
      per2=0;}}
      
      if(per2==0 && totalProfitCal()<=-(levelDev0+levelDev1)){
      nextLevelOrder();
       if (per2==4){
      per2=1;
      per3=0;}}
      
       if(per3==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2)){
      nextLevelOrder();
       if (per3==4){
      per3=1;
      per4=0;}}
      
      if(per4==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3)){
      nextLevelOrder();
       if (per4==4){
      per4=1;
      per5=0;}}
      
      if(per5==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4)){
      nextLevelOrder();
       if (per5==4){
      per5=1;
      per6=0;}}
      
      if(per6==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5)){
      nextLevelOrder();
       if (per6==4){
      per6=1;
      per7=0;}}
      
      if(per7==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6)){
      nextLevelOrder();
       if (per7==4){
      per7=1;
      per8=0;}}
      
      if(per8==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7)){
      nextLevelOrder();
       if (per8==4){
      per8=1;
      per9=0;}}
      
      if(per9==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8)){
      nextLevelOrder();
       if (per9==4){
      per9=1;
      per10=0;}}
      
      if(per10==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9)){
      nextLevelOrder();
       if (per10==4){
      per10=1;
      per11=0;}}
      
      if(per11==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10)){
      nextLevelOrder();
       if (per11==4){
      per11=1;
      per12=0;}}
      
      if(per12==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11)){
      nextLevelOrder();
       if (per12==4){
      per12=1;
      per13=0;}}
      
      if(per13==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12)){
      nextLevelOrder();
       if (per13==4){
      per13=1;
      per14=0;}}
      
      if(per14==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13)){
      nextLevelOrder();
       if (per14==4){
      per14=1;
      per15=0;}}
      
      if(per15==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13+levelDev14)){
      nextLevelOrder();
       if (per15==4){
      per15=1;
      per16=0;}}
      
      if(per16==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13+levelDev14+levelDev15)){
      nextLevelOrder();
       if (per16==4){
      per16=1;
      per17=0;}}
      
      if(per17==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13+levelDev14+levelDev15+levelDev16)){
      nextLevelOrder();
       if (per17==4){
      per17=1;
      per18=0;}}
      
      if(per18==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13+levelDev14+levelDev15+levelDev16+levelDev17)){
      nextLevelOrder();
       if (per18==4){
      per18=1;
      per19=0;}}
      
      if(per19==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13+levelDev14+levelDev15+levelDev16+levelDev17+levelDev18)){
      nextLevelOrder();
       if (per19==4){
      per19=1;
      per20=0;}}
      
      if(per20==0 && totalProfitCal()<=-(levelDev0+levelDev1+levelDev2+levelDev3+levelDev4+levelDev5+levelDev6+levelDev7+levelDev8+levelDev9
      +levelDev10+levelDev11+levelDev12+levelDev13+levelDev14+levelDev15+levelDev16+levelDev17+levelDev18+levelDev19)){
      nextLevelOrder();
       if (per20==4){
      per20=1;}}
         break;  

         }


         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+

         //+------------------------------------------------------------------+
         //| Caclulate the profit/loss in pip Function                        |
         //+------------------------------------------------------------------+
         bool spaceCal(int level)
        {

         int i;
         double test;
         //crossIndexDefine(level);
         for(i=0;i<CROSS_NUMBER;i++)
        {
         PositionSelectByTicket(baseTickets[i][level]);
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         levelDiff[i][level]=-PositionGetDouble(POSITION_PRICE_OPEN)+SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
         if(SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS)==3)
        {
         levelDiff[i][level]=levelDiff[i][level]/100;

         }
         test=levelDiff[i][level];
         }else if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){
         levelDiff[i][level]=PositionGetDouble(POSITION_PRICE_OPEN)-SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
         if(SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS)==3)
        {
         levelDiff[i][level]=levelDiff[i][level]/100;

         }
         test=levelDiff[i][level];
         }else {
         PrintFormat("spaceCal error");
         return(false);
         }
         }

         return(true);
         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| check the condition for next level negative space                |
         //+------------------------------------------------------------------+

         int checkLevel(int currentLevel)
        {

         int nextLevel,i;
         double localPrft=0;
         double sum=0;

         int k=PositionsTotal()-1;
         for(k;k>=0;--k)
        {
         if(!PositionSelectByTicket(PositionGetTicket(k)))
        {
         PrintFormat("Position Close Error = %d",GetLastError());
         }
         localPrft+=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
         }

         if(localPrft<-levelSwitchLoss)
         nextLevel=currentLevel+1;
         // else if (levelDiff[pairIndex[2]][currentLevel] > positiveSpace/10000 )
         //     nextLevel = currentLevel+1;
         else nextLevel=currentLevel;
         if(negcntflag==0)
        {
         spaceCal(currentLevel);
         for(i=0;i<CROSS_NUMBER;i++)
        {
         if(levelDiff[i][currentLevel]<pipNeg)
        {
         sum++;
         }
         }
         if(sum==CROSS_NUMBER)
        {
         sum=0;
         for(i=0;i<CROSS_NUMBER;i++)
        {
         sum+=levelDiff[i][currentLevel];

         }
         if(sum<meanNegetiveCounter/10000)
        {
         negetiveCount++;
         negcntflag=1;
         }
         }
         }

         return nextLevel;
         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| min, max, median pair index finding function                     |
         //+------------------------------------------------------------------+

         void crossIndexDefine(int level)
        {

         int i,maxIndex,minIndex,medianIndex;
         double tempArray[CROSS_NUMBER];

         for(i=0;i<CROSS_NUMBER;i++)
        {
         tempArray[i]=positionVol[i][level];
         }
         maxIndex       = ArrayMaximum(tempArray,0,CROSS_NUMBER);
         minIndex       = ArrayMinimum(tempArray,0,CROSS_NUMBER);

         for(i=0;i<CROSS_NUMBER;i++)
        {
         if(i!=maxIndex && i!=minIndex)
         medianIndex=i;
         }
         pairIndex[0] = minIndex;
         pairIndex[1] = medianIndex;
         pairIndex[2] = maxIndex;



         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| Function for next level order sending     repeating all basket once                      |
         //+------------------------------------------------------------------+
         bool nextLevelOrder(void)
        {

         string tempComment;
         //--   
         //---strat trading
         if(SymbolInfoInteger(EnumToString(crossName1),SYMBOL_DIGITS)!=3){
         spread1=10000*(SymbolInfoDouble(EnumToString(crossName1),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName1),SYMBOL_BID));}
         else{spread1=100*(SymbolInfoDouble(EnumToString(crossName1),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName1),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName2),SYMBOL_DIGITS)!=3){
         spread2=10000*(SymbolInfoDouble(EnumToString(crossName2),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName2),SYMBOL_BID));}
         else{spread2=100*(SymbolInfoDouble(EnumToString(crossName2),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName2),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName3),SYMBOL_DIGITS)!=3){
         spread3=10000*(SymbolInfoDouble(EnumToString(crossName3),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName3),SYMBOL_BID));}
         else{spread3=100*(SymbolInfoDouble(EnumToString(crossName3),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName3),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName4),SYMBOL_DIGITS)!=3){
         spread4=10000*(SymbolInfoDouble(EnumToString(crossName4),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName4),SYMBOL_BID));}
         else{spread4=100*(SymbolInfoDouble(EnumToString(crossName4),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName4),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName5),SYMBOL_DIGITS)!=3){
         spread5=10000*(SymbolInfoDouble(EnumToString(crossName5),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName5),SYMBOL_BID));}
         else{spread5=100*(SymbolInfoDouble(EnumToString(crossName5),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName5),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName6),SYMBOL_DIGITS)!=3){
         spread6=10000*(SymbolInfoDouble(EnumToString(crossName6),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName6),SYMBOL_BID));}
         else{spread6=100*(SymbolInfoDouble(EnumToString(crossName6),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName6),SYMBOL_BID));}
         
         if(spread1>Spread||spread2>Spread||spread3>Spread||spread4>Spread||spread5>Spread||spread6>Spread && ctr = 0)
         {Print("Spread is widen");
         Sleep(6000);}
         else{
         if(per1==0)
        {
        per1=3;
         if(crossName1a!=Null)
        {
         if(crossType1a== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[0][0].Buy(lot1a,EnumToString(crossName1a),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1a==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[0][0].Sell(lot1a,EnumToString(crossName1a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2a!=Null)
        {
         if(crossType2a== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[1][0].Buy(lot2a,EnumToString(crossName2a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2a==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[1][0].Sell(lot2a,EnumToString(crossName2a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3a!=Null)
        {
         if(crossType3a== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[2][0].Buy(lot3a,EnumToString(crossName3a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3a==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[2][0].Sell(lot3a,EnumToString(crossName3a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4a!=Null)
        {
         if(crossType4a== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[3][0].Buy(lot4a,EnumToString(crossName4a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4a==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[3][0].Sell(lot4a,EnumToString(crossName4a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5a!=Null)
        {
         if(crossType5a== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[3][0].Buy(lot5a,EnumToString(crossName5a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5a==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[3][0].Sell(lot5a,EnumToString(crossName5a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6a!=Null)
        {
         if(crossType6a== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[3][0].Buy(lot6a,EnumToString(crossName6a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6a==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName2,"""");
         if(!tradeObj[3][0].Sell(lot6a,EnumToString(crossName6a),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
         per1=4;
         }
///////////////////////////////////////////////////
         if(per2==0)
        {
         per2=3;
         if(crossName1b!=Null)
        {
         if(crossType1b== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[0][0].Buy(lot1b,EnumToString(crossName1b),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1b==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[0][0].Sell(lot1b,EnumToString(crossName1b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2b!=Null)
        {
         if(crossType2b== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[1][0].Buy(lot2b,EnumToString(crossName2b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2b==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[1][0].Sell(lot2b,EnumToString(crossName2b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3b!=Null)
        {
         if(crossType3b== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[2][0].Buy(lot3b,EnumToString(crossName3b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3b==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[2][0].Sell(lot3b,EnumToString(crossName3b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4b!=Null)
        {
         if(crossType4b== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[3][0].Buy(lot4b,EnumToString(crossName4b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4b==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[3][0].Sell(lot4b,EnumToString(crossName4b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5b!=Null)
        {
         if(crossType5b== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[3][0].Buy(lot5b,EnumToString(crossName5b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5b==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[3][0].Sell(lot5b,EnumToString(crossName5b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6b!=Null)
        {
         if(crossType6b== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[3][0].Buy(lot6b,EnumToString(crossName6b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6b==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName3,"""");
         if(!tradeObj[3][0].Sell(lot6b,EnumToString(crossName6b),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per2=4;
         }
         //////////////////////////////////////////////////////
         if(per3==0)
        {
         per3=3;
         if(crossName1c!=Null)
        {
         if(crossType1c== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[0][0].Buy(lot1c,EnumToString(crossName1c),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1c==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[0][0].Sell(lot1c,EnumToString(crossName1c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2c!=Null)
        {
         if(crossType2c== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[1][0].Buy(lot2c,EnumToString(crossName2c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2c==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[1][0].Sell(lot2c,EnumToString(crossName2c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3c!=Null)
        {
         if(crossType3c== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[2][0].Buy(lot3c,EnumToString(crossName3c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3c==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[2][0].Sell(lot3c,EnumToString(crossName3c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4c!=Null)
        {
         if(crossType4c== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[3][0].Buy(lot4c,EnumToString(crossName4c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4c==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[3][0].Sell(lot4c,EnumToString(crossName4c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5c!=Null)
        {
         if(crossType5c== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[3][0].Buy(lot5c,EnumToString(crossName5c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5c==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[3][0].Sell(lot5c,EnumToString(crossName5c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6c!=Null)
        {
         if(crossType6c== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[3][0].Buy(lot6c,EnumToString(crossName6c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6c==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName4,"""");
         if(!tradeObj[3][0].Sell(lot6c,EnumToString(crossName6c),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per3=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per4==0)
        {
         per4=3;
         if(crossName1d!=Null)
        {
         if(crossType1d== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[0][0].Buy(lot1d,EnumToString(crossName1d),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1d==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[0][0].Sell(lot1d,EnumToString(crossName1d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2d!=Null)
        {
         if(crossType2d== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[1][0].Buy(lot2d,EnumToString(crossName2d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2d==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[1][0].Sell(lot2d,EnumToString(crossName2d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3d!=Null)
        {
         if(crossType3d== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[2][0].Buy(lot3d,EnumToString(crossName3d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3d==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[2][0].Sell(lot3d,EnumToString(crossName3d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4d!=Null)
        {
         if(crossType4d== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[3][0].Buy(lot4d,EnumToString(crossName4d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4d==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[3][0].Sell(lot4d,EnumToString(crossName4d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5d!=Null)
        {
         if(crossType5d== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[3][0].Buy(lot5d,EnumToString(crossName5d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5d==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[3][0].Sell(lot5d,EnumToString(crossName5d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6d!=Null)
        {
         if(crossType6d== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[3][0].Buy(lot6d,EnumToString(crossName6d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6d==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName5,"""");
         if(!tradeObj[3][0].Sell(lot6d,EnumToString(crossName6d),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per4=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per5==0)
        {
         per5=3;
         if(crossName1e!=Null)
        {
         if(crossType1e== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[0][0].Buy(lot1e,EnumToString(crossName1e),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1e==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[0][0].Sell(lot1e,EnumToString(crossName1e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2e!=Null)
        {
         if(crossType2e== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[1][0].Buy(lot2e,EnumToString(crossName2e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2e==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[1][0].Sell(lot2e,EnumToString(crossName2e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3e!=Null)
        {
         if(crossType3e== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[2][0].Buy(lot3e,EnumToString(crossName3e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3e==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[2][0].Sell(lot3e,EnumToString(crossName3e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4e!=Null)
        {
         if(crossType4e== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[3][0].Buy(lot4e,EnumToString(crossName4e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4e==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[3][0].Sell(lot4e,EnumToString(crossName4e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5e!=Null)
        {
         if(crossType5e== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[3][0].Buy(lot5e,EnumToString(crossName5e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5e==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[3][0].Sell(lot5e,EnumToString(crossName5e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6e!=Null)
        {
         if(crossType6e== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[3][0].Buy(lot6e,EnumToString(crossName6e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6e==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName6,"""");
         if(!tradeObj[3][0].Sell(lot6e,EnumToString(crossName6e),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per5=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per6==0)
        {
         per6=3;
         if(crossName1f!=Null)
        {
         if(crossType1f== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[0][0].Buy(lot1f,EnumToString(crossName1f),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1f==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[0][0].Sell(lot1f,EnumToString(crossName1f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2f!=Null)
        {
         if(crossType2f== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[1][0].Buy(lot2f,EnumToString(crossName2f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2f==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[1][0].Sell(lot2f,EnumToString(crossName2f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3f!=Null)
        {
         if(crossType3f== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[2][0].Buy(lot3f,EnumToString(crossName3f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3f==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[2][0].Sell(lot3f,EnumToString(crossName3f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4f!=Null)
        {
         if(crossType4f== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[3][0].Buy(lot4f,EnumToString(crossName4f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4f==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[3][0].Sell(lot4f,EnumToString(crossName4f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5f!=Null)
        {
         if(crossType5f== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[3][0].Buy(lot5f,EnumToString(crossName5f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5f==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[3][0].Sell(lot5f,EnumToString(crossName5f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6f!=Null)
        {
         if(crossType6f== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[3][0].Buy(lot6f,EnumToString(crossName6f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6f==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName7,"""");
         if(!tradeObj[3][0].Sell(lot6f,EnumToString(crossName6f),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per6=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per7==0)
        {
         per7=3;
         if(crossName1g!=Null)
        {
         if(crossType1g== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[0][0].Buy(lot1g,EnumToString(crossName1g),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1g==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[0][0].Sell(lot1g,EnumToString(crossName1g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2g!=Null)
        {
         if(crossType2g== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[1][0].Buy(lot2g,EnumToString(crossName2g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2g==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[1][0].Sell(lot2g,EnumToString(crossName2g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3g!=Null)
        {
         if(crossType3g== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[2][0].Buy(lot3g,EnumToString(crossName3g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3g==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[2][0].Sell(lot3g,EnumToString(crossName3g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4g!=Null)
        {
         if(crossType4g== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[3][0].Buy(lot4g,EnumToString(crossName4g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4g==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[3][0].Sell(lot4g,EnumToString(crossName4g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5g!=Null)
        {
         if(crossType5g== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[3][0].Buy(lot5g,EnumToString(crossName5g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5g==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[3][0].Sell(lot5g,EnumToString(crossName5g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6g!=Null)
        {
         if(crossType6g== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[3][0].Buy(lot6g,EnumToString(crossName6g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6g==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName8,"""");
         if(!tradeObj[3][0].Sell(lot6g,EnumToString(crossName6g),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per7=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per8==0)
        {
         per8=3;
         if(crossName1h!=Null)
        {
         if(crossType1h== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[0][0].Buy(lot1h,EnumToString(crossName1h),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1h==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[0][0].Sell(lot1h,EnumToString(crossName1h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2h!=Null)
        {
         if(crossType2h== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[1][0].Buy(lot2h,EnumToString(crossName2h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2h==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[1][0].Sell(lot2h,EnumToString(crossName2h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3h!=Null)
        {
         if(crossType3h== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[2][0].Buy(lot3h,EnumToString(crossName3h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3h==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[2][0].Sell(lot3h,EnumToString(crossName3h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4h!=Null)
        {
         if(crossType4h== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[3][0].Buy(lot4h,EnumToString(crossName4h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4h==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[3][0].Sell(lot4h,EnumToString(crossName4h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5h!=Null)
        {
         if(crossType5h== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[3][0].Buy(lot5h,EnumToString(crossName5h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5h==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[3][0].Sell(lot5h,EnumToString(crossName5h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6h!=Null)
        {
         if(crossType6h== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[3][0].Buy(lot6h,EnumToString(crossName6h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6h==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName9,"""");
         if(!tradeObj[3][0].Sell(lot6h,EnumToString(crossName6h),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per8=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per9==0)
        {
         per9=3;
         if(crossName1i!=Null)
        {
         if(crossType1i== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[0][0].Buy(lot1i,EnumToString(crossName1i),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1i==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[0][0].Sell(lot1i,EnumToString(crossName1i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2i!=Null)
        {
         if(crossType2i== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[1][0].Buy(lot2i,EnumToString(crossName2i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2i==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[1][0].Sell(lot2i,EnumToString(crossName2i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3i!=Null)
        {
         if(crossType3i== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[2][0].Buy(lot3i,EnumToString(crossName3i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3i==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[2][0].Sell(lot3i,EnumToString(crossName3i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4i!=Null)
        {
         if(crossType4i== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[3][0].Buy(lot4i,EnumToString(crossName4i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4i==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[3][0].Sell(lot4i,EnumToString(crossName4i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5i!=Null)
        {
         if(crossType5i== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[3][0].Buy(lot5i,EnumToString(crossName5i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5i==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[3][0].Sell(lot5i,EnumToString(crossName5i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6i!=Null)
        {
         if(crossType6i== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[3][0].Buy(lot6i,EnumToString(crossName6i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6i==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName10,"""");
         if(!tradeObj[3][0].Sell(lot6i,EnumToString(crossName6i),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per9=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per10==0)
        {
         per10=3;
         if(crossName1j!=Null)
        {
         if(crossType1j== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[0][0].Buy(lot1j,EnumToString(crossName1j),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1j==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[0][0].Sell(lot1j,EnumToString(crossName1j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2j!=Null)
        {
         if(crossType2j== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[1][0].Buy(lot2j,EnumToString(crossName2j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2j==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[1][0].Sell(lot2j,EnumToString(crossName2j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3j!=Null)
        {
         if(crossType3j== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[2][0].Buy(lot3j,EnumToString(crossName3j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3j==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[2][0].Sell(lot3j,EnumToString(crossName3j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4j!=Null)
        {
         if(crossType4j== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[3][0].Buy(lot4j,EnumToString(crossName4j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4j==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[3][0].Sell(lot4j,EnumToString(crossName4j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5j!=Null)
        {
         if(crossType5j== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[3][0].Buy(lot5j,EnumToString(crossName5j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5j==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[3][0].Sell(lot5j,EnumToString(crossName5j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6j!=Null)
        {
         if(crossType6j== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[3][0].Buy(lot6j,EnumToString(crossName6j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6j==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName11,"""");
         if(!tradeObj[3][0].Sell(lot6j,EnumToString(crossName6j),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per10=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per11==0)
        {
         per11=3;
         if(crossName1k!=Null)
        {
         if(crossType1k== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[0][0].Buy(lot1k,EnumToString(crossName1k),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1k==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[0][0].Sell(lot1k,EnumToString(crossName1k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2k!=Null)
        {
         if(crossType2k== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[1][0].Buy(lot2k,EnumToString(crossName2k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2k==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[1][0].Sell(lot2k,EnumToString(crossName2k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3k!=Null)
        {
         if(crossType3k== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[2][0].Buy(lot3k,EnumToString(crossName3k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3k==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[2][0].Sell(lot3k,EnumToString(crossName3k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4k!=Null)
        {
         if(crossType4k== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[3][0].Buy(lot4k,EnumToString(crossName4k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4k==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[3][0].Sell(lot4k,EnumToString(crossName4k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5k!=Null)
        {
         if(crossType5k== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[3][0].Buy(lot5k,EnumToString(crossName5k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5k==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[3][0].Sell(lot5k,EnumToString(crossName5k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6k!=Null)
        {
         if(crossType6k== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[3][0].Buy(lot6k,EnumToString(crossName6k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6k==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName12,"""");
         if(!tradeObj[3][0].Sell(lot6k,EnumToString(crossName6k),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per11=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per12==0)
        {
         per12=3;
         if(crossName1l!=Null)
        {
         if(crossType1l== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[0][0].Buy(lot1l,EnumToString(crossName1l),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1l==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[0][0].Sell(lot1l,EnumToString(crossName1l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2l!=Null)
        {
         if(crossType2l== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[1][0].Buy(lot2l,EnumToString(crossName2l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2l==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[1][0].Sell(lot2l,EnumToString(crossName2l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3l!=Null)
        {
         if(crossType3l== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[2][0].Buy(lot3l,EnumToString(crossName3l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3l==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[2][0].Sell(lot3l,EnumToString(crossName3l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4l!=Null)
        {
         if(crossType4l== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[3][0].Buy(lot4l,EnumToString(crossName4l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4l==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[3][0].Sell(lot4l,EnumToString(crossName4l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5l!=Null)
        {
         if(crossType5l== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[3][0].Buy(lot5l,EnumToString(crossName5l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5l==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[3][0].Sell(lot5l,EnumToString(crossName5l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6l!=Null)
        {
         if(crossType6l== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[3][0].Buy(lot6l,EnumToString(crossName6l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6l==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName13,"""");
         if(!tradeObj[3][0].Sell(lot6l,EnumToString(crossName6l),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per12=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per13==0)
        {
         per13=3;
         if(crossName1m!=Null)
        {
         if(crossType1m== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[0][0].Buy(lot1m,EnumToString(crossName1m),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1m==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[0][0].Sell(lot1m,EnumToString(crossName1m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2m!=Null)
        {
         if(crossType2m== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[1][0].Buy(lot2m,EnumToString(crossName2m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2m==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[1][0].Sell(lot2m,EnumToString(crossName2m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3m!=Null)
        {
         if(crossType3m== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[2][0].Buy(lot3m,EnumToString(crossName3m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3m==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[2][0].Sell(lot3m,EnumToString(crossName3m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4m!=Null)
        {
         if(crossType4m== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[3][0].Buy(lot4m,EnumToString(crossName4m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4m==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[3][0].Sell(lot4m,EnumToString(crossName4m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5m!=Null)
        {
         if(crossType5m== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[3][0].Buy(lot5m,EnumToString(crossName5m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5m==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[3][0].Sell(lot5m,EnumToString(crossName5m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6m!=Null)
        {
         if(crossType6m== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[3][0].Buy(lot6m,EnumToString(crossName6m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6m==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName14,"""");
         if(!tradeObj[3][0].Sell(lot6m,EnumToString(crossName6m),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per13=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per14==0)
        {
         per14=3;
         if(crossName1n!=Null)
        {
         if(crossType1n== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[0][0].Buy(lot1n,EnumToString(crossName1n),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1n==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[0][0].Sell(lot1n,EnumToString(crossName1n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2n!=Null)
        {
         if(crossType2n== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[1][0].Buy(lot2n,EnumToString(crossName2n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2n==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[1][0].Sell(lot2n,EnumToString(crossName2n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3n!=Null)
        {
         if(crossType3n== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[2][0].Buy(lot3n,EnumToString(crossName3n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3n==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[2][0].Sell(lot3n,EnumToString(crossName3n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4n!=Null)
        {
         if(crossType4n== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[3][0].Buy(lot4n,EnumToString(crossName4n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4n==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[3][0].Sell(lot4n,EnumToString(crossName4n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5n!=Null)
        {
         if(crossType5n== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[3][0].Buy(lot5n,EnumToString(crossName5n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5n==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[3][0].Sell(lot5n,EnumToString(crossName5n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6n!=Null)
        {
         if(crossType6n== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[3][0].Buy(lot6n,EnumToString(crossName6n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6n==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName15,"""");
         if(!tradeObj[3][0].Sell(lot6n,EnumToString(crossName6n),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per14=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per15==0)
        {
         per15=3;
         if(crossName1o!=Null)
        {
         if(crossType1o== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[0][0].Buy(lot1o,EnumToString(crossName1o),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1o==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[0][0].Sell(lot1o,EnumToString(crossName1o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2o!=Null)
        {
         if(crossType2o== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[1][0].Buy(lot2o,EnumToString(crossName2o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2o==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[1][0].Sell(lot2o,EnumToString(crossName2o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3o!=Null)
        {
         if(crossType3o== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[2][0].Buy(lot3o,EnumToString(crossName3o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3o==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[2][0].Sell(lot3o,EnumToString(crossName3o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4o!=Null)
        {
         if(crossType4o== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[3][0].Buy(lot4o,EnumToString(crossName4o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4o==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[3][0].Sell(lot4o,EnumToString(crossName4o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5o!=Null)
        {
         if(crossType5o== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[3][0].Buy(lot5o,EnumToString(crossName5o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5o==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[3][0].Sell(lot5o,EnumToString(crossName5o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6o!=Null)
        {
         if(crossType6o== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[3][0].Buy(lot6o,EnumToString(crossName6o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6o==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName16,"""");
         if(!tradeObj[3][0].Sell(lot6o,EnumToString(crossName6o),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per15=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per16==0)
        {
         per16=3;
         if(crossName1p!=Null)
        {
         if(crossType1p== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[0][0].Buy(lot1p,EnumToString(crossName1p),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1p==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[0][0].Sell(lot1p,EnumToString(crossName1p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2p!=Null)
        {
         if(crossType2p== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[1][0].Buy(lot2p,EnumToString(crossName2p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2p==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[1][0].Sell(lot2p,EnumToString(crossName2p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3p!=Null)
        {
         if(crossType3p== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[2][0].Buy(lot3p,EnumToString(crossName3p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3p==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[2][0].Sell(lot3p,EnumToString(crossName3p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4p!=Null)
        {
         if(crossType4p== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[3][0].Buy(lot4p,EnumToString(crossName4p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4p==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[3][0].Sell(lot4p,EnumToString(crossName4p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5p!=Null)
        {
         if(crossType5p== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[3][0].Buy(lot5p,EnumToString(crossName5p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5p==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[3][0].Sell(lot5p,EnumToString(crossName5p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6p!=Null)
        {
         if(crossType6p== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[3][0].Buy(lot6p,EnumToString(crossName6p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6p==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName17,"""");
         if(!tradeObj[3][0].Sell(lot6p,EnumToString(crossName6p),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per16=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per17==0)
        {
         per17=3;
         if(crossName1q!=Null)
        {
         if(crossType1q== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[0][0].Buy(lot1q,EnumToString(crossName1q),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1q==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[0][0].Sell(lot1q,EnumToString(crossName1q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2q!=Null)
        {
         if(crossType2q== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[1][0].Buy(lot2q,EnumToString(crossName2q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2q==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[1][0].Sell(lot2q,EnumToString(crossName2q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3q!=Null)
        {
         if(crossType3q== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[2][0].Buy(lot3q,EnumToString(crossName3q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3q==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[2][0].Sell(lot3q,EnumToString(crossName3q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4q!=Null)
        {
         if(crossType4q== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[3][0].Buy(lot4q,EnumToString(crossName4q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4q==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[3][0].Sell(lot4q,EnumToString(crossName4q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5q!=Null)
        {
         if(crossType5q== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[3][0].Buy(lot5q,EnumToString(crossName5q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5q==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[3][0].Sell(lot5q,EnumToString(crossName5q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6q!=Null)
        {
         if(crossType6q== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[3][0].Buy(lot6q,EnumToString(crossName6q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6q==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName18,"""");
         if(!tradeObj[3][0].Sell(lot6q,EnumToString(crossName6q),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per17=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per18==0)
        {
         per18=3;
         if(crossName1r!=Null)
        {
         if(crossType1r== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[0][0].Buy(lot1r,EnumToString(crossName1r),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1r==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[0][0].Sell(lot1r,EnumToString(crossName1r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2r!=Null)
        {
         if(crossType2r== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[1][0].Buy(lot2r,EnumToString(crossName2r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2r==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[1][0].Sell(lot2r,EnumToString(crossName2r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3r!=Null)
        {
         if(crossType3r== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[2][0].Buy(lot3r,EnumToString(crossName3r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3r==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[2][0].Sell(lot3r,EnumToString(crossName3r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4r!=Null)
        {
         if(crossType4r== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[3][0].Buy(lot4r,EnumToString(crossName4r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4r==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[3][0].Sell(lot4r,EnumToString(crossName4r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5r!=Null)
        {
         if(crossType5r== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[3][0].Buy(lot5r,EnumToString(crossName5r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5r==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[3][0].Sell(lot5r,EnumToString(crossName5r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6r!=Null)
        {
         if(crossType6r== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[3][0].Buy(lot6r,EnumToString(crossName6r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6r==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName19,"""");
         if(!tradeObj[3][0].Sell(lot6r,EnumToString(crossName6r),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per18=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per19==0)
        {
         per19=3;
         if(crossName1s!=Null)
        {
         if(crossType1s== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[0][0].Buy(lot1s,EnumToString(crossName1s),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1s==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[0][0].Sell(lot1s,EnumToString(crossName1s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2s!=Null)
        {
         if(crossType2s== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[1][0].Buy(lot2s,EnumToString(crossName2s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2s==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[1][0].Sell(lot2s,EnumToString(crossName2s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3s!=Null)
        {
         if(crossType3s== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[2][0].Buy(lot3s,EnumToString(crossName3s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3s==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[2][0].Sell(lot3s,EnumToString(crossName3s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4s!=Null)
        {
         if(crossType4s== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[3][0].Buy(lot4s,EnumToString(crossName4s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4s==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[3][0].Sell(lot4s,EnumToString(crossName4s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5s!=Null)
        {
         if(crossType5s== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[3][0].Buy(lot5s,EnumToString(crossName5s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5s==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[3][0].Sell(lot5s,EnumToString(crossName5s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6s!=Null)
        {
         if(crossType6s== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[3][0].Buy(lot6s,EnumToString(crossName6s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6s==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName20,"""");
         if(!tradeObj[3][0].Sell(lot6s,EnumToString(crossName6s),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per19=4;
         }
         ///////////////////////////////////////////////////////////////
         if(per20==0)
        {
         per20=3;
         if(crossName1t!=Null)
        {
         if(crossType1t== BUY)
        {
         tempComment=NULL;
        StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[0][0].Buy(lot1t,EnumToString(crossName1t),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1t==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[0][0].Sell(lot1t,EnumToString(crossName1t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2t!=Null)
        {
         if(crossType2t== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[1][0].Buy(lot2t,EnumToString(crossName2t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2t==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[1][0].Sell(lot2t,EnumToString(crossName2t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3t!=Null)
        {
         if(crossType3t== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[2][0].Buy(lot3t,EnumToString(crossName3t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3t==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[2][0].Sell(lot3t,EnumToString(crossName3t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4t!=Null)
        {
         if(crossType4t== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[3][0].Buy(lot4t,EnumToString(crossName4t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4t==SELL){
         tempComment=NULL;
        StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[3][0].Sell(lot4t,EnumToString(crossName4t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5t!=Null)
        {
         if(crossType5t== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[3][0].Buy(lot5t,EnumToString(crossName5t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5t==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[3][0].Sell(lot5t,EnumToString(crossName5t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6t!=Null)
        {
         if(crossType6t== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[3][0].Buy(lot6t,EnumToString(crossName6t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6t==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName21,"""");
         if(!tradeObj[3][0].Sell(lot6t,EnumToString(crossName6t),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }
          per20=4;
         }}
         ////////////////////////////////////////////////////////////////////////////////////
         /////////////////////////////////////////////////////////////////////////////////////


         if(a1==3)
        {
         a2=0;
         a1=4;
         }

         if(a2==3)
        {
         a3=0;
         a2=4;
         }

         if(a3==3)
        {
         a4=0;
         a3=4;
         }

         if(a4==3)
        {
         a5=0;
         a4=4;
         }

         if(a5==3)
        {
         a6=0;
         a5=4;
         }

         if(a6==3)
        {
         a7=0;
         a6=4;
         }

         if(a7==3)
        {
         a8=0;
         a7=4;
         }

         if(a8==3)
        {
         a9=0;
         a8=4;
         }

         if(a9==3)
        {
         a10=0;
         a9=4;
         }

         if(a10==3)
        {
         a11=0;
         a10=4;
         }

         if(a11==3)
        {
         a12=0;
         a11=4;
         }

         if(a12==3)
        {
         a13=0;
         a12=4;
         }

         if(a13==3)
        {
         a14=0;
         a13=4;
         }

         if(a14==3)
        {
         a15=0;
         a14=4;
         }

         if(a15==3)
        {
         a16=0;
         a15=4;
         }

         if(a16==3)
        {
         a17=0;
         a16=4;
         }

         if(a17==3)
        {
         a18=0;
         a17=4;
         }

         if(a18==3)
        {
         a19=0;
         a18=4;
         }

         if(a19==3)
        {
         a20=0;
         a19=4;
         }
         ////////////////////////////////////

         return(true);
         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| Function for calculating new level volumes                       |
         //+------------------------------------------------------------------+
         void nextVolCal(int level)
        {
         int i,temp;

         for(i=0;i<CROSS_NUMBER;i++)
        {


         if(a1==0)
        {
         positionVol[0][0]=lot1a;

         positionVol[1][0]=lot2a;

         positionVol[2][0]=lot3a;

         positionVol[3][0]=lot4a;

         positionVol[4][0]=lot5a;

         positionVol[5][0]=lot6a;

         a1=3;
         }

         if(a2==0)
        {
         positionVol[0][0]=lot1b;

         positionVol[1][0]=lot2b;

         positionVol[2][0]=lot3b;

         positionVol[3][0]=lot4b;

         positionVol[4][0]=lot5b;

         positionVol[5][0]=lot6b;

         a2=3;
         }

         if(a3==0)
        {
         positionVol[0][0]=lot1c;

         positionVol[1][0]=lot2c;

         positionVol[2][0]=lot3c;

         positionVol[3][0]=lot4c;

         positionVol[4][0]=lot5c;

         positionVol[5][0]=lot6c;

         a3=3;
         }

         if(a4==0)
        {
         positionVol[0][0]=lot1d;

         positionVol[1][0]=lot2d;

         positionVol[2][0]=lot3d;

         positionVol[3][0]=lot4d;

         positionVol[4][0]=lot5d;

         positionVol[5][0]=lot6d;

         a4=3;
         }

         if(a5==0)
        {
         positionVol[0][0]=lot1e;

         positionVol[1][0]=lot2e;

         positionVol[2][0]=lot3e;

         positionVol[3][0]=lot4e;

         positionVol[4][0]=lot5e;

         positionVol[5][0]=lot6e;

         a5=3;
         }

         if(a6==0)
        {
         positionVol[0][0]=lot1f;

         positionVol[1][0]=lot2f;

         positionVol[2][0]=lot3f;

         positionVol[3][0]=lot4f;

         positionVol[4][0]=lot5f;

         positionVol[5][0]=lot6f;

         a6=3;
         }

         if(a7==0)
        {
         positionVol[0][0]=lot1g;

         positionVol[1][0]=lot2g;

         positionVol[2][0]=lot3g;

         positionVol[3][0]=lot4g;

         positionVol[4][0]=lot5g;

         positionVol[5][0]=lot6g;

         a7=3;
         }

         if(a8==0)
        {
         positionVol[0][0]=lot1h;

         positionVol[1][0]=lot2h;

         positionVol[2][0]=lot3h;

         positionVol[3][0]=lot4h;

         positionVol[4][0]=lot5h;

         positionVol[5][0]=lot6h;

         a8=3;
         }

         if(a9==0)
        {
         positionVol[0][0]=lot1i;

         positionVol[1][0]=lot2i;

         positionVol[2][0]=lot3i;

         positionVol[3][0]=lot4i;

         positionVol[4][0]=lot5i;

         positionVol[5][0]=lot6i;

         a9=3;
         }

         if(a10==0)
        {
         positionVol[0][0]=lot1j;

         positionVol[1][0]=lot2j;

         positionVol[2][0]=lot3j;

         positionVol[3][0]=lot4j;

         positionVol[4][0]=lot5j;

         positionVol[5][0]=lot6j;

         a10=3;
         }

         if(a11==0)
        {
         positionVol[0][0]=lot1k;

         positionVol[1][0]=lot2k;

         positionVol[2][0]=lot3k;

         positionVol[3][0]=lot4k;

         positionVol[4][0]=lot5k;

         positionVol[5][0]=lot6k;

         a11=3;
         }

         if(a12==0)
        {
         positionVol[0][0]=lot1l;

         positionVol[1][0]=lot2l;

         positionVol[2][0]=lot3l;

         positionVol[3][0]=lot4l;

         positionVol[4][0]=lot5l;

         positionVol[5][0]=lot6l;

         a12=3;
         }

         if(a13==0)
        {
         positionVol[0][0]=lot1m;

         positionVol[1][0]=lot2m;

         positionVol[2][0]=lot3m;

         positionVol[3][0]=lot4m;

         positionVol[4][0]=lot5m;

         positionVol[5][0]=lot6m;

         a13=3;
         }

         if(a14==0)
        {
         positionVol[0][0]=lot1n;

         positionVol[1][0]=lot2n;

         positionVol[2][0]=lot3n;

         positionVol[3][0]=lot4n;

         positionVol[4][0]=lot5n;

         positionVol[5][0]=lot6n;

         a14=3;
         }

         if(a15==0)
        {
         positionVol[0][0]=lot1o;

         positionVol[1][0]=lot2o;

         positionVol[2][0]=lot3o;

         positionVol[3][0]=lot4o;

         positionVol[4][0]=lot5o;

         positionVol[5][0]=lot6o;

         a15=3;
         }

         if(a16==0)
        {
         positionVol[0][0]=lot1p;

         positionVol[1][0]=lot2p;

         positionVol[2][0]=lot3p;

         positionVol[3][0]=lot4p;

         positionVol[4][0]=lot5p;

         positionVol[5][0]=lot6p;

         a16=3;
         }

         if(a17==0)
        {
         positionVol[0][0]=lot1q;

         positionVol[1][0]=lot2q;

         positionVol[2][0]=lot3q;

         positionVol[3][0]=lot4q;

         positionVol[4][0]=lot5q;

         positionVol[5][0]=lot6q;

         a17=3;
         }

         if(a18==0)
        {
         positionVol[0][0]=lot1r;

         positionVol[1][0]=lot2r;

         positionVol[2][0]=lot3r;

         positionVol[3][0]=lot4r;

         positionVol[4][0]=lot5r;

         positionVol[5][0]=lot6r;

         a18=3;
         }

         if(a19==0)
        {
         positionVol[0][0]=lot1s;

         positionVol[1][0]=lot2s;

         positionVol[2][0]=lot3s;

         positionVol[3][0]=lot4s;

         positionVol[4][0]=lot5s;

         positionVol[5][0]=lot6s;

         a19=3;
         }

         if(a20==0)
        {
         positionVol[0][0]=lot1t;

         positionVol[1][0]=lot2t;

         positionVol[2][0]=lot3t;

         positionVol[3][0]=lot4t;

         positionVol[4][0]=lot5t;

         positionVol[5][0]=lot6t;

         a20=3;
         }

         /////////////////////////////////////////



         }
         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| check repeat pairs condition                                     |
         //+------------------------------------------------------------------+

         void checkRepeat(int level)
        {
         int i;
         double test;
         //for(j=0;j<=level;j++){ 
         crossIndexDefine(level);  //in order to define the max and min   
         for(i=0;i<CROSS_NUMBER;i++)
        {

         if(levelDiff[pairIndex[i]][level]/(repeatNumber[pairIndex[i]][level]+1)<repeatTheresholds[pairIndex[i]][level][0])
        {
         test = levelDiff[pairIndex[i]][level];
         test = repeatTheresholds[pairIndex[i]][level][0];
         repeatPairIndex[pairIndex[i]][level]=1; //1 means low thereshold
         repeatNumber[pairIndex[i]][level]++;
         }else if(levelDiff[pairIndex[i]][level]/(repeatNumber[pairIndex[i]][level]+1)>repeatTheresholds[pairIndex[i]][level][1]){ //high thereshold is hited
         test = repeatTheresholds[pairIndex[i]][level][1];
         test = levelDiff[pairIndex[i]][level];
         repeatPairIndex[pairIndex[i]][level]=2; //2 means high thereshold
         repeatNumber[pairIndex[i]][level]++;
         }else{// no thereshold hited
         test=levelDiff[pairIndex[i]][level];
         repeatPairIndex[pairIndex[i]][level]=0;
         }
         //next pair

         }

         //}
         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| check reapeat pairs condition                                    |
         //+------------------------------------------------------------------+
         void  assignNewRepeatTheresholds(int level)
        {

         crossIndexDefine(level+1);  //in order to define the max and min  
         repeatTheresholds[pairIndex[0]][level+1][0] = MINVOL_LOW_REPEAT_THERESHOLD;
         repeatTheresholds[pairIndex[0]][level+1][1] = MINVOL_HIGH_REPEAT_THERESHOLD;
         repeatTheresholds[pairIndex[1]][level+1][0] = MEDIANVOL_LOW_REPEAT_THERESHOLD;
         repeatTheresholds[pairIndex[1]][level+1][1] = MEDIANVOL_HIGH_REPEAT_THERESHOLD;
         repeatTheresholds[pairIndex[2]][level+1][0] = MAXVOL_LOW_REPEAT_THERESHOLD;
         repeatTheresholds[pairIndex[2]][level+1][1] = MAXVOL_HIGH_REPEAT_THERESHOLD;

         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| Total profit calculator Function                                 |
         //+------------------------------------------------------------------+
         double totalProfitCal(void)
        {

         int total=PositionsTotal();
         double profit=0;
         for(int i=total-1;i>=0;i--)
        {
         if(PositionGetTicket(i)>0)
        {
         if(PositionGetInteger(POSITION_MAGIC)==Magic)
        {
        if(SWAP==0){
         profit+=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);}
         else{ if (SWAP==1){profit+=PositionGetDouble(POSITION_PROFIT);}}//*********//commision is omited
         }
         }
         }
         return profit;

         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| Close all positions Function                                     |
         //+------------------------------------------------------------------+
         bool closeAllPositions(void)
        {
         int k=PositionsTotal()-1;
         for(k;k>=0;--k)
        {

         if(PositionGetTicket(k)>0)
        {
         if(PositionGetInteger(POSITION_MAGIC)==Magic)
        {

         closeObj.PositionClose(PositionGetTicket(k));
         Sleep(10);
         }
         }

         }

         a=0;
         a1=0;
         a2=1;
         a3=1;
         a4=1;
         a5=1;
         a6=1;
         a7=1;
         a8=1;
         a9=1;
         a10=1;
         a11=1;
         a12=1;
         a13=1;
         a14=1;
         a15=1;
         a16=1;
         a17=1;
         a18=1;
         a19=1;
         a20=1;
         //////////////////////

         return(true);

         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| Initialize Variabels Function                                    |
         //+-----------------------  -----------------------------------------+
         void initVariable(void)
        {

         int i,j;
         levelSwitchLoss=levelSpace[0];
         for(i=0;i<CROSS_NUMBER;i++)
        {
         for(j=0;j<MAX_LEVEL;j++)
        {
         levelDiff[0][j]       =0;
         repeatNumber[0][j]    =0;
         repeatPairIndex[0][j] =0;

         levelDiff[1][j]       =0;
         repeatNumber[1][j]    =0;
         repeatPairIndex[1][j] =0;

         levelDiff[2][j]       =0;
         repeatNumber[2][j]    =0;
         repeatPairIndex[2][j] =0;

         levelDiff[3][j]       =0;
         repeatNumber[3][j]    =0;
         repeatPairIndex[3][j] =0;
         }
         }

         }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
         //+------------------------------------------------------------------+
         //| Level0 Trade Function                                            |
         //+------------------------------------------------------------------+
         bool level0Trade(void)
        {

         string tempComment;
         //--   
         //---strat trading
if(SymbolInfoInteger(EnumToString(crossName1),SYMBOL_DIGITS)!=3){
         spread1=10000*(SymbolInfoDouble(EnumToString(crossName1),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName1),SYMBOL_BID));}
         else{spread1=100*(SymbolInfoDouble(EnumToString(crossName1),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName1),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName2),SYMBOL_DIGITS)!=3){
         spread2=10000*(SymbolInfoDouble(EnumToString(crossName2),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName2),SYMBOL_BID));}
         else{spread2=100*(SymbolInfoDouble(EnumToString(crossName2),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName2),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName3),SYMBOL_DIGITS)!=3){
         spread3=10000*(SymbolInfoDouble(EnumToString(crossName3),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName3),SYMBOL_BID));}
         else{spread3=100*(SymbolInfoDouble(EnumToString(crossName3),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName3),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName4),SYMBOL_DIGITS)!=3){
         spread4=10000*(SymbolInfoDouble(EnumToString(crossName4),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName4),SYMBOL_BID));}
         else{spread4=100*(SymbolInfoDouble(EnumToString(crossName4),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName4),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName5),SYMBOL_DIGITS)!=3){
         spread5=10000*(SymbolInfoDouble(EnumToString(crossName5),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName5),SYMBOL_BID));}
         else{spread5=100*(SymbolInfoDouble(EnumToString(crossName5),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName5),SYMBOL_BID));}
         
         if(SymbolInfoInteger(EnumToString(crossName6),SYMBOL_DIGITS)!=3){
         spread6=10000*(SymbolInfoDouble(EnumToString(crossName6),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName6),SYMBOL_BID));}
         else{spread6=100*(SymbolInfoDouble(EnumToString(crossName6),SYMBOL_ASK)-SymbolInfoDouble(EnumToString(crossName6),SYMBOL_BID));}
         
         if(spread1>Spread||spread2>Spread||spread3>Spread||spread4>Spread||spread5>Spread||spread6>Spread)
         {Print("Spread is widen");
         Sleep(6000);
         }
         else{per0=1;

         if(crossName1!=Null)
        {
         if(crossType1== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[0][0].Buy(initVol1,EnumToString(crossName1),0,0,0,tempComment))
        { //cross1
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         else tradeObj[2][0].ResultDeal();                                                   //to let the orders execute prior to going calculation of level , if no time is given the level may become -1!! and array error occured  

         }else if(crossType1==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[0][0].Sell(initVol1,EnumToString(crossName1),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross1         
         }
         tradeObj[0][0].SetExpertMagicNumber(Magic);
         baseTickets[0][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName2!=Null)
        {
         if(crossType2== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[1][0].Buy(initVol2,EnumToString(crossName2),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2       
         }else if(crossType2==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[1][0].Sell(initVol2,EnumToString(crossName2),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }//cross2         
         }
         tradeObj[1][0].SetExpertMagicNumber(Magic);
         baseTickets[1][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName3!=Null)
        {
         if(crossType3== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[2][0].Buy(initVol3,EnumToString(crossName3),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType3==SELL){
         tempComment=NULL;
         StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[2][0].Sell(initVol3,EnumToString(crossName3),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[2][0].SetExpertMagicNumber(Magic);
         baseTickets[2][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName4!=Null)
        {
         if(crossType4== BUY)
        {
         tempComment=NULL;
         StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[3][0].Buy(initVol4,EnumToString(crossName4),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType4==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[3][0].Sell(initVol4,EnumToString(crossName4),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[3][0].SetExpertMagicNumber(Magic);
         baseTickets[3][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName5!=Null)
        {
         if(crossType5== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[3][0].Buy(initVol5,EnumToString(crossName5),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType5==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[3][0].Sell(initVol5,EnumToString(crossName5),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[4][0].SetExpertMagicNumber(Magic);
         baseTickets[4][0]=PositionGetTicket(PositionsTotal()-1);
         }

         if(crossName6!=Null)
        {
         if(crossType6== BUY)
        {
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[3][0].Buy(initVol6,EnumToString(crossName6),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }
         }else if(crossType6==SELL){
         tempComment=NULL;
          StringConcatenate(tempComment,basketName1,"""");
         if(!tradeObj[3][0].Sell(initVol6,EnumToString(crossName6),0,0,0,tempComment))
        {
         PrintFormat("Order Error Error = %d",GetLastError());
         }

         }
         tradeObj[5][0].SetExpertMagicNumber(Magic);
         baseTickets[5][0]=PositionGetTicket(PositionsTotal()-1);
         }}



         return(true);


         }
//+------------------------------------------------------------------+
