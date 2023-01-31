// classe responsável por representar uma conta de banco dos clientes

class Account {
  String name;
  double balance; //saldo em conta
  bool isAuthenticated; //representa se o usuário está ou não autenticado
  DateTime? createdAt;

  Account({
    required this.name,
    required this.balance,
    required this.isAuthenticated,
    this.createdAt,
  })  : assert(name.isNotEmpty, "O nome não pode ser uma string vazia"),
        assert(balance >= 0, "o saldo não pode ser negativo");

  editBalance({required value}) {
    balance = balance + value;
  }
}
