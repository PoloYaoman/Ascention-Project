
#ifndef STR_OPS 
#define STR_OPS 0


U8* Concat (U8* s1, U8* s2) {
    U8* ns = MAlloc(StrLen(s1)+StrLen(s2)+1);
    MemCpy(ns, s1, StrLen(s1));
    MemCpy(ns+StrLen(s1), s2, StrLen(s2)+1);
    return ns;
}


U8* Find(U8* text, U8* ref) {
    if (*ref == '\0') {
        return NULL;
    }

    for (; *text!='\0'; text++) {
        U8* t = text;
        U8* r = ref;
        while (*t!='\0' && *r!='\0' && *t==*r) {
            t++; n++;
        }
        if (*n=='\0') {
            return text;
        }
    }

    return NULL
}


U0 FindAndReplace (U8* text, U8* ref, U8* instr) { //TODO
    if (!text || !ref || !instr) {
        return;
    }

    U8* n_text = MAlloc(StrLen(text)+StrLen(instr)-StrLen(ref)+1);
    U8* ptr = n_text

    U8* found = Find(text, ref);
    MemCpy(ptr, text, StrLen(text)-StrLen(found));
    ptr += StrLen(text)-StrLen(found);
    MemCpy(ptr, instr, StrLen(instr));
    ptr += StrLen(instr);
}


#endif