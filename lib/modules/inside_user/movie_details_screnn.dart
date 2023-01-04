// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:cinema_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:cinema_app/shared/cubit/app_cubit/app_states.dart';
import 'package:cinema_app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetails extends StatelessWidget {
  final dynamic model;
  late Image image;
  MovieDetails({required this.model, required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(), body: moviePage(model, AppCubit.get(context)));
      },
    );
  }

  Widget moviePage(model, cubit) {
    double rating = 3;
    List<Image> images = [];
    image = Image(
      image: image.image,
      fit: BoxFit.cover,
    );
    images.add(image);
    bool isRan = false;
    for (var x in model.posters) {
      if (isRan == false) {
        isRan = true;
      } else {
        images.add(Image(
          image: NetworkImage(x.url),
          fit: BoxFit.cover,
        ));
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 450,
              width: double.infinity,
              child: PageView.builder(
                itemBuilder: ((context, index) => SizedBox(
                      width: double.infinity,
                      child: index == 0
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Hero(
                                  tag: "Movie ${model.iD}",
                                  child: images[index]))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: images[index],
                            ),
                    )),
                itemCount: images.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              model.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar(
                    initialRating: 3,
                    minRating: 1,
                    maxRating: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(
                          IconBroken.Star,
                          color: Colors.yellow,
                        ),
                        empty: const Icon(
                          IconBroken.Star,
                          color: Colors.black,
                        ),
                        half: const Icon(
                          IconBroken.Star,
                          color: Colors.green,
                        )),
                    onRatingUpdate: (value) {
                      rating = value;
                    }),
                const SizedBox(
                  width: 50,
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {
                      cubit.saveRating(rating, model.iD.toString());
                    },
                    icon: const Icon(
                      Icons.send_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  const Text(
                    "Send",
                    style: TextStyle(color: Colors.green),
                  )
                ]),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Rate the movie !",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
