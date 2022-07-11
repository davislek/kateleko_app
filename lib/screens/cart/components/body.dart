import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:katale_ko_client/models/cart.dart';
import 'package:katale_ko_client/services/Firestore.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import '../../../utils/application_state.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Cart>>? carts;

  @override
  void initState(){
    super.initState();
    carts = FireStoreService.getCart(Provider.of<ApplicationState>(
        context, listen: false).user);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: carts,
      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
        print("called");
        if (snapshot.hasData && snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          print("data is there");
          return Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(snapshot.data![index].id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {});
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset("assets/icons/Trash.svg"),
                          ],
                        ),
                      ),
                      child: CartCard(cart: snapshot.data![index]),
                    ),
                  ),
            ),
          );
        }
        else if(snapshot.data!=null && snapshot.data!.isEmpty){
          print("data == null");
          return const Center(
            child:Icon(
              Icons.add_shopping_cart_sharp,
              color:Colors.yellow,
              size:90
            )
          );
        }
        return Center(child:CircularProgressIndicator());
      },
    );
  }
}