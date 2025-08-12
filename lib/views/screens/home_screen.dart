import 'package:boarding1/core/const.dart';
import 'package:boarding1/core/lang.dart';
import 'package:boarding1/core/theme.dart';
import 'package:boarding1/models/datas.dart';
import 'package:boarding1/services/provider.dart';
import 'package:boarding1/slider_provider.dart';
import 'package:boarding1/views/widgets/appbar.dart';
import 'package:boarding1/views/widgets/bottom_nav.dart';
import 'package:boarding1/views/widgets/category.dart';
import 'package:boarding1/views/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Consumer<ProductProvider>(
         builder: (context, todoProvider, child) {
          if (todoProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (todoProvider.errorMessage != null) {
            return Center(child: Text(todoProvider.errorMessage!));
          }
          return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              _buildCarousel(context,todoProvider.banners),
              ProductsList(title: LangEnglish.mostPopular,products:todoProvider.mostPopularProducts,),
              _buildPromotionBanner(),
              _buildCategoriesSection(todoProvider.categories),
              ProductsList(title: LangEnglish.featuredProducts,products:todoProvider.featuredProducts,),
            ],
          ),
        );
         }
      ),
      bottomNavigationBar: BottomNav(),
    );
  }

  Widget _buildCarousel(context, List<Content> contents ) {
    final carouselProvider = Provider.of<CarouselIndexProvider>(context);
    return SizedBox(
      height: 104,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                carouselProvider.updateIndex(index);
              },
              itemCount: ConstDatas().categories.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    image: DecorationImage(image: NetworkImage(contents[index].imageUrl??'')),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        ConstDatas().carouselImages.length,
                        (index) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                carouselProvider.currentIndex == index
                                    ? AppColors.white
                                    : AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionBanner() {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.green,
      ),
    );
  }

  Widget _buildCategoriesSection(List<Content> categories) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                LangEnglish.categories,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(LangEnglish.viewAll),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(category: categories[index]);
            },
          ),
        ),
      ],
    );
  }
}
