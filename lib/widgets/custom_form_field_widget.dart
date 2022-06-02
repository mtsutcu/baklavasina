import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFormFieldWidget extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  bool obsucreText;
  CustomFormFieldWidget(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.controller,
      required this.margin,
      required this.padding,
      this.obsucreText = false})
      : super(key: key);

  @override
  State<CustomFormFieldWidget> createState() => _CustomFormFieldWidgetState();
}

class _CustomFormFieldWidgetState extends State<CustomFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade900,
      ),
      margin: widget.margin,
      padding: widget.padding,
      child: TextFormField(
        obscureText: widget.obsucreText,
        onSaved: (newValue) => widget.controller.text = newValue.toString(),
        controller: widget.controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 11),
            hintText: widget.hintText,
            icon: Icon(
              widget.icon,
              color: Theme.of(context).primaryColor,
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
