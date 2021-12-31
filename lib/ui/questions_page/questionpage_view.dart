import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:whowanttobeamillionaire/di/dependency_graph.dart';
import 'package:whowanttobeamillionaire/misc/k_constants.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/questionspage_viewmodel.dart';
import 'package:whowanttobeamillionaire/ui/questions_page/widget/drawer.dart';
import 'package:whowanttobeamillionaire/widgets/button.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return ViewModelBuilder<QuestionPageViewModel>.reactive(
      viewModelBuilder: () => getFromDependencyGraph<QuestionPageViewModel>(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        key: _key,
        endDrawer: AppDrawer(model: model),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () {
                      _key.currentState!.openEndDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: kBlueBorder,
                            thickness: 3,
                          ),
                        ),
                        AppButton(
                          model: model,
                          index: -1,
                          width: MediaQuery.of(context).size.width * .9,
                          label: model.question,
                          isQuestion: true,
                        ),
                        const Expanded(
                          child: Divider(
                            color: kBlueBorder,
                            thickness: 3,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Divider(
                                color: kBlueBorder,
                                thickness: 3,
                              ),
                            ),
                            AppButton(
                              model: model,
                              index: 0,
                              label: model.answer0,
                              width: MediaQuery.of(context).size.width * .45,
                            ),
                            AppButton(
                              model: model,
                              index: 1,
                              label: model.answer1,
                              width: MediaQuery.of(context).size.width * .45,
                            ),
                            const Expanded(
                              child: Divider(
                                color: kBlueBorder,
                                thickness: 3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Divider(
                                color: kBlueBorder,
                                thickness: 3,
                              ),
                            ),
                            AppButton(
                              model: model,
                              index: 2,
                              label: model.answer2,
                              width: MediaQuery.of(context).size.width * .45,
                            ),
                            AppButton(
                              model: model,
                              index: 3,
                              label: model.answer3,
                              width: MediaQuery.of(context).size.width * .45,
                            ),
                            const Expanded(
                              child: Divider(
                                color: kBlueBorder,
                                thickness: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
