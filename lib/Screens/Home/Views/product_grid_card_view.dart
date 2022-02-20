import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_price.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:flutter/material.dart';

class ProductCardView extends StatelessWidget {
  final MProducts? product;
  const ProductCardView({Key? key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 1,
                offset: Offset(1.0, 1.0), // Shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    product?.logo ?? "",
                    fit: BoxFit.fill,
                    //height: 150.0,
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 37.0,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  child: AppTitle(
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    color: Colors.black,
                    title: product?.name,
                    padding: const EdgeInsets.only(top: 7.0),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppPrice(titel: "Rs ", price: product!.price!),
                      const Spacer(),
                      AppPrice(
                        titel: "Rs ",
                        price: (product!.offerPrice!),
                        isLineThrough: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
