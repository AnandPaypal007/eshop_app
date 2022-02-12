import 'package:eshop/Utils/apptheme.dart';
import 'package:flutter/material.dart';

import 'app_textfield.dart';
import 'app_title.dart';
import 'nav_cart_view.dart';

class Navbar extends StatelessWidget implements PreferredSize {
  final String? title;
  final double height;
  final bool isSearch;
  final bool isCart;
  final bool isLocalised;
  final Function? searchCallBack;
  final bool isAddButton;
  final Function? addCallBack;

  const Navbar(
      {this.height = kToolbarHeight,
      Key? key,
      @required this.title,
      this.isSearch = false,
      this.isCart = false,
      this.isLocalised = true,
      this.searchCallBack,
      this.isAddButton = false,
      this.addCallBack});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: white,
      centerTitle: true,
      actions: [
        isCart ? const NavCartView() : Container(),
        isAddButton
            ? IconButton(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.darkBlue,
                ),
                onPressed: () => addCallBack!())
            : Container()
      ],
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      title: isSearch
          ? _searchBar()
          : AppTitle(
              title: title,
              fontSize: 22,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              isLocalised: isLocalised,
            ),
    );
  }

  _searchBar() {
    return GestureDetector(
      onTap: () => searchCallBack!(),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            boxShadow: [AppTheme.shadow],
            // border: Border.all(width: 0.4, color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: AppTextField(
            enabled: false,
            height: 34,
            isRightIcon: true,
            hintText: "searchCubeSnack",
            rightIcon: Icon(
              Icons.search,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
