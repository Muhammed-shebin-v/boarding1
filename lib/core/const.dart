

import 'package:boarding1/views/widgets/category.dart';
import 'package:boarding1/views/widgets/product.dart';
import 'package:flutter/material.dart';
class ConstDatas {
  final List<String> carouselImages = [
    'assets/images/carousel1.jpg',
    'assets/images/carousel2.jpg',
    'assets/images/carousel3.jpg',
  ];

final List<Product> popularProducts = [
    Product(
      name: 'Lenovo K3 Mini Outdoor Wireless Speaker',
      image: 'assets/images/speaker.jpg',
      originalPrice: 1500,
      discountedPrice: 1100,
      rating: 4.5,
      discount: 65,
    ),
    Product(
      name: 'MI Multicolor Mini Backpack Travel Backpack',
      image: 'assets/images/backpack.jpg',
      originalPrice: 800,
      discountedPrice: 700,
      rating: 4.0,
      discount: 65,
    ),
    Product(
      name: 'Motul 300 10W40 4 Stroke Motor Cycle Engine Oil 1 Litre',
      image: 'assets/images/motul.jpg',
      originalPrice: 800,
      discountedPrice: 600,
      rating: 4.5,
      discount: 65,
    ),
    Product(
      name: 'Motul 300 10W40 4 Stroke Motor Cycle Engine Oil',
      image: 'assets/images/motul2.jpg',
      originalPrice: 850,
      discountedPrice: 600,
      rating: 4.0,
      discount: 65,
    ),
  ];

  final List<Product> featuredProducts = [
    Product(
      name: 'Lenovo K3 Mini Outdoor Wireless Speaker',
      image: 'assets/images/speaker.jpg',
      originalPrice: 1500,
      discountedPrice: 1100,
      rating: 4.5,
      discount: 65,
    ),
    Product(
      name: 'MI Multicolor Mini Backpack Travel Backpack',
      image: 'assets/images/backpack.jpg',
      originalPrice: 800,
      discountedPrice: 700,
      rating: 4.0,
      discount: 65,
    ),
    Product(
      name: 'Motul 300 10W40 4 Stroke Motor Cycle Engine Oil 1 Litre',
      image: 'assets/images/motul.jpg',
      originalPrice: 800,
      discountedPrice: 600,
      rating: 4.5,
      discount: 65,
    ),
    Product(
      name: 'Motul 5100 10W40 4 Stroke Motor Cycle Engine Oil',
      image: 'assets/images/motul3.jpg',
      originalPrice: 900,
      discountedPrice: 700,
      rating: 4.2,
      discount: 65,
    ),
  ];

  final List<Category> categories = [
    Category(name: 'Grocery & Foods', icon: Icons.shopping_basket),
    Category(name: 'Mobile & Devices', icon: Icons.phone_android),
    Category(name: 'Consumer Electronics', icon: Icons.tv),
    Category(name: 'Kids & Mom', icon: Icons.child_care),
  ];
}