class Attributes {
  final String name;
  final String localizedName;
  final List<String>? applicablePlatforms;

  Attributes(
      {required this.name,
      required this.localizedName,
      required this.applicablePlatforms});

  factory Attributes.fromJson(Map<String, dynamic> json) {
    final applicablePlatforms = json['ApplicablePlatforms'];
    List<String>? listPlatforms = [];
    if(applicablePlatforms != null){
      listPlatforms = json['ApplicablePlatforms'].cast<String>();
    }
    return Attributes(
        name: json['Name'],
        localizedName: json['LocalizedName'],
        applicablePlatforms: listPlatforms);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['LocalizedName'] = localizedName;
    data['ApplicablePlatforms'] = applicablePlatforms;
    return data;
  }
}
