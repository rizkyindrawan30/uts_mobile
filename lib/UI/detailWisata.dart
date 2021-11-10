import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/wisata.dart';

class DetailWisata extends StatefulWidget {
  DetailWisata({required this.wisata});
  final Wisata wisata;
  @override
  _DetailWisataState createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.wisata.namaWisata),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Image.asset(widget.wisata.foto),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
              ),
              child: Text(
                widget.wisata.lokasiWisata,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.wisata.deskripsi),
            ),
          ],
        ),
      ),
    );
  }
}
