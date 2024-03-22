class Barang {
  final String nama;
  final String harga;
  final String keterangan;
  final String foto;
  final int jumlah;

  Barang({
    required this.nama,
    required this.harga,
    required this.keterangan,
    required this.foto,
    this.jumlah = 1,
  });

  Barang copyWith({
    String? nama,
    String? harga,
    String? keterangan,
    String? foto,
    int? jumlah,
  }) {
    return Barang(
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      keterangan: keterangan ?? this.keterangan,
      foto: foto ?? this.foto,
      jumlah: jumlah ?? this.jumlah,
    );
  }
}
