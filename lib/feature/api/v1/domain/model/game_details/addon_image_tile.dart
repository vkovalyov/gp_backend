class AddonImageTile {
  final String uRI;

  AddonImageTile({required this.uRI});

  factory AddonImageTile.fromJson(Map<String, dynamic> json) {
    return AddonImageTile(uRI: json['URI']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['URI'] = uRI;
    return data;
  }
}
