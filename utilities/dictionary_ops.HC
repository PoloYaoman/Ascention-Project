
#ifndef DICT_OPS
#define DICT_OPS 0


// #define INT_TYPE 0
// #define FLOAT_TYPE 1
// #define STRING_TYPE 2


// class value {
//     I32 type;
//     union {
//         I64 int;
//         F64 f;
//         U8* str;
//     };
// };

// value* initValue(I32 type, I64 int = 0, F64 f = 0, U8* str = NULL) {
//     value* n_val = MAlloc(sizeof(value));
//     n_val->type = type;
//     switch(type) {
//         case INT_TYPE:
//             n_val->int = int;
//             break;
//         case FLOAT_TYPE:
//             n_val->f = f;
//             break;
//         case STRING_TYPE:
//             n_val->str = str;
//             break;
//         default:
//             "Unrecognised type."
//             return NULL;
//             break;
//     }
//     return n_val;
// }

class int_dictionary {
    I64 size;
    U8** key;
    I64* val;
};

int_dictionary* initIntDictionary (U8** keys, I64* val) {
    int_dictionary* n_dict = MAlloc(sizeof(int_dictionary));
    n_dict->key = MAlloc(MSize(keys));
    n_dict->val = MAlloc(MSize(val));
    n_dict->size = 0;
    I64 i = 0;

    while (keys!=NULL) {
        n_dict->key[i] = *keys;
        if (val!=NULL) {
            n_dict->val = val;
        } else {
            "Missing value.";
            return NULL;
        }
        n_dict->size++;
        keys++;
        val++;
        i++;
    }

    return n_dict;
}

U0 addKey (int_dictionary* dict, U8* key, I64 val) {
    if (dict==NULL) {
        dict = MAlloc(sizeof(int_dictionary));
    }
    if (key!=NULL && val!=NULL) {
        ReAlloc(dict->key, sizeof(U8*)+MSize(n_dict->key));
        ReAlloc(dict->val, sizeof(I64)+MSize(n_dict->val));
        dict->key[dict->size] = key;
        dict->val[dict->size] = val;
        dict->size++;
    } else {
        "Missing value."
        return;
    }
}

value* getIntKey (int_dictionary* dict, U8* key) {
    while(dict!=NULL) {
        if (key!=NULL) {
            if (!StrNCmp(dict->key, key)) {
                return dict->val;
            }
        } else {
            "NULL key value."
            return NULL;
        }
    }
    "Empty dictionary."
    return NULL;
}


#endif 