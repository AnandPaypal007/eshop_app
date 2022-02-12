import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

class ProductListCardView extends StatelessWidget {
  final MProducts? product;
  const ProductListCardView({Key? key, @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey500!,
              blurRadius: 1,
              offset: Offset(1.0, 1.0), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product?.logo ?? "",
                fit: BoxFit.fill,
                height: 100.0,
                width: 100.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        height: 40.0,
                        color: Colors.blue[50],
                        child: AppTitle(
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          color: Colors.black,
                          title: product?.name,
                          padding: const EdgeInsets.only(top: 7.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTitle(
                            title: product?.price.toString(),
                            color: Colors.white,
                            //padding: const EdgeInsets.only(bottom: 10),
                          ),
                          // const Spacer(),
                          AppTitle(
                            color: Colors.white,
                            title: product?.offerPrice.toString(),
                            //padding: const EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
