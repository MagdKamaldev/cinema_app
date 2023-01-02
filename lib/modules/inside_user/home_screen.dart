// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:cinema_app/modules/inside_user/movie_details_screnn.dart';
import 'package:cinema_app/shared/components.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_states.dart';
import 'package:cinema_app/shared/styles/colors.dart';
import 'package:cinema_app/shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                          color: defaultColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 300, child: trendingItemBuilder(cubit)),
                  ],
                ),
              );
            },
            fallback: (context) => Center(
                  child: CircularProgressIndicator(color: defaultColor),
                ));
      },
    );
  }

  Widget trendingItemBuilder(cubit) => ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          movieBuiler(cubit.homeModel!.movies![index], context),
      separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
      itemCount: cubit.homeModel!.movies!.length);

  Widget movieBuiler(model, context) {
    Image image = Image(
      image: NetworkImage(
        model.posters[0].url,
      ),
      fit: BoxFit.cover,
    );
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            MovieDetails(
              model: model,
              image: image,
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(width: 200, height: 230, child: image),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 130,
                child: Text(
                  model.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("3.5"),
              Icon(
                IconBroken.Star,
                color: Colors.yellow[600],
              )
            ],
          ),
        ],
      ),
    );
  }
}
