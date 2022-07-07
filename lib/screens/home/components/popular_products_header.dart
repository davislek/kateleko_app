import 'package:flutter/material.dart';
import 'package:katale_ko_client/screens/home/components/popular_product.dart';
import 'package:katale_ko_client/screens/home/components/section_title.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class PopularProductsHeader extends StatefulWidget {
  const PopularProductsHeader({Key? key}) : super(key: key);

  @override
  State<PopularProductsHeader> createState() => _PopularProductsHeaderState();
}

class _PopularProductsHeaderState extends State<PopularProductsHeader> {
  String title = 'Popular';

  //changing the title function
  String changeTitle(String givenTitle) {
    String title = givenTitle;
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(title: '$title', press: () {}),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: PopularProducts()
              //  Row(
              //   children: [
              //     ...List.generate(
              //       demoProducts.length,
              //       (index) {
              //         if (true) return ProductCard(product: demoProducts[index]);
              //         return SizedBox
              //             .shrink(); // here by default width and height is 0
              //       },
              //     ),
              //     SizedBox(width: getProportionateScreenWidth(20)),
              //   ],
              // ),
            )
          ],
        );;
  }
}
