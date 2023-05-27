import 'package:flutter/material.dart';

import '../constants.dart';

class MenuTileButton extends StatelessWidget {
  const MenuTileButton({
    Key? key,
    required this.title,
    this.leading,
    this.onTap,
    this.isOutline = false,
    this.isDisabled = false,
  }) : super(key: key);

  const MenuTileButton.outlined(
      {Key? key,
        required String title,
        Widget? leading,
        VoidCallback? onTap,
        bool isDisabled = false})
      : this(
    key: key,
    title: title,
    leading: leading,
    onTap: onTap,
    isOutline: true,
    isDisabled: isDisabled,
  );

  final String title;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool isOutline;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: isOutline ? Theme.of(context).colorScheme.primary : Colors.white,
      ),
      child: IgnorePointer(
        ignoring: isDisabled,
        child: Opacity(
          opacity: isDisabled ? 0.2 : 1,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: ShapeDecoration(
                color: isOutline
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    side: isOutline
                        ? BorderSide(
                        color: Theme.of(context).colorScheme.primary)
                        : BorderSide.none),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[
                    leading!,
                    SizedBox(width: DimConstants.mediumHorizontalGutter.dim)
                  ],
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isOutline
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}