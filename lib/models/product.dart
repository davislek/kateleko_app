import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String title;
  final List<String> images;
  final price;
  final bool isFavourite, isPopular;

  @JsonKey(defaultValue: '')

  Product({
    required this.id,
    required this.images,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json)  => _$ProductToJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}