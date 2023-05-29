import 'package:flutter/material.dart';

class Option<T> extends StatelessWidget {
  const Option(
      {Key? key,
      required this.label,
      required this.value,
      this.groupValue,
      this.onChanged})
      : super(key: key);
  final String label;
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(_isSelected ? 1 : 0.2),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 350),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: _isSelected
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
          child: Text(label),
        ),
      ),
    );
  }
}
