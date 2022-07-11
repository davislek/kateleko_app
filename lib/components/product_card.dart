import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:katale_ko_client/models/product.dart';
import 'package:katale_ko_client/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../services/Firestore.dart';
import '../size_config.dart';
import '../utils/application_state.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void onAddToFavourites() async
  {
    await FireStoreService.addToCart(Provider.of<ApplicationState>(context,
        listen: false).user, widget.product.id.toString());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Added to favourites"),
      backgroundColor: Colors.deepOrange,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: widget.product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: Image.asset(widget.product.images),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color:kPrimaryColor.withOpacity(0.15),
                        //product.isFavourite
                          //  ? kPrimaryColor.withOpacity(0.15)
                           // : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: (){
                          onAddToFavourites();
                        },
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color:Color(0xFFDBDEE4)
                          //product.isFavourite
                           //   ? Color(0xFFFF4848)
                            //  : Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
