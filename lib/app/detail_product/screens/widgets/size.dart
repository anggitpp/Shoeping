import 'package:flutter/material.dart';
import 'package:shoeping/shared/models/product_size.dart';

import '../../../../config/theme.dart';
import 'size_box.dart';

class SizeWidget extends StatefulWidget {
  final List<ProductSize> sizes;
  const SizeWidget({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  ProductSize? selectedSize;

  @override
  Widget build(BuildContext context) {
    selectedSize ??= widget.sizes.first;

    return Row(
      children: widget.sizes
          .map(
            (e) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = e;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                child: SizeBox(
                  size: e.stock.toString(),
                  backgroundColor: selectedSize == e ? lightGrey : lighterBlack,
                  textColor: selectedSize == e ? mainColor : Colors.white,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
