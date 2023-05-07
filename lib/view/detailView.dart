import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailedViewPage extends StatefulWidget {
  String newsUrl;

  DetailedViewPage({super.key, required this.newsUrl});

  @override
  State<DetailedViewPage> createState() => _DetailedViewPageState();
}

class _DetailedViewPageState extends State<DetailedViewPage> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.newsUrl),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("NEWS WATCH"),
                elevation: 0,
              backgroundColor: Colors.black87,
            ),
          body: Stack(
            children: [
                WebViewWidget(
                controller: controller,
              ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
            ),
        ],
      ),
    ));
  }
}
