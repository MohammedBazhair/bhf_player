import 'dart:io';

import 'package:bhf_player/core/utils/app_constants/app_assests/app_images_assests.dart';
import 'package:bhf_player/core/utils/styles/app_colors/dark_colors.dart';
import 'package:flutter/material.dart';

class CourseCardThumbnail extends StatelessWidget {
  const CourseCardThumbnail({super.key, this.thumbnailPath});

  final String? thumbnailPath;

  @override
  Widget build(BuildContext context) {
    final ImageProvider image = thumbnailPath != null
        ? FileImage(File(thumbnailPath!))
        : const AssetImage(AppImagesAssests.error);
    return Container(
      width: 80,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 0.3,
          color: DarkColors.border.withAlpha(150),
        ),
      ),
    );
  }
}
