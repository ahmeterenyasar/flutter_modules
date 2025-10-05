
import '../models/bank_account.dart';

class TransactionService {
  void transfer(BankAccount from, BankAccount to, double amount) {
    print('Transfering ...');
    if(!from.canWithdraw(amount))
    {
      print('Transfer failed');
      return;
    }
    print('From: ${from.accountNumber}');
    print('To: ${to.accountNumber}');
    print('Amount: $amount');
    from.withdraw(amount);
    to.deposit(amount);
    print('Transfer successful');
  }
}