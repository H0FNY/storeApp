import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/componants/componants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/serveces/update_product_service.dart';

class updateScreen extends StatefulWidget {
  updateScreen({Key? key}) : super(key: key);
  static String id = "update product";

  @override
  State<updateScreen> createState() => _updateScreenState();
}

class _updateScreenState extends State<updateScreen> {
  String? title, desc, image, price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(),
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomText(
                    hint: 'title',
                    onchange: (value) {
                      title = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomText(
                    onchange: (value) {
                      desc = value;
                    },
                    hint: 'description',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomText(
                    hint: 'price',
                    onchange: (value) {
                      price = value;
                    },
                    keyboard: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomText(
                      hint: 'image',
                      onchange: (value) {
                        image = value;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomButton(
                    text: 'Update',
                    onpressed: () async {
                      setState(() {
                        isloading = !isloading;
                      });
                      try {
                        await Update(product);
                        print('success');
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isloading = !isloading;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Update(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id,
        title: title == null ? product.title : title!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        image: image==null ? product.image:image!,
        category: product.category);
  }
}
