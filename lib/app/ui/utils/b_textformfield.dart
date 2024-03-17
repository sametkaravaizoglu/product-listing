import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BTextFormField {
  static Widget widget({
    required BuildContext context,
    bool? autoFocus,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? mask,
    String? Function(String?)? validation,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    ValueChanged<String>? onFieldSubmitted,
    TextEditingController? controller,
    TextInputType? keyboardType,
    int? minLines,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? border,
    InputBorder? disabledBorder,
    InputDecoration? decoration,
    TextStyle? style,
    TextStyle? labelStyle,
    BoxConstraints? boxConstraints,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    String? hintText,
    String? labelText,
    String? helperText,
    Widget? leadingIcon,
    Widget? suffixIcon,
    bool? obscureText,
    int? maxLength,
    int? maxLines,
    bool? enabled,
    bool? readOnly,
    Color? cursorColor,
    AutovalidateMode? validateMode,
    double? fontSize,
    Color? borderColor,
    Color? fillColor,
    FloatingLabelBehavior? floatingLabelBehavior,
  }) {
    return TextFormField(
      autofocus: autoFocus == null ? false : true,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      cursorColor: cursorColor ?? ColorManager.instance.darkGray,
      textInputAction: textInputAction,
      style: style ??
          TextStyle(
            color: ColorManager.instance.darkGray,
            fontSize: fontSize ?? 16,
          ),
      inputFormatters: mask ?? [],
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: validateMode ?? AutovalidateMode.disabled,
      keyboardType: keyboardType ?? TextInputType.text,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      minLines: minLines ?? 1,
      decoration: decoration ??
          InputDecoration(
            counter: const Offstage(),
            prefixIcon: leadingIcon,
            suffixIcon: suffixIcon,
            constraints: boxConstraints,
            filled: fillColor != null ? true : true,
            fillColor: fillColor ?? ColorManager.instance.white,
            contentPadding: const EdgeInsets.only(left: 16, top: 16),
            disabledBorder: disabledBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? ColorManager.instance.gray,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorManager.instance.darkGray,
                width: 0.7,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorManager.instance.darkGray,
                width: 0.7,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorManager.instance.darkGray,
                width: 0.7,
              ),
            ),
            helperText: helperText,
            helperStyle: helperStyle,
            alignLabelWithHint: true,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            labelText: labelText ?? "",
            hintText: hintText ?? "",
            hintStyle: hintStyle != null
                ? hintStyle.copyWith(
                    color: ColorManager.instance.darkGray,
                  )
                : TextStyle(
                    fontSize: 16.sp,
                    color: ColorManager.instance.darkGray,
                  ),
            labelStyle: labelStyle ??
                TextStyle(
                  fontSize: 16.sp,
                  color: ColorManager.instance.darkGray,
                ),
          ),
      validator: validation,
      onTap: onTap,
    );
  }
}
