import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class Categories {
  Future<List<ProductModel>> getCategories({required String category}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category');
    List<ProductModel> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return list;
  }
}
