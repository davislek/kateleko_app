import 'package:flutter/material.dart';
import 'package:katale_ko_client/components/default_button.dart';
import 'package:katale_ko_client/models/product.dart';
import 'package:katale_ko_client/services/Firestore.dart';
import 'package:katale_ko_client/size_config.dart';
import 'package:katale_ko_client/utils/application_state.dart';
import 'package:provider/provider.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool addButtonLoad = false;
  void onAddToCart() async
  {
    setState((){
      addButtonLoad = true;
    });
    await FireStoreService.addToCart(Provider.of<ApplicationState>(context,
        listen: false).user, widget.product.id.toString());
    setState((){
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: widget.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {onAddToCart();},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
