const String tableNote = 'note';
const String columnId = '_id';
const String columnTitleText = 'titleText';
const String columnBodyText = 'bodyText';

class Note {
  int id;
  String contents;

  Note({
    required this.id,
    required this.contents,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        contents: json["contents"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contents": contents,
      };
}
