

import '../mixins/transaction_logger.dart';
import '../utils/bank_utils.dart';
import 'bank_account.dart';

class CheckingAccount extends BankAccount with TransactionLogger {
  static int totalCheckingAccounts = 0;
  
  CheckingAccount({
    required String customerId,
    double initialBalance = 0.0,
    String? accountNumber,
  }) : super(
    customerId: customerId,
    accountType: 'Checking',
    initialBalance: initialBalance,
    accountNumber: accountNumber,
  ) {
    totalCheckingAccounts++;
  }

  @override
  double calculateInterest() {
    return BankUtils.calculateInterest(balance, BankUtils.checkingInterestRate);
  }

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("Deposit must be positive");
      return;
    }

    updateBalance(balance + amount);
    logTransaction('Deposited: $amount');
    print('Deposited $amount New Balance: $balance');
  }

  @override
  void withdraw(double amount) {
    if (!canWithdraw(amount)) {
      print('Unable to withdraw');
      return;
    }

    updateBalance(balance - amount);
    logTransaction('Withdraw $amount');
    print('Withdraw $amount New Balance: $balance');
  }

  @override
  void printDetails() {
    print('\n*Account Details*');
    print('Account Number: $accountNumber');
    print('Customer ID: $customerId');
    print('Balance: $balance');
    print('Status: $status');
    print('Last Transaction: $lastTransactionDate');
    print('*******************');
  }

  
}