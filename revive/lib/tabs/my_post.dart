import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/tabs/my_post_details.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: MasonryGridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              navigate(context, MyPostDetails());
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                      'assets/images/post_' + (index + 1).toString() + '.jpeg'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}






//itemBuilder: (context, index) => Image.asset(
           // 'assets/images/image' + (index + 1).toString() + '.jpg'));

         //  revive\assets\images\image2.jpg



/// child: Image.asset(
                //      'assets/images/image' + (index + 1).toString() + '.jpg'),


                //Image.asset('assets/images/prof1.jpeg'),


// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class SavedPost extends StatelessWidget {
//   const SavedPost({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4.0),
//         child: MasonryGridView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: 100,
//           gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Opacity(
//                 opacity: 0.9,
//                 child: Image.asset('assets/images/forest.jpg'),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
