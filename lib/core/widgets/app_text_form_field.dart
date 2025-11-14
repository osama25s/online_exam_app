import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;

  const AppTextFormField({
    Key? key,

    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.onChanged,
    this.initialValue,
    this.contentPadding,
    this.errorText,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  bool get _hasValue {
    return widget.controller?.text.isNotEmpty ??
        (widget.initialValue?.isNotEmpty ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorErrorColor: AppColors.red,
      cursorColor: AppColors.black,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      initialValue: widget.initialValue,
      style: const TextStyle(fontSize: 16, color: Color(0xFF111827)),
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: widget.label,
        isDense: true,
        labelStyle: TextStyles.font16Grey400Weight().copyWith(
          color: _isFocused ? AppColors.black : AppColors.darkGrey,
        ),
        floatingLabelStyle: TextStyles.font16Grey400Weight().copyWith(
          color: AppColors.darkGrey,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        hintStyle: TextStyles.font16Grey400Weight(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.black, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red, width: 2),
        ),
      ),
    );
  }
}
