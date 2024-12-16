
#ifndef CONCAT 
#define CONCAT 0


I64 Concat (I64 s1, I64 s2) {
$ID,2$I64 ns = MAlloc(StrLen(s1)+StrLen(s2)+1);
MemCpy(ns, s1, StrLen(s1));
MemCpy(ns+StrLen(s1), s2, StrLen(s2)+1);
return ns;
$ID,-2$}


#endif