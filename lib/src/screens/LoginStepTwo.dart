import 'package:flutter/material.dart';
import 'package:flutterassignment/src/res/dimens.dart';
import 'package:flutterassignment/src/res/strings.dart';
import 'package:flutterassignment/src/res/textstyles.dart';
import 'package:flutterassignment/src/widgets/BaseContainer.dart';
import 'package:flutterassignment/src/widgets/TextWidget.dart';
import 'package:flutterassignment/src/widgets/Button.dart';

class LoginStepTwo extends StatefulWidget {
  final Function onLoginClick;

  const LoginStepTwo({Key key, this.onLoginClick}) : super(key: key);

  @override
  _LoginStepOneState createState() => _LoginStepOneState();
}

class _LoginStepOneState extends State<LoginStepTwo> {
  TextEditingController mobileNumberEditController =
      new TextEditingController();

  bool isValid = false;

  @override
  void initState() {
    super.initState();
    mobileNumberEditController.addListener(onMobileNumberChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      showAppBar: false,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(kContainerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "To Be Continue...",
                  textStyles: TextStyles.large,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onMobileNumberChanged() {
    setState(() {
      if (mobileNumberEditController.text.length <= 9)
        isValid = false;
      else
        isValid = true;
    });
  }
}
