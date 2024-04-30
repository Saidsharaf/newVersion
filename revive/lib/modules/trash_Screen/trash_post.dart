import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrashPost extends StatelessWidget {
  const TrashPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: MasonryGridView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset("assets/images/image6.jpg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
