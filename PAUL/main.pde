import processing.video.*;
import java.io.File;

/////////////////////////////////////////////
import ddf.minim.*;
Minim minim;
AudioSample clickSound;


boolean LOADING = true;
boolean MENU = true;
boolean menuOpen = false;
boolean VIEW_LIST = false;
boolean CREDITS = false;
boolean PROFILE = false;

boolean addRestaurantHover = false;
boolean viewListHover = false;

  
//Animation boutons
float buttonWidth1 = 280;
float buttonWidth2 = 280;
float buttonWidth3 = 280;
float buttonHeight1 = 60;
float buttonHeight2 = 60;
float buttonHeight3 = 60;
float enlargedButtonWidth = 300;
float enlargedButtonHeight = 70;
float animationSpeed = 0.5;
float textsize1 = 16;
float textsize2 = 16;
float textsize3 = 16;

//Animation rectangle
boolean animatingMenu = false;
int animationTimer = 0;
int animationSpeedRect = 5;

//Image
PImage arrowImage;

//Annimation Titre
int animatingTextIndex = 0;
boolean animatingText = false;
int lastFrame = 0;
float targetFrameRate = 10; 

/////////////////////////////////////////////
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
boolean cameraActive = false;
boolean photoTaken = false;
boolean one_use=false;

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

Capture video;
PImage capturedImage;
PImage profile_pic;

Restaurant[] restaurants_array;
User[] users_array;
User current_user;

//COLORS
int C1 = #f5e7cc; 
int C2 = #E28413; 
int C3 = #000022; 


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
  
  minim = new Minim(this);
  clickSound = minim.loadSample("click.wav"); 
}

void draw() {
  
  if(!logged_in)
  {
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
  
  ///////////////////////////
  if(logged_in)
  {
    if (animatingMenu) {
      if(menuOpen) {
        animationTimer += animationSpeedRect;
      } 
      if (animationTimer >= 100) {
        animationTimer = constrain(animationTimer, 0, 100); 
        animatingMenu = false;
      }
    }
    //MENU TOP RIGHT  
    if(MENU && menuOpen)
    {
      fill(C1);
      rect(width/2, height-30, map(animationTimer, 0, 100, 0, width), 60, 10);
      if(!animatingMenu)
      {
        if (mouseX > width - 100 && mouseX < width && mouseY > height-60 && mouseY < height)
        {
          fill(C3);
          textSize(20);
          text("CREDITS", 60, height-30);
          text("CLOSE", width/2, height-30);
          cursor(HAND);
          fill(C2);
          textSize(22);
          text("QUIT", width-60, height-30);
        }
        else if (mouseX > 30 && mouseX < 100 && mouseY > height-60 && mouseY < height)
        {
          fill(C3);
          textSize(20);
          text("QUIT", width-60, height-30);
          text("CLOSE", width/2, height-30);
          cursor(HAND);
          fill(C2);
          textSize(22);
          text("CREDITS", 60, height-30);
        }
        else if (mouseX > width/2-35 && mouseX < width/2+35 && mouseY > height-60 && mouseY < height)
        {
          fill(C3);
          textSize(20);
          text("CREDITS", 60, height-30);
          text("QUIT", width-60, height-30);
          cursor(HAND);
          fill(C2);
          textSize(22);
          text("CLOSE", width/2, height-30);
          
        }
        else
        {
          fill(C3);
          textSize(20);
          text("CREDITS", 60, height-30);
          text("QUIT", width-60, height-30);
          text("CLOSE", width/2, height-30);
          cursor(ARROW);
        } 
      }
      
    }
    else if(MENU)
    {
      if(LOADING)
      {
        background(C3);
        textAlign(CENTER, CENTER);
        if (!animatingText) {
            animatingText = true;
            animatingTextIndex = 0;
            lastFrame = millis();
        }
        fill(C1);
        textSize(48);
        int timePassed = millis() - lastFrame;
        if (timePassed >= 1000 / targetFrameRate) {
          animatingTextIndex++;
          lastFrame = millis();
        }      
        text("RASSOUL".substring(0, min(animatingTextIndex, 7)), width/2, 100);
        if(animatingTextIndex==7)
        {
          LOADING = false;
        }
      }
      //MENU
      else 
      {
        background(C3);
        //TOP
        fill(C1);
        textSize(48);
        text("RASSOUL", width/2, 100);
        fill(C1); 
        rectMode(CORNER);
       
        rect(width/2-30,height-60, 60, 60, 10); 
        
        rectMode(CENTER);
        if((mouseX > width/2-30 && mouseX < width/2+30 && mouseY < height && mouseY > height-60 && menuOpen == false) || (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 250 && mouseY < 310) || (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 350 && mouseY < 410) || ( mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 450 && mouseY < 510))
        {
          cursor(HAND);
        }
        else
        {
          cursor(ARROW);
        }
        
        // Add a Restaurant button
        if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 250 && mouseY < 310) {
          buttonWidth1 = lerp(buttonWidth1, enlargedButtonWidth, animationSpeed);
          buttonHeight1 = lerp(buttonHeight1, enlargedButtonHeight, animationSpeed);
          textsize1 = lerp(textsize1, 22, animationSpeed);
        } else {
          buttonWidth1 = lerp(buttonWidth1, 280, animationSpeed);
          buttonHeight1 = lerp(buttonHeight1, 60, animationSpeed);
          textsize1 = lerp(textsize1, 16, animationSpeed);
        }  
      
        // View Restaurant List button
        if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 350 && mouseY < 410) {
          buttonWidth2 = lerp(buttonWidth2, enlargedButtonWidth, animationSpeed);
          buttonHeight2 = lerp(buttonHeight2, enlargedButtonHeight, animationSpeed);
          textsize2 = lerp(textsize2, 22, animationSpeed);
        } else {
          buttonWidth2 = lerp(buttonWidth2, 280, animationSpeed);
          buttonHeight2 = lerp(buttonHeight2, 60, animationSpeed);
          textsize2 = lerp(textsize2, 16, animationSpeed);
        }
        
        // View Profile
        if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 450 && mouseY < 510) {
          buttonWidth3 = lerp(buttonWidth3, enlargedButtonWidth, animationSpeed);
          buttonHeight3 = lerp(buttonHeight3, enlargedButtonHeight, animationSpeed);
          textsize3 = lerp(textsize3, 22, animationSpeed);
        } else {
          buttonWidth3 = lerp(buttonWidth3, 280, animationSpeed);
          buttonHeight3 = lerp(buttonHeight3, 60, animationSpeed);
          textsize3 = lerp(textsize3, 16, animationSpeed);
        }
          
        // Draw buttons with animation
        fill(C1);
        noStroke(); 
        rectMode(CENTER);
        rect(width/2, 280, buttonWidth1, buttonHeight1, 10); // Add a Restaurant button
        rect(width/2, 380, buttonWidth2, buttonHeight2, 10); // View Restaurant List button
        rect(width/2, 480, buttonWidth3, buttonHeight3, 10); // Profile
      
        fill(C3);
        textSize(textsize1);
        text("Add a Restaurant", width/2, 280);
        textSize(textsize2);
        text("View Restaurant List", width/2, 380);
        textSize(textsize3);
        text("My profile", width/2, 480);
      }
    }
    //LISTE DE RESTAURANTS 
    else if (VIEW_LIST) {
      background(C3);
      textAlign(CENTER, CENTER);
      textSize(48);
      fill(C1);
      text("MY LIST", width/2, 50);

      cursor(ARROW);
    }
    //CREDITS
    else if (CREDITS) {
      background(C3);
      textAlign(CENTER, CENTER);
      textSize(48);
      fill(C1);
      text("CREDITS", width/2, 50);
      textSize(24);
      text("PAUL-ALEXANDRE FORTUNA", width/2, height/2-100);
      text("JULES PUGUET", width/2, height/2);
      text("FABIO OLIVEIRA", width/2, height/2 + 100);
    }
    //PROFILE
    else if (PROFILE) {
      background(C3);
      textAlign(CENTER, CENTER);
      textSize(48);
      fill(C1);
      text("PROFILE", width/2, 50);
      textSize(24);
      current_user.display();
    }
    
    //RETOUR 
    if(!MENU)
    {
      drawLeftArrow(30, height / 2, 15, 10);
      if (mouseX > 25 && mouseX < 45 && mouseY > height/2-15 && mouseY < height/2+15) 
      {
        cursor(HAND);
      }
      else if(CREDITS || PROFILE)
      {
        cursor(ARROW);
      }
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
