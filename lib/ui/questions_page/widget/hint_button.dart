import 'package:flutter/material.dart';

class HintButton extends StatelessWidget {
  final IconData? icon;
  final Function? onPressed;
  final String? label;

  const HintButton({this.label, this.icon, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Align(
          child: Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.blueAccent],
                stops: [0.0, .4],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.green,
              border: Border.all(color: Colors.white, width: 3.0),
              borderRadius: const BorderRadius.all(Radius.elliptical(100, 60)),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              label != null
                  ? Text(
                      label!,
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  : Icon(icon ?? Icons.exit_to_app, color: Colors.white),
            ]),
          ),
        ),
      ),
    );
  }
}
