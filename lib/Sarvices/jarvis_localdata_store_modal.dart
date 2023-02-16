class Jarvisevoices {
  int? id;
  String? Title;
  String? date;
  String? starttime;
  String? lasttime;
  String? discription;

  Jarvisevoices(
      {this.id,
      this.Title,
      this.date,
      this.starttime,
      this.lasttime,
      this.discription});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'Title': Title,
      'date': date,
      'starttime': starttime,
      'lasttime': lasttime,
      'discription': discription
    };
    return map;
  }

  Jarvisevoices.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    Title = map['Title'];
    date = map['date'];
    starttime = map['starttime'];
    lasttime = map['lasttime'];
    discription = map['discription'];
  }
}
