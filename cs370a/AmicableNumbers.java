/******************************************************************************
 * Name        : LargestPalindromeProduct.java
 * Authors     : Noel Smith, Thomas Haumersen, Joshua Gribbon
 * Version     : 1.0
 * Date        : February 1, 2017
 * Description : Solution to Project Euler #21
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
import java.util.ArrayList;

public class AmicableNumbers {

    public static int sumDivisors(int n){
        int sum = 1;
        int max = (int)Math.sqrt(n);
        //find factors and sum them up
        for(int i=2; i<max; i++){
            if(n % i == 0){
                sum += i;
                if(n/i != i){
                    sum += n/i;
                }
            }
        }
        return sum;
    }

	public static void main(String[] args) {
		//gets the starting time in milliseconds
		long start = System.currentTimeMillis();
		//this is the number we are calculating against
		int num = 1000000;
        //collect values
        ArrayList<Integer> amicables = new ArrayList<Integer>();

        //loop up to number
		for(int i = 2; i < num ; i++){
            int sumDivs = sumDivisors(i);
            //don't add pairs that are already there
            boolean alreadyFound = amicables.contains(sumDivs) && amicables.contains(i);
            //only add amicable pairs
            boolean amicable = i == sumDivisors(sumDivs);
            //dont add pairs that are the same number
            boolean ident = i == sumDivs;
            if(amicable && !alreadyFound && !ident && (sumDivs <= num)){//new amicable pair
                amicables.add(i);
                amicables.add(sumDivs);
                System.out.printf("(%d,%d)\n", i, sumDivs);
            }
		}
        //System.out.println(amicables.toString());
		//print out sum
        int sum = amicables.stream().reduce((a,b)->a+b).get();
		System.out.println("Sum: " + sum);
		//calculate and print elapsed time
		System.out.println("Elapsed time: " + (System.currentTimeMillis() - start) + " ms");
	}

}
