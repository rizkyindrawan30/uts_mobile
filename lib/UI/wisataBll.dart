import 'package:flutter/material.dart';
import 'package:latihan_mvvm/Model/wisata.dart';
import 'package:latihan_mvvm/Service/apiStatic.dart';
import 'package:latihan_mvvm/UI/detailWisata.dart';
import 'package:latihan_mvvm/UI/homePage.dart';

class WisataBll extends StatefulWidget {
  const WisataBll({Key? key}) : super(key: key);

  @override
  _WisataBllState createState() => _WisataBllState();
}

class _WisataBllState extends State<WisataBll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Buleleng"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder<List<Wisata>>(
        future: ApiStatic.getWisata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Wisata> listWisata = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => DetailWisata(
                                  wisata: listWisata[index],
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.lightBlueAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(ApiStatic.host + '/' + listWisata[index].foto),
                            Column(
                              children: [
                                Text(listWisata[index].namaWisata),
                                Text(
                                  listWisata[index].harga,
                                  style: TextStyle(fontSize: 8),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      // bottomNavigationbar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
              break;
            case 1:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => WisataBll()));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              title: Text("Wisata Buleleng")),
        ],
      ),
    );
  }
}
