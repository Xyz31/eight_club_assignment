import 'package:flutter/material.dart';
import 'package:project_eight_second/utils/images_directory.dart';

class Tempscreen extends StatefulWidget {
  const Tempscreen({super.key});

  @override
  State<Tempscreen> createState() => _TempscreenState();
}

class _TempscreenState extends State<Tempscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            // image
            Image.asset(
              ImageDirectory.backgroundImage,
              fit: BoxFit.fill,
            )

            // body
          ],
        ),
      ),
    );
  }
}
