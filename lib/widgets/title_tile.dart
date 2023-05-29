import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/assetx.dart';
import 'package:practice/constants.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({
    Key? key,
    this.leading,
    required this.title,
    required this.background,
    this.onPressed,
  }) : super(key: key);
  final Widget? leading;
  final String title;
  final Widget background;
  final VoidCallback? onPressed;

  const TitleTile.variant1(
      {Key? key,
      required String title,
      Widget? leading,
      VoidCallback? onPressed})
      : this(
            key: key,
            background: const _BackgroundVariant1(),
            title: title,
            leading: leading,
            onPressed: onPressed);

  const TitleTile.variant2(
      {Key? key,
      required String title,
      Widget? leading,
      VoidCallback? onPressed})
      : this(
            key: key,
            background: const _BackgroundVariant2(),
            title: title,
            leading: leading,
            onPressed: onPressed);

  const TitleTile.variant3(
      {Key? key,
      required String title,
      Widget? leading,
      VoidCallback? onPressed})
      : this(
            key: key,
            background: const _BackgroundVariant3(),
            title: title,
            leading: leading,
            onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius:
              BorderRadius.all(Radius.circular(DimConstants.borderRadius.dim)),
        ),
        height: 55,
        child: Stack(
          children: [
            background,
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (leading != null) ...[
                      Align(child: leading!),
                      SizedBox(width: DimConstants.mediumHorizontalGutter.dim),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundVariant1 extends StatelessWidget {
  const _BackgroundVariant1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        'circle'.svg,
        width: 120,
        alignment: Alignment.topCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _BackgroundVariant2 extends StatelessWidget {
  const _BackgroundVariant2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SvgPicture.asset(
        'session_ellipse_1'.svg,
        width: 80,
        alignment: const Alignment(-1, -2),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _BackgroundVariant3 extends StatelessWidget {
  const _BackgroundVariant3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SvgPicture.asset(
        'home_ellipse_2'.svg,
        width: 60,
        alignment: const Alignment(0, -1.25),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
