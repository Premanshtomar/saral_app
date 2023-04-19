import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saral_app/authentication/bloc/auth_cubit.dart';
import 'package:saral_app/utils/style/colors.dart';
import 'package:saral_app/utils/style/images.dart';
import 'package:saral_app/utils/style/text_styles.dart';

class GoogleSignInScreen extends StatelessWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: Card(
            shadowColor: AppColors.teal,
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.height * 0.2,
            ),
            elevation: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Hi There!!",
                    style: AppTextStyles.bodyText24BlackBold),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: MaterialButton(
                    color: Colors.teal[100],
                    elevation: 10,
                    onPressed: () async {
                      await cubit.onSignupClicked(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.08,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.google),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        const Text(
                          "Sign In with Google",
                          style: AppTextStyles.bodyText18BlackBold,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
