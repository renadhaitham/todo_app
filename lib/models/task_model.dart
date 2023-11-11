class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  String userId;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.date,
      required this.userId,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> data) //turn map into model
      : this(
          id: data['id'],
          isDone: data['isDone'],
          date: data['date'],
          userId: data['userId'],
          title: data['title'],
          description: data['description'],
        );

  Map<String, dynamic> toJson() {
    //turn model into map
    return {
      "id": id,
      "title": title,
      "date": date,
      "userId": userId,
      "description": description,
      "isDone": isDone,
    };
  }
}
