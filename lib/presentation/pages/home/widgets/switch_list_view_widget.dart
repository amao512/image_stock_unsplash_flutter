import 'package:flutter/material.dart';

class SwitchListView extends StatelessWidget {
  final bool isGridView;
  final Function(bool) onSelect;

  const SwitchListView({
    super.key,
    required this.isGridView,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        IconButton(
          icon: const Icon(Icons.view_agenda_sharp),
          color: isGridView ? Colors.grey : Theme.of(context).iconTheme.color,
          onPressed: () {
            if (isGridView) {
              onSelect(false);
            }
          },
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.grid_view_sharp),
          color: !isGridView ? Colors.grey : Theme.of(context).iconTheme.color,
          onPressed: () {
            if (!isGridView) {
              onSelect(true);
            }
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
