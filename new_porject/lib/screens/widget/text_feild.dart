import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_porject/utils/dimension.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final String titleText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final bool isPassword;
  final Function? onTap;
  final Function? onChanged;
  final Function? onSubmit;
  final bool? isEnabled;
  final TextCapitalization capitalization;
  final Color? fillColor;
  final bool isAmount;
  final bool isNumber;
  final bool amountIcon;
  final bool durationIcon;
  final bool title;
  final bool readOnly;
  final Function? onComplete;
  final Function(bool)? onFocus;
  final Widget? suffix;
  final bool fromProfile;
  MyTextField(
      {this.hintText = '',
      this.titleText = '',
      this.controller,
      this.focusNode,
      this.fromProfile = false,
      this.nextFocus,
      this.isEnabled = true,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onSubmit,
      this.onChanged,
      this.capitalization = TextCapitalization.none,
      this.onTap,
      this.fillColor,
      this.readOnly = false,
      this.isPassword = false,
      this.isAmount = false,
      this.isNumber = false,
      this.amountIcon = false,
      this.durationIcon = false,
      this.title = true,
      this.onFocus,
      this.suffix,
      this.onComplete});
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
      _focusNode.addListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    if (widget.onFocus != null) {
      widget.onFocus!(_focusNode.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.title
          ? Row(children: [
              Text(
                widget.hintText == '' ? widget.hintText : widget.titleText,
                style: TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL, color: Theme.of(context).disabledColor),
              ),
              const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              widget.fromProfile
                  ? const SizedBox.shrink()
                  : widget.isEnabled!
                      ? const SizedBox()
                      : Text('(${'non_changeable'})',
                          style: TextStyle(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: Theme.of(context).colorScheme.error,
                          ))
            ])
          : const SizedBox.shrink(),
      SizedBox(
        height: widget.maxLines != 5 ? 50 : 100,
        child: TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: const TextStyle(fontSize: 14),
          textInputAction: widget.nextFocus != null ? widget.inputAction : TextInputAction.done,
          keyboardType: widget.isAmount
              ? const TextInputType.numberWithOptions(decimal: true)
              : widget.isNumber
                  ? TextInputType.number
                  : widget.inputType,
          autofillHints: widget.inputType == TextInputType.name
              ? [AutofillHints.name]
              : widget.inputType == TextInputType.emailAddress
                  ? [AutofillHints.email]
                  : widget.inputType == TextInputType.phone
                      ? [AutofillHints.telephoneNumber]
                      : widget.inputType == TextInputType.streetAddress
                          ? [AutofillHints.fullStreetAddress]
                          : widget.inputType == TextInputType.url
                              ? [AutofillHints.url]
                              : widget.inputType == TextInputType.visiblePassword
                                  ? [AutofillHints.password]
                                  : widget.inputType == TextInputType.url
                                      ? [AutofillHints.url]
                                      : null,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          readOnly: widget.readOnly,
          textAlignVertical: TextAlignVertical.center,
          autofocus: false,
          //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.url
              ? [FilteringTextInputFormatter.deny(RegExp(r'[!@#\$%^&*(),?+×÷“[]{}|<>\s|\u0600-\u06FF\u0750-\u07FF]'))]
              : widget.inputType == TextInputType.phone
                  ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]
                  : widget.isNumber
                      ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                      : widget.isAmount
                          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
                          : null,
          decoration: InputDecoration(
            // hintText: widget.hintText,
            labelText: widget.hintText,
            isDense: true,
            filled: false,
            fillColor: widget.fillColor != null ? widget.fillColor : Theme.of(context).cardColor,
            enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 0.3, color: Theme.of(context).shadowColor), //<-- SEE HERE
            ),
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 0.3, color: Theme.of(context).shadowColor), //<-- SEE HERE
            ),
            hintStyle: TextStyle(color: Theme.of(context).hintColor),
          ),
          onTap: widget.onTap as void Function()?,
          onSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged as void Function(String)?,
          onEditingComplete: widget.onComplete as void Function()?,
        ),
      ),
    ]);
  }
}
