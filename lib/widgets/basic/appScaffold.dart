import 'package:flutter/material.dart';

class appScaffold extends StatefulWidget {
  appScaffold(
      {super.key,
      required this.navigationRail,
      required this.navigationBar,
      required this.body,
      this.minimumAspectRatioForLandscape = 1.0 / 1.0});

  Widget navigationRail;
  Widget navigationBar;
  Widget body;
  final minimumAspectRatioForLandscape;

  @override
  State<appScaffold> createState() => _appScaffoldState();
}

class _appScaffoldState extends State<appScaffold> {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio >=
        widget.minimumAspectRatioForLandscape;

    return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          build(context);
          return true;
        },
        child: Scaffold(
          bottomNavigationBar: isLandscape == true ? null : widget.navigationBar,
          body: isLandscape
              ? Row(
                  children: [
                    widget.navigationRail,
                    Expanded(child: widget.body)
                  ],
                )
              : widget.body
        ));
  }
}
