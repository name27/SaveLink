import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_note_app/controller/my_web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends GetView<MyWebViewController> {
  const WebViewScreen({super.key});
  static const route = '/webView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: WebViewWidget(controller: controller.webViewController!),
    );
  }
}
