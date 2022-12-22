

class UserModel {
   String? ip_address;
   String? email;
   String? date;
   String? password;

  UserModel( this.ip_address, this.email, this.date, this.password);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "ip_address":ip_address??"",
      "email":email??"",
      "date":date??"",
      "password":password??"",
    };
    return map;
  }

  UserModel.fromMap(Map<String,dynamic> map){
    ip_address=map["ip_address"];
    email=map["email"];
    date=map ["date"];
    password= map["password"];
  }
}