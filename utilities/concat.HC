
#ifndef CONCAT 
#define CONCAT 0


U8* Concat (U8* s1, U8* s2) {
    U8* ns = MAlloc(StrLen(s1)+StrLen(s2)+1);
    MemCpy(ns, s1, StrLen(s1));
    MemCpy(ns+StrLen(s1), s2, StrLen(s2)+1);
    return ns;
}


#endif