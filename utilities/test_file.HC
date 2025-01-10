class Person
{
  U8 *name;
  I64 age;
};

Person* PersonNew(U8 *name, I64 age=40)
{
  Person *p = MAlloc(sizeof(Person));
  p->name = name;
  p->age = age;
  return p;
}

I64 i = 10;
Person* p = PersonNew("Terry",42);
"%d %s => %d",i,p->name,p->age;