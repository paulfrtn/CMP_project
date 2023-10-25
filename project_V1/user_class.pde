class User {
  int user_id;
  String first_name;
  String last_name;
  String email;
  String pseudo;
  String password;
  int age;
  String address;
  String phone_num;
  PImage profile_pic;
  
  User(int user_id, String first_name, String last_name, String email,String pseudo, String password ,int age, String address, String phone_num) {
    this.user_id = user_id;
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.pseudo=pseudo;
    this.password=password;
    this.age = age;
    this.address = address;
    this.phone_num = phone_num;
    this.profile_pic = loadImage("images/default_pp.png");
    profile_pic.resize(100,100);
  }
  void display(float x, float y){
      textSize(14);
      fill(0);
      text("first name:"+first_name,x,y);
      text("last name :"+last_name,x,y+20);
      text("age:"+age,x,y+40);
      profile_pic.resize(100,100);
      image(profile_pic,x+200,y);
  }

}
