JSONArray users;
JSONArray restaurants;
JSONArray API_rest;

boolean add_rest = false;
boolean enter_session_pseudo = false;
boolean enter_session_password = false;
boolean logged_in = false;
boolean login =false;
boolean creating=false;
boolean creation=false;
boolean enter_pseudo = false;
boolean enter_password = false;
boolean enter_first_name=false;
boolean enter_last_name=false;
boolean enter_email=false;
boolean enter_age=false;
boolean enter_adress=false;
boolean enter_phone_num=false;
boolean enter_profile_pic=false;

int page=0;

String session_pseudo = "";
String session_password = "";
String first_name = "";
String last_name = "";
String email="";
String new_pseudo="";
String new_password="";
int age;
String adress = "";
String phone_num="";
PImage profile_pic;

Restaurant[] restaurants_array;
User[] users_array;
User current_user;

void setup() {
  size(480, 720);
  background(#2a9d8f);
  users = loadJSONArray("Json/users.json");
  File file = new File(sketchPath("Json/restaurants.json"));
  if (file.exists()) {
    restaurants = loadJSONArray("Json/restaurants.json");
    println("Fichier JSON existant chargé : restaurants.json");
  } else {
    restaurants = new JSONArray();
    saveJSONArray(restaurants, "Json/restaurants.json");
    println("Nouveau fichier JSON créé : restaurants.json");
  }
  API_rest = loadJSONArray("Json/API.json");
}

void draw() {
  background(#2a9d8f);
   if(page==0){
    session();
  }
  
  if(page==1){
    create_user_form(first_name,last_name, new_pseudo,new_password,email,age,adress,phone_num,profile_pic);
  }
}

void keyPressed() {
  if (!logged_in) {
    if (enter_session_pseudo) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        session_pseudo += key;
      } else if (key == BACKSPACE && session_pseudo.length() > 0) {
        session_pseudo = session_pseudo.substring(0,session_pseudo.length() - 1);
      }
    }
    if (enter_session_password) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        session_password += key;
      } else if (key == BACKSPACE && session_password.length() > 0) {
        session_password = session_password.substring(0, session_password.length() - 1);
      }
    }
    if (enter_first_name) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        first_name += key;
      } else if (key == BACKSPACE && first_name.length() > 0) {
        first_name = first_name.substring(0, first_name.length() - 1);
      }
    }
    if (enter_last_name) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        last_name += key;
      } else if (key == BACKSPACE && last_name.length() > 0) {
        last_name = last_name.substring(0, last_name.length() - 1);
      }
    }
     if (enter_pseudo) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        new_pseudo += key;
      } else if (key == BACKSPACE && new_pseudo.length() > 0) {
        new_pseudo = new_pseudo.substring(0, new_pseudo.length() - 1);
      }
    }
    if (enter_password) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        new_password += key;
      } else if (key == BACKSPACE && new_pseudo.length() > 0) {
        new_password = new_password.substring(0, new_password.length() - 1);
      }
    }
    if (enter_email) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        email += key;
      } else if (key == BACKSPACE && email.length() > 0) {
        email = email.substring(0, email.length() - 1);
      }
    }
    if (enter_age) {
    if (key >= '0' && key <= '9') {
      age = age * 10 + (key - '0');
    } else if (key == BACKSPACE && age > 0) {
      age = age / 10;
    }
  }
   if (enter_adress) {
      if (key >= '0' && key <= '9' || key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z'|| key==' ') {
        adress += key;
      } else if (key == BACKSPACE && adress.length() > 0) {
        adress = adress.substring(0, adress.length() - 1);
      }
    }
    if (enter_phone_num) {
      if (key >= '0' && key <= '9' || key=='+' || key==' ') {
        phone_num += key;
      } else if (key == BACKSPACE && phone_num.length() > 0) {
        phone_num = phone_num.substring(0, phone_num.length() - 1);
      }
    }
  }
}


void mousePressed() {
  if (mouseButton == LEFT && ((mouseX >= 100 && mouseX <= 400) && (mouseY >= 300 && mouseY < 330)) && page==0) {
    enter_session_pseudo = true;
    enter_session_password = false;
  }
  if (mouseButton == LEFT && ((mouseX >= 100 && mouseX <= 400) && (mouseY >= 400 && mouseY < 430)) && page==0) {
    enter_session_pseudo = false;
    enter_session_password = true;
  }
  if(mouseButton == LEFT && isMouseOverSignUp()){
    login = true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<130)&&(mouseY>100 && mouseY<130)))
  {
    login=false;
    creating = true;
    page=1;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>600 && mouseY<650)))
  {
    creating=false;
    creation=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>100 && mouseY<130)))
  {
    enter_last_name=false;
    enter_password=false;
    enter_pseudo=false;
    enter_age=false;
    enter_email=false;
    enter_adress=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>150 && mouseY<180)))
  {
    enter_password=false;
    enter_pseudo=false;
    enter_age=false;
    enter_email=false;
    enter_adress=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>200 && mouseY<230)))
  {
    enter_password=false;
    enter_age=false;
    enter_email=false;
    enter_adress=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=false;
    enter_pseudo=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>250 && mouseY<280)))
  {
    enter_age=false;
    enter_email=false;
    enter_adress=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=false;
    enter_pseudo=false;
    enter_password=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>300 && mouseY<330)))
  {
    enter_password=false;
    enter_age=false;
    enter_adress=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=false;
    enter_pseudo=false;
    enter_email=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>350 && mouseY<380)))
  {
    enter_password=false;
    enter_email=false;
    enter_adress=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=false;
    enter_pseudo=false;
    enter_age=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>400 && mouseY<430)))
  {
    enter_password=false;
    enter_email=false;
    enter_phone_num=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=false;
    enter_pseudo=false;
    enter_age=false;
    enter_adress=true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>450 && mouseY<480)))
  {
    enter_password=false;
    enter_email=false;
    enter_profile_pic=false;
    enter_first_name=false;
    enter_last_name=false;
    enter_pseudo=false;
    enter_age=false;
    enter_adress=false;
    enter_phone_num=true;
  }
  
  
}
