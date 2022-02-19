import 'package:eshop/Screens/CommonWidgets/app_loader.dart';
import 'package:eshop/Screens/Home/Views/banner_products_page.dart';
import 'package:eshop/Screens/Home/bloc/home_repo.dart';
import 'package:eshop/Screens/Home/bloc/index.dart';
import 'package:eshop/Utils/app_navigator.dart';
import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBannerView extends StatefulWidget {
  const HomeBannerView({Key? key}) : super(key: key);

  @override
  State<HomeBannerView> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends State<HomeBannerView> {
  int index = 0;
  final pageController = PageController();
  HomeBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(HomeDefaultState(), HomeRepo());
    bloc?.add(LoadOffersEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is HomeLoadingState || state is HomeDefaultState) {
            return const AppLoader();
          }

          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 150, //size.height / 4,
                  width: size.width,
                  child: PageView(
                    children: <Widget>[
                      ...bloc!.repo.offers
                          .map((e) => GestureDetector(
                                onTap: () => showProducts(context, e.id),
                                child: Image.network(
                                  e.logo ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ))
                          .toList()
                    ],
                    controller: pageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: SmoothPageIndicator(
                              controller: pageController,
                              count: bloc!.repo.offers.length,
                              effect: const WormEffect(
                                  activeDotColor: AppColors.darkBlue,
                                  paintStyle: PaintingStyle
                                      .stroke), // your preferred effect
                              onDotClicked: (index) {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  showProducts(context, id) {
    AppNavigator.push(context, BannerProductsPage(id: id));
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }
}
