import 'package:get/route_manager.dart';
import 'package:link_note_app/util/app_routes.dart';
import 'package:link_note_app/view/home/home_screen.dart';
import 'package:link_note_app/view/link/links_screen.dart';
import 'package:link_note_app/view/link/web_view_screen.dart';
import 'package:link_note_app/view/tag/tag_select_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.tagSelect, page: () => const TagSelectScreen()),
    GetPage(name: AppRoutes.links, page: () => const LinksScreen()),
    GetPage(name: AppRoutes.webView, page: () => const WebViewScreen()),
  ];
}
