import 'dart:convert';
import 'package:http/http.dart' as http;

class Restaurant {
  final String name;

  const Restaurant({
    required this.name,
  });

  static Restaurant fromJson(Map<String, dynamic> json) => Restaurant(
        name: json['name'],
      );
}


class RestaurantApi {
  static Future<List<Restaurant>> getNameCitys(String query) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List restaurants = json.decode(response.body);

      final rs = restaurants.map((json) => Restaurant.fromJson(json)).where((restaurant) {
        final nameLower = restaurant.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();  

      return rs;
    } else {
      throw Exception();
    }
  }
}

