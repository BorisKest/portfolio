final String tableNote = 'note';
final String columnId = '_id';
final String columnTitleText = 'titleText';
final String columnBodyText = 'bodyText';

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
