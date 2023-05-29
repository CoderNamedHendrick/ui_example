import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/assetx.dart';
import 'package:practice/constants.dart';
import 'package:practice/views/attendance.dart';
import 'package:practice/views/form_page.dart';
import 'package:practice/widgets/notification_icon.dart';

import '../widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _Background(
        child: Column(
          children: [
            const _PageHeader(),
            SizedBox(height: DimConstants.largeVerticalGutter.dim),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DimConstants.horizontalMargin.dim,
              ),
              child: const SchoolYearCard(),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DimConstants.horizontalMargin.dim,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      MenuTileButton(
                        title: 'Attendance',
                        leading: const Icon(Icons.checklist_sharp),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const Attendance()));
                        },
                      ),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      const MenuTileButton.outlined(
                        title: 'Reading',
                        isDisabled: true,
                        leading: Icon(Icons.library_books),
                      ),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      const MenuTileButton(
                        title: 'Reading',
                        isDisabled: true,
                        leading: Icon(Icons.library_books),
                      ),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      const MenuTileButton.outlined(
                        title: 'Reading',
                        isDisabled: true,
                        leading: Icon(Icons.library_books),
                      ),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      const MenuTileButton(
                        title: 'Reading',
                        isDisabled: true,
                        leading: Icon(Icons.library_books),
                      ),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      const MenuTileButton.outlined(
                        title: 'Reading',
                        isDisabled: true,
                        leading: Icon(Icons.library_books),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DimConstants.horizontalMargin.dim,
        vertical: DimConstants.verticalMargin.dim,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: const Icon(Icons.shop_two_outlined),
              ),
              SizedBox(width: DimConstants.smallHorizontalGutter.dim),
              Text(
                'Hi Linda!',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const NotificationIcon(),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            height: MediaQuery.of(context).viewPadding.top + 125,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(
                      'home_ellipse_1'.svg,
                      height: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewPadding.top - 30),
                      child: SvgPicture.asset(
                        'home_ellipse_2'.svg,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(child: SafeArea(child: child))
        ],
      ),
    );
  }
}
