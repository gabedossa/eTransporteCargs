class UserLocal{
  String? user_id;
  String? user_nome;
  String? user_email;
  String? user_cargo;
  String? user_senha;
  String? user_confirmaSenha;

  UserLocal({
    this.user_id,
    this.user_nome,
    this.user_email,
    this.user_cargo, 
    this.user_senha,
    this.user_confirmaSenha,
  });

  Map<String, dynamic> toMap() {
    return<String, dynamic>{
      'id' : user_id,
      'nome' : user_nome,
      'email' : user_email,
      'cargo' : user_cargo,
      'senha' : user_senha,
      'confirmarSenha': user_confirmaSenha
    };
  }

  factory UserLocal.fromMap(Map<String, dynamic> map){
    return UserLocal(
      user_id: map['id'], 
      user_nome: map['nome'], 
      user_email: map['email'], 
      user_cargo: map['cargo'], 
      user_senha: map['senha'], 
      user_confirmaSenha: map['confirmaSenha']);
  }
}