

class User {
  String name;
  String surname;
  List<Wallet> wallets;
  List<Category> categories = [];
  
  User({required this.name, required this.surname, required this.wallets}) {
    for (var wallet in wallets) {
      bool categoryExists = false;
      for (var category in categories) {
        if (category.id == wallet.category.id) {
          categoryExists = true;
          break;
        }
      }
      if (!categoryExists) {
        categories.add(wallet.category);
      }
    }
  }

  String getFullName() {
    return '$name $surname';
  }

  int getWalletCount() {
    return wallets.length;
  }

  double getTotalBalance() {
    double total = 0;
    for (var wallet in wallets) {
      total = total + wallet.balance;
    }
    return total;
  }

  Map<String, List<Wallet>> getWalletsByCategory() {
    Map<String, List<Wallet>> groups = {};
    
    for (var wallet in wallets) {
      String categoryName = wallet.category.name;
      
      if (groups[categoryName] == null) {
        groups[categoryName] = [];
      }
      groups[categoryName]!.add(wallet);
    }
    
    return groups;
  }

  void transfer(Wallet from, Wallet to, double amount) {
    if (amount <= 0) {
      throw ArgumentError('Transfer miktarı pozitif olmalıdır');
    }
    from.withdraw(amount);
    to.deposit(amount);
  }

  void addCategory(String name) {
    int newId = 1;
    for (var category in categories) {
      if (category.id >= newId) {
        newId = category.id + 1;
      }
    }
    
    for (var category in categories) {
      if (category.name == name) {
        print('Bu kategori zaten mevcut: $name');
        return;
      }
    }
    
    Category newCategory = Category(newId, name);
    categories.add(newCategory);
    print('yeni kategori eklendi: $name (ID: $newId)');
  }

  void listCategories() {
    print('Tüm Mevcut Kategoriler:');
    for (var category in categories) {
      print('${category.id}. ${category.name}');
    }
  }

  void addWalletToCategory(String categoryName, double initialBalance) {
    Category? targetCategory;
    
    for (var category in categories) {
      if (category.name == categoryName) {
        targetCategory = category;
        break;
      }
    }
    
    if (targetCategory == null) {
      print('Kategori bulunamadı: $categoryName');
      return;
    }
    
    Wallet newWallet = Wallet(balance: initialBalance, category: targetCategory);
    wallets.add(newWallet);
    print('$categoryName kategorisine $initialBalance bakiyeli yeni cüzdan eklendi');
  }

  Wallet getHighestBalanceWallet() {
    if (wallets.isEmpty) {
      throw StateError('Kullanıcının hiç cüzdanı yok');
    }
    
    Wallet highest = wallets[0];
    for (var wallet in wallets) {
      if (wallet.balance > highest.balance) {
        highest = wallet;
      }
    }
    return highest;
  }


  String getLowestBalanceCategory() {
    if (wallets.isEmpty) {
      throw StateError('Kullanıcının hiç cüzdanı yok');
    }
    
    var groups = getWalletsByCategory();
    String lowestCategory = '';
    double lowestBalance = double.infinity;
    
    for (var categoryName in groups.keys) {
      List<Wallet> categoryWallets = groups[categoryName]!;
      double categoryTotal = 0;
      
      for (var wallet in categoryWallets) {
        categoryTotal += wallet.balance;
      }
      
      if (categoryTotal < lowestBalance) {
        lowestBalance = categoryTotal;
        lowestCategory = categoryName;
      }
    }
    
    return lowestCategory;
  }

  List<Wallet> getWalletsSortedByBalance(String categoryName) {
    List<Wallet> categoryWallets = [];
    
    for (var wallet in wallets) {
      if (wallet.category.name == categoryName) {
        categoryWallets.add(wallet);
      }
    }
    
    for (int i = 0; i < categoryWallets.length; i++) {
      for (int j = 0; j < categoryWallets.length - 1; j++) {
        if (categoryWallets[j].balance > categoryWallets[j + 1].balance) {
          Wallet temp = categoryWallets[j];
          categoryWallets[j] = categoryWallets[j + 1];
          categoryWallets[j + 1] = temp;
        }
      }
    }
    
    return categoryWallets;
  }
}

class Category {
  int id;
  String name;
  
  Category(this.id, this.name);
}

class Wallet {
  double balance;
  Category category;

  Wallet({required this.balance, required this.category});

  void deposit(double amount) {
    if (amount < 0) {
      throw ArgumentError('Yatırılacak miktar pozitif olmalıdır');
    }
    balance += amount;
    print("Para yatirma islemi: $amount, mevcut bakiye: $balance");
  }

  void withdraw(double amount) {
    if (amount < 0) {
      throw ArgumentError('Çekilecek miktar pozitif olmalıdır');
    }
    if (balance < amount) {
      throw Exception('Yetersiz bakiye! Mevcut bakiye: $balance, Çekilmek istenen: $amount');
    }
    balance -= amount;
    print("Para cekme islemi: $amount, mevcut bakiye: $balance");
  }
}


void main() {
  final vadesiz = Category(1, "Vadesiz");
  final vadeli = Category(2, "Vadeli");
  final yatirim = Category(3, "Yatırım");

  final wallet1 = Wallet(balance: 150000, category: vadesiz);
  final wallet2 = Wallet(balance: 0, category: vadeli);
  final wallet3 = Wallet(balance: 200000000, category: yatirim);
  final wallet4 = Wallet(balance: 1241243124, category: vadesiz);

  final user = User(name: "Hüseyin", surname: "Şahinli", wallets: [wallet1, wallet2, wallet3, wallet4]);

  print("Kullanıcı Bilgileri");
  print("Ad Soyad: ${user.getFullName()}");
  print("Toplam Cüzdan Sayısı: ${user.getWalletCount()}");
  print("Toplam Bakiye: ${user.getTotalBalance()} ");

  print("\n============================\n");

  wallet1.deposit(500);
  wallet3.withdraw(300);

  print("\n============================\n");

  var groupedWallets = user.getWalletsByCategory();
  groupedWallets.forEach((category, wallets) {
    double categoryTotal = wallets.fold(0.0, (sum, wallet) => sum + wallet.balance);
    print("$category: ${wallets.length} cüzdan, Toplam: $categoryTotal");
  });

  print("\n============================\n");

  print("\nTransfer function");
  print("Wallet1 Balance Before Transfer: ${wallet1.balance}, Wallet2: ${wallet2.balance}");
  user.transfer(wallet1, wallet2, 500);
  print("After transfer: ${wallet1.balance}, Wallet2: ${wallet2.balance}");
  print("TotalBalance: ${user.getTotalBalance()} ");

  print("\n============================\n");
  
  user.listCategories();
  
  user.addCategory("Kripto");
  user.addCategory("Emeklilik");
  user.addCategory("Altın");

  user.addCategory("Kripto");
  
  user.listCategories();
  
  user.addWalletToCategory("Kripto", 50000);
  user.addWalletToCategory("Emeklilik", 100000);
  
  user.addWalletToCategory("Emlak", 75000);
  
  print("Toplam Cüzdan Sayısı: ${user.getWalletCount()}");
  print("Toplam Bakiye: ${user.getTotalBalance()} ");

  print("\n============================\n");
  
  var highestWallet = user.getHighestBalanceWallet();
  print("\nen yüksek bakiye: ${highestWallet.balance} (${highestWallet.category.name})");

  var lowestCategory = user.getLowestBalanceCategory();
  print("en düşük bakiye: $lowestCategory");

  var sortedCashWallets = user.getWalletsSortedByBalance("Vadesiz");
  for (var i = 0; i < sortedCashWallets.length; i++) {
    print("${i + 1}. ${sortedCashWallets[i].balance}");
  }

  print("\n============================\n");

  // try cath blocks
  // try {
  //   wallet1.withdraw(-100);
  // } catch (e) {
  //   print("Hata yakalandı: $e");
  // }
  
  try {
    wallet3.withdraw(2147483647);
  } catch (e) {
    print("Hata yakalandı: $e");
  }
}