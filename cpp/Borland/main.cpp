#include <iostream>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <\sci\all.cpp>
using namespace std;
//==============================================================================
// Defines
#define  NUM  10
#define  CHR  ":"
//==============================================================================
// Variaveis Estaticas
static int _corcabec = 75;
static int _cormenu  = 31;
static int _corfundo = 15;
static char *pull[NUM]  = {"Encerrar","Sistemas","Vendas","Backup",
                           "Editor","Config","Arquivos","Reconstruir",
                           "Shell","Help"
                          };





//==============================================================================
char *inttostr(int val);

//==============================================================================
int main(void)
{
   ClearScreen();
   omenu.create();
   box(10, 10, 20, 40);
   aprint( 11, 11, "TESTE", omenu.cormenu);

   return 0;
}
//==============================================================================
