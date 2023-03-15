// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class AppCustomImage extends StatefulWidget {
  const AppCustomImage(
    this.src, {
    Key? key,
  }) : super(key: key);

  final String src;

  @override
  State<AppCustomImage> createState() => _AppCustomImageState();
}

class _AppCustomImageState extends State<AppCustomImage> {
  html.ImageElement? _element;

  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      '__webImageViewType__${widget.src}__',
      (int viewId) {
        _element = html.ImageElement(src: widget.src)
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.objectFit = 'scale-down';
        return _element!;
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _element?.removeAttribute('src');
    _element?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: '__webImageViewType__${widget.src}__');
  }
}
