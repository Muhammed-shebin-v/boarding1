import 'package:boarding1/models/const.dart';
import 'package:boarding1/core/lang.dart';
import 'package:boarding1/core/theme.dart';
import 'package:boarding1/models/datas.dart';
import 'package:boarding1/views/widgets/product.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final String title;
  final List<Content> products;
  const ProductsList({super.key, required this.title,required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: AppColors.black,fontWeight: FontWeight.w500),
              ),
              Text(LangEnglish.viewAll),
            ],
          ),
        ),
        SizedBox(
          height: 191,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product:products[index] );
            },
          ),
        ),
      ],
    );
  }
}
