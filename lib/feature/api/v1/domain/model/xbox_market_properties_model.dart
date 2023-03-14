class MarketProperties {
  List<String>? supportedLanguages;

  MarketProperties({
    this.supportedLanguages,
  });

  MarketProperties.fromJson(Map<String, dynamic> json) {
    supportedLanguages = json['SupportedLanguages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['SupportedLanguages'] = supportedLanguages;

    return data;
  }
}
