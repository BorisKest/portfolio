import 'package:flutter/widgets.dart';

/// {@template image_container}
/// ImageContainer widget.
/// {@endtemplate}
class ImageContainer extends StatelessWidget {
  /// {@macro image_container}
  const ImageContainer({
    super.key, // ignore: unused_element
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) => Container(
    transformAlignment: Alignment.center,
    constraints: const BoxConstraints(minHeight: 100, minWidth: 100),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    clipBehavior: Clip.hardEdge,
    child: SizedBox.expand(child: child),
  );
}
