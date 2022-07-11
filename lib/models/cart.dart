import 'package:json_annotation/json_annotation.dart';
import './product.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Product {
  int count = 0;
  Cart(
      String title, double price, String id, String description,
      String images, String category, this.count)
      :super(title, price, id, description, images, category);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
