import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exception/bank_controller_exception.dart';
import 'models/account.dart';

//teremos nossa função main. Nela executaremos os códigos de nosso projeto.

void testingNullSafety() {
  Account? myAccount =
      Account(name: 'Layssa', balance: 200, isAuthenticated: true);

  //Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }
  // if (myAccount != null) {
  //   print(myAccount.balance);
  // } else {
  //   print("Conta Nula");
  // }

  print(myAccount != null ? myAccount.balance : "Conta Nula");

  print(myAccount?.balance);
}

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account: Account(
          name: "Ricarth Lima", balance: -10000, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 700);

    if (result) {
      print("Transação concluída com sucesso");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID ${e.idSender} do remente não é um Id válido");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O ID ${e.idReceiver} do destinatário não é um Id válido");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário remente de ID '${e.idSender}' não esta autenticado");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print(
        "O usuário de Id '${e.idSender}' tentou enviar ${e.amount} sendo que na sua conta tem possui '${e.senderBalance}'");
  } on Exception {
    print("Algo deu errado");
  }
}

//SIMULAÇÃO DE ERRO --------------------------------------------------------
// void main() {
//   double amount = double.parse("25,33"); //isso gera o erro "FormatException"
//   recursiveFunc(1);
// }

// recursiveFunc(int count) {
//   print(count);
//   recursiveFunc(count + 1);
// } //isso gerar o erro Stack Overflow, porém, antes ele vai ate 21895 (seu limite de excecução)

//PILHA DE EXECUÇÃO ----------------------------------------------------
// void main() {
//   print("Start Main");
//   functionOne();
//   print("Finished Main");
// }

// void functionOne() {
//   print("Start F01");
//   functionTwo();
//   print("Finished F01");
// }

// void functionTwo() {
//   print("Start F02");
//   for (int i = 1; i <= 5; i++) {
//     print(i);
//     double amount = double.parse("Not a number");
//   }
//   print("Finished F02");
// }

// import "dart:math";

// void main() {
//   print(bhaskara(1, "-8", 12));
// }

// Set<double> bhaskara(a, b, c) {
//   double delta = calcularDelta(a, b, c);
//   double resultado1 = ((b * -1) + delta) / (2 * a);
//   double resultado2 = ((b * -1) - delta) / (2 * a);
//   return [resultado1, resultado2].toSet();
// }

// calcularDelta(a, b, c) {
//   double resultado = b * b;
//   resultado = resultado - (4 * a * c);
//   resultado = pow(resultado, (1 / 2)).toDouble();
//   return resultado;
// }

// Exceções com o Try-on -------------------------------

// void main() {
//   print("Start Main");
//   functionOne();
//   print("Finished Main");
// }

// void functionOne() {
//   print("Start F01");
//   functionTwo();
//   print("Finished F01");
// }

// void functionTwo() {
//   print("Start F02");
//   for (int i = 1; i <= 5; i++) {
//     print(i);
//     try {
//       double amount = double.parse("Not a number");
//     }on FormatException {
//       print("A conversão não pode ser feita");
//     }
//   }
//   print("Finished F02");
// }

// outra forma de realizar o Try-on --------------------------
// void main() {
//   print("Start Main");
//   functionOne();
//   print("Finished Main");
// }

// void functionOne() {
//   print("Start F01");
//   try {
//     functionTwo();
//   } on FormatException {
//     print("Foi capturada dentro da FunctionOne");
//   }
//   print("Finished F01");
// }

// void functionTwo() {
//   print("Start F02");
//   for (int i = 1; i <= 5; i++) {
//     print(i);
//     double amount = double.parse("Not a number");
//   }
//   print("Finished F02");
// }

//  Catch -------------------------------
// void main() {
//   print("Start Main");
//   functionOne();
//   print("Finished Main");
// }

// void functionOne() {
//   print("Start F01");
//   try {
//     functionTwo();
//   } on FormatException catch (e) {
//     print("Foi capturada dentro da FunctionOne");
//     print(e.message);
//     print(e.source);
//     print(e.toString());
//   }
//   print("Finished F01");
// }

// void functionTwo() {
//   print("Start F02");
//   for (int i = 1; i <= 5; i++) {
//     print(i);
//     double amount = double.parse("Not a number");
//   }
//   print("Finished F02");
// }

// void main() {
//   print("Start Main");
//   functionOne();
//   print("Finished Main");
// }

// void functionOne() {
//   print("Start F01");
//   try {
//     functionTwo();
//   } catch (exception, stackTrace) {
//     print(exception);
//     print(stackTrace.toString());
//     // print(exception.runtimeType);
//   } finally {
//     print("Chegou no finally");
//   }
//   print("Finished F01");
// }

// void functionTwo() {
//   print("Start F02");
//   for (int i = 1; i <= 5; i++) {
//     print(i);
//     double amount = double.parse("Not a number");
//   }
//   print("Finished F02");
// }


