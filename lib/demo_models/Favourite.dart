import 'package:flutter/material.dart';
import 'Product.dart';


class Favourite {
  final Product product;
  final int numOfItem;

  Favourite({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Favourite> demoCarts = [
  Favourite(product: demoProducts[0], numOfItem: 2),
  Favourite(product: demoProducts[1], numOfItem: 1),
  Favourite(product: demoProducts[3], numOfItem: 1),
];
