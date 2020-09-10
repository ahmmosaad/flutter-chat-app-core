import 'package:flutter/material.dart';

import 'constant.dart';

class Field extends StatelessWidget {
  final Function change;
  final Function validation;
  final IconData iconData;
  final String label;
  final String hint;

  Field({ this.change, this.hint, this.label, this.validation, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        child: Row(
          children: [
            Icon(iconData,color: myMsg),
            SizedBox(width: 10,),
            Expanded(
              child: TextFormField(

                decoration: InputDecoration(
                  labelText: label,
                  hintText: hint,
                ),
                onChanged: change,
                validator: validation,

              ),
            ),
          ],
        ),
      ),
    );
  }
}