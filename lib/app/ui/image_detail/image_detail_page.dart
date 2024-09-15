import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/pixabay_image.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PixabayImage image = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Image Detail')),
      body: Center(
        child: Hero(
          tag: 'image_${image.id}',
          child: Image.network(
            image.largeImageURL,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
