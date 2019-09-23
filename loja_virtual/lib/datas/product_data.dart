import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String id;
  String title;
  String description;
  double price;
  List imagens;
  List sizes;

  String category;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    price = snapshot.data["price"] + 0.0;
    imagens = snapshot.data["imagens"];
    sizes = snapshot.data["size"];
    description = snapshot.data["description"];
  }
}