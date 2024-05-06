// ignore_for_file: public_member_api_docs, sort_constructors_first

class Measurementmodel {
  String date;
  String measurement;
  Measurementmodel({
    required this.date,
    required this.measurement,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'measurement': measurement,
    };
  }

  factory Measurementmodel.fromMap(Map<String, dynamic> map) {
    return Measurementmodel(
      date: map['date'] as String,
      measurement: map['measurement'] as String,
    );
  }
}
