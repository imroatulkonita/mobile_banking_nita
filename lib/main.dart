import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage (),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int saldo = 30000000;

  String formatRupiah(int number) {
    return number.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
    );
  }

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
            padding: EdgeInsets.all(10),
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

                    SizedBox(width: 40),

                    Column(
                      mainAxisSize:   MainAxisSize.min,
                      children: [

                      Image.network("https://images.bisnis.com/posts/2022/02/25/1504876/logo-livin.jpg",
                      width: 60,

                      ),
                      
                        SizedBox(height: 5),

                        Text(
                          "Livin' by Mandiri",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Icon(Icons.mail, color: Colors.white),

                  ],
                ),

                SizedBox(height: 8),

                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                      backgroundImage: NetworkImage("https://png.pngtree.com/png-vector/20240620/ourlarge/pngtree-beautiful-cartoon-girl-logo-png-image_12811932.png"),
                    ),
                  ),
                    SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Imroatul Konita",
                               style: TextStyle(
                                color: Colors.white,
                                fontSize: 18)),
                            Text(
                              "2.600 Livin' poin",
                                 style: TextStyle(
                                  color: Colors.white70),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),


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
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Text(
                                    "Rp ${formatRupiah(saldo)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),

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

                        GestureDetector(
                          onTap: () {
                            TextEditingController nama = TextEditingController();
                            TextEditingController nominal = TextEditingController();

                            showDialog(
                              context: context, 
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Transfer Uang"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nama,
                                        decoration: InputDecoration(labelText: "Nama Tujuan"),
                                      ),
                                      TextField(
                                        controller: nominal,
                                        decoration: InputDecoration(labelText: "Nominal"),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Batal"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                         int jumlah = int.tryParse(nominal.text) ?? 0;
                                         if (jumlah <= 0) {
                                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nominal tidak valid")),
                                         );
                                         return;
                              }

                              if (jumlah > saldo){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saldo tidak cukup")),
                                );
                                return;
                              }

                              setState(() {
                                saldo -= jumlah;
                              });

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Transfer ke ${nama.text} sebesar Rp $jumlah berhasil",
                                      ),
                                    ),
                                  );
                               },
                               child: Text("Kirim"),
                                ),
                             ],
                           );
                          },
                        );
                      },
                        child: menuItem(Icons.send, "Transfer"),
                        ),
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
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Text("Home", style: TextStyle(fontSize: 10)),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProdukPage()),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag),
                Text("Produk", style: TextStyle(fontSize: 10)),
              ],
            ),
          ),

          SizedBox(width: 50),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PromoPage()),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_giftcard),
                Text("Promo", style: TextStyle(fontSize: 10)),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilPage()),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                Text("Profil", style: TextStyle(fontSize: 10)),
                ],
              ),
            ),

           ],
          ),
        ),
      ),

      // BUTTON QR TENGAH
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF00AEEF),
        elevation: 6,
        child: Icon(Icons.qr_code, size: 30,),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: Text("QRIS"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.qr_code, size: 100),
                    SizedBox(height: 10),
                    Text("Scan / Bayar QRIS"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), 
                    child: Text("Tutup"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      floatingActionButtonLocation: 
          FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ProdukPage extends StatelessWidget{
  const ProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produk")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("Tabungan"),
            subtitle: Text("Buku Rekening Baru"),
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Kartu Kredit"),
            subtitle: Text("Ajukan Kartu Kredit"),
          ),
          ListTile(
            leading: Icon(Icons.savings),
            title: Text("Deposito"),
            subtitle: Text("Investasi aman"),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text("Pinjaman"),
            subtitle: Text("Ajukan Pinjaman"),
          ),
        ],
      ),
    );
  } 
}

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("promo")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.red),
              title: Text("Cashback 50%"),
              subtitle: Text("Transfer bebas biaya"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.discount, color: Colors.orange),
              title: Text("Diskon Merchant"),
              subtitle: Text("Belanja hemat di partner"),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilPage extends StatelessWidget{
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://png.pngtree.com/png-vector/20240620/ourlarge/pngtree-beautiful-cartoon-girl-logo-png-image_12811932.png"),
          ),
          SizedBox(height: 10),
          Text("Imroatul Konita",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("nita@gmail.com"),
          SizedBox(height: 20),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Pengaturan"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}