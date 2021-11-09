class listBarang {
  final String code;
  final String name;
  final String images;
  final double rate;
  final String promo;

  listBarang({this.code, this.name, this.images, this.rate, this.promo});

  factory listBarang.fromJson(dynamic json) {
    return listBarang(
      code: json['code'] as String,
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rate: json['rat3'] as double,
        promo: json['promo'] as String);
  }

  static List<listBarang> listBarangFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return listBarang.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'listBarang {code: $code, name: $name, image: $images, rating: $rate, totalTime: $promo}';
  }
}
