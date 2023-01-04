// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:cinema_app/models/home_model.dart';
import 'package:cinema_app/modules/inside_user/movie_details_screnn.dart';
import 'package:cinema_app/shared/components.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/icon_broken.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Movies>? filterdMovies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).searchMovies;
        return ConditionalBuilder(
          condition: model != null,
          builder: (context) {
            filterdMovies == null ? filterdMovies = model!.movies : {};
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(IconBroken.Search),
                      hintText: "Search",
                    ),
                    onChanged: (query) {
                      filterdMovies = model!.movies!.where((movie) {
                        final movieTitle = movie.title!.toLowerCase();
                        final input = query.toLowerCase();
                        return movieTitle.contains(input);
                      }).toList();
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          buildSearchItem(filterdMovies![index]),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: filterdMovies!.length,
                    ),
                  ),
                ],
              ),
            );
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildSearchItem(model) {
    Image image = Image(
      image: NetworkImage(
        model.posters[0].url,
      ),
      fit: BoxFit.cover,
    );
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            MovieDetails(
              image: image,
              model: model,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: "Movie ${model.iD}",
                      child: Image(
                        image: NetworkImage(
                          model.posters[0].url,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model.rating.toStringAsFixed(2)),
                          Icon(
                            IconBroken.Star,
                            color: Colors.yellow[600],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
