class HomeModel {
  List<Movies>? movies;

  HomeModel({this.movies});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  int? iD;
  String? title;
  List<Cast>? cast;
  List<Cinemas>? cinemas;
  String? releaseDate;
  List<Posters>? posters;

  Movies(
      {this.iD,
      this.title,
      this.cast,
      this.cinemas,
      this.releaseDate,
      this.posters});

  Movies.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    title = json['title'];
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
    if (json['cinemas'] != null) {
      cinemas = <Cinemas>[];
      json['cinemas'].forEach((v) {
        cinemas!.add(Cinemas.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    if (json['posters'] != null) {
      posters = <Posters>[];
      json['posters'].forEach((v) {
        posters!.add(Posters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['title'] = title;
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (cinemas != null) {
      data['cinemas'] = cinemas!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate;
    if (posters != null) {
      data['posters'] = posters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  int? iD;
  String? name;
  Movies? movies;

  Cast({this.iD, this.name, this.movies});

  Cast.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    movies = json['movies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['name'] = name;
    data['movies'] = movies;
    return data;
  }
}

class Cinemas {
  int? iD;
  String? name;
  String? address;
  int? latitude;
  int? longitude;
  Movies? movies;

  Cinemas(
      {this.iD,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.movies});

  Cinemas.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    movies = json['movies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['name'] = name;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['movies'] = movies;
    return data;
  }
}

class Posters {
  int? iD;
  String? url;
  int? movieId;

  Posters({this.iD, this.url, this.movieId});

  Posters.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    url = json['Url'];
    movieId = json['MovieId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Url'] = url;
    data['MovieId'] = movieId;
    return data;
  }
}
