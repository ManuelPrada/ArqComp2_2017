/*MULTIPLICACION CON SUSMAS SUCESIVAS 

#include <conio.h>
#include <stdio.h>

int main()
{
    int acumulador, contador, n1, n2;
   printf( "\n   Introduzca primer n%cmero (numeroEntero): ", 93 );
    scanf( "%d", &n1 );
    printf( "\n   Introduzca segundo n%cmero (numeroEntero): ", 93 );
    scanf( "%d", &n2 );

    if ( n1 >= 0 && n2 >= 0 )
    {
        acumulador = 0;

        if ( n2 != 0 )
        {
            contador = 1;
            while ( contador <= n1 )
            {
                acumulador += n2;
                contador++;
            }
        }

        printf( "\n   %d * %d = %d", n1, n2, acumulador );

    }
    else
        printf( "\n   ERROR: Ambos n%cmeros deben ser mayores o iguales que cero.", 93 );

    getch(); /* Pausa 

    return 0;
}*/


/*DIVISION CON RESTAS SUCESIVAS

#include <conio.h>
#include <stdio.h>

int main()
{
    int cociente, dividendo, divisor, resto;

    printf( "\n   Introduzca dividendo (entero): " );
    scanf( "%d", &dividendo );
    printf( "\n   Introduzca divisor (entero): " );
    scanf( "%d", &divisor );

    if ( dividendo > 0 && divisor > 0 )
    {
        cociente = 0;
        resto = dividendo;

        while ( resto >= divisor )
        {
            resto -= divisor;
            cociente++;
        }

        printf( "\n   %d div %d = %d ( Resto = %d )", dividendo, divisor, cociente, resto );
    }
    else
        printf( "\n   ERROR: Ambos n%cmeros deben ser mayores que cero.", 163 );

    getch(); /* Pausa 

    return 0;
}*/
