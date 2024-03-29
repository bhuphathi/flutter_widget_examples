import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_widget_examples/presentation/widgets/tile.dart';

const _defaultColor = Color(0xFF34568B);

class StaggeredMasonaryGrid extends StatelessWidget {
  const StaggeredMasonaryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          extent: (index % 5 + 1) * 100,
        );
      },
    );
  }
}
