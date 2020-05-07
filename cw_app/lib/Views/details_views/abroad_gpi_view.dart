import 'package:cw_app/Views/Models/abroad_detail_gpi.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/utils/utils_views.dart';
import 'package:flutter/material.dart';

class AbroadGpiView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final AbroadDetailGPI detail;

  const AbroadGpiView(
      {Key key, this.animationController, this.animation, this.detail})
      : super(key: key);

  IconData getIcon(String message) {
    if (detail.codeDescription.contains('RECHAZADO')) {
      return Icons.cancel;
    }
    if (detail.codeDescription.contains('ACREDITADO')) {
      return Icons.beenhere;
    }
  }

  HexColor getColor(String message) {
    if (detail.codeDescription.contains('RECHAZADO')) {
      return HexColor('DD3232');
    }
    if (detail.codeDescription.contains('ACREDITADO')) {
      return HexColor('30ce4f');
    }
  }

  @override
  Widget build(BuildContext context) {
    UtilsViews utils = new UtilsViews(context);
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FintnessAppTheme.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: FintnessAppTheme.grey.withOpacity(0.5),
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: SizedBox(
                                  height: 40,
                                  width: 45,
                                  child: AspectRatio(
                                    aspectRatio: 1.714,
                                    child: Icon(getIcon(detail.codeDescription),
                                        color:
                                            getColor(detail.codeDescription)),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  utils.rowlist('Estado',
                                      detail.codeDescription, true, true),
                                  utils.rowlist(
                                      'Importe',
                                      '${detail.creditAmount} ${detail.crediCurrency}',
                                      false,
                                      true),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
