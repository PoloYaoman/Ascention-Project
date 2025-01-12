
#ifndef STR_OPS 
#define STR_OPS 0


U8* Concat (U8* s1, U8* s2) {
    U8* ns = MAlloc(StrLen(s1)+StrLen(s2)+1);
    MemCpy(ns, s1, StrLen(s1));
    MemCpy(ns+StrLen(s1), s2, StrLen(s2)+1);
    return ns;
}

// I64* FindStr (U8* text, U8* ref) {
//     I64* inds = NULL;
//     I64 i = 0;
//     while (i<StrLen(text)) {
//         I64 temp = i;
//         I64 j = 0;
//         while (text[i] == ref[j]) {
//             I64 temp = i;
//             i++;
//             j++;
//             if (j == 3) {
                
//             }
//         }
//     }
// }


#endif