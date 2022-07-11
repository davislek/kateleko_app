part of 'favourite.dart';

Favourite _$FavouriteFromJson(Map<String, dynamic> json) => Favourite(
    json['title'] as String,
    (json['price'] as num).toDouble(),
    json['id'] as String,
    json['description'] as String,
    json['images'] as String,
    json['category'] as String? ?? '',
    (json['count'] as num).toInt()
);