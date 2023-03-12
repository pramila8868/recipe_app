// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import '../../data/onboarding/onboarding_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../splash_screen/const.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: BlocBuilder<OnboardingCubit, int>(
//       builder: (context, state) {
//         return IntroductionScreen(
//           onChange: (index) => context.read<OnboardingCubit>().next(),
//          // pages: pages,
//           onDone: () => Navigator.of(context).pop(),
//           // onSkip: () => Navigator.of(context).pop(),
//           showSkipButton: true,
//           showNextButton: false,

//           skip: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.06.h,
//               width: MediaQuery.of(context).size.width * 0.3.w,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(237, 0, 0, 0),
//                   borderRadius: BorderRadius.circular(10)),
//               child: MaterialButton(
//                   onPressed: () {},
//                   child: Row(
//                     children: const [
//                       Text(
//                         "SKIP",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                     ],
//                   )),
//             ),
//           ),
//           //  const Text('Skip'),
//           //  next: const Icon(Icons.arrow_forward),
//           done:
//               const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
//           dotsDecorator: DotsDecorator(
//             activeColor: Theme.of(context).accentColor,
//             size: const Size.square(10.0),
//             activeSize: const Size(20.0, 10.0),
//             activeShape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0)),
//           ),
//         );
//       },
//     ));
//   }
// }

