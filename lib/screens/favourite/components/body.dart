import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:katale_ko_client/models/favourite.dart';
import 'package:provider/provider.dart';

import '../../../services/Firestore.dart';
import '../../../size_config.dart';
import '../../../utils/application_state.dart';
import 'favourite_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Future<List<Favourite>>? favourites;

  @override
  void initState(){
    super.initState();
    favourites = FireStoreService.getFavourites(Provider.of<ApplicationState>(
        context, listen: false).user);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Favourite>>(
        future: favourites,
        builder: (context, AsyncSnapshot<List<Favourite>> snapshot) {
        if (snapshot.hasData && snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
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
                      child: FavouriteCard(favourite: snapshot.data![index]),
                    ),
                  ),
            ),
          );
        }
        else if(snapshot.data!=null && snapshot.data!.isEmpty){
          return const Center(
              child:Icon(
                  Icons.thumb_up_alt_rounded,
                  color:Colors.red,
                  size:90
              )
          );
        }
        return Center(child:CircularProgressIndicator());
      },
    );
  }
}