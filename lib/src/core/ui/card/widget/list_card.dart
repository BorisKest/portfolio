import 'package:portfolio/src/core/ui/card/data/card_model.dart';
import 'package:portfolio/src/core/ui/image_container/image_container.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// {@template list_card}
/// ListCard widget.
/// {@endtemplate}
class ListCard extends StatelessWidget {
  /// {@macro list_card}
  const ListCard({
    super.key, // ignore: unused_element
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) => MaterialButton(
    padding: EdgeInsets.all(10.0),
    minWidth: 100,
    height: 100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    onPressed: cardModel.onPressed,
    child: Column(
      children: [
        if (cardModel.imageUrl != null)
          Flexible(
            flex: 4,
            child: ImageContainer(
              child: CachedNetworkImage(
                imageUrl: cardModel.imageUrl!,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        SizedBox(
          height:
              cardModel.imageUrl != null
                  ? MediaQuery.of(context).size.height * 0.01
                  : 0,
        ),
        Flexible(
          flex: 1,
          child: SizedBox.expand(
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.fitHeight,
              child: RichText(
                text: TextSpan(
                  text: cardModel.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  children: [
                    if (cardModel.subTitle != null)
                      TextSpan(
                        text: '\n${cardModel.subTitle}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    if (cardModel.dateTime != null)
                      TextSpan(
                        text: '\n${cardModel.dateTime}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.surfaceBright,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
