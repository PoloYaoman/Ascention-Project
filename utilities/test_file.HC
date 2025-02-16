
Cd(__DIR__);;

#include "string_ops.HC"

U8* text = "This is a big text\n";
U8* ref = "big";
U8* instr = "small";

text = FindAndReplace(text, ref, instr);
"%s", text;