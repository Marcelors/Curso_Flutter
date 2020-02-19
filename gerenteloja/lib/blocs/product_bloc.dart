import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductBloc extends BlocBase {


  ProductBloc({this.categoryId, this.product}) {

  }

  String categoryId;
  DocumentSnapshot product;

  @override
  void dispose() {
  }
}