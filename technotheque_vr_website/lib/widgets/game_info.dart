import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    super.key,
    required this.game,
  });

  final Game game;

  Widget _buildText(BuildContext context, String title, String text) {
    final colon = LocaleText.of(context, listen: false).colon;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title$colon ',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Flexible(
              child: Text(text, style: Theme.of(context).textTheme.bodyLarge!)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          game.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(decoration: TextDecoration.underline),
        ),
        _buildText(context, texts.description, game.description(context)),
        _buildText(context, texts.time, game.time(context)),
        _buildText(context, texts.position, game.position(context)),
        _buildText(context, texts.numberPlayers, game.numberPlayers(context)),
        _buildText(context, texts.progression, game.progression(context)),
        _buildText(context, texts.performanceFeedback,
            game.performanceFeedback(context)),
        _buildText(
            context, texts.resultsFeedback, game.resultsFeedback(context)),
        _buildText(context, texts.physicalRequirements,
            game.physicalRequirements(context)),
        _buildText(context, texts.motorSkills, game.motorSkills(context)),
        _buildText(context, texts.sideNotes, game.sideNotes(context)),
        _buildText(context, texts.cognitiveRequirements,
            game.cognitiveRequirements(context)),
      ],
    );
  }
}
