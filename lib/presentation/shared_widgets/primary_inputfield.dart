import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:fci_project/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryInputField extends StatefulWidget {
  const PrimaryInputField({
    Key? key,
    this.hasTextHeader = false,
    this.isSecure = false,
    this.hintText = '',
    this.icon,
    this.validator,
    this.onSaved,
    this.controller,
    this.maxLines,
    this.hideBorder = false,
    this.max,
    this.headerText,
    this.autoValidate = AutovalidateMode.onUserInteraction,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String? hintText;
  final String? headerText;
  final bool? hasTextHeader;
  final bool? isSecure;
  final bool? hideBorder;
  final IconData? icon;
  final dynamic validator;
  final dynamic onSaved;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? max;
  final int? maxLines;
  final AutovalidateMode autoValidate;

  @override
  State<PrimaryInputField> createState() => _PrimaryInputFieldState();
}

class _PrimaryInputFieldState extends State<PrimaryInputField> {
  bool showPass = false;
  bool isValid = false;
  @override
  void initState() {
    showPass = widget.isSecure!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.headerText != null ||
            (widget.hasTextHeader! && widget.headerText!.trim().isNotEmpty))
          PrimaryText(
            text: widget.headerText ?? '',
            textStyle: TStyle.headerTextStyle,
          ),
        TextFormField(
          controller: widget.controller,
          onSaved: widget.onSaved,
          obscureText: showPass,
          maxLength: widget.max,
          maxLines: widget.isSecure! ? 1 : widget.maxLines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          autovalidateMode: widget.autoValidate,
          keyboardType: widget.keyboardType,
          onChanged: (String? value) {
            if (widget.max == 10 &&
                widget.keyboardType == TextInputType.phone) {
              if (value!.trim().isNotEmpty && value.startsWith('0')) {
                widget.controller!.clear();
                return;
              }
            }

            if (value!.trim().isNotEmpty &&
                value.trim().contains('@') &&
                value.trim().contains('.')) {
              if (isValid) return;
              isValid = true;
              setState(() {});
            } else {
              if (!isValid) return;
              isValid = false;
              setState(() {});
            }
          },
          validator: widget.validator ??
              (String? value) {
                if (value!.trim().isEmpty) {
                  return 'مطلوب ${widget.headerText} *';
                }
                if (widget.max != null && value.trim().length < widget.max!) {
                  return 'برجاء استكمال رقم الهاتف*';
                }
                return null;
              },
          decoration: InputDecoration(
              isDense: true,
              border: widget.hideBorder! ? InputBorder.none : null,
              hintText: widget.hintText,
              counterText: '',
              suffixText:
                  widget.keyboardType == TextInputType.phone && widget.max == 10
                      ? '02+'
                      : null,
              suffixIcon: widget.isSecure! == false && isValid
                  ? PrimaryIcon(Icons.done)
                  : widget.isSecure!
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          icon: PrimaryIcon(showPass
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )
                      : null,
              prefixIcon: widget.icon != null
                  ? PrimaryIcon(widget.icon, iconSizeRatio: 1.2, color: kgrey)
                  : null),
        ),
      ],
    );
  }
}
