import 'package:flutter/material.dart';
import 'package:flutterassignment/src/res/dimens.dart';
import 'package:flutterassignment/src/screens/LoginStepOne.dart';
import 'package:flutterassignment/src/widgets/BaseContainer.dart';
import 'package:flutterassignment/src/widgets/TextWidget.dart';
import 'package:flutterassignment/src/widgets/Button.dart';

import 'LoginStepTwo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int selectedPage = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      showBackButton: selectedPage > 0,
      onBackPress: _handleBackPress,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kContainerPadding),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.black,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => {changePage(0)},
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: CircleAvatar(
                          backgroundColor:
                              selectedPage == 0 ? Colors.white : Colors.green,
                          radius: 19,
                          child: TextWidget(
                            text: '1',
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 19,
                        child: TextWidget(
                          text: '2',
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 19,
                        child: TextWidget(
                          text: '3',
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 19,
                        child: TextWidget(
                          text: '4',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: PageView(
              controller: pageController,
              physics: new NeverScrollableScrollPhysics(),
              children: [
                LoginStepOne(
                  onLoginClick: () => {changePage(1)},
                ),
                LoginStepTwo()
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changePage(int index) {
    setState(() {
      selectedPage = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  _handleBackPress() {
    changePage(selectedPage - 1);
  }
}
