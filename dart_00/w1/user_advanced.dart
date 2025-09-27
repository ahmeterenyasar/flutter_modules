
// void main() {
//     String userName = "1. Ahmet";
//     var userName2 = "2. Ahmet";
    
//     const String bankName = "X Bank";
//     final String user1 = "Customer 1";
//     const double user1Money = 100.00;

//     const String user2 = "Customer 2";
//     int user2Money = 300;

//     user2Money = user2Money - user1Money.toInt();
//     print("$user2\nBalance: $user2Money");
// }

void main()
{
    const String halisahaName = "X Sports Club";
    int totalCapacity = 100;
    int customer1Num = 20;
    int customer2Num = 50;
    int order = customer1Num + customer2Num;
    print("$halisahaName");
    print("Saha Kapasitesi: $totalCapacity");
    print("Mevcut boş alan: ${(totalCapacity - (customer1Num + customer2Num) )}");
}