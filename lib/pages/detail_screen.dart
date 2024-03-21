import 'package:flutter/material.dart';
import 'package:listview_toko_app/models/barang.dart';
import 'package:listview_toko_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class DetailBarangScreen extends StatelessWidget {
  final Barang barang;
  final List<Barang> keranjang;

  DetailBarangScreen({required this.barang, required this.keranjang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          barang.nama,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffFF5858),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              barang.foto,
              width: 200,
              height: 200,
            ),
            Text(
              barang.harga,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              barang.keterangan,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffFF5858),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);

                  cartProvider.addItemToCart(barang);
                  Navigator.pushNamed(context, '/keranjang');
                },
                child: Text(
                  'Tambahkan ke Keranjang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
