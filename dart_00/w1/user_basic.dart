void main()
{
    final String userName;
    int userMoney;

    userName = "Ahmet";
    userMoney = 25;

    for (int i = 0; i < 4; i++)
        userMoney += 5;
    
    print("Merhaba, $userName Hoş geldiniz!");
    print("\nCurrent Balance: $userMoney");

    print("\nSpendings...");
    userMoney -= 5;
    print("Current Balance: $userMoney");

    double dUserMoney = 23.3;
    dUserMoney /= 2;
    print("Double type money: $dUserMoney");
}