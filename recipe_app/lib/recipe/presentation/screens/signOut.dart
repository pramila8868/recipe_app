import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/loginStorageService.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleCubit.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';

class SignOut extends StatelessWidget {
  LoginStorageService _delete = LoginStorageService();
  SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Align(
              alignment: Alignment.center,
              child: BlocBuilder<GoogleSignInCubit, GoogleSignInState>(
                builder: (context, state) {
                  return InkWell(
                      onTap: () async {
                        await BlocProvider.of<GoogleSignInCubit>(context)
                            .dicontinue();
                        //   _delete.deleteLoginToken();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (Route route) => false);
                      },
                      child: const Icon(Icons.logout_outlined));
                },
              )),
        ],
      ),
    ));
  }
}
