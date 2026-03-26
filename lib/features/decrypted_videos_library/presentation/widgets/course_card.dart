import 'package:bhf_player/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';
import 'package:bhf_player/features/decrypted_videos_library/presentation/screens/course_details_screen.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'course_card_thumbnail.dart';

class BuildCourseCard extends StatelessWidget {
  const BuildCourseCard(this.cardCourse, {super.key});

  final CardCourse cardCourse;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: () async =>
          await context.pushRoute(CourseDetailsScreen(cardCourse)),
      child: ListTile(
        tileColor: context.theme.colorScheme.surface,
        horizontalTitleGap: AppSizes.secondPadding,

        contentPadding: const EdgeInsets.all(AppSizes.secondPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontSize: 15,
          color: textTheme.titleMedium?.color?.withAlpha(200),
        ),
        subtitleTextStyle: textTheme.labelSmall?.copyWith(
          color: textTheme.labelSmall?.color?.withAlpha(150),
          fontSize: 12,

          height: 2,
        ),

        leading: CourseCardThumbnail(thumbnailPath: cardCourse.courseThumbnail),
        title: Text(
          cardCourse.courseTitle,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        subtitle: Row(
          spacing: 4,
          children: [
            BuildIcon(
              Icons.play_circle_outline,
              size: 15,
              color: textTheme.titleMedium?.color?.withAlpha(150),
            ),

            Text(
              "${cardCourse.videos.length} ${S.of(context).videos}",
              textDirection: TextDirection.rtl,
            ),
          ],
        ),

        trailing: BuildIcon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
          color: textTheme.titleMedium?.color?.withAlpha(200),
        ),
      ),
    );
  }
}
