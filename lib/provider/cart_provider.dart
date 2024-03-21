import 'package:flutter/material.dart';
import 'package:listview_toko_app/models/barang.dart';

class CartProvider extends ChangeNotifier {
  List<Barang> _keranjang = [];

  List<Barang> get keranjang => _keranjang;

  void addItemToCart(Barang barang) {
    _keranjang.add(barang);
    notifyListeners();
  }

  void removeItemFromCart(Barang barang) {
    _keranjang.remove(barang);
    notifyListeners();
  }

  void clearItemFromCart() {
    _keranjang.clear();
    notifyListeners();
  }
}
