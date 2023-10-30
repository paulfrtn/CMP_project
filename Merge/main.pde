import processing.video.*;
import java.io.File;
import ddf.minim.*;
Minim minim;
AudioSample clickSound;

void setup() {
  size(480, 720);
  background(C3);
  users = loadJSONArray("Json/users.json");
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
  pp_icon=loadImage("images/pp_icon.png");
  save_icon=loadImage("images/save_icon.png");
  discard_icon=loadImage("images/discard_icon.png");
  pp_icon.resize(30,30);
  save_icon.resize(30,30);
  discard_icon.resize(30,30);
  
  minim = new Minim(this);
  clickSound = minim.loadSample("click.wav"); 
  
  HomeIn = loadImage("images/HomeIn.png");
  HomeOut = loadImage("images/HomeOut.png");
  SunImg = loadImage("images/sun.png");
  MoonImg = loadImage("images/moon.png");
  CloudImg = loadImage("images/cloud.png");
  RainImg = loadImage("images/rain.png");
  WeatherIn = loadImage("images/WeatherIn.png");
  WeatherOut = loadImage("images/WeatherOut.png");
}

void draw() {
  if(!logged_in){
    if(page==0){
     background(#2a9d8f);
    session();
  }
  if(page==1){
    background(#2a9d8f);
    create_user_form(first_name,last_name, new_pseudo,new_password,email,age,adress,phone_num,profile_pic);
  }
  if(page==2){
    picture_s1=true;
    if (photoTaken) {
      background(#2a9d8f);
      image(capturedImage, 0, 0);
      textSize(32);
      fill(0);
      text("Press 'Y' to save or 'N' to discard", 50, 50);
      if(take_picture){
        fill(255);
        drawButtons();
      }
    } 
    else if (cameraActive && video.available()) {
      video.read();
      image(video, 0, 0);
      fill(255);
      noStroke();
      if(!take_picture){
        drawCameraButton();
      }
    }
  }
  }
  if(logged_in)
  {
    load_restaurants(restaurants);
    if (weatherapp) {
      weather();
    }else {
      menu();
    }
  }
}
void drawButtons() {
  rect(520,675,50,50,20);
  rect(600,675,50,50,20);
}

void drawCameraButton() {
  
  rect(575,675,50,50,20);
  image(pp_icon,585,685);
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
    
    if(mouseButton == LEFT && ((mouseX>100 && mouseX<400)&&(mouseY>500 && mouseY<550))){
      page=2;
      picture_s1=true;
    }
  }
  if(page==2){
    profile_picture();
    if(mouseButton == LEFT && ((mouseX>575 && mouseX<625)&&(mouseY>675 && mouseY<725))){
        picture_s2=true;
        picture_s1=false;
        take_picture=true;
      }
  }
}
