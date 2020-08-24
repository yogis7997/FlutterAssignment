import 'package:flutter/material.dart';
import 'package:flutterassignment/src/res/colors.dart';
import 'package:flutterassignment/src/res/textstyles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyles textStyles;
  final Color textColor;
  final TextAlign textAlign;

  const TextWidget(
      {Key key, this.text, this.textStyles, this.textColor, this.textAlign:TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText1;
    switch (textStyles) {
      case TextStyles.normal:
        textStyle = Theme.of(context).textTheme.bodyText1;
        break;
      case TextStyles.large:
        textStyle = Theme.of(context).textTheme.headline1;
        break;
    }
    return Text(
      text != null ? text : '',
      textAlign: textAlign,
      style: textStyle.copyWith(color: textColor),
    );
  }
}
