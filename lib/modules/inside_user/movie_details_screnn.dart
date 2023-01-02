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
        return Scaffold(body: moviePage(model, AppCubit.get(context)));
      },
    );
  }

  Widget moviePage(model, cubit) {
    late double rating;
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
      child: Column(
        children: [
          SizedBox(
            height: 420,
            width: double.infinity,
            child: PageView.builder(
              itemBuilder: ((context, index) => SizedBox(
                    width: double.infinity,
                    child: images[index],
                  )),
              itemCount: images.length,
            ),
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
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    cubit.saveRating(rating, model.iD.toString());
                  },
                  icon: const Icon(
                    IconBroken.Tick_Square,
                    size: 30,
                    color: Colors.green,
                  )),
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
    );
  }
}
