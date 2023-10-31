//IMPORT LIBRARY
import processing.video.*;
import java.io.File;
import ddf.minim.*;
Minim minim;
AudioSample clickSound;

void setup() {
  size(480, 720);
  background(C3);
  //Load every images
  loadImages();
  //Load the json for the users and the restaurants 
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
  
  minim = new Minim(this);
  clickSound = minim.loadSample("click.wav"); 
}

void draw() {
  //First you can Sign In or Sign Up before using the app
  if(!logged_in){
    //Sign Up page
    if(page==0){
      background(C3);
      session();
    }
    //Sign In page
    if(page==1){
      background(C3);
      create_user_form(first_name,last_name, new_pseudo,new_password,email,age,adress,phone_num,profile_pic);
    }
    //Take a picture for you new account
    if(page==2){
      picture_s1=true;
      if (photoTaken) {
        background(C3);
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
  //The app once the user is logged in
  if(logged_in)
  {
    //Load every restaurant in the Json
    load_restaurants(restaurants);
    //Menu or weather app first
    if (weatherapp) {
      weather();
    }else {
      menu();
    }
  }
}

//For writing the user id and password
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
