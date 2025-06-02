import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  final String imagePath;
  final double size;
  final double aspectRatio;
  final BoxFit fit;

  const ImageWrapper({
    super.key, 
    required this.imagePath, 
    required this.size, 
    this.fit = BoxFit.contain,
    this.aspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * aspectRatio,
      height: size,
      child: Image.asset(
        imagePath,
        fit: fit,
      ),
    );
  }
}