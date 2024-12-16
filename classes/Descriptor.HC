
#ifndef DESC 
#define DESC 0

Cd(__DIR__);;

#include "../utilities/concat.HC"


$ID,2$$ID,-2$#define RD_NUM 10


union Descriptor{
$ID,2$/* This one will hold a random statement 
and a probability of its occurence */
I64 desc;
I64 prob;
$ID,-2$};

Descriptor InitDescriptor(I64 d, I64 p) {
$ID,2$Descriptor ndesc;
ndesc.desc = d;
ndesc.prob = p;
return ndesc;
$ID,-2$}


/*Descriptors for rooms*/

U0 FillRoomsDesc(Descriptor* rd) {
$ID,2$rd[0] = InitDescriptor
$ID,2$("is bright, but you cannot identify the light source", 50);
$ID,-2$rd[1] = InitDescriptor
$ID,2$("is perfectly forgettable", 30);
$ID,-2$rd[2] = InitDescriptor
$ID,2$("feels cold", 70);
$ID,-2$rd[3] = InitDescriptor
$ID,2$("fills you with a sentiment of belonging", 20);
$ID,2$$ID,-2$$ID,-2$rd[4] = InitDescriptor
$ID,2$("smells like smoke", 40);
$ID,-2$rd[5] = InitDescriptor
$ID,2$("is shaped impractically for furnishing", 40);
$ID,-2$rd[6] = InitDescriptor
$ID,2$("is messy", 60);
$ID,-2$rd[7] = InitDescriptor
$ID,2$("has an aura that weighs heavy on your soul", 50);
$ID,-2$rd[8] = InitDescriptor
$ID,2$("will probably oison your soul if you remain here long enough", 100/RD_NUM);
$ID,-2$rd[9] = InitDescriptor
$ID,2$("reminds you of home", 100/RD_NUM);
$ID,-2$$ID,-2$}

Descriptor RoomsDesc[RD_NUM];
FillRoomsDesc[RoomsDesc];

$ID,2$$ID,-2$I64 GenRoomDescription() {
$ID,2$I64 newDesc;
I32 i = 0;
while (i<3) {
$ID,2$I64 ind = Abs(RandI64 % 10);
I64 tprob = Abs(RandI64 % 100);
if (RoomsDesc[ind].prob <= tprob) {
$ID,2$if (i==0) {
$ID,2$newDesc = Concat("This room ",RoomsDesc[ind].desc);
newDesc = Concat(newDesc, ". ");
i++;
$ID,-2$} else {
$ID,2$switch(Abs(RandI64 %3)) {
$ID,2$case 0:
$ID,2$newDesc = Concat("It ", RoomsDesc[ind].desc);
newDesc = Concat(newDesc, ". ");
break;
$ID,-2$case 1:
$ID,2$newDesc = Concat("It also ",RoomsDesc[ind].desc);
newDesc = Concat(newDesc, ". ");
break;
$ID,-2$case 2:
$ID,2$newDesc = Concat("However, it ",RoomsDesc[ind].desc);
newDesc = Concat(newDesc, ". ");
break;
$ID,-2$$ID,-2$}
i++;
$ID,-2$}
$ID,-2$}
$ID,-2$}
newDesc += '\n';
return newDesc;
$ID,-2$}


#endif