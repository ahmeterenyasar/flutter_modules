
import '../interfaces/printable.dart';
import '../utils/bank_utils.dart';

abstract class BankAccount implements Printable{
  final String accountNumber;
  final String customerId;
  late String _accountType;
  double _balance;
  late DateTime _lastTransactionDate;

  BankAccount({
    required this.customerId,
    required String accountType,
    double initialBalance = 0.0, // default parameter
    String? accountNumber, // optional nullable parameter
  }) : _balance = initialBalance,
       accountNumber = accountNumber ?? BankUtils.generateAccountNumber() {
    _accountType = accountType;
    _lastTransactionDate = DateTime.now();
  }

  // getters and setters
  double get balance => _balance;
  String get accountType => _accountType;
  String get lastTransactionDate =>
    _lastTransactionDate.toString().substring(0,10);
  String get status => _balance == 0 ? 'Empty' : 'Active';

  // abstarct methods
  void deposit(double amount);
  void withdraw(double amount);
  double calculateInterest();

  //concrete methods, can be used to all subclasses
  bool canWithdraw(double amount) {
    return _balance >= amount && amount > 0;
  }

  void updateBalance(double newBalance) {
    _balance = newBalance;
    _lastTransactionDate = DateTime.now();
  }

  bool isSameAccount(BankAccount other) {
    return identical(this, other);
  }

  bool hasSameAccountNumber(BankAccount other) {
    return this.accountNumber == other.accountNumber;
  }
}