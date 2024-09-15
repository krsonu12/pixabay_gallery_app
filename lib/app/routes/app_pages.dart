import 'package:get/get.dart';
import 'package:pixabay_gallery_app/app/bindings/home_binding.dart';
import 'package:pixabay_gallery_app/app/ui/home/home_page.dart';
import 'package:pixabay_gallery_app/app/ui/image_detail/image_detail_page.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.imageDetail,
      page: () => const ImageDetailPage(),
    ),
  ];
}

abstract class Routes {
  static const home = '/';
  static const imageDetail = '/image-detail';
}
