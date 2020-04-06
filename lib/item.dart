class Item{
  int _id;
  String _title;
  String _username;
  String _password;
  String _description;
  bool  _isVisible;

  Item(this._id, this._title, this._username, this._password, this._description, this._isVisible);

  // setter
  set id(int id){
    this._id = id;
  }
  set title(String title){
    this._title = title;
  }
  set username(String username){
    this._username = username;
  }
  set password(String password){
    this._password = password;
  }
  set description(String description){
    this._description = description;
  }

  set isVisible(bool isVisible){
    this._isVisible = isVisible;
  }

  // getter
  int get id => this._id;
  String get title => this._title;
  String get username => this._username;
  String get password => this._password;
  String get description => this._description;
  bool get isVisible => this._isVisible;
}