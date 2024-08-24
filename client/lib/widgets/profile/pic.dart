import 'package:flutter/material.dart';

class HeronProfilePic extends StatelessWidget {
  final ImageProvider<Object>? image;
  final double size;

  const HeronProfilePic(
    this.image, {
    super.key,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(40.0),
        image: DecorationImage(
          image: image ??
              AssetImage(
                brightness == Brightness.dark
                    ? "assets/images/profile_pic_dark.png"
                    : "assets/images/profile_pic.png",
              ),
        ),
      ),
    );
  }
}
