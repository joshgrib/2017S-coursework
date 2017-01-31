/******************************************************************************
 * Name        : LargestPalindromeProduct.java
 * Authors     : Noel Smith, Thomas Haumersen, Joshua Gribbon
 * Version     : 1.1
 * Date        : January 24, 2017
 * Modify Date : January 25, 2017
 * Description : Solution to Project Euler #4
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
public class LargestPalindromeProduct {
    //Reverses the order of the digits of the input number
    private static int reverseInt(int n) {
        int out = 0;
        while (n != 0) {
            out *= 10;
            out += n % 10;
            n /= 10;
        }
        return out;
    }

    //Checks to see if the number is the same forwards and backwards
    private static boolean isPalindrome(int n) {
        return n == reverseInt(n);
    }

    //main entry to the program
    public static void main(String[] args) {
        long start = System.nanoTime();
        int n = 0, maxPal = 0, factor1 = 0, factor2 = 0;

        for (int i = 999; i > 0; i--) {
            for (int j = 999; j > 0; j--) {
                n = i * j;
                //dont bother checking if the product is smaller than the largest
                if(n < maxPal)
                    continue;
                if (isPalindrome(n)) {
                	maxPal = n; factor1 = i; factor2 = j;
                }
            }
        }

        //default, if no factors are found
        if(maxPal == 0)
        	System.out.println("No palindromes found");
        else
        {
        	//checks to make sure that the factors are listed from smaller to larger
        	if(factor1 > factor2)
        		System.out.printf("%d * %d = %d", factor2,factor1,maxPal);
        	else
        		System.out.printf("%d * %d = %d", factor1,factor2,maxPal);
        	System.out.println();
        }

        //gets the elapsed time
        double elapsed = (System.nanoTime() - start) / 1e6;
        System.out.println("Elapsed time: " + elapsed + " ms");
    }
}
