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
boolean isLoading = true;

int page=0;
float angle=0;


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
  loading();
  load_users(users);
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
  isLoading = false;
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
    session_pseudo = input_edit(session_pseudo, enter_session_pseudo);
    session_password = input_edit(session_password,enter_session_password);
    first_name = input_edit(first_name, enter_first_name);
    last_name = input_edit(last_name, enter_last_name);
    new_pseudo = input_edit(new_pseudo, enter_pseudo);
    new_password = input_edit(new_password, enter_password);
    email=input_edit(email,enter_email);
    age = input_edit_4int(age,enter_age);
    adress = input_edit(adress,enter_adress);
    phone_num = input_edit(phone_num,enter_phone_num);
  }
  if(key==' '){
    page=0;
  }
}


void mousePressed() {
  if(mouseButton == LEFT && isMouseOverSignUp()){
    login = true;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<130)&&(mouseY>100 && mouseY<130)))
  {
    login=false;
    creating = true;
    enter_session_pseudo = false;
    enter_session_password = false;
    page=1;
  }
  if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>600 && mouseY<650)))
  {
    creating=false;
    creation=true;
  }
  if(page==0){
    enter_session_pseudo = input_click_page1(100,400,300,330,enter_session_pseudo);
    enter_session_password = input_click_page1(100,400,400,430,enter_session_password);
  }
  if(page==1){
    enter_first_name = input_click_page1(100,400,100,130,enter_first_name);
    enter_last_name = input_click_page1(100,400,150,180,enter_last_name);
    enter_pseudo = input_click_page1(100,400,200,230,enter_pseudo);
    enter_password = input_click_page1(100,400,250,280,enter_password);
    enter_email = input_click_page1(100,400,300,330,enter_email);
    enter_age = input_click_page1(100,400,350,380,enter_age);
    enter_adress = input_click_page1(100,400,400,430,enter_adress);
    enter_phone_num = input_click_page1(100,400,450,480,enter_phone_num);  
  }
}


void loading(){
    float x = width / 2;
    float y = height / 2;
    float arcRadius = 50;
    float startAngle = radians(angle);
    float endAngle = radians(angle + 90); 
    
    noFill();
    stroke(#0a9396);
    strokeWeight(10);
    arc(x, y, arcRadius * 2, arcRadius * 2, startAngle, endAngle);
    
    textSize(36);
    fill(#0a9396);
    text("Loading...",width/2-70,height/2+100);
    angle += 4; 
}
