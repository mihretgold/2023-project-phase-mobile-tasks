class Task{
  String _title;
  String _description;
  DateTime _dueDate;
  bool _status;

  Task(this._title, this._description, this._dueDate, this._status);

  set title(String title){
    _title = title;
  }

  String get title => _title;

  set description(String description) {
    _description = description;
  }

  String get description => _description;

  set dueDate(DateTime dueDate) {
    _dueDate = dueDate;
  }

  DateTime get dueDate => _dueDate;

  set status(bool status) {
    _status = status;
  }

  bool get status => _status;

  void displayTask(){
     print("Title:  $_title");
    print("Description:  $_description");
    print("Due Date:  $_dueDate");
    print("Status:  $_status");
  }
}