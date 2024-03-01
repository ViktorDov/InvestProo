import 'dart:convert';

class Tips {
  final String header;
  final String subHeader;
  final String description;
  final String timeForReading;
  final String adviceType;
  final String introTitle;
  final String introDescription;
  final String subTitle;
  final String subTitleDescription;
  final String subTwoTitle;
  final String subTwoDescription;
  final DateTime date;

  Tips({
    required this.header,
    required this.subHeader,
    required this.description,
    required this.timeForReading,
    required this.adviceType,
    required this.introTitle,
    required this.introDescription,
    required this.subTitle,
    required this.subTitleDescription,
    required this.subTwoTitle,
    required this.subTwoDescription,
    required this.date,
  });

  Tips copyWith({
    String? header,
    String? subHeader,
    String? description,
    String? timeForReading,
    String? adviceType,
    String? introTitle,
    String? introDescription,
    String? subTitle,
    String? subTitleDescription,
    String? subTwoTitle,
    String? subTwoDescription,
    DateTime? date,
  }) {
    return Tips(
      header: header ?? this.header,
      subHeader: subHeader ?? this.subHeader,
      description: description ?? this.description,
      timeForReading: timeForReading ?? this.timeForReading,
      adviceType: adviceType ?? this.adviceType,
      introTitle: introTitle ?? this.introTitle,
      introDescription: introDescription ?? this.introDescription,
      subTitle: subTitle ?? this.subTitle,
      subTitleDescription: subTitleDescription ?? this.subTitleDescription,
      subTwoTitle: subTwoTitle ?? this.subTwoTitle,
      subTwoDescription: subTwoDescription ?? this.subTwoDescription,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header,
      'subHeader': subHeader,
      'description': description,
      'timeForReading': timeForReading,
      'adviceType': adviceType,
      'introTitle': introTitle,
      'introDescription': introDescription,
      'subTitle': subTitle,
      'subTitleDescription': subTitleDescription,
      'subTwoTitle': subTwoTitle,
      'subTwoDescription': subTwoDescription,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Tips.fromMap(Map<String, dynamic> map) {
    return Tips(
      header: map['header'] as String,
      subHeader: map['subHeader'] as String,
      description: map['description'] as String,
      timeForReading: map['timeForReading'] as String,
      adviceType: map['adviceType'] as String,
      introTitle: map['introTitle'] as String,
      introDescription: map['introDescription'] as String,
      subTitle: map['subTitle'] as String,
      subTitleDescription: map['subTitleDescription'] as String,
      subTwoTitle: map['subTwoTitle'] as String,
      subTwoDescription: map['subTwoDescription'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tips.fromJson(String source) => Tips.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tips(header: $header, subHeader: $subHeader, description: $description, timeForReading: $timeForReading, adviceType: $adviceType, introTitle: $introTitle, introDescription: $introDescription, subTitle: $subTitle, subTitleDescription: $subTitleDescription, subTwoTitle: $subTwoTitle, subTwoDescription: $subTwoDescription, date: $date)';
  }

  @override
  bool operator ==(covariant Tips other) {
    if (identical(this, other)) return true;
  
    return 
      other.header == header &&
      other.subHeader == subHeader &&
      other.description == description &&
      other.timeForReading == timeForReading &&
      other.adviceType == adviceType &&
      other.introTitle == introTitle &&
      other.introDescription == introDescription &&
      other.subTitle == subTitle &&
      other.subTitleDescription == subTitleDescription &&
      other.subTwoTitle == subTwoTitle &&
      other.subTwoDescription == subTwoDescription &&
      other.date == date;
  }

  @override
  int get hashCode {
    return header.hashCode ^
      subHeader.hashCode ^
      description.hashCode ^
      timeForReading.hashCode ^
      adviceType.hashCode ^
      introTitle.hashCode ^
      introDescription.hashCode ^
      subTitle.hashCode ^
      subTitleDescription.hashCode ^
      subTwoTitle.hashCode ^
      subTwoDescription.hashCode ^
      date.hashCode;
  }
}
