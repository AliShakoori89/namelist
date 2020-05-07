class Person{
  int id;
  String name;
  String lastname;
  String email;
  String phonenumber;
  String nationalcode;
  static const String TABLENAME = "my_table";

  Person({this.id,this.name,this.lastname,this.email,this.phonenumber, this.nationalcode});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nationalcode': nationalcode , 'name': name, 'lastname': lastname, 'email': email, 'phonenumber': phonenumber};
  }

  Person.Map(dynamic Person){
    this.id = Person['id'];
    this.nationalcode = Person['nationalcode'];
    this.name =Person['name'];
    this.lastname = Person['lastname'];
    this.email = Person['email'];
    this.phonenumber = Person['phonenumber'];
  }

  Person.MaptoObject(Map<String,dynamic> map){
    id = map['_id'];
    nationalcode = map['nationalcode'];
    name = map['name'];
    lastname = map['lastname'];
    email=map['email'];
    phonenumber = map['phonenumber'];
  }


//  int get _id => id;
//  String get _name => name;
//  String get _lastname => lastname;
//  String get _email => email;
//  String get _phonenumber => phonenumber;
//
//
//  set id(int value) {
//      _id = value;
//  }

//  Map<String,dynamic> toMap(){
//    var map = new Map<String,dynamic>();
//    map['_id'] = this._id;
//    map['name'] = this._name;
//    map['lastname'] = this._lastname;
//    map['email'] = this._email;
//    map['phonenumber'] = this._phonenumber;
//
//    if (_id!=null){
//      map['_id'] = this._id;
//    }
//    return map;
//  }
}