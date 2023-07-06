import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn(
      {super.key,
      required this.children,
      this.physics,
      this.scrollDirection,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.mainAxisSize});
  final List<Widget> children;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      physics: physics ??
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: scrollDirection ?? Axis.vertical,
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.min,
        children: children,
      ),
    );
  }
}
