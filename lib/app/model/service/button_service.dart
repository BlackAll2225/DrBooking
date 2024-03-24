class ButtonService {
  String content;
  String imageUrl;
  bool isService;
  TypeService type;
  ButtonService(
      {required this.content,
      required this.imageUrl,
      required this.isService,
      required this.type});

  factory ButtonService.fromJson(Map<String, dynamic> json) => ButtonService(
      content: json["content"],
      imageUrl: json["imageUrl"],
      isService: bool.tryParse(json["isService"]) ?? false,
      type: json["type"]);
}

enum TypeService { generalExam, specialtyExam, labExam, requestExam }
