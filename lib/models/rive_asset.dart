import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, src;
  late SMIBool? input;
  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> riveAnimations = [
  RiveAsset(
    "assets/rivassets/nothingfound.riv",
    artboard: "main",
    stateMachineName: "State Machine 1",
  ),
];
