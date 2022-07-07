import 'package:flutter/material.dart';
import 'package:katale_ko_client/components/product_card.dart';
import 'package:katale_ko_client/models/Product.dart';
import 'package:katale_ko_client/screens/services/Firestore.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  Future<List<Product>>? products;
  String title = 'Popular';
  //changing the title function
  String changeTitle(String givenTitle) {
    String title = givenTitle;
    return title;
  }

  @override
  void initState()
  {
    products = FireStoreService.getProducts([]) as Future<List<Product>>?;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: products
        ,builder:(context, AsyncSnapshot<List<Product>> snapshot)
    {
    if(snapshot.hasData && snapshot.data != null)
    {
      return GridView.builder(
          itemCount: snapshot.data?.length,
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemBuilder: (BuildContext context, int index)
          {
            return ProductCard(product: snapshot.data![index]);
          });
    } else
    {
     return const Center(child: CircularProgressIndicator(),);
    }
    }
    );
  }
}
