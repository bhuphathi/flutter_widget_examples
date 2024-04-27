import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridTileCount extends StatelessWidget {
  const StaggeredGridTileCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 0.25,
              child: Container(color: Colors.black38, child: const Text("tile")),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 0.25,
              child: Container(color: Colors.black38, child: const Text("tile")),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 0.25,
              child: Container(color: Colors.black38, child: const Text("tile")),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 0.25,
              child: Container(color: Colors.black38, child: const Text("tile")),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.25,
              child: Container(color: Colors.black38, child: const Text("tile")),
            ),
          ],
        ),
      ),
    );
  }
}
