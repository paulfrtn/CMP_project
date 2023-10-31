import processing.video.*;
import java.io.File;
import ddf.minim.*;
Minim minim;
AudioSample clickSound;

void setup() {
  size(480, 720);
  background(C3);
  loadImages();
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
  if(!logged_in){
    if(page==0){
      background(C3);
      session();
    }
    if(page==1){
      background(C3);
      create_user_form(first_name,last_name, new_pseudo,new_password,email,age,adress,phone_num,profile_pic);
    }
    if(page==2){
      if (photoTaken) {
        background(#2a9d8f);
        image(capturedImage, 0, 0);
        textSize(32);
        fill(0);
        text("Press 'Y' to save or 'N' to discard", 50, 50);
      } 
      else if (cameraActive && video.available()) {
        video.read();
        image(video, 0, 0);
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
