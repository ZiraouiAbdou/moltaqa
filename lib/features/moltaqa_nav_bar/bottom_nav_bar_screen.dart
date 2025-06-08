import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class MoltaqaScaffoldWithNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  /// Constructs an [MoltaqaScaffoldWithNavBar].
  const MoltaqaScaffoldWithNavBar({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey<String>('MoltaqaScaffoldWithNavBar'));

  @override
  State<MoltaqaScaffoldWithNavBar> createState() =>
      _MoltaqaScaffoldWithNavBarState();
}

class _MoltaqaScaffoldWithNavBarState extends State<MoltaqaScaffoldWithNavBar> {
  /// The navigation shell and container for the branch Navigators.

  final NotchBottomBarController _controller = NotchBottomBarController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.navigationShell,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        itemLabelStyle: TextStylesManager.titleSmall,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: Colors.blueGrey),
            activeItem: Icon(
              Icons.home_filled,
              color: ColorsManager.primaryColor,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.category_outlined, color: Colors.blueGrey),
            activeItem: Icon(Icons.category, color: ColorsManager.primaryColor),
            itemLabel: 'Packs',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_outlined, color: Colors.blueGrey),
            activeItem: Icon(Icons.person, color: ColorsManager.primaryColor),
            itemLabel: 'Profile',
          ),
        ],
        onTap: (index) {
          _onTap(context, index);
        },
        kIconSize: 20,
        kBottomRadius: 10,
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) async {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.

    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
