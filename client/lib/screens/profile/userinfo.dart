import 'package:heron/widgets/profile/pic.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum UserPlatformType {
  google,
  apple,
}

class ProfileUserInfo extends StatelessWidget {
  final String name;
  final String email;
  final UserPlatformType platform;
  final ImageProvider<Object>? image;

  const ProfileUserInfo({
    super.key,
    required this.name,
    required this.email,
    required this.platform,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          HeronProfilePic(image, size: 56.0),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              Text(
                email,
                style: TextStyle(color: colorScheme.outline),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileUserInfoSmall extends StatelessWidget {
  final String name;
  final ImageProvider<Object>? image;

  const ProfileUserInfoSmall({
    super.key,
    required this.name,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        HeronProfilePic(image, size: 28.0),
        const SizedBox(width: 10.0),
        Text(
          name,
          style: textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class ProfileUserStatistics extends StatelessWidget {
  final int courses;
  final int missions;

  const ProfileUserStatistics({
    super.key,
    this.courses = 0,
    this.missions = 0,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          ProfileUserStatisticsItem(
            icon: HugeIcons.strokeRoundedRoute01,
            value: l10n.profileCourseCount(courses),
          ),
          const SizedBox(height: 4.0),
          ProfileUserStatisticsItem(
            icon: HugeIcons.strokeRoundedChampion,
            value: l10n.profileMissionCount(missions),
          ),
        ],
      ),
    );
  }
}

class ProfileUserStatisticsItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const ProfileUserStatisticsItem({
    super.key,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 18.0, color: colorScheme.primary),
        const SizedBox(width: 8.0),
        Text(value, style: textTheme.bodyLarge),
      ],
    );
  }
}
