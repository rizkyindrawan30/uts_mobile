import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_mvvm/Model/wisata.dart';

class ApiStatic {
  static final host = 'http://172.16.150.217/wisata/public';
  static gethost() {
    return host;
  }

  static Future<List<Wisata>> getWisata2() async {
    List<Wisata> wisata = [];
    for (var i = 1; i <= 10; i++) {
      wisata.add(Wisata(
        idWisata: i,
        namaWisata: "Nama Wisata" + i.toString(),
        lokasiWisata: "Lokasi : Sambangan Secret Garden",
        foto: "https://images.app.goo.gl/3Kg5pYbK8eqzBFKJA",
        harga: "Rp 10.000/Orang",
        deskripsi:
            "Air Terjun Kroya merupakan air terjun yang memiliki tinggi 35 m dengan sebuah kolam alami yang luas berkedalaman 4 m tepat di bawahnya. Di sini pengunjung bisa menguji adrenalin dengan cara meluncur bebas melalui air terjun atau melompat layaknya di Mahana Point Cliff Jump di Nusa Ceningan.",
        createdAt: "",
        updatedAt: "",
      ));
    }
    return wisata;
  }

  static Future<List<Wisata>> getWisata() async {
    // String response ='{"current_page":1,"data":[{"id_wisata":1,"nama_wisata":"Ambenga Waterfal","lokasi_wisata":"Ambengan","foto":"uploads\/wisata\/1635323227Deadpool-MCU-Future-The-Illuminerdi.jpg","harga":"Rp 5000","deskripsi":"Ada air terjun di ambengan","created_at":"2021-10-27T08:27:07.000000Z","updated_at":"2021-10-27T08:27:07.000000Z"},{"id_wisata":2,"nama_wisata":"Pantai Penimbangan","lokasi_wisata":"Jl. Pura Segara Penimbangan","foto":"uploads\/wisata\/1635607702Pantai-Penimbangan-Buleleng-2.jpg","harga":"Rp 5000","deskripsi":"Nama Pantai Penimbangan Buleleng memang tak begitu setenar Pantai Lovina, meski keduanya sama-sama berada di Bali Utara. Terlepas dari popularitasnya yang memang kurang, bukan berarti Pantai Penimbangan tak layak dijadikan sebagai tempat wisata.","created_at":"2021-10-30T15:28:23.000000Z","updated_at":"2021-10-30T15:28:23.000000Z"}],"first_page_url":"http:\/\/127.0.0.1:8000\/api\/wisata?page=1","from":1,"last_page":1,"last_page_url":"http:\/\/127.0.0.1:8000\/api\/wisata?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/wisata?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http:\/\/127.0.0.1:8000\/api\/wisata","per_page":5,"prev_page_url":null,"to":2,"total":2}';
    try {
      final response = await http.get(Uri.parse("$host/api/wisata"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Wisata>((json) => Wisata.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      return [];
    }
  }
}
