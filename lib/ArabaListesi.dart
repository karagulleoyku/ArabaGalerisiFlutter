import 'package:flutter/material.dart';
import 'ApiService.dart';
import 'araba.dart';

class ArabaListesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Araba Galerisi")),
      body: FutureBuilder<List<Araba>>( //veriler api'den geldiği için FutureBuilder
        future: ApiService.arabalarGetir(), //api çağrısı
        builder: (context, gelenVeri) {
          if (gelenVeri.connectionState == ConnectionState.waiting) { //verileri beklerken yükleniyor ekrani
            return Center(child: CircularProgressIndicator());
          } else if (gelenVeri.hasData) { //apiden veri geldiyse list yap
            final arabalar = gelenVeri.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final araba = arabalar[index];
                return ListTile(
                  title: Text("${araba.marka} ${araba.model}"),
                  subtitle: Text("${araba.fiyat} TL"),
                  leading: araba.fotoUrls.isNotEmpty
                      ? Image.network(araba.fotoUrls.first,
                      width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(
                    Icons.image_not_supported,
                  size: 40,
                  color: Colors.grey,),
                );
              },
            );
          } else {
            return Center(child: Text('Veri bulunamadı'));
          }
        },
      ),
    );
  }
}