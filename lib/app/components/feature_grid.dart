import 'package:adcondo_app/app/components/item_grid.dart';
import 'package:flutter/material.dart';

class FeatureGrid extends StatefulWidget {
  final List<ItemGrid> features;
  final int initialItemCount; // Ex: 6
  const FeatureGrid(
      {super.key, required this.features, this.initialItemCount = 6});

  @override
  State<FeatureGrid> createState() => _FeatureGridState();
}

class _FeatureGridState extends State<FeatureGrid> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final visibleItems = List<ItemGrid>.from(
      expanded
          ? widget.features
          : widget.features.take(widget.initialItemCount),
    );

    final showMore = widget.features.length > widget.initialItemCount;
    if (showMore) {
      visibleItems.add(
        ItemGrid(
          label: expanded ? "Ver menos" : "Ver mais",
          icon: expanded ? Icons.expand_less : Icons.expand_more,
          onPressed: () => setState(() => expanded = !expanded),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 5,
      childAspectRatio: 0.7,
      children: visibleItems
          .map((item) => ItemGrid(
                icon: item.icon,
                label: item.label,
                onPressed: item.onPressed,
              ))
          .toList(),
    );
  }
}
