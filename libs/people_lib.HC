
#ifndef PEOPLE_LIB
#define PEOPLE_LIB 0 


#include "classes/Room.HC"
#include "classes/Person.HC"


#define CHAR_NUM 3
#define CDESC_NUM 3
#define WORDS_NUM 3


U8* characters[CHAR_NUM] = {
    "$$RED$$an angel$$BLUE$$",
    "$$RED$$an old man$$BLUE$$",
    "$$RED$$a dog$$BLUE$$"   
};


U8* c1_desc[CDESC_NUM] = {
    "$$RED$$They have a blurry face. Blurry everything, in fact. The more you look at them, the less you are sure of what you see.$$BLUE$$",
    "$$RED$$They look human, but your gut tells you they are not.$$BLUE$$",
    "$$RED$$They look tired$$BLUE$$"
};

U8* c2_desc[CDESC_NUM] = {
    "$$RED$$He is draped in so many layers of fabric that you can't quite see his figure.$$BLUE$$",
    "$$RED$$He waves at you to come closer.$$BLUE$$",
    "$$RED$$His eyes are absent, it looks like he is unaware of your presence, or is simply effectively ignoring you.$$BLUE$$"
};

U8* c3_desc[CDESC_NUM] = {
    "$$RED$$It is old. Perhaps older than you are. Perhaps older than this place.$$BLUE$$",
    "$$RED$$It turns it circles, it is looking for something.$$BLUE$$",
    "$$RED$$The fur on its back raises at the sight of you, an suddenly an already gigantic beast turns even bigger.$$BLUE$$"
};


U8* char_descriptions[CHAR_NUM] = {
    c1_desc, c2_desc, c3_desc
};


U8* c1_words[WORDS_NUM] = {
    "$$RED$$Do not look at me.$$BLUE$$",
    "$$RED$$You love so sheepishly it almost feels unfair. So why have you come? What is really at stake for you here?$$BLUE$$",
    "$$RED$$Your soul is on fire but your heart is not in it.$$BLUE$$"
};


U0 FillCharacters (Room* r) {
    // Fills in every "[c]" with a random character

    while(Find(r->description, "[c]")!=NULL) {
        I32 ind = Abs(RandI64 % CHAR_NUM);
        r->description = FindAndReplace(r->description, "[c]", characters[ind]);
        r->num_characters++;

        I32 indd = Abs(RandI64 % CDESC_NUM);
        I32 inddd = Abs(RandI64 % WORDS_NUM);
        addPerson(&(r->characters), 
            InitPerson(characters[ind],char_descriptions[ind][indd],c1_words[inddd]));
    }
    return;
}


#endif