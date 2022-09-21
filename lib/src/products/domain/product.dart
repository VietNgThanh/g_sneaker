import 'dart:convert';

typedef ProductId = String;

class Product {
  const Product({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  final ProductId id;
  final String image;
  final String name;
  final String description;
  final double price;
  final String color;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: (map['id'] as num).toInt().toString(),
      image: map['image'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
