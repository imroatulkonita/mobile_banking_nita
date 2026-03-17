import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage (),
    );
  }
}

class HomePage extends StatelessWidget{

  Widget menuItem(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 11))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: ListView(
        children: [

          // HEADER
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.blue),
                        ),
                        SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "BANK MANDIRI",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 10),
                            
                            Text("Imroatul Konita",
                               style: TextStyle(
                                color: Colors.white,
                                fontSize: 18)),
                            Text("2.600 poin",
                                 style: TextStyle(
                                  color: Colors.white70))

                          ],
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Icon(Icons.mail, color: Colors.white),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 20),

                // CARD REKENING
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rekening",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Icon(Icons.visibility, size: 18),
                                SizedBox(width: 5),
                                Text("Saldo"),
                              ],
                            )
                          ],
                        ),

                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            menuItem(Icons.account_balance, "Tabungan"),
                            menuItem(Icons.credit_card, "Kartu"),
                            menuItem(Icons.savings, "Deposito"),
                            menuItem(Icons.money, "pinjaman"),
                            menuItem(Icons.show_chart, "Investasi"),
                          ],
                        ),

                        SizedBox(height: 15),

                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tabungan Nita"),
                                  Text("30.000.000",
                                       style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                ],
                              ),
                              Icon(Icons.credit_card)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 15),

          // TRANSAKSI FAVORIT
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Transaksi Favorit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold)),
                        Icon(Icons.settings)
                      ],
                    ),

                    SizedBox(height: 15),

                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      children: [

                        menuItem(Icons.send, "Transfer"),
                        menuItem(Icons.receipt, "Bayar"),
                        menuItem(Icons.account_balance_wallet, "Top Up"),
                        menuItem(Icons.qr_code, "QRIS"),
                        menuItem(Icons.money, "Tarik"),
                        menuItem(Icons.public, "Valas"),
                        menuItem(Icons.show_chart, "Invest"),
                        menuItem(Icons.qr_code_scanner, "QR Trf"),
                        menuItem(Icons.wifi, "Tap Pay"),
                        menuItem(Icons.more_horiz, "Lainnya"),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text("Home", style: TextStyle(fontSize: 10)),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text("Home", style: TextStyle(fontSize: 10),)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag),
                  Text("Produk", style: TextStyle(fontSize: 10),)
                ],
              ),

              SizedBox(width: 40),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.card_giftcard),
                  Text("Promo", style:  TextStyle(fontSize: 10)),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text("Profil", style: TextStyle(fontSize: 10)),
                ],
              ),
              
            ],
          ),
        ),
      ),

      // BUTTON QR TENGAH
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.qr_code),
        onPressed: () {},
      ),
      floatingActionButtonLocation: 
          FloatingActionButtonLocation.centerDocked,
    );
  }
}