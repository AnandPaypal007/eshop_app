import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBannerView extends StatefulWidget {
  const HomeBannerView({Key? key}) : super(key: key);

  @override
  State<HomeBannerView> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends State<HomeBannerView> {
  int index = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height / 3,
          width: size.width,
          child: PageView(
            children: <Widget>[Container()],
            controller: pageController,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                    controller: pageController,
                    count: 5,
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
}
