import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final List<Widget> title;
  final List<Widget> trailing;
  final List<Widget> subtitle;
  final Widget leading;
  final Color tileColor;
  CustomListTile(
      {Key key,
      this.title,
      this.trailing,
      this.subtitle,
      this.leading,
      this.tileColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: title,
      ),
      leading: leading,
      subtitle: subtitle != null
          ? Row(mainAxisSize: MainAxisSize.min, children: subtitle)
          : null,
      trailing: trailing != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: trailing,
            )
          : null,
    );
  }
}
