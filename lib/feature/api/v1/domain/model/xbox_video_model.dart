class Videos {
  String? uri;
  String? videoPurpose;
  int? height;
  int? width;
  String? audioEncoding;
  String? videoEncoding;
  String? videoPositionInfo;
  String? caption;
  int? fileSizeInBytes;
  String? trailerId;
  int? sortOrder;

  Videos(
      {this.uri,
      this.videoPurpose,
      this.height,
      this.width,
      this.audioEncoding,
      this.videoEncoding,
      this.videoPositionInfo,
      this.caption,
      this.fileSizeInBytes,
      this.trailerId,
      this.sortOrder});

  Videos.fromJson(Map<String, dynamic> json) {
    uri = json['Uri'];
    videoPurpose = json['VideoPurpose'];
    height = json['Height'];
    width = json['Width'];
    audioEncoding = json['AudioEncoding'];
    videoEncoding = json['VideoEncoding'];
    videoPositionInfo = json['VideoPositionInfo'];
    caption = json['Caption'];
    fileSizeInBytes = json['FileSizeInBytes'];
    trailerId = json['TrailerId'];
    sortOrder = json['SortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Uri'] = uri;
    data['VideoPurpose'] = videoPurpose;
    data['Height'] = height;
    data['Width'] = width;
    data['AudioEncoding'] = audioEncoding;
    data['VideoEncoding'] = videoEncoding;
    data['VideoPositionInfo'] = videoPositionInfo;
    data['Caption'] = caption;
    data['FileSizeInBytes'] = fileSizeInBytes;
    data['TrailerId'] = trailerId;
    data['SortOrder'] = sortOrder;
    return data;
  }
}
