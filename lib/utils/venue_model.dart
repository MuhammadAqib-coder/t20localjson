class VenueModel {
  final String country;
  final String city;
  final String stadium;
  final String image;

  VenueModel(
      {required this.country,
      required this.city,
      required this.stadium,
      required this.image});

  static VenueModel fromJson(map) {
    return VenueModel(
        country: map['country'],
        city: map['city'],
        stadium: map['stadium'],
        image: map['image']);
  }
}
