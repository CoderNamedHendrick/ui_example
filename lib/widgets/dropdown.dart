import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  final Color? dropIconColor;
  final Color? backgroundColor;
  final String? dropdownValue;
  final bool withHint;
  final bool readOnly;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.hintText,
    this.onChanged,
    required this.dropdownValue,
    this.dropIconColor,
    this.backgroundColor,
    this.withHint = true,
    this.readOnly = false,
  })  : assert(!withHint || (withHint && hintText != null),
            'hint text shouldn\'t be null if withHint is true'),
        super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  late final ValueNotifier<String?> dropdownValueNotifier =
      ValueNotifier(widget.dropdownValue);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    dropdownValueNotifier.value = widget.dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: AbsorbPointer(
        absorbing: widget.readOnly,
        child: InkWell(
          onTap: () {
            if (widget.onChanged == null) return;

            _toggleDropdown();
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Colors.transparent,
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.withHint)
                          ValueListenableBuilder(
                              valueListenable: dropdownValueNotifier,
                              builder: (context, String? value, child) {
                                if (value == null) {
                                  return const SizedBox.shrink();
                                }
                                return Text(
                                  widget.hintText!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  textAlign: TextAlign.start,
                                );
                              }),
                        const SizedBox(height: 3),
                        ValueListenableBuilder(
                          valueListenable: dropdownValueNotifier,
                          builder: (context, String? value, child) {
                            return Text(
                              value ?? widget.hintText ?? '',
                              style: value == null
                                  ? TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    )
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.start,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  RotationTransition(
                    turns: _rotateAnimation,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    var size = renderBox?.size;

    var offset = renderBox?.localToGlobal(Offset.zero);
    var topOffset = offset!.dy + size!.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  left: offset.dx,
                  top: topOffset,
                  width: size.width,
                  child: CompositedTransformFollower(
                    offset: Offset(0, size.height + 10),
                    link: _layerLink,
                    showWhenUnlinked: false,
                    child: Material(
                      elevation: 2,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white.withOpacity(0.8),
                      child: SizeTransition(
                        axisAlignment: 1,
                        sizeFactor: _expandAnimation,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height -
                                topOffset -
                                15,
                          ),
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: widget.items.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                dropdownValueNotifier.value =
                                    widget.items[index];
                                widget.onChanged?.call(widget.items[index]);
                                _toggleDropdown();
                              },
                              child: Row(
                                children: [
                                  const _SelectorCircle(),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      widget.items[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry?.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

class _SelectorCircle extends StatelessWidget {
  const _SelectorCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: const ShapeDecoration(
        shape: CircleBorder(side: BorderSide(color: Colors.grey, width: 3)),
      ),
    );
  }
}
