import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whowanttobeamillionaire/misc/configuration.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/questionpage_view.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/questionspage_viewmodel.dart';
import 'package:whowanttobeamillionaire/widgets/button.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const QuestionPage(),
                    ),
                  );
                },
                child: AbsorbPointer(
                  child: AppButton(
                    model: QuestionPageViewModel(),
                    width: MediaQuery.of(context).size.width * 0.4,
                    isQuestion: true,
                    label: kStartTheGameText,
                    index: -1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
