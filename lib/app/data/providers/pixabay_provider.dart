import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pixabay_gallery_app/app/models/pixabay_image.dart';
import 'package:pixabay_gallery_app/config/env.dart';

class PixabayProvider extends GetConnect {
  Future<List<PixabayImage>> fetchImages(
      {required String query, required int page}) async {
    final response = await http.get(
      Uri.parse(
        'https://pixabay.com/api/?key=${Env.pixabayApiKey}&q=$query&image_type=photo&pretty=true&per_page=20&page=$page',
      ),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['hits'] as List)
          .map(
            (json) => PixabayImage.fromJson(json),
          )
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
