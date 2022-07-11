import 'package:json_annotation/json_annotation.dart';
import './product.dart';

part 'favourite.g.dart';

@JsonSerializable()
class Favourite extends Product {
  int count = 0;

  Favourite(String title, double price, String id, String description, String images,
      String category, this.count)
      : super(title, price, id, description, images, category);

  factory Favourite.fromJson(Map<String, dynamic> json) => _$FavouriteFromJson(json);
}
