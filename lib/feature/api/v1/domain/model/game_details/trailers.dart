class Trailers {
  final String title;
  final String uRI;
  final String previewImageURI;

  Trailers(
      {required this.title, required this.uRI, required this.previewImageURI});

  factory Trailers.fromJson(Map<String, dynamic> json) {
    return Trailers(
      title: json['Title'],
      uRI: json['URI'],
      previewImageURI: json['PreviewImageURI'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['URI'] = uRI;
    data['PreviewImageURI'] = previewImageURI;
    return data;
  }
}
