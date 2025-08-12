import 'package:boarding1/core/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      color: AppColors.green,
      child: Row(
        children: [
          Icon(Icons.shopping_cart_outlined, color: AppColors.black, size: 26),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(offset:Offset(0,4),blurRadius: 8,spreadRadius: 2,color: const Color.fromARGB(31, 0, 0, 0))
                ]
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: AppColors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Icon(Icons.notifications_outlined, color: AppColors.white, size: 24),
        ],
      ),
    );
  }
}
