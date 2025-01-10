
#ifndef DESC 
#define DESC 0


//Cd(__DIR__);;

#include "./utilities/concat.HC"


#define RD_NUM 10


class Descriptor{
    /* This one will hold a random statement 
    and a probability of its occurence */
    U8* desc;
    I64 prob;
};

Descriptor* InitDescriptor(U8* d, I64 p) {
    Descriptor* ndesc = MAlloc(sizeof(Descriptor));

    ndesc->desc = d;
    ndesc->prob = p;

    //"New descriptor: %s, %d\n", ndesc->desc, ndesc->prob;
    return ndesc;
}


/*Descriptors for rooms*/

U0 FillRoomsDesc(Descriptor** rd) {
    rd[0] = InitDescriptor
        ("is bright, but you cannot identify the light source", 50);
    rd[1] = InitDescriptor
        ("is perfectly forgettable", 30);
    rd[2] = InitDescriptor
        ("feels cold", 70);
    rd[3] = InitDescriptor
        ("fills you with a sentiment of belonging", 20);
    rd[4] = InitDescriptor
        ("smells like smoke", 40);
    rd[5] = InitDescriptor
        ("is shaped impractically for furnishing", 40);
    rd[6] = InitDescriptor
        ("is messy", 60);
    rd[7] = InitDescriptor
        ("has an aura that weighs heavy on your soul", 50);
    rd[8] = InitDescriptor
        ("will probably oison your soul if you remain here long enough", 10);
    rd[9] = InitDescriptor
        ("reminds you of home", 30);
    //"First descriptor: %s, %d\n", rd[0].desc, rd[0].prob;
}

Descriptor* RoomsDesc[RD_NUM];
FillRoomsDesc(RoomsDesc);

I64 GenRoomDescription() {
    I64 newDesc;
    I32 i = 0;
    while (i<3) {
        I64 ind = Abs(RandI64 % 10);
        I64 tprob = Abs(RandI64 % 100);
        if (RoomsDesc[ind]->prob <= tprob) {
            if (i==0) {
                newDesc = Concat("This room ",RoomsDesc[ind]->desc);
                newDesc = Concat(newDesc, ". ");
            } else {
                switch(Abs(RandI64 %3)) {
                    case 0:
                        newDesc = Concat("It ", RoomsDesc[ind]->desc);
                        newDesc = Concat(newDesc, ". ");
                        break;
                    case 1:
                        newDesc = Concat("It also ", RoomsDesc[ind]->desc);
                        newDesc = Concat(newDesc, ". ");
                        break;
                    case 2:
                        newDesc = Concat("However, it ", RoomsDesc[ind]->desc);
                        newDesc = Concat(newDesc, ". ");
                        break;
                }
            }
            i++;
        }
    }
    return newDesc;
}


#endif