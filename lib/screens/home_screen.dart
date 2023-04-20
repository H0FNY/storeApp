import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/serveces/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 13, right: 13),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProducts().getAllproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 45,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
