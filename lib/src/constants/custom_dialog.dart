import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, image;
  final Widget actionButtons;

  CustomDialog({
    @required this.title,
    @required this.actionButtons,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 24.0),
              actionButtons
            ],
          ),
        ),
        Positioned(
          left: 80,
          right: 80,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: Consts.avatarRadius,
            backgroundImage: image != null ? NetworkImage(image) : null,
          ),
        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 10.0;
  static const double avatarRadius = 60.0;
}