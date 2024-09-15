import 'package:get/get.dart';
import '../data/providers/pixabay_provider.dart';
import '../models/pixabay_image.dart';

class ImageController extends GetxController {
  final PixabayProvider _provider = Get.find<PixabayProvider>();

  var images = <PixabayImage>[].obs;
  var isLoading = false.obs;
  var searchTerm = ''.obs;
  var page = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  void fetchImages({bool isNewSearch = false}) async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      if (isNewSearch) {
        images.clear();
        page.value = 1;
      }
      final newImages = await _provider.fetchImages(
          query: searchTerm.value, page: page.value);
      images.addAll(newImages);
      page.value++;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void setSearchTerm(String term) {
    searchTerm.value = term;
    debounce(
      searchTerm,
      (_) => fetchImages(isNewSearch: true),
      time: const Duration(milliseconds: 500),
    );
  }
}
