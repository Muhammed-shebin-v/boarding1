

import 'dart:developer';

import 'package:boarding1/models/datas.dart';
import 'package:boarding1/services/api.dart';
import 'package:boarding1/services/database.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Datas> _allItems = [];
  List<Content> _banners=[];
  List<Content> _featuredProducts = [];
  List<Content> _mostPopularProducts = [];

  List<Content> _categories = [];

  bool _isLoading = true;
  String? _errorMessage;
  List<Content> get banners => _banners;
  List<Content> get featuredProducts => _featuredProducts;
  List<Content> get mostPopularProducts => _mostPopularProducts;
  List<Content> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final data = await _apiService.fetchTodos();
    if (data.isNotEmpty) {
      _allItems = data;
      _filterProducts();
      _addToDB(data);

    } else {
      _errorMessage = "Failed to fetch data";
      fetchFromDatabase();
    }

    _isLoading = false;
    notifyListeners();
  }

  void _filterProducts() {
     _banners =
        _allItems
            .where((item) => item.type == "banner_slider")
            .expand((item) => item.contents)
            .toList();
    _featuredProducts =
        _allItems
            .where((item) => item.type == 'products')
            .expand((item) => item.contents)
            .toList();

    _mostPopularProducts =
        _allItems
            .where((item) => item.type == "products")
            .expand((item) => item.contents)
            .toList();

   
    _categories =
        _allItems
            .where((item) => item.type == 'catagories')
            .expand((item) => item.contents)
            .toList();
  }
  Future<void> fetchFromDatabase() async {
  final dbHelper = DatabaseHelper();
  final allDatas = await dbHelper.getAllDatas();
 _banners =
        allDatas
            .where((item) => item.type == "banner_slider")
            .expand((item) => item.contents)
            .toList();
    _featuredProducts =
        allDatas
            .where((item) => item.type == 'products')
            .expand((item) => item.contents)
            .toList();

    _mostPopularProducts =
        allDatas
            .where((item) => item.type == "products")
            .expand((item) => item.contents)
            .toList();

    _categories =
        allDatas
            .where((item) => item.type == "categories")
            .expand((item) => item.contents)
            .toList();
   
}
  Future<void> _addToDB(data)async{
 final dbHelper = DatabaseHelper();
      for (var item in data) {
        final dataObj = Datas.fromJson(item);
        await dbHelper.insertDatas(dataObj);
       log("✅ Data saved to Sqflite");
      
      }
  }
}
