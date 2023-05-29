import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key, this.inverse = false}) : super(key: key);
  final bool inverse;

  const NotificationIcon.inverse({Key? key}) : this(key: key, inverse: true);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: inverse
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                    : Colors.white,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 18,
              width: 18,
              decoration: ShapeDecoration(
                color: inverse
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
                shape: CircleBorder(
                  side: BorderSide(
                      width: 2, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 15,
                color: inverse
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
