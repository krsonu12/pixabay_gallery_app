import 'package:get/get.dart';
import '../controllers/image_controller.dart';
import '../data/providers/pixabay_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PixabayProvider>(() => PixabayProvider());
    Get.lazyPut<ImageController>(() => ImageController());
  }
}
