class ApodModel {
  final String? copyright;
  final String? date;
  final String? explanation;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;

  const ApodModel({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  ApodModel copyWith({
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  }) {
    return ApodModel(
      copyright: copyright ?? this.copyright,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyright,
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'serviceVersion': serviceVersion,
      'title': title,
      'url': url,
    };
  }

  factory ApodModel.fromMap(Map<String, dynamic> map) {
    return ApodModel(
      copyright: map['copyright'] as String?,
      date: map['date'] as String?,
      explanation: map['explanation'] as String?,
      hdurl: map['hdurl'] as String?,
      mediaType: map['mediaType'] as String?,
      serviceVersion: map['serviceVersion'] as String?,
      title: map['title'] as String?,
      url: map['url'] as String?,
    );
  }
}
