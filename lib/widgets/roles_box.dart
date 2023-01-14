// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RolesBox extends StatefulWidget {
  final String iconPath, title, desc;
  final Color bgColor, titleColor, descColor;
  final Function onClick;
  const RolesBox(this.iconPath, this.title, this.desc, this.bgColor,
      this.titleColor, this.descColor, this.onClick);

  @override
  State<RolesBox> createState() => _RolesBoxState();
}

class _RolesBoxState extends State<RolesBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(widget.iconPath,
                          width: 100.0, height: 100.0),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: widget.titleColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              widget.desc,
                              style: TextStyle(color: widget.descColor),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )),
      onTap: () => widget.onClick(),
    );
  }
}
