import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWrapper extends StatelessWidget {
  final String svgPath;
  final double size;
  final double aspectRatio;
  final BoxFit fit;

  const SvgWrapper({
    super.key,
    required this.svgPath,
    required this.size,
    this.fit = BoxFit.contain,
    this.aspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * aspectRatio,
      height: size,
      child: SvgPicture.asset(svgPath, fit: fit),
    );
  }
}