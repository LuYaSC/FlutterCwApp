import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_widget/focus_widget.dart';

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

  Container getDropdown<T>(
      T value,
      List<DropdownMenuItem<T>> _dropdownMenuItems,
      dynamic onChangeDropdownItem,
      IconData iconView) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(iconView),
          //SvgPicture.asset("assets/icons/maps-and-flags.svg"),
          SizedBox(width: 20),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: Colors.orange[900],
              underline: SizedBox(),
              //icon: SvgPicture.asset("assets/icons/dropdown.svg"),
              value: value,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),
          ),
        ],
      ),
    );
  }

  Container getTextTransaction(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      width: double.infinity,
      child: rowlist(title, value),
    );
  }

  Container getInput(FocusNode focus, String textInput, [int maxLength = 20, int maxLines = 1]) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
        child: Container(
          child: FocusWidget(
            focusNode: focus,
            child: TextField(
              maxLength: maxLength,
              maxLines: maxLines,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: textInput,
                labelText: textInput,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor('FF8000')),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
