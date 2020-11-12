import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/file.dart';
import 'package:http/http.dart' as http;

class EmployeeProvider with ChangeNotifier {
  List<File> file = [];


  Future<void> addProduct(File files) async {
    const url = 'http://dummy.restapiexample.com/api/v1/create';
    final response = await http.post(
        url,
        body: json.encode({
          'name': files.name,
          'age': files.age,
          'salary': files.salary
        })
    );
    print(response.body);
    final newProduct = File(
        id: json.decode(response.body)['data']['id'].toString(),
        name: files.name,
        age: files.age,
        salary: files.salary
    );
//    file.add(newProduct);
    file.insert(0, newProduct);
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url = 'http://dummy.restapiexample.com/api/v1/delete/';
    await http.delete(url + id);
    final index = file.indexWhere((element) => element.id == id);
//    final existingIndex = file[index];
    file.removeAt(index);
    notifyListeners();
  }

  Future<void> fetch() async {
    //file.clear();
    const url = 'http://dummy.restapiexample.com/api/v1/employees';
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    print(extractedData);
    List<File> loadedRecords = [];
    //as Map<String, dynamic>;
    for (var i = 0; i < extractedData['data'].length; i++) {
      loadedRecords.add(File(
          id: extractedData['data'][i]['id'].toString(),
          name: extractedData['data'][i]['employee_name'],
          age: double.parse(extractedData['data'][i]['employee_age']),
          salary: double.parse(extractedData['data'][i]['employee_salary'])));
    }
    file = loadedRecords;
    notifyListeners();
  }
}