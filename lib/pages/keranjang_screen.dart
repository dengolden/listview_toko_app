import 'package:flutter/material.dart';
import 'package:listview_toko_app/models/barang.dart';
import 'package:listview_toko_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class KeranjangScreen extends StatelessWidget {
  final List<Barang> keranjang;

  KeranjangScreen({this.keranjang = const []});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final List<Barang> keranjang = cartProvider.keranjang;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              cartProvider.clearItemFromCart();
            },
            icon: Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Color(0xffFF5858),
      ),
      body: keranjang.isEmpty
          ? Center(
              child: Text('Keranjang belanja kosong'),
            )
          : ListView.builder(
              itemCount: keranjang.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(keranjang[index].nama),
                  onDismissed: (direction) {
                    cartProvider.removeItemFromCart(keranjang[index]);
                  },
                  background: Container(
                    color: Color(0xffFF5858),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(keranjang[index].foto),
                    ),
                    title: Text(
                      keranjang[index].nama,
                    ),
                    subtitle: Text(keranjang[index].harga),
                  ),
                );
              },
            ),
    );
  }
}
