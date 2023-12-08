class Model{
  String alarmName;
  bool isActivated= true;
  String seledtedtime;


  Model(this.alarmName, this.isActivated, this.seledtedtime);

  Map<String, dynamic> toMap() {
    return {
     'alarmName': alarmName,
      'isActivated': isActivated,
      'time': seledtedtime,

    };
  }

  // Create a Model object from a Map for deserialization
  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      map['description'],
      map['check'],
      map['title'],
    );
  }
}
