import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/constants.dart';

class EventTile extends StatelessWidget {
  const EventTile(
      {Key? key,
      required this.eventTime,
      required this.eventTitle,
      this.isOutline = false})
      : super(key: key);
  final DateTime eventTime;
  final String eventTitle;
  final bool isOutline;

  const EventTile.outlined(
      {Key? key, required String eventTitle, required DateTime eventTime})
      : this(
            key: key,
            eventTime: eventTime,
            eventTitle: eventTitle,
            isOutline: true);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _timeOfDay.format(eventTime),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isOutline
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(
                  Radius.circular(DimConstants.borderRadius.dim)),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  eventTitle,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isOutline
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                      ),
                ),
                SizedBox(height: DimConstants.verticalMargin.dim),
                Text(
                  _dayMonthYear.format(eventTime),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isOutline
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        letterSpacing: 0.8,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  DateFormat get _timeOfDay => DateFormat('h a');

  DateFormat get _dayMonthYear => DateFormat('EEE d, yyyy');
}
