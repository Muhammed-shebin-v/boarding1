import 'package:boarding1/core/theme.dart';
import 'package:boarding1/models/datas.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final Content product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      margin: const EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              color: AppColors.white,
            ),
            child: const Icon(Icons.image, size: 40, color: Colors.grey),
          ),
          Expanded(child: SizedBox(),),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Sale ${product.discount}',
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 6,
              ),
            ),
          ),
          Gap(8),
                Text(
                  product.productName!,
                  style: const TextStyle(
                    fontSize: 6,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(8),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        index < product.productRating!.floor()
                            ? Icons.star
                            : Icons.star,
                        size: 15,
                        color:index < product.productRating!.floor()?AppColors.gold:AppColors.grey,
                      ),
                    ),
                  ],
                ),
                Gap(8),
                Row(
                  children: [
                    Text(
                      product.offerPrice!,
                      style: const TextStyle(
                        fontSize: 6,
                        color: AppColors.black,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      product.actualPrice!,
                      style: const TextStyle(
                        fontSize: 6,
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final int originalPrice;
  final int discountedPrice;
  final double rating;
  final int discount;

  Product({
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.discount,
  });
}