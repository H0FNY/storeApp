import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProducts {
  Future<List<ProductModel>> getAllproduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return list;
  }
}
