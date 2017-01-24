public class pe_primeFactors{
  public static void main(String arg[]){
      long myInput = 600851475143L;
      int i = 2;
      int max_factor = (int)Math.sqrt(n);
      while(i <= maxfactor){
          if(n % i == 0){}
              n /= i;
              System.out.println(i);
              max_factor = (int)Math.sqrt(n);
          }else{
              i++;
          }
      }
      System.out.println(n);
  }
}
