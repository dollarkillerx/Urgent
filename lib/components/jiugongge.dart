import 'package:flutter/material.dart';

class Jiugongge extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;

  const Jiugongge({Key? key,required this.title,required this.icon,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 1,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(this.icon,size: 50,),
            Text(this.title),
          ],
        ),
      ),
      onTap: () {
        if (this.onTap != null) {
          onTap!();
        }
      },
    );
  }

}