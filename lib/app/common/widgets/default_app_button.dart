import 'package:clean_architecture/app/common/widgets/shimmer/shimmer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/app_theme.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final Color? titleColor;
  final TextStyle? textStyle;
  final FontWeight?fontWeight;
  final Color? buttonColor;
  final double width;
  final double height;
  final VoidCallback? onPress;
  final VoidCallback? onDisabledPressed;
  final BorderRadiusGeometry? borderRadius;
  final bool isDisabled;
  final bool isLoading;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Border? border;
  final double? titleSize;

  const DefaultButton({
    super.key,
    this.title = '',
    this.titleColor = Colors.white,
    this.fontWeight,
    this.buttonColor = AppTheme.lightPrimaryColor,
    this.width = 305,
    this.height = 44,
    this.onPress,
    this.onDisabledPressed,
    this.textStyle,
    this.borderRadius,
    this.prefixIconPath,
    this.suffixIconPath,
    this.border,
    this.titleSize,
    this.fontFamily,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: isLoading
          ? ShimmerButton(width: width, height: height)
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                if (isDisabled) {
                  onDisabledPressed?.call();
                } else {
                  onPress?.call();
                }
              },
              child: Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isDisabled ? AppTheme.disabledButtonColor : buttonColor,
                  borderRadius: borderRadius ?? BorderRadius.circular(15),
                  border: border,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIconPath != null) ...[
                      SvgPicture.asset(prefixIconPath!, height: 24),
                      const SizedBox(width: 10)
                    ],
                    Text(
                      title,
                      style: textStyle ??
                          TextStyle(
                            color: titleColor,
                            fontWeight:fontWeight ??FontWeight.w300,
                            fontSize: titleSize ?? 16,
                            fontFamily: fontFamily??'DMSans',
                          ),
                    ),
                    if (suffixIconPath != null) ...[
                      const SizedBox(width: 10),
                      SvgPicture.asset(suffixIconPath!, height: 24)
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
