class Araba {
  final String detayLink;
  final String aciklama;
  final String marka;
  final String model;
  final String km;
  final String vites;
  final double fiyat;
  final List<String> fotoUrls;

  Araba({
    required this.detayLink,
    required this.aciklama,
    required this.marka,
    required this.model,
    required this.km,
    required this.vites,
    required this.fiyat,
    required this.fotoUrls,
  });

  factory Araba.fromJson(Map<String, dynamic> json) {
    return Araba(
      detayLink: json['detayLink'],
      aciklama: json['aciklama'],
      marka: json['marka'],
      model: json['model'],
      km: json['km'],
      vites: json['vites'],
      fiyat: (json['fiyat'] as num).toDouble(),
      fotoUrls: List<String>.from(json['fotoUrls']),
    );
  }
}
