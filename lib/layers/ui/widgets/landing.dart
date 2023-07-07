import 'package:flutter/material.dart';
import 'package:test_smena/layers/ui/widgets/bottom_nav_bar.dart';

class Landing extends StatefulWidget {
  const Landing(this.child, {super.key});
  final Widget child;

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) {
            return Scaffold(
              body: SafeArea(top: true, child: widget.child),
              bottomNavigationBar: AppBottomNavBar(
                selectedIndex: 0,
                onTap: (index) {},
              ),
            );
          },
        )
      ],
    );
  }
}
