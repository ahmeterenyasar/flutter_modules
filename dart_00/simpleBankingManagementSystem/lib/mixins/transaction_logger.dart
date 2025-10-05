
mixin TransactionLogger {
  final List<String> _transactionLog = [];

  void logTransaction(String transaction) {
    final timestamp = DateTime.now().toString().substring(0,19);
    _transactionLog.add('[$timestamp] $transaction');
  }

  void printTransactionHistory() {
    print("Transaction History");
    print("===================");
    if (_transactionLog.isEmpty) {
      print("No Transactions for now");
    } else {
      for (var log in _transactionLog)
        print(log);
    }
    print("===================");
  }

  int get transactionCount => _transactionLog.length;
}