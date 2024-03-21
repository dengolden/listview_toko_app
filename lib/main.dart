import 'package:flutter/material.dart';
import 'package:listview_toko_app/pages/keranjang_screen.dart';
import 'package:listview_toko_app/pages/list_screen.dart';
import 'package:listview_toko_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'List Barang',
        routes: {
          '/': (context) => BarangListScreen(),
          '/keranjang': (context) => KeranjangScreen(),
        },
      ),
    );
  }
}
