import 'package:flutter/material.dart';
import 'package:listview_toko_app/models/barang.dart';

class CartProvider extends ChangeNotifier {
  List<Barang> _keranjang = [];

  List<Barang> get keranjang => _keranjang;

  void addItemToCart(Barang barang) {
    bool itemExists = _keranjang.any((item) => item.nama == barang.nama);

    if (itemExists) {
      for (int i = 0; i < _keranjang.length; i++) {
        if (_keranjang[i].nama == barang.nama) {
          _keranjang[i] =
              _keranjang[i].copyWith(jumlah: _keranjang[i].jumlah + 1);
          break;
        }
      }
    } else {
      _keranjang.add(barang.copyWith(jumlah: 1));
    }
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

  void decrementItem(Barang barang) {
    for (int i = 0; i < _keranjang.length; i++) {
      if (_keranjang[i].nama == barang.nama) {
        if (_keranjang[i].jumlah > 1) {
          _keranjang[i] =
              _keranjang[i].copyWith(jumlah: _keranjang[i].jumlah - 1);
        } else {
          _keranjang.removeAt(i);
        }
        break;
      }
    }
    notifyListeners();
  }

  void incrementItem(Barang barang) {
    for (int i = 0; i < _keranjang.length; i++) {
      if (_keranjang[i].nama == barang.nama) {
        _keranjang[i] =
            _keranjang[i].copyWith(jumlah: _keranjang[i].jumlah + 1);
        break;
      }
    }
    notifyListeners();
  }
}
