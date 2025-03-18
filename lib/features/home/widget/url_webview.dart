import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UrlWebView extends StatefulWidget {
  final String url;

  const UrlWebView({super.key, required this.url});

  @override
  State<UrlWebView> createState() => _UrlWebViewState();
}

class _UrlWebViewState extends State<UrlWebView> {
  late final WebViewController _controller;
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => setState(() => _isLoading = true),
          onPageFinished: (url) => setState(() => _isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: WebViewWidget(controller: _controller),
        ),
        if (_isLoading)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  
}