class VideoContent {
  final int id;
  final String title;
  final List<String>professors;
  final String urlImage;
  final List<String> domains;
  final String description;
  final String videoURL;
  final String instituteName;

  const VideoContent({
    required this.id,
    required this.title,
    required this.professors,
    required this.urlImage,
    required this.domains,
    required this.description,
    required this.videoURL,
    required this.instituteName,
  });

  factory VideoContent.fromJson(Map<String, dynamic> json) => VideoContent(
    id: json['id'],
    title: json['title'],
    professors: json['professors'],
    urlImage: json['urlImage'],
    domains: json['domains'],
    description: json['description'],
    videoURL: json['videoURL'],
    instituteName: json['instituteName'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'professors': professors,
    'urlImage': urlImage,
    'domains':domains,
    'description':description,
    'videoURL' : videoURL,
    'instituteName': instituteName,
  };
}