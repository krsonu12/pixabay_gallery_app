import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery_app/app/controllers/image_controller.dart';

class HomePage extends GetView<ImageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pixabay Gallery')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: controller.setSearchTerm,
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.images.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (MediaQuery.of(context).size.width / 150).floor(),
                    childAspectRatio: 1,
                  ),
                  itemCount: controller.images.length +
                      (controller.isLoading.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == controller.images.length) {
                      controller.fetchImages();
                      return const Center(child: CircularProgressIndicator());
                    }
                    final image = controller.images[index];
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed('/image-detail', arguments: image),
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                image.previewURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Likes: ${image.likes} | Views: ${image.views}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
