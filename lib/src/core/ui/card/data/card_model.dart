class CardModel {
  CardModel({
    required this.id,
    required this.title,
    this.subTitle,
    this.imageUrl,
    this.dateTime,
    this.onPressed,
  });
  String id;
  String title;
  String? subTitle;
  String? imageUrl;
  DateTime? dateTime;

  Function()? onPressed;
}
