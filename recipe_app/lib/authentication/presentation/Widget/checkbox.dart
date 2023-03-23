import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/authentication/presentation/widget/constant.dart';
import 'package:recipe_app/data/checkbox/cubit/checkboxCubit.dart';
//import 'package:recipe_app/data/checkbox/cubit/checkbox_cubit.dart';

class CheckboxCustom extends StatelessWidget {
  
  const CheckboxCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxCubit, bool>(
      builder: (context, state) {
        return Checkbox(
          value: state,
          onChanged: (value) {
            BlocProvider.of<CheckboxCubit>(context).updateCheckbox();
            // context.read<CheckboxCubit>().updateCheckbox();
          },
          activeColor: btnColor,
          side: BorderSide(color: text1Color),
          
        );
        
      },
    );
  }
}
