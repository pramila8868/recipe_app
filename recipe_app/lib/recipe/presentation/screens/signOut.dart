import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/loginStorageService.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleCubit.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/authentication/presentation/loginCubit/loginCubit.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';

class SignOut extends StatelessWidget {
  final LoginStorageService _loginStorageService = LoginStorageService();
  LoginStorageService _delete = LoginStorageService();
  SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    _loginStorageService.deleteLoginToken("accessToken");
                    context.read<GoogleSignInCubit>().dicontinue();
                    print("Logout");

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Icon(Icons.logout_outlined))
             
              ),
        ],
      ),
    ));
  }
}
