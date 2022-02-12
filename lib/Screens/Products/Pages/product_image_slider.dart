import 'package:eshop/Screens/Products/Pages/product_details.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSider extends StatefulWidget {
  final List<String>? images;

  const ProductImageSider({
    Key? key,
    this.images,
  }) : super(key: key);

  @override
  _ProductImageSiderState createState() => _ProductImageSiderState();
}

class _ProductImageSiderState extends State<ProductImageSider> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 2,
          width: size.width,
          child: PageView(
            children: <Widget>[
              ...widget.images!
                  .map((e) => e.isNotEmpty
                      ? GestureDetector(
                          child: Image.network(e),
                        )
                      : Container())
                  .toList()
            ],
            controller: controller,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: widget.images?.length ?? 0,
                    effect: const WormEffect(
                        activeDotColor: AppColors.darkBlue,
                        paintStyle:
                            PaintingStyle.stroke), // your preferred effect
                    onDotClicked: (index) {}),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
