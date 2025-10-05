import 'dart:math';
import '../models/customer.dart';

class CustomerService {
  final List<Customer> _customers = [];

  List<Customer> get customers => List.unmodifiable(_customers);

  void addCustomer(Customer customer) {
    _customers.add(customer);
    print('Customer ${customer.name} added to the system');
  }

  List<Customer> dummyCustomerGenerator(int count) {
    List<Customer> dummyCustomers = [];
    Random random = Random();
    
    List<String> names = [
      'Alice Johnson', 
      'Bob Smith', 
      'Carol Williams', 
      'David Brown', 
      'Eve Davis',
      'Frank Miller',
      'Grace Lee',
      'Henry Wilson'
    ];
    
    for (int i = 0; i < count; i++) {
      int randomId = 1000 + random.nextInt(9000);
      String id = 'CUS$randomId';
      
      String randomName = names[random.nextInt(names.length)];
      
      int randomPhone = 1000 + random.nextInt(9000);
      String phone = '+1-555-$randomPhone';
      
      Customer newCustomer = Customer(
        id: id,
        name: randomName,
        phone: phone,
      );
      
      dummyCustomers.add(newCustomer);
    }
    
    _customers.addAll(dummyCustomers);
    print('Generated $count dummy customers');
    return dummyCustomers;
  }

  void sortCustomersByName() {
    _customers.sort((a, b) => a.name.compareTo(b.name));
    print('Customers sorted by name');
  }

  List<Customer> getReversedCustomerList() {
    return _customers.reversed.toList();
  }

  void insertCustomerAt(int i, Customer customer) {
    _customers.insert(i, customer);
    print('Customer ${customer.name} insterted at index $i');
  }

  void clearAllCustomers() {
    final count = _customers.length;
    _customers.clear();
    print('$count customers are deleted from system');
  }

  // NOTES: find customer by id with null safety

  void printAllCustomers() {
    print('PRINTING ALL THE CUSTOMERS');
    if(_customers.isEmpty) {
      print('No customers in the system');
      return;
    }

    for (var customer in _customers) {
      customer.printDetails();
    }
  }
}