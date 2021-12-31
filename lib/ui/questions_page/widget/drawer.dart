import 'package:flutter/material.dart';
import 'package:whowanttobeamillionaire/misc/configuration.dart';
import 'package:whowanttobeamillionaire/misc/k_constants.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/questionspage_viewmodel.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/widget/hint_button.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/widget/moneytable.dart';

class AppDrawer extends StatelessWidget {
  final QuestionPageViewModel model;

  const AppDrawer({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Container(
        color: kDarkBlue,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              HintButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HintButton(
                label: "50:50",
                onPressed: () {
                  model.removeTwoFalseAnswers();
                  Navigator.pop(context);
                },
              ),
              HintButton(
                icon: Icons.phone_in_talk_sharp,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              HintButton(
                icon: Icons.groups_rounded,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Column(
            children: List.generate(gameQuestions.length,
                (index) => MoneyTable(index: index, model: model)),
          ),
        ]),
      ),
    );
  }
}
