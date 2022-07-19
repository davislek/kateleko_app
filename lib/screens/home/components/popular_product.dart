import 'package:flutter/material.dart';
import 'package:katale_ko_client/components/product_card.dart';
import 'package:katale_ko_client/models/product.dart';
import 'package:katale_ko_client/services/Firestore.dart';


class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  Future<List<Product>>? products;
  //changing the title function

  @override
  void initState() {
    super.initState();
    products = FireStoreService.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {;
    return FutureBuilder<List<Product>>(
        future: products,
        builder:(context, AsyncSnapshot<List<Product>> snapshot)
    {
    if(snapshot.hasData && snapshot.data != null)
    {
      return SingleChildScrollView(
        child: GridView.builder(
            itemCount: snapshot.data?.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: const EdgeInsets.all(2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index)
            {
              return
                ProductCard(
                  product: snapshot.data![index]
                );
            }),
      );
    }
    else
    {
     return const Center(child: CircularProgressIndicator());
    }
    }
    );
  }
}
