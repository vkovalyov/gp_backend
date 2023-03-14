class ImageTile {
  final String uRI;
  final int width;
  final int height;

  ImageTile({required this.uRI, required this.width, required this.height});

  factory ImageTile.fromJson(Map<String, dynamic> json) {
    return ImageTile(
      uRI: json['URI'],
      width: json['Width'],
      height: json['Height'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['URI'] = uRI;
    data['Width'] = width;
    data['Height'] = height;
    return data;
  }
}
