import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/constants/assets_consts.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';
import 'package:moltaqa/features/auth/ui/widgets/login_widget.dart';
import 'package:moltaqa/features/auth/ui/widgets/signup_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    AssetsConsts.authAvatarr,
                    height: 0.35.sh,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsManager.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    child: TabBar(
                      labelStyle: TextStylesManager.titleMedium,
                      unselectedLabelStyle: TextStylesManager.titleMedium,
                      dividerHeight: 0,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: WidgetStateProperty.resolveWith<Color?>((
                        Set<WidgetState> states,
                      ) {
                        // Use the default focused overlay color
                        return states.contains(WidgetState.focused)
                            ? null
                            : Colors.transparent;
                      }),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,

                      indicator: BoxDecoration(
                        color: ColorsManager.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [Text("Sign in"), Text("Sign up")],
                    ),
                  ),
                  SizedBox(
                    height: 0.5.sh,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 0,
                      ),
                      child: TabBarView(
                        children: [LoginWidget(), SignupWidget()],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
