import 'package:flutter/material.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/shared/component/component.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  List<String> followers =
      List.generate(10, (index) => "hodasalama${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followers"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateAndFinish(context,  HomeLayout(index: 3,));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: followers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: const AssetImage("assets/images/prof_2.jpeg"),
              ),
              title: Text(followers[index]),
              subtitle: const Text("Hoda Salama"),
              trailing: _removeBtn(context, index),
            ),
          );
        },
      ),
    );
  }

  Widget _removeBtn(BuildContext context, int index) {
    return SizedBox(
      child: MaterialButton(
        elevation: 2.0,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.green,
        onPressed: () {
          setState(() {
            followers.removeAt(index);
          });
        },
        child: const Text(
          "Remove",
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:revive/modules/LoginAndReg/login.dart';
// import 'package:revive/shared/component/component.dart';

// class Followers extends StatelessWidget {
//   const Followers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Followers"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             navigateAndFinish(context, loginScreen());
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               onTap: () {},
//               leading: CircleAvatar(
//                 radius: 28,
//                 backgroundImage: const AssetImage("assets/images/prof1.jpeg"),
//               ),
//               title: const Text("hodasalama89"),
//               subtitle: const Text("Hoda Salama"),
//               trailing: _removeBtn(context),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _removeBtn(BuildContext context) {
//     return SizedBox(
//       child: MaterialButton(
//         elevation: 2.0,
//         highlightElevation: 0.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         color: Color.fromARGB(61, 158, 158, 158),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => loginScreen()),
//         ),
//         child: const Text(
//           "Remove",
//           style: TextStyle(
//             fontSize: 10.0,
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ),
//     );
//   }
// }
