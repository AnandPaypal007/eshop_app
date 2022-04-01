import 'package:eshop/Models/product.dart';
import 'package:eshop/Screens/Products/bloc/index.dart';
import 'package:eshop/Utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductVariationColor extends StatefulWidget {
  final MProducts? product;
  const ProductVariationColor({Key? key, this.product}) : super(key: key);

  @override
  State<ProductVariationColor> createState() => _ProductVariationColorState();
}

class _ProductVariationColorState extends State<ProductVariationColor> {
  @override
  Widget build(BuildContext context) {
    final repo = BlocProvider.of<ProductBloc>(context).repo;
    return Row(
      children: [
        ...widget.product!.variation!
            .map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      repo.productVariation = e;
                    });
                    BlocProvider.of<ProductBloc>(context)
                        .add(ProductVariationEvent(variation: e));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: repo.productVariation != null &&
                                repo.productVariation.id == e.id
                            ? Border.all(width: 2, color: Colors.cyan)
                            : null,
                        color: HexColor.fromHex(e.color!),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ))
            .toList()
      ],
    );
  }
}
