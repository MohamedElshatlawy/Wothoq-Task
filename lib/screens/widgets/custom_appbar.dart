import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leadingIcon;
  final List<Widget> traillingIcons;
  final BorderRadiusGeometry leadingRaduis;
  final Function() leadingPress;

  const CustomAppBar({
    Key key,
    this.leadingIcon,
    this.traillingIcons,
    this.leadingPress,
    this.leadingRaduis,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          decoration: BoxDecoration(
              color: ColorsUtils.whiteColor, borderRadius: leadingRaduis),
          child: leadingIcon,
        ),
        actions: traillingIcons,
      ),
    );
  }
}
