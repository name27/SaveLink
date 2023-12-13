import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewController extends GetxController {
  var url = Get.arguments["link"];
  WebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
}
