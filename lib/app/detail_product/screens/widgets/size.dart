import 'package:flutter/material.dart';

import '../../../../config/theme.dart';
import 'size_box.dart';

class SizeWidget extends StatefulWidget {
  final List<String> sizes;
  const SizeWidget({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    selectedSize ??= widget.sizes.first;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.sizes
          .map(
            (e) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = e;
                });
              },
              child: SizeBox(
                size: e,
                backgroundColor: selectedSize == e ? lightGrey : lighterBlack,
                textColor: selectedSize == e ? mainColor : Colors.white,
              ),
            ),
          )
          .toList(),
    );
  }
}
