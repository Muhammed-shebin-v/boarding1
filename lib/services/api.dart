import 'dart:convert';
import 'dart:developer';
import 'package:boarding1/models/datas.dart';
import 'package:boarding1/services/database.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo';

  Future<List<Datas>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        log('we got the datas');
        final List<dynamic> data = jsonDecode(response.body);

      final dbHelper = DatabaseHelper();

      for (var item in data) {
        final dataObj = Datas.fromJson(item);
        await dbHelper.insertDatas(dataObj);
       log("✅ Data saved to Sqflite");
      
      }
      return data.map((json) => Datas.fromJson(json)).toList();
       } else {
        log('API Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Network or parsing error: $e');
      return [];
    }
  }
}
