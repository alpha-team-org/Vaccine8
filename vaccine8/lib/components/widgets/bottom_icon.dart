import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final String _iconText;
  final IconData _icon;

  final Function _onPressed;

  BottomIcon({@required iconText, @required icon, @required onPressed})
      : this._iconText = iconText,
        this._icon = icon,
        this._onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {},
            child: IconButton(
              onPressed: _onPressed,
              padding: EdgeInsets.all(0),
              icon: Icon(
                _icon,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            _iconText,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
