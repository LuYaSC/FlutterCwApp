import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw_app/Views/Models/tracking_batch.dart';
import 'package:cw_app/Views/details_views/batch_detail.dart';
import 'package:cw_app/Views/movements/screen_movements.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListBatchesTracking extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final bool rotation;
  final TrackingBatch list;

  ListBatchesTracking(
      {Key key,
      this.animationController,
      this.animation,
      this.rotation,
      this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: FintnessAppTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FintnessAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 4),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            color: Colors.orange[900]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                'Lote',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: -0.1,
                                                  color: FintnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                  child: Text(
                                                    '${(this.list.id * animation.value).toInt()}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FintnessAppTheme
                                                              .fontName,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: FintnessAppTheme
                                                          .darkerText,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                      ),
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            color: Colors.orange[900]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                'Importe',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: -0.1,
                                                  color: FintnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, bottom: 3),
                                                  child: Text(
                                                    '${(this.list.amount * animation.value).toDouble()}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FintnessAppTheme
                                                              .fontName,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: FintnessAppTheme
                                                          .darkerText,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[900]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                'Tipo',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: -0.1,
                                                  color: FintnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: 240.0,
                                                      maxWidth: 240.0,
                                                      minHeight: 30.0,
                                                      maxHeight: 100.0,
                                                    ),
                                                    child: AutoSizeText(
                                                      this.list.name,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FintnessAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color: FintnessAppTheme
                                                            .darkerText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 35,
                                        width: 2,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[900]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 1, bottom: 2),
                                              child: Text(
                                                'Fecha Proceso',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: -0.1,
                                                  color: FintnessAppTheme.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: 240.0,
                                                      maxWidth: 240.0,
                                                      minHeight: 30.0,
                                                      maxHeight: 100.0,
                                                    ),
                                                    child: AutoSizeText(
                                                      this.list.dateProcess,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FintnessAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color: FintnessAppTheme
                                                            .darkerText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Center(
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: FintnessAppTheme.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100.0),
                                          ),
                                          border: new Border.all(
                                              width: 4,
                                              color: Colors.blue[900]
                                                  .withOpacity(0.2)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());
                                                  Navigator.push<dynamic>(
                                                    context,
                                                    MaterialPageRoute<dynamic>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            Batchdetail(
                                                              animationController:
                                                                  animationController,
                                                              key: key,
                                                            ),
                                                        fullscreenDialog: true),
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      color: Colors.blue[900],
                                                    ),
                                                    Text(
                                                      'Detalles',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FintnessAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                        color: Colors.blue[900],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Center(
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: FintnessAppTheme.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100.0),
                                          ),
                                          border: new Border.all(
                                              width: 4,
                                              color: getColor(
                                                      this.list.description)
                                                  .withOpacity(0.2)),
                                          /*.nearlyDarkBlue
                                                            .withOpacity(0.2)),*/
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            Navigator.push<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ScreenMovements(
                                                            animationController:
                                                                animationController,
                                                            key: key,
                                                          ),
                                                  fullscreenDialog: true),
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                  getIcons(
                                                      this.list.description),
                                                  color: getColor(
                                                      this.list.description)),
                                              Text(
                                                this.list.description,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: FintnessAppTheme
                                                        .fontName,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11,
                                                    letterSpacing: 0.0,
                                                    color: getColor(
                                                        this.list.description)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

IconData getIcons(String description) {
  var iconresult;
  switch (description) {
    case 'Procesado':
      iconresult = Icons.check_circle;
      break;
    case 'No procesado':
      iconresult = Icons.cancel;
      break;
    case 'Rechazado':
      iconresult = Icons.cancel;
      break;
    case 'Solicitado':
      iconresult = Icons.library_add;
      break;
    case 'Controlado':
      iconresult = Icons.offline_pin;
      break;
    case 'En Procesp':
      iconresult = Icons.swap_vertical_circle;
      break;
  }
  return iconresult;
}

Color getColor(String description) {
  var colorResult;
  switch (description) {
    case 'Procesado':
      colorResult = Colors.green;
      break;
    case 'No procesado':
      colorResult = Colors.red;
      break;
    case 'Rechazado':
      colorResult = Colors.red;
      break;
    case 'Solicitado':
      colorResult = Colors.blue;
      break;
    case 'Controlado':
      colorResult = Colors.orange;
      break;
    case 'En Procesp':
      colorResult = Colors.yellow;
      break;
  }
  return colorResult;
}

class CurvePainter extends CustomPainter {
  final double angle;
  final List<Color> colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = List<Color>();
    if (colors != null) {
      colorsList = colors;
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
