import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilsViews {
  BuildContext context;

  UtilsViews(BuildContext context) {
    this.context = context;
  }

  Row rowlist(String description, String content,
      [bool isFirst = false, bool isSpecial = false]) {
    var screenwidth = MediaQuery.of(context).size.width - 60;
    return Row(
      mainAxisAlignment:
          isSpecial ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 240,
              maxWidth: screenwidth,
              minHeight: 0.0,
              maxHeight: 100.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 5,
                right: 12,
                top: isFirst ? 5 : 1,
              ),
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: '$description: ',
                      style: TextStyle(
                        fontFamily: FintnessAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: Colors.orange[900],
                        //FintnessAppTheme.nearlyDarkBlue,
                      ),
                    ),
                    new TextSpan(
                      text: content,
                      style: TextStyle(
                        fontFamily: FintnessAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: HexColor("#014B8E"),
                        //FintnessAppTheme.nearlyDarkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
