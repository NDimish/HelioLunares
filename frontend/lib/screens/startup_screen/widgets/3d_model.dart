import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class GlbModel extends StatefulWidget {
  const GlbModel({super.key});

  @override
  State<GlbModel> createState() => _GlbModelState();
}

class _GlbModelState extends State<GlbModel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: ModelViewer(
        src: 'assets/heliolunares.glb',
        alt: "Cube",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
