class Wisata {
  Wisata({
    required this.idWisata,
    required this.namaWisata,
    required this.lokasiWisata,
    required this.foto,
    required this.harga,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });
  int idWisata;
  String namaWisata;
  String lokasiWisata;
  String foto;
  String harga;
  String deskripsi;
  String createdAt;
  String updatedAt;

  factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        idWisata: json["id_wisata"],
        namaWisata: json["nama_wisata"].toString(),
        lokasiWisata: json["lokasi_wisata"].toString(),
        foto: json["foto"].toString(),
        harga: json["harga"].toString(),
        deskripsi: json["deskripsi"].toString(),
        createdAt: json["create_at"].toString(),
        updatedAt: json["update_at"].toString(),
      );
}
