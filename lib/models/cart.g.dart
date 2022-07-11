part of 'cart.dart';

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  json['title'] as String,
  (json['price'] as num).toDouble(),
  json['id'] as String,
  json['description'] as String,
  json['images'] as String,
  json['category'] as String? ?? '',
  (json['count'] as num).toInt()
);