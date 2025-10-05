import '../lib/models/checking_account.dart';
import '../lib/models/customer.dart';
import '../lib/models/saving_account.dart';
import '../lib/services/customer_service.dart';
import '../lib/services/transaction_service.dart';
import '../lib/utils/bank_utils.dart';

void main() {
  print('!!! BANK SYSTEM !!!');

  final customerService = CustomerService();
  final transactionService = TransactionService();

  print('DEBUG TOPIC: ==List Generate==');
  customerService.dummyCustomerGenerator(3);

  print('DEBUG TOPIC: ==Custom Customer Create==');
  final mainCustomer = Customer(
    id: 'CUS001',
    name: 'Ahmet Eren Yasar',
    phone: '+90-506-127-6534',
    email: 'erenyasar344@gmail.com',
  );

  customerService.addCustomer(mainCustomer);

  print('DEBUG TOPIC: Cascade Notation Examples');
  final checking = CheckingAccount(
    customerId: mainCustomer.id,
    initialBalance: 1000.0,
  );

  final saving = SavingAccount(
    customerId: mainCustomer.id,
    initialBalance: 5000.0,
  );

  //cascade
  mainCustomer
    ..addAccount(checking)
    ..addAccount(saving)
    ..printDetails();

  print('DEBUG TOPIC: deposit & withdraw operations');
  checking
    ..deposit(500)
    ..withdraw(200)
    ..printDetails();

  print('DEBUG TOPIC: Transaction History -mixin-');
  checking.printTransactionHistory();

  print('DEBUG TOPIC: Static methods & fields');
  print('Saving Interest Rate: ${BankUtils.savingsInterestRate}');
  print('Total Checking Accounts: ${CheckingAccount.totalCheckingAccounts}');
  print('Total Saving Accounts: ${SavingAccount.totalSavingAccounts}');

  print('Transfer Opeartion');
  transactionService.transfer(checking, saving, 300);

  print('DEBUG TOPIC: List operations');
  print('Before Sorting:');
  for (var customer in customerService.customers) {
    print(' - ${customer.name}');
  }
  customerService.sortCustomersByName();
  print('After sorting:');
  for (var customer in customerService.customers) {
    print(' - ${customer.name}');
  }

  //reversed
  print('Reversed List:');
  final reversed = customerService.getReversedCustomerList();
  for (var customer in reversed) {
    print(' - ${customer.name}');
  }

  //Insert operation
  final newCustomer = Customer(id: 'CUS9999', name: 'Priority Customer');
  customerService.insertCustomerAt(0, newCustomer);
  print('After Insertion:');
  for (var customer in customerService.customers) {
    print(' - ${customer.name}');
  }

  print('DEBUG TOPIC: Reference Type (== vs identical)');
  final acc1 = checking;
  final acc2 = checking;
  final acc3 = CheckingAccount(customerId: 'CUS002', initialBalance: 100);

  print('account1 == account2: ${acc1 == acc2}');
  print('identical(account1, account 2): ${identical(acc1, acc2)}');
  print('account1.isSameAccount(account3): ${acc1.isSameAccount(acc3)}');

  print('DEBUG TOPIC: Null Safety');
  String? optionalPhone = mainCustomer.phone;
  print('Phone: ${optionalPhone ?? "No Phone Num Providede"}');

  print('getter and setters');
  print('Current Name: ${mainCustomer.name}');
  mainCustomer.name = 'Eren Yasar';
  print('Updated name: ${mainCustomer.name}');

  print('\nDEBUG TOPIC: Testing removeAccount and printAccountsByType');
  print('=== Testing printAccountsByType ===');
  mainCustomer.printAccountsByType('Checking');
  mainCustomer.printAccountsByType('Saving');
  mainCustomer.printAccountsByType('NonExisting');
  
  print('\n=== Testing removeAccount ===');
  print('Before removal - Total accounts: ${mainCustomer.totalAccounts}');
  mainCustomer.printDetails();
  
  print('\nRemoving checking account...');
  mainCustomer.removeAccount(checking);
  
  print('After removal - Total accounts: ${mainCustomer.totalAccounts}');
  mainCustomer.printDetails();
  
  print('\nTrying to print Checking accounts after removal:');
  mainCustomer.printAccountsByType('Checking');
  
  print('\n=== Testing removeAccount ===');
  print('Saving account number: ${saving}');
  print('Before removeAccount - Total accounts: ${mainCustomer.totalAccounts}');
  
  mainCustomer.removeAccount(saving);
  print('After removeAccount - Total accounts: ${mainCustomer.totalAccounts}');
  

  print('\nDEBUG TOPIC: FINAL');
  customerService.printAllCustomers();

}