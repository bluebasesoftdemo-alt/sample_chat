import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_color.dart';
import '../styles.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;

  const CustomButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
  })  : outline = false;

  const CustomButton.outline({super.key,
    required this.title,
    this.onTap,
    this.leading,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 45,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
          color: !disabled ? mPrimaryBlackColor : mSecondaryColor100,
          borderRadius: BorderRadius.circular(8),
        )
            : BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: mPrimaryBlackColor,
              width: 1,
            )),
        child: !busy
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading!,
            if (leading != null) SizedBox(width: 5),
            Text(
              title,
              style: bodyStyle.copyWith(
                fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                color: !outline ? Colors.white : mPrimaryBlackColor,
              ),
            ),
          ],
        )
            : CircularProgressIndicator(
          strokeWidth: 8,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}