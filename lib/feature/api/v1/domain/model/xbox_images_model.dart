class Images {
  String? fileId;
  int? fileSizeInBytes;
  int? height;
  String? imagePurpose;
  String? unscaledImageSHA256Hash;
  String? uri;
  int? width;

  Images(
      {this.fileId,
      this.fileSizeInBytes,
      this.height,
      this.imagePurpose,
      this.unscaledImageSHA256Hash,
      this.uri,
      this.width});

  Images.fromJson(Map<String, dynamic> json) {
    fileId = json['FileId'];
    fileSizeInBytes = json['FileSizeInBytes'];
    height = json['Height'];
    imagePurpose = json['ImagePurpose'];
    unscaledImageSHA256Hash = json['UnscaledImageSHA256Hash'];
    uri = json['Uri'];
    width = json['Width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['FileId'] = fileId;
    data['FileSizeInBytes'] = fileSizeInBytes;
    data['Height'] = height;
    data['ImagePurpose'] = imagePurpose;
    data['UnscaledImageSHA256Hash'] = unscaledImageSHA256Hash;
    data['Uri'] = uri;
    data['Width'] = width;
    return data;
  }
}
