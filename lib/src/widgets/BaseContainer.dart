import 'package:flutter/material.dart';
import 'package:flutterassignment/src/res/dimens.dart';
import 'package:flutterassignment/src/widgets/TextWidget.dart';

class BaseContainer extends StatelessWidget {
  final bool showAppBar;
  final String title;
  final Widget child;
  final bool loading;
  final double paddingAll;
  final Function onBackPress;
  final bool showBackButton;

  const BaseContainer(
      {Key key,
      this.showAppBar = true,
      this.title,
      this.child,
      this.loading = false,
      this.paddingAll = 0.0,
      this.onBackPress,
      this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(showAppBar),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(paddingAll),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: child != null ? child : SizedBox.shrink()),
          loading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: null,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 6.0,
                    ),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }

  appBarWidget(showAppBar) => showAppBar
      ? AppBar(
          leading: showBackButton
              ? BackButton(
                  onPressed: onBackPress,
                  color: Colors.white,
                )
              : null,
          title: TextWidget(
            text: title,
          ),
        )
      : null;
}
