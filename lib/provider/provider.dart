import 'dart:convert';
import 'package:api_calling/model/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  List<Data> data = [];

  Future<void> fetchData() async {
    final responseFromApi =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));

    try {
      if (responseFromApi.statusCode == 200) {
        final productJson = json.decode(responseFromApi.body);

        data = List<Data>.from(productJson.map((json) => Data.fromJson(json)));
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      print('You got Error The length of dataList is${data}');
    }
  }
}
