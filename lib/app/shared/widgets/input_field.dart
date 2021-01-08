import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;
  final TextInputType tipoTeclado;
  final Color colorParam;
  final String initialData;
  final bool enabled;
  final int maxLines;
  final int maxLength;

  InputField({this.icon, this.hint, this.obscure, this.stream, this.onChanged, this.tipoTeclado, this.colorParam, this.initialData, this.enabled, this.maxLines, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextFormField(
            maxLines: maxLines != null ? maxLines == 999 ? null : maxLines : 1,
            maxLength: maxLength,
            onChanged: onChanged,
            enabled: enabled,
            initialValue: initialData,
            keyboardType: tipoTeclado,
            decoration: InputDecoration(
              icon: this.icon!=null ? Icon(icon, color: colorParam) : null,
              hintText: hint,
              hintStyle: TextStyle(color: colorParam),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorParam)
              ),
              contentPadding: EdgeInsets.only(
                  left: 5,
                  right: 30,
                  bottom: 10,
                  top: 10
              ),
              errorText: snapshot.hasError ? snapshot.error : null,
            ),
            style: TextStyle(color: colorParam),
            obscureText: obscure,
          );
        }
    );
  }
}
