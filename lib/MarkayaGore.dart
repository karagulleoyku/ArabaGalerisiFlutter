import 'package:flutter/material.dart';
import 'ApiService.dart';
import 'araba.dart';

class MarkayaGore extends StatefulWidget {
  const MarkayaGore({super.key});

  @override
  State<MarkayaGore> createState() => _MarkayaGoreState();
}

class _MarkayaGoreState extends State<MarkayaGore> {
  final TextEditingController _aramaController = TextEditingController();

  Future<List<Araba>>? _arabaListesi;// apiden gelen veriyi tutacak

  @override
  void initState() {
    super.initState();
    _aramaController.addListener(_aramaYap);
  }
  void _aramaYap() {
    if (_aramaController.text.isNotEmpty) {
      setState(() {
        _arabaListesi = ApiService.markayaGoreAra(_aramaController.text);
      });
    } else {
      setState(() {
        _arabaListesi = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Markaya Göre Ara")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _aramaController,
              decoration: const InputDecoration(
                labelText: 'Marka Girin',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _arabaListesi == null
                  ? const Center(child: Text('Lütfen aramak istediğiniz markayı girin'))
                  : FutureBuilder<List<Araba>>(
                future: _arabaListesi,
                builder: (context, gelenVeri) {
                  if (gelenVeri.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (gelenVeri.hasError) {
                    return Center(child: Text('Hata: ${gelenVeri.error}'));
                  } else if (gelenVeri.hasData && gelenVeri.data!.isNotEmpty) {
                    final arabalar = gelenVeri.data!;
                    return ListView.builder(
                      itemCount: arabalar.length,
                      itemBuilder: (context, index) {
                        final araba = arabalar[index];
                        return Card(
                          child: ListTile(
                            title: Text("${araba.marka} ${araba.model}"),
                            subtitle: Text("${araba.fiyat} TL"),
                            leading: araba.fotoUrls.isNotEmpty
                                ? Image.network(araba.fotoUrls.first,
                                width: 50, height: 50, fit: BoxFit.cover)
                                : const Icon(
                              Icons.image_not_supported,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Sonuç bulunamadı'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}