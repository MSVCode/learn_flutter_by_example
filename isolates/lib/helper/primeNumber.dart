/// Purposely naive computational expensive function
///
List<int> findPrimeNumbers(int count) {
  List<int> primes = [];

  int current = 2; //prime starts from 2

  while (primes.length < count) {
    bool isPrime = true;

    //check divisible
    for (int i = 2; i < current; i++) {
      if (current % i == 0) {
        isPrime = false;
      }
    }

    if (isPrime) {
      primes.add(current);
    }
    current++; //next number
  }

  return primes;
}
