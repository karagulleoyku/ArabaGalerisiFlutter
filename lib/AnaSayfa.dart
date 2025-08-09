import 'package:flutter/material.dart';
import 'ArabaListesi.dart';
import 'FiyataGore.dart';
import 'MarkayaGore.dart';
import 'SatinAl.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Araba Galerisi")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC5B0CD),
                minimumSize: Size(230, 60),
              ) ,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArabaListesi()),
                );
              },
              child: Text("Arabaları Listele", style: TextStyle(fontSize: 20)),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style:ElevatedButton.styleFrom(backgroundColor: Color(0xFFC5B0CD), minimumSize: Size(200, 60)) ,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarkayaGore()),
                );
              },
              child: Text("Marka Ara", style: TextStyle(fontSize: 20)),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style:ElevatedButton.styleFrom(backgroundColor: Color(0xFFC5B0CD), minimumSize: Size(200, 60)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FiyataGore()),
                );
              },
              child: Text("Fiyat Filtrele", style: TextStyle(fontSize: 20)),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style:ElevatedButton.styleFrom(backgroundColor: Color(0xFFC5B0CD), minimumSize: Size(150, 60)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SatinAl()),
                );
              },
              child: Text("Satın Al", style: TextStyle(fontSize: 20)),
            ),
          ],
          )
      ),
    );
  }
}