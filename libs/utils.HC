
#ifndef UTILS
#define UTILS 0


/*
    A collection of useful functions
    Mostly string ops
*/


U0* ReAlloc(U0* ptr, U64 new_size) {
    // Reallocates a memory block to a new size
    // If ptr is NULL, behaves like MAlloc

    if (new_size == 0) {
        Free(ptr);
        return NULL;
    }
    
    if (ptr == NULL) {
        return MAlloc(new_size);
    }
    
    U64 old_size = MSize(ptr);
    U0* new_ptr = MAlloc(new_size);
    
    if (new_ptr) {
        // Copy the minimum of old and new size
        U64 copy_size;
        if (old_size <= new_size) {
            copy_size = old_size;
        } else {
            copy_size = new_size;
        }
        MemCpy(new_ptr, ptr, copy_size);
        Free(ptr);
    }
    
    return new_ptr;
}

U8* Concat (U8* s1, U8* s2) {
    // Concatenates s1 and s2

    U8* ns = MAlloc(StrLen(s1)+StrLen(s2)+1);
    MemCpy(ns, s1, StrLen(s1));
    MemCpy(ns+StrLen(s1), s2, StrLen(s2)+1);
    return ns;
}


U8* Find(U8* text, U8* ref) {
    // Returns pointer to the first character of ref in text

    if (*ref == '\0') {
        return NULL;
    }

    for (; *text!='\0'; text++) {
        U8* t = text;
        U8* r = ref;
        while (*t!='\0' && *r!='\0' && *t==*r) {
            t++; 
            r++;
        }
        if (*r=='\0') {
            return text;
        }
    }

    return NULL;
}


U8* FindAndReplace (U8* text, U8* ref, U8* instr) {
    // Finds ref in text and replaces with instr
    // Returns NULL if no occurences found

    if (!text || !ref || !instr) {
        "One of the instructions doesn't exist";
        return NULL;
    }

    U8* n_text = MAlloc(StrLen(text)+StrLen(instr)-StrLen(ref)+1);
    U8* ptr = n_text;
    U8* found = Find(text, ref);

    Bool fnd = (found!=NULL);
    if (fnd) {
        MemCpy(ptr, text, StrLen(text)-StrLen(found));
        ptr += StrLen(text)-StrLen(found);
        MemCpy(ptr, instr, StrLen(instr));
        ptr += StrLen(instr);
        found += StrLen(ref);
        MemCpy(ptr, found, StrLen(found));
    }

    return n_text;
}


#endif