import 'package:flutter/material.dart';
import 'package:flutterassignment/src/res/dimens.dart';
import 'package:flutterassignment/src/res/strings.dart';
import 'package:flutterassignment/src/res/textstyles.dart';
import 'package:flutterassignment/src/widgets/BaseContainer.dart';
import 'package:flutterassignment/src/widgets/TextWidget.dart';
import 'package:flutterassignment/src/widgets/Button.dart';

class LoginStepOne extends StatefulWidget {
  final Function onLoginClick;

  const LoginStepOne({Key key, this.onLoginClick}) : super(key: key);

  @override
  _LoginStepOneState createState() => _LoginStepOneState();
}

class _LoginStepOneState extends State<LoginStepOne> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: welcome,
                  textStyles: TextStyles.large,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextWidget(
                    text: welcomeDes,
                    textStyles: TextStyles.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextField(
                    maxLength: 10,
                    controller: mobileNumberEditController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            width: MediaQuery.of(context).size.width,
            child: Button(
              text: 'Login',
              enabled: isValid,
              onPress: () => widget.onLoginClick(),
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
