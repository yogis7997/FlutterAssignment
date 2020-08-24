import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/src/res/colors.dart';
import 'package:flutterassignment/src/res/dimens.dart';
import 'package:flutterassignment/src/widgets/TextWidget.dart';

class Button extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool enabled;

  const Button({Key key, this.onPress, this.text, this.enabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: kButtonHeight,
      child: RaisedButton(
        onPressed: enabled ? onPress : null,
        disabledColor: kButtonColorDeactivated,
        child: Align(
          alignment: Alignment.center,
          child: TextWidget(
            text: text,
            textColor: kButtonTextColor,
          ),
        ),
      ),
    );
  }
}
