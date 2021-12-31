import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whowanttobeamillionaire/misc/k_constants.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/questionspage_viewmodel.dart';
import 'dart:ui' as ui;

class AppButton extends StatefulWidget {
  final QuestionPageViewModel model;
  final String label;
  final double? width;
  final int index;
  final bool isQuestion;

  const AppButton({
    required this.index,
    required this.model,
    required this.label,
    this.isQuestion = false,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.label == '') {
          return;
        } else if (!widget.isQuestion) {
          await widget.model.nextQuestion(widget.label);
        } else {
          return;
        }
      },
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.isQuestion ? 120 : 70,
        padding: EdgeInsets.symmetric(
          vertical: widget.isQuestion ? 14.0 : 5.0,
        ),
        child: Stack(
          children: [
            CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
              painter: RPSCustomPainter(
                  widget.model, widget.label, widget.isQuestion),
            ),
            Positioned.fill(
              child: Align(
                alignment:
                    widget.isQuestion ? Alignment.center : Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: widget.isQuestion
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Text(
                        getQuestionLetterWithIndex(widget.index),
                        style: Theme.of(context).textTheme.bodyText1!.apply(
                              color: kOrange,
                            ),
                      ),
                      Text(
                        widget.label,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getQuestionLetterWithIndex(int index) {
    switch (index) {
      case 0:
        return 'A:    ';
      case 1:
        return 'B:    ';
      case 2:
        return 'C:    ';
      case 3:
        return 'D:    ';
      default:
        return '';
    }
  }
}

class RPSCustomPainter extends CustomPainter {
  final QuestionPageViewModel model;
  final String label;
  final bool isQuestion;

  RPSCustomPainter(this.model, this.label, this.isQuestion);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.1),
        Offset(size.width * 0.50, size.height * 1),
        calculateGradientColors(model, label, isQuestion),
        [0.00, 1.00]);

    Paint paint1 = Paint()
      ..color = kBlueBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path0 = Path()
      ..moveTo(size.width * 0.0, size.height * 0.5)
      ..lineTo(size.width * 0.1, size.height * 1)
      ..lineTo(size.width * 0.9, size.height * 1)
      ..lineTo(size.width * 1, size.height * 0.5)
      ..lineTo(size.width * 0.9, size.height * 0)
      ..lineTo(size.width * 0.1, size.height * 0)
      ..close();

    Path path1 = Path()
      ..moveTo(size.width * 0.0, size.height * 0.5)
      ..lineTo(size.width * 0.1, size.height * 1)
      ..lineTo(size.width * 0.9, size.height * 1)
      ..lineTo(size.width * 1, size.height * 0.5)
      ..lineTo(size.width * 0.9, size.height * 0)
      ..lineTo(size.width * 0.1, size.height * 0)
      ..close();

    canvas.drawPath(path0, paint0);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<Color> calculateGradientColors(
      QuestionPageViewModel model, String label, bool isQuestion) {
    if (model.userAnsweredCorrectly == 0 || isQuestion) {
      return kDarkGradiant;
    } else {
      if (model.userAnsweredCorrectly == 1 && label == model.correctAnswer) {
        return [Colors.green, Colors.green];
      }
      if (model.userAnsweredCorrectly == 2) {
        if (label == model.correctAnswer) {
          return [Colors.green, Colors.green];
        } else {
          return [Colors.red, Colors.red];
        }
      }
    }
    return kDarkGradiant;
  }
}
