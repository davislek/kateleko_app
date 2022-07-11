import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/cart.dart';
import '../../models/product.dart';
import '../models/favourite.dart';

class FireStoreService {
  static const String ProductCollection = 'product';
  static const String CustomerCollection = 'customer';
  static const String CartCollection = 'cart';
  static const String FavouriteCollection = 'favourite';

  static Future<List<Product>> getProducts(List<String>? ids) async {
    try {
      final ProductRef = FirebaseFirestore.instance.collection(ProductCollection).withConverter<Product>(
              fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
              toFirestore: (product, _) => product.toJson());

      QuerySnapshot<Product> productDoc;
      if (ids != null && ids.isNotEmpty) {
        productDoc = await ProductRef.where('id', whereIn: ids).get();
      }
      else
      {
        //assets
        print("its this function");
        productDoc = await ProductRef.get();
      }
      return productDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting the product", stackTrace: stacktrace, error: e);
    }
    return [];
  }


  //cart logic
  static addToCart(User? user, String productId) async {
    if (user == null) return;
    try {
      var doc = FirebaseFirestore
          .instance
          .collection(CustomerCollection)
          .doc(user.uid)
          .collection(CartCollection)
          .doc(productId);
      DocumentReference<Map<String, dynamic>> product = doc;
      if ((await product.get()).exists) {
        product.update({"count": FieldValue.increment(1)});
      }
      else{
        product.set({"id": productId, "count": 1});
      }
    } catch (e, stackTrace) {
      log("Error adding to cart", stackTrace: stackTrace, error: e);
    }
  }
Future<List<Cart>>? carts;
  static Future<List<Cart>> getCart(User? user) async{
    List<Cart> carts = [];
    try
    {
     final cartRef = await FirebaseFirestore.instance
        .collection(CustomerCollection)
        .doc(user?.uid)
        .collection(CartCollection)
         .get();
     List<String> productIds = [];
     for(var element in cartRef.docs) {
       productIds.add(element['id']);
     }
     List<Product> products  = await getProducts(productIds);
     for(var element in cartRef.docs){
       Product product = products.firstWhere((prod) => prod.id == element.id);
       var json = product.toJson();
       json['count'] = element['count'];
       carts.add(Cart.fromJson(json));
     }
    }on FirebaseException
    catch(e, stacktrace)
    {
      log("Error getting Cart ", stackTrace: stacktrace, error: e);
    }
    return carts;
  }
  static double getCartTotal(List<Cart> carts){
    double total = 0;
    for(Cart cart in carts)
    {
      total += cart.price * cart.count;
    }
    return total;
  }

  static double getCartNumber(List<Cart> carts){
    double Number = 0;
    for(Cart cart in carts){
      Number++;
    }
    return Number;
  }

  //favourite logic
  static addToFavourites(User? user, String productId) async {
    if (user == null) return;
    try {
      var doc = FirebaseFirestore
          .instance
          .collection(CustomerCollection)
          .doc(user.uid)
          .collection(FavouriteCollection)
          .doc(productId);
      DocumentReference<Map<String, dynamic>> product = doc;
      if ((await product.get()).exists) {
        product.update({"count": FieldValue.increment(1)});
      }
      else{
        product.set({"id": productId, "count": 1});
      }
    } catch (e, stackTrace) {
      log("Error adding to favourites", stackTrace: stackTrace, error: e);
    }
  }

  Future<List<Favourite>>? favourites;
  static Future<List<Favourite>> getFavourites(User? user) async{
    List<Favourite> favourites = [];
    try
    {
      final favouriteRef = await FirebaseFirestore.instance
          .collection(CustomerCollection)
          .doc(user?.uid)
          .collection(FavouriteCollection)
          .get();
      List<String> productIds = [];
      for(var element in favouriteRef.docs) {
        productIds.add(element['id']);
      }
      List<Product> products  = await getProducts(productIds);
      for(var element in favouriteRef.docs){
        Product product = products.firstWhere((prod) => prod.id == element.id);
        var json = product.toJson();
        json['count'] = element['count'];
        favourites.add(Favourite.fromJson(json));
      }
    }
    catch(e, stacktrace)
    {
      log("Error getting Cart ", stackTrace: stacktrace, error: e);
    }
    return favourites;
  }

}

