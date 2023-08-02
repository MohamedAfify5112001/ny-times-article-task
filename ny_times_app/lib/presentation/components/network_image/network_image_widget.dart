import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String path;

  const NetworkImageWidget({
    super.key,
    required this.path,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(path),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
