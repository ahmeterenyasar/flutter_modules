import '../mixins/transaction_logger.dart';
import '../utils/bank_utils.dart';
import 'bank_account.dart';

class SavingAccount extends BankAccount with TransactionLogger {
  static int totalSavingAccounts = 0;
  final int _withdrawLimit = 3;
  int _withdrawCount = 0;

  SavingAccount({
    required String customerId,
    double initialBalance = 0.0,
    String? accountNumber,
  }) : super(
    customerId: customerId,
    accountType: 'Saving',
    initialBalance: initialBalance,
    accountNumber: accountNumber,
  ) {
    totalSavingAccounts++;
  }

  int get remainingWithdraws => _withdrawLimit - _withdrawCount;
  
  @override
  double calculateInterest() {
    return BankUtils.calculateInterest(balance, BankUtils.savingsInterestRate);
  }
  
  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit must be positive');
      return;
    }

    updateBalance(balance + amount);
    logTransaction('Deposited: $amount');
    print('Deposited $amount New Balance: $balance');
  }
  
  @override
  void withdraw(double amount) {
    if (_withdrawCount >= _withdrawLimit) {
      print('Reached to withdraw limit');
      return;
    }

    if (!canWithdraw(amount)) {
      print('Unable to withdraw');
      return;
    }

    updateBalance(balance - amount);
    _withdrawCount++;
    logTransaction('Withdraw $amount Remaining Withdraws: $remainingWithdraws');
    print('Withdraw $amount New Balance $balance');
  }

  void applyInterest() {
    final interest = calculateInterest();
    updateBalance(balance + interest);
    logTransaction('Interest applied: $interest');
    print('Interest $interest applied');
  }

  void resetWithdrawLimit() {
    _withdrawCount = 0;
    print('Withdraw limit reset');
  }
  
  @override
  void printDetails() {
    print('\n*Saving Account Details*');
    print('Account Number: $accountNumber');
    print('Customer ID: $customerId');
    print('Balance: $balance');
    print('Status: $status');
    print('Remaining Withdraws: $remainingWithdraws');
    print('Last Transaction: $lastTransactionDate');
    print('Total Transactions: $transactionCount');
    print('********************');
  }

}