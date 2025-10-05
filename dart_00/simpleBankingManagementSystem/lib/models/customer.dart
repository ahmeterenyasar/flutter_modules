import '../interfaces/printable.dart';
import '../utils/extensions.dart';
import 'bank_account.dart';
import 'checking_account.dart';
import 'saving_account.dart';

class Customer implements Printable {
  final String id;
  String _name;
  String? phone;
  late final String email;
  final List<BankAccount> accounts = [];

  Customer({required this.id, required String name, this.phone, String? email})
    : _name = name,
      this.email = email ?? '$id@deneme.com';

  // getter and setter
  String get name => _name;
  set name(String val) {
    if (val.isValidName) {
      _name = val;
    } else {
      print('Invalid name');
    }
  }

  int get totalAccounts => accounts.length;

  double get totalBalance {
    double total = 0.0;
    for (var account in accounts) {
      total += account.balance;
    }
    return total;
  }

  void addAccount(BankAccount account) {
    accounts.add(account);
    print('Account ${account.accountNumber} added to customer $name');
  }

  void removeAccount(BankAccount account) {
    accounts.remove(account);
    print('Account ${account.accountNumber} removed');
  }

  void printAccountsByType(String type) {
    print('~$type Accounts for $name~');
    
    bool foundAny = false;
    for (int i = 0; i < accounts.length; i++) {
      BankAccount account = accounts[i];
      if (type == 'Checking' && account is CheckingAccount) {
        account.printDetails();
        foundAny = true;
      } else if (type == 'Saving' && account is SavingAccount) {
        account.printDetails();
        foundAny = true;
      }
    }
    if (!foundAny) {
      print('No $type accounts found.');
    }
  }

  @override
  void printDetails() {
    print('= CUSTOMER INFORMATION =');
    print('ID: $id');
    print('Name: $name');
    print('Phone: ${phone ?? 'Not provided'}'); // null-aware operator
    print('Email: $email');
    print('Total Accounts: $totalAccounts');
    print('Total Balance: $totalBalance');
  }
}
