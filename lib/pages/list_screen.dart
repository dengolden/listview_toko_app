import 'package:flutter/material.dart';
import 'package:listview_toko_app/models/barang.dart';
import 'package:listview_toko_app/pages/detail_screen.dart';

class BarangListScreen extends StatelessWidget {
  final List<Barang> barangs = [
    Barang(
        nama: 'Indomie Rebus',
        harga: 'Rp3.000',
        keterangan:
            'Mie Rebus Instan yang mudah dimasak. \nSetiap pembelian mendapatkan 4 varian. Yaitu Indomie Ayam Spesial, Indomie Kari Ayam, Indomie Soto dan Indomie Ayam Bawang',
        foto: 'assets/indomierebus.png'),
    Barang(
        nama: 'La Pasta Spaghetti',
        harga: 'Rp30.000',
        keterangan:
            'Spaghetti Instan yang mudah dimasak.\nSetiap pembelian La Pasta Spaghetti mendapatkan 2 varian. Yaitu rasa Cheese Bolognese dan Spicy Barbeque',
        foto: 'assets/spaghetti.png'),
    Barang(
        nama: 'Pronas Sarden Saus Tomat',
        harga: 'Rp15.000',
        keterangan:
            'Ikan Sarden Kaleng dengan Saus Tomat. \nPraktis untuk Di Masak Kapan Saja dan Dimana Saja',
        foto: 'assets/sarden.png'),
    Barang(
        nama: 'Gulaku 1/2Kg',
        harga: 'Rp12.000',
        keterangan: 'Gula Pasir Kemasan Ukuran 1/2Kg',
        foto: 'assets/gulaku.png'),
    Barang(
        nama: 'Minyak Tropical',
        harga: 'Rp60.000',
        keterangan:
            'Minyak Goreng Kemasan untuk Memasak \nSetiap Pembelian Mendapatkan 3 Ukuran : 2L, 1L dan 1/2L',
        foto: 'assets/minyaktropical.png'),
  ];

  final List<Barang> keranjang = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Barang',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffFF5858),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/keranjang');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 300,
              ),
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: barangs.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(barangs[index].foto),
                ),
                title: Text(
                  barangs[index].nama,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(barangs[index].harga),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailBarangScreen(
                        barang: barangs[index],
                        keranjang: keranjang,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
