
class BankUtils {
  //private constructor
  BankUtils._();

  static const double savingsInterestRate = 0.03;
  static const double checkingInterestRate = 0.01;
  static const double minBalance = 0.0;

  //static method
  static double calculateInterest(double balance, double rate) {
    return balance * rate;
  }

  static String generateAccountNumber() {
    return 'ACC${DateTime.now().millisecondsSinceEpoch}';
  }

}