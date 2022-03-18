import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/CommonWidgets/app_title.dart';
import 'package:eshop/Screens/CommonWidgets/cart_view.dart';
import 'package:eshop/Screens/CommonWidgets/nav_bar.dart';
import 'package:eshop/Screens/Products/Pages/product_image_slider.dart';
import 'package:eshop/Screens/Products/Views/product_like_view.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  final MProducts? product;
  const ProductDetailsView({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
        title: "Product details",
        isCart: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ProductImageSider(
                    images: product?.images,
                  ),
                  Positioned(
                    child: ProductLikeView(
                      product: product,
                    ),
                    right: 0,
                    top: 0,
                  ),
                ],
              ),
              AppTitle(
                title: product!.name,
                textAlign: TextAlign.left,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const AppTitle(
                        title: "Price Rs: ",
                        fontWeight: FontWeight.bold,
                      ),
                      AppTitle(title: product?.price.toString()),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const AppTitle(
                        title: "Offer Price RS: ",
                        fontWeight: FontWeight.bold,
                      ),
                      AppTitle(title: product?.offerPrice.toString())
                    ],
                  ),
                  const Spacer(),
                  AppCartView(
                    productId: product!.id!,
                    quantity: 1,
                  )
                ],
              ),
              const AppTitle(
                title: "Description: ",
                textAlign: TextAlign.left,
                maxLines: 100,
                fontWeight: FontWeight.bold,
                padding: EdgeInsets.only(top: 10),
              ),
              AppTitle(
                title: product!.description,
                textAlign: TextAlign.left,
                maxLines: 100,
                padding: const EdgeInsets.only(top: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
