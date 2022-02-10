class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remind': remind,
      'repeat': repeat,
      'color': color,
      'isCompleted': isCompleted,
    };
  }

  Task.fromMap(Map<String, dynamic> task){
    id =  task['id'];
    title = task['title'];
    note = task['note'];
    date = task['date'];
    startTime = task['startTime'];
    endTime = task['endTime'];
    remind = task['remind'];
    repeat = task['repeat'];
    color = task['color'];
    isCompleted = task['isCompleted'];

  }
}
