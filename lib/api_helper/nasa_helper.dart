import 'dart:convert';
import 'dart:developer';

import 'package:tutorial_project/constants/apod_model.dart';
import 'package:tutorial_project/constants/constants.dart';
import 'package:http/http.dart' as http;

class NasaHelper {
  Future<ApodModel> getPicture(String date) async {
    //Final can be overwritten unlike constant
    //Late can aslo be used but it will not initially have a value
    final url = Uri.parse('$apiUrl?api_key=$apiKey&date=$date');
    final response = await http.get(url);
    ApodModel model = ApodModel();
    if (response.statusCode == 200) {
      model = ApodModel.fromMap(jsonDecode(response.body));
      return model;
    } else {
      throw Exception(
          'Could not find image [${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}
