class TaskModel {
  String userId;
  String id;
  String title;
  String body;

  TaskModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        userId: json['userID'].toString(),
        id: json['id'].toString(),
        title: json['title'].toString(),
        body: json['body'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'userID': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
