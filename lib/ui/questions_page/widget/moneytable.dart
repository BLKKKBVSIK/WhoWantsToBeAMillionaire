import 'package:flutter/material.dart';
import 'package:whowanttobeamillionaire/misc/configuration.dart';
import 'package:whowanttobeamillionaire/misc/k_constants.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/questionspage_viewmodel.dart';

class MoneyTable extends StatelessWidget {
  final int index;
  final QuestionPageViewModel model;

  const MoneyTable({required this.model, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: model.score == gameQuestions.length - index
          ? Colors.green
          : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text((gameQuestions.length - index).toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .apply(color: index % 5 == 0 ? Colors.white : kOrange)),
          Text(" - ", style: Theme.of(context).textTheme.bodyText1),
          Text(moneyTable.elementAt(index),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .apply(color: index % 5 == 0 ? Colors.white : kOrange)),
        ],
      ),
    );
  }
}
