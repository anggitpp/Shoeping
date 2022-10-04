import 'package:flutter/material.dart';
import 'package:shoeping/shared/models/product_image.dart';

import '../../../../config/constant.dart';
import '../../../../config/theme.dart';

class DetailProductImage extends StatefulWidget {
  final List<ProductImage> images;
  const DetailProductImage(
    this.images, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailProductImage> createState() => _DetailProductImageState();
}

class _DetailProductImageState extends State<DetailProductImage> {
  String? selectedImage;
  @override
  Widget build(BuildContext context) {
    selectedImage ??= widget.images.first.image;
    return Container(
      width: AppSizes.phoneWidthMargin(context),
      padding: const EdgeInsets.all(16),
      height: 302,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: lighterBlack,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageAPIURL + selectedImage!,
            width: 244,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Row(
            children: List.generate(
              widget.images.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = widget.images[index].image;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: index == widget.images.length - 1 ? 0 : 8),
                  padding: const EdgeInsets.all(6),
                  width: 49,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: darkerBlack,
                  ),
                  child: Image.network(
                    imageAPIURL + widget.images[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
