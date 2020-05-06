import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final bool outlined;
  final Function handleTap;

  const LargeButton({
    Key key,
    this.title,
    this.outlined,
    this.handleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: outlined
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
        )
            : BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: outlined
              ? Theme.of(context).textTheme.title
              : Theme.of(context).textTheme.title.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
