import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileGallaryHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 48.0;

  @override
  double get maxExtent => 48.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 48.0,
      padding: const EdgeInsets.only(bottom: 6.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceBright,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outlineVariant,
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Text(l10n.profileGalleryHeader, style: textTheme.titleSmall),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class ProfileGallery extends StatelessWidget {
  const ProfileGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: SvgPicture.asset(
              "assets/images/gallery_empty.svg",
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              l10n.profileGalleryEmpty,
              style: TextStyle(
                color: colorScheme.outline,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
