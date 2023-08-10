class Tasks {
  static int _currentId = 0;
  int id;
  String title;
  String description;
  DateTime dueDate;
  bool status;

  Tasks(this.title, this.description, this.dueDate, this.status)
      : id = ++_currentId;

  void markCompleted() {
    status = true;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tasks &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          dueDate == other.dueDate &&
          status == other.status;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      dueDate.hashCode ^
      status.hashCode;
}
