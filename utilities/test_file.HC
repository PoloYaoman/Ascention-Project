
Cd(__DIR__);;


#include "dictionary_ops.HC"

I64 val1 = 1;
I64 val2 = 2;
I64 val3 = 3;

U8* key1 = "Mister";
U8* key2 = "Blue";
U8* key3 = "Sky";

I64 keys[2] = {key1, key2};
U8* vals[2] = {val1, val2};

int_dictionary* dict = initIntDictionary(keys, vals);
addKey(dict, key3, val3);

"\n";
"%d\n", getIntKey(dict,"Mister");
"%d\n", getIntKey(dict,"Blue");
"%d\n", getIntKey(dict,"Sky");