class PlatformDependencies {
  String? platformName;

  PlatformDependencies({this.platformName});

  PlatformDependencies.fromJson(Map<String, dynamic> json) {
    platformName = json['PlatformName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlatformName'] = platformName;
    return data;
  }
}
