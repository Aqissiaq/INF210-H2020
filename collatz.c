#include <stdio.h>
#include <stdlib.h>

void collatz( int n )
{
    if ( n == 1 ) { return; }
    else if ( n % 2 == 0 ) { collatz( n / 2 ); return; }
    else { collatz( 3 * n + 1); return; }
}

int main()
{
    for ( int i = 1; i <= 1000000; i++ )
    {
        collatz( i );
    }
}
