import 'package:default_project/models/product/rating_model.dart';

class ProductsModel {
  final num id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      this.rating});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json["id"] as num? ?? 0,
        title: json["title"] as String? ?? "",
        price: json["price"] as num? ?? 0,
        description: json["description"] as String? ?? "",
        category: json["category"] as String? ?? "",
        image: json["image"] as String? ?? "",
        rating: Rating.fromJson(json["rating"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating!.toJson(),
    };
  }
}
