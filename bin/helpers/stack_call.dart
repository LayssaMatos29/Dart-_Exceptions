void stackStart() {
  print("Start Main");
  functionOne();
  print("Finished Main");
}

void functionOne() {
  print("Start F01");
  try {
    functionTwo();
  } catch (exception, stackTrace) {
    print(exception);
    print(stackTrace.toString());
    // print(exception.runtimeType);
  } finally {
    print("Chegou no finally");
  }
  print("Finished F01");
}

void functionTwo() {
  print("Start F02");
  for (int i = 1; i <= 5; i++) {
    print(i);
    double amount = double.parse("Not a number");
  }
  print("Finished F02");
}
