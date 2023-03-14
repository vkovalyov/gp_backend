class ContentRating {
  final String ratingValue;
  final String description;
  final int ratingAge;
  final List<String> ratingDescriptors;

  ContentRating({
    required this.ratingValue,
    required this.description,
    required this.ratingAge,
    required this.ratingDescriptors,
  });

  factory ContentRating.fromJson(Map<String, dynamic> json) {
    return ContentRating(
        ratingValue: json['RatingValue'],
        description: json['Description'],
        ratingAge: json['RatingAge'],
        ratingDescriptors: json['RatingDescriptors'].cast<String>());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RatingValue'] = ratingValue;
    data['Description'] = description;
    data['RatingAge'] = ratingAge;
    data['RatingDescriptors'] = ratingDescriptors;
    return data;
  }
}
