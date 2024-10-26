class ProductEntity {
  final String id;
  final double usdPrice;
  final double egpPrice;
  final String name;
  final String? imageId;

  ProductEntity({
    required this.id,
    required this.usdPrice,
    required this.egpPrice,
    required this.name,
    this.imageId,
  });

  // From JSON
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      usdPrice: json['usd_price'].toDouble(),
      egpPrice: json['egp_price'].toDouble(),
      name: json['name'],
      imageId: json['image_id'],
    );
  }

}


