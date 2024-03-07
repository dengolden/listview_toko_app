import 'package:flutter/material.dart';
import 'package:listview_toko_app/models/barang.dart';

class KeranjangScreen extends StatelessWidget {
  final List<Barang> keranjang;

  KeranjangScreen({this.keranjang = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffFF5858),
      ),
      body: ListView.builder(
        itemCount: keranjang.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(keranjang[index].foto),
            ),
            title: Text(keranjang[index].nama),
            subtitle: Text(keranjang[index].keterangan),
          );
        },
      ),
    );
  }
}
