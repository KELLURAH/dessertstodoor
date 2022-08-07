import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendors/core/utils/Colors.dart';

import '../../../../../core/components/widgetFunctions.dart';

class WithdrawalStepper extends StatefulWidget {
  const WithdrawalStepper({Key? key}) : super(key: key);

  @override
  State<WithdrawalStepper> createState() => _WithdrawalStepperState();
}

class _WithdrawalStepperState extends State<WithdrawalStepper> {
  int currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  onTapped(int step) {
    setState(() => currentStep = step);
  }

  onContinued() {
    currentStep < 2
        ? setState(() {
            currentStep += 1;
            isDone = true;
          })
        : null;
  }

  onCancel() {
    currentStep > 0 ? setState(() => currentStep -= 1) : null;
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  bool isDone = false;

  @override
  // OrientationBuilder(
  //           builder: (context, orientation) {
  //             switch (orientation) {
  //               case Orientation.portrait:
  //                 return buildStepper(StepperType.vertical);
  //               case Orientation.landscape:
  //                 return buildStepper(StepperType.horizontal);
  //               default:
  //                 throw UnimplementedError(orientation.toString());
  //             }
  //           },
  //         ),
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.portrait:
            return buildStepper(StepperType.vertical);
          case Orientation.landscape:
            return buildStepper(StepperType.horizontal);
          default:
            throw UnimplementedError(orientation.toString());
        }
      },
      // child: Container(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Expanded(
      //         child: Stepper(
      //           type: stepperType,
      //           physics: const BouncingScrollPhysics(),
      //           currentStep: currentStep,
      //           onStepTapped: (step) => onTapped(step),
      //           onStepContinue: onContinued,
      //           onStepCancel: onCancel,
      //           steps: [
      //             Step(
      //               title: const Text('Account'),
      //               content: Column(
      //                 children: <Widget>[
      //                   TextFormField(
      //                     decoration:
      //                         const InputDecoration(labelText: 'Email Address'),
      //                   ),
      //                   TextFormField(
      //                     decoration:
      //                         const InputDecoration(labelText: 'Password'),
      //                   ),
      //                 ],
      //               ),
      //               isActive: currentStep >= 0,
      //               state: currentStep >= 0
      //                   ? StepState.complete
      //                   : StepState.disabled,
      //             ),
      //             Step(
      //               title: const Text('Address'),
      //               content: Column(
      //                 children: <Widget>[
      //                   TextFormField(
      //                     decoration:
      //                         const InputDecoration(labelText: 'Home Address'),
      //                   ),
      //                   TextFormField(
      //                     decoration:
      //                         const InputDecoration(labelText: 'Postcode'),
      //                   ),
      //                 ],
      //               ),
      //               isActive: currentStep >= 0,
      //               state: currentStep >= 1
      //                   ? StepState.complete
      //                   : StepState.disabled,
      //             ),
      //             Step(
      //               title: const Text('Mobile Number'),
      //               content: Column(
      //                 children: <Widget>[
      //                   TextFormField(
      //                     decoration:
      //                         const InputDecoration(labelText: 'Mobile Number'),
      //                   ),
      //                 ],
      //               ),
      //               isActive: currentStep >= 0,
      //               state: currentStep >= 2
      //                   ? StepState.complete
      //                   : StepState.disabled,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Stepper buildStepper(StepperType type) {
    final size = MediaQuery.of(context).size;
    return Stepper(
      elevation: 1.5,
      type: stepperType,
      physics: const BouncingScrollPhysics(),
      currentStep: currentStep,
      onStepTapped: (step) => onTapped(step),
      onStepContinue: onContinued,
      onStepCancel: onCancel,
      steps: <Step>[
        Step(
          title: subTextRaleway(
            'Account Information',
            fontWeight: FontWeight.w600,
          ),
          content: Card(
            elevation: .25,
            color: PRIMARY_COLOR,
            child: Container(
              height: size.height * 0.225,
              decoration: BoxDecoration(
                color: PRIMARY_COLOR.withOpacity(0.15),
              ),
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
          isActive: currentStep >= 0,
          state: currentStep >= 1
              ? StepState.complete
              : (!isDone)
                  ? StepState.disabled
                  : StepState.editing,
        ),
        Step(
          title: subTextRaleway(
            'Amount to Withdraw',
            fontWeight: FontWeight.w600,
          ),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount in GH¢'),
              ),
            ],
          ),
          isActive: currentStep >= 0,
          state: currentStep >= 2 ? StepState.complete : StepState.editing,
        ),
        Step(
          title: subTextRaleway('Payment Method', fontWeight: FontWeight.w600),
          content: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.credit_card_rounded),
                title: subText('Add Credit/Debit Card'),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/momo.jpeg',
                  height: 35,
                ),
                title: subText('Withdraw using MOMO', fontSize: 15),
              ),
            ],
          ),
          isActive: currentStep >= 0,
          state: currentStep >= 3 ? StepState.complete : StepState.editing,
        ),
        Step(
          title: subTextRaleway('Mobile Number', fontWeight: FontWeight.w600),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
            ],
          ),
          isActive: currentStep >= 0,
          state: currentStep >= 4 ? StepState.complete : StepState.editing,
        ),
      ],
    );
  }

  Step buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    Widget? content,
  }) {
    return Step(
      title: title,
      subtitle: subTextRaleway('Subtitle', fontWeight: FontWeight.w400),
      state: state,
      isActive: isActive,
      content: content ??
          LimitedBox(
            maxWidth: 300,
            maxHeight: 300,
            child: Container(color: CupertinoColors.systemGrey),
          ),
    );
  }
}
