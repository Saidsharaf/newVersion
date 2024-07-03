import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitLikes/cubit.dart';
import 'package:revive/modules/betweenOwner_Customer/post_screen/cubitLikes/state.dart';
import 'package:revive/shared/network/end_point.dart';

class Likes extends StatelessWidget {
  const Likes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => showLikesCubit()..showLikes(id: 9),
      child: BlocConsumer<showLikesCubit, ShowLikesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = showLikesCubit.get(context);
                    Widget buildSearch(index) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      server + cubit.fav[index]["user"]["profile_photo"]),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.fav[index]["user"]["username"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        cubit.fav[index]["user"]["email"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(height: 1,color: Colors.grey),
                itemCount: cubit.fav.length,
                itemBuilder: (context, index) => buildSearch(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
