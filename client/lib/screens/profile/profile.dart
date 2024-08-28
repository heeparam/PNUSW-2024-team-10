import 'package:heron/screens/profile/gallery.dart';
import 'package:heron/screens/profile/userinfo.dart';
import 'package:heron/widgets/appbar/appbar.dart';
import 'package:heron/widgets/button/icon.dart';
import 'package:flutter/material.dart';
import 'package:heron/widgets/scroll/scroll.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileKey = GlobalKey();
  final galleryHeaderKey = GlobalKey();
  final scrollViewKey = GlobalKey();

  double _profileHeight = 0.0;
  double _galleryHeaderOffset = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final RenderBox profileRenderBox =
          profileKey.currentContext!.findRenderObject() as RenderBox;

      final RenderBox galleryHeaderRenderBox =
          galleryHeaderKey.currentContext!.findRenderObject() as RenderBox;

      final RenderBox scrollViewRenderBox =
          scrollViewKey.currentContext!.findRenderObject() as RenderBox;

      setState(() {
        _profileHeight = profileRenderBox.size.height;
        _galleryHeaderOffset =
            galleryHeaderRenderBox.localToGlobal(Offset.zero).dy -
                scrollViewRenderBox.localToGlobal(Offset.zero).dy;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    // TODO: Implement ProfileScreen
    final String name = "홍길동";
    final String email = "gildong1557@gmail.com";
    final UserPlatformType platform = UserPlatformType.google;
    final ImageProvider<Object>? image = null;
    final int courses = 3;
    final int missions = 12;

    return ScrollOffsetProvider(
      builder: (context, scrollOffset, scrollController) => Scaffold(
        backgroundColor:
            scrollOffset > 4 ? colorScheme.surface : colorScheme.surfaceBright,
        appBar: HeronAppBar(
          hasBackButton: false,
          scrollOffset: scrollOffset,
          disableBorder: scrollOffset > _galleryHeaderOffset,
          title: Opacity(
            opacity: ((scrollOffset - _profileHeight) / 12).clamp(0.0, 1.0),
            child: ProfileUserInfoSmall(
              name: name,
              image: image,
            ),
          ),
          actions: [
            // 추후 알림 기능 구현 시 사용
            // HeronIconButton(
            //   icon: const Icon(HugeIcons.strokeRoundedNotification03),
            //   onPressed: () {},
            // ),
            HeronIconButton(
              icon: const Icon(HugeIcons.strokeRoundedSetting07),
              onPressed: () {
                context.go("/profile/settings");
              },
            ),
          ],
        ),
        body: CustomScrollView(
          key: scrollViewKey,
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: ColoredBox(
              color: colorScheme.surfaceBright,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8.0),
                  ProfileUserInfo(
                    key: profileKey,
                    name: name,
                    email: email,
                    platform: platform,
                    image: image,
                  ),
                  const SizedBox(height: 28.0),
                  ProfileUserStatistics(
                    courses: courses,
                    missions: missions,
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: SizedBox.shrink(key: galleryHeaderKey),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProfileGallaryHeader(),
            ),
            const SliverFillRemaining(
              child: ProfileGallery(),
            ),
          ],
        ),
      ),
    );
  }
}
