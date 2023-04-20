import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  ProductModel product ;
  CustomCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(.2),
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Card(
            elevation: 4,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$'+product.price.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 20,
            bottom: 55,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            )),
      ],
    );
  }
}
