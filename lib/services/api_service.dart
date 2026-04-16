// http classes in case of using live API's
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:satishop/models/satellite_model.dart';

class ApiService {
  Future<List<SatelliteModel>> fetchSatelliteProducts() async {
    final response = await http.get(
      Uri.parse(
        "https://69e0be5a29c070e6597bf6a4.mockapi.io/satellites/satellites",
      ), // <-- to do: put the api key in an env var
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> list = jsonData;

      return list.map((item) => SatelliteModel.fromJson(item)).toList();
    } else {
      throw Exception("Unable to retrieve data.");
    }
  }
}
