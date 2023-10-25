float rectWidth = 100;
float rectHeight = 40;
float posX = 200;
float posY = 500;
color normalColor = #0077b6;
color hoverColor = #90e0ef;

void load_users(JSONArray users) {
  if (users != null) {
    // Initialiser le tableau des utilisateurs avec la taille du JSON
    users_array = new User[users.size()];

    for (int i = 0; i < users.size(); i++) {
      JSONObject userJSON = users.getJSONObject(i);
      int user_id = userJSON.getInt("user_id");
      String first_name = userJSON.getString("first_name");
      String last_name = userJSON.getString("last_name");
      String email = userJSON.getString("email");
      String pseudo = userJSON.getString("pseudo");
      String password = userJSON.getString("password");
      int age = userJSON.getInt("age");
      String address = userJSON.getString("address");
      String phone_num = userJSON.getString("phone_num");

      users_array[i] = new User(user_id, first_name, last_name, email, pseudo, password, age, address, phone_num);
    }
  } else {
    println("Aucun utilisateur trouvé.");
  }
}

void connexion_form(String pseudo, String password) {
  textSize(20);
  fill(0);
  text("Connexion", 200, 250);
  noFill();
  stroke(255);
  strokeWeight(1);
  if (!enter_session_pseudo && pseudo.length() == 0) {
    noFill();
    rect(100, 300, 300, 30);
    fill(255);
    textSize(16);
    text("Enter your pseudo", 110, 320);
  }
  if (enter_session_pseudo) {
    fill(#a3b18a);
    rect(100, 300, 300, 30);
    textSize(16);
    fill(0);
    text(pseudo, 110, 320);
  }
  if (!enter_session_password && password.length() == 0) {
    noFill();
    rect(100, 400, 300, 30);
    textSize(16);
    fill(255);
    text("Enter your password", 110, 420);
  }
  if (enter_session_password) {
    fill(#588157);
    rect(100, 400, 300, 30);
    textSize(16);
    fill(0);
    for (int i = 0; i < password.length(); i++) {
      text("*", 110 + i * 10, 425);
    }
  }
  if (!enter_session_password && password.length() > 0) {
    fill(#3a86ff);
    rect(100, 400, 300, 30);
    textSize(16);
    fill(0);
    for (int i = 0; i < password.length(); i++) {
      text("*", 110 + i * 10, 425);
    }
  }
  if (!enter_session_pseudo && pseudo.length() > 0) {
    fill(#3a86ff);
    rect(100, 300, 300, 30);
    textSize(16);
    fill(0);
    text(pseudo, 110, 320);
  }
  if (isMouseOverSignUp()) {
    rectWidth = lerp(rectWidth, 110, 0.2);
    rectHeight = lerp(rectHeight, 50, 0.2);
    posX = lerp(posX, 195, 0.2);
    posY = lerp(posY, 495, 0.2);
    fill(hoverColor);
  } else {
    rectWidth = lerp(rectWidth, 100, 0.2);
    rectHeight = lerp(rectHeight, 40, 0.2);
    posX = lerp(posX, 200, 0.2);
    posY = lerp(posY, 500, 0.2);
    fill(normalColor);
  }
  rect(posX, posY, rectWidth, rectHeight);
  fill(0);
  text("Sign up", 225, 525);
}

boolean isMouseOverSignUp() {
  return mouseX > 200 && mouseX < 200 + rectWidth && mouseY > 500 && mouseY < 500 + rectHeight;
}

void session() {
  if (!logged_in) {
    fill(0);
    rect(100, 100, 30, 30);
    connexion_form(session_pseudo, session_password);
  } else {
    current_user.display(100, 350);
  }
  if (login) {
    for (int i = 0; i < users_array.length; i++) {
      if (session_pseudo.equals(users_array[i].pseudo)) {
        if (session_password.equals(users_array[i].password)) {
          current_user = new User(users_array[i].user_id,
            users_array[i].first_name,
            users_array[i].last_name,
            users_array[i].email,
            users_array[i].pseudo,
            users_array[i].password,
            users_array[i].age,
            users_array[i].address,
            users_array[i].phone_num);
          logged_in = true;
        }
      } else {
      }
    }
    login = false;
  }
}

void create_user_form(String firstname, String lastname, String Pseudo, String PassWord, String mail, int age, String Adress, String phone_number,PImage profile_pic) {

    textSize(20);
    fill(0);
    noFill();
    stroke(255);
    strokeWeight(1);
    
    if(creating){
    
    
    if (!enter_first_name && firstname.length() == 0) {
      noFill();
      rect(100, 100, 300, 30);
      fill(255);
      textSize(16);
      text("Enter your first name", 110, 120);
    }
    if (!enter_first_name && firstname.length() > 0) {
      fill(#3a86ff);
      rect(100, 100, 300, 30);
      fill(255);
      textSize(16);
      text(firstname, 110, 120);
    }
    if (enter_first_name) {
      fill(#a3b18a);
      rect(100, 100, 300, 30);
      fill(255);
      textSize(16);
      text(firstname, 110, 120);
    }
    
    
    if (!enter_last_name && lastname.length() == 0) {
      noFill();
      rect(100, 150, 300, 30);
      textSize(16);
      fill(255);
      text("Enter your last name", 110, 170);
    }
    if (!enter_last_name && lastname.length() > 0) {
      fill(#3a86ff);
      rect(100, 150, 300, 30);
      textSize(16);
      fill(255);
      text(lastname, 110, 170);
    }
    if (enter_last_name) {
      fill(#a3b18a);
      rect(100, 150, 300, 30);
      textSize(16);
      fill(255);
      text(lastname, 110, 170);
    }
    
    
    if (!enter_pseudo && Pseudo.length() == 0) {
      noFill();
      rect(100, 200, 300, 30);
      textSize(16);
      fill(255);
      text("Choose a pseudo", 110, 220);
    }
    if (!enter_pseudo && Pseudo.length() > 0) {
      fill(#3a86ff);
      rect(100, 200, 300, 30);
      textSize(16);
      fill(255);
      text(Pseudo, 110, 220);
    }
    if (enter_pseudo) {
      fill(#a3b18a);
      rect(100, 200, 300, 30);
      textSize(16);
      fill(255);
      text(Pseudo, 110, 220);
    }
    
    
    if (!enter_password && PassWord.length() == 0) {
      noFill();
      rect(100, 250, 300, 30);
      textSize(16);
      fill(255);
      text("Choose a password", 110, 270);
    }
    if (!enter_password && PassWord.length() > 0) {
      fill(#3a86ff);
      rect(100, 250, 300, 30);
      textSize(16);
      fill(255);
      text(PassWord, 110, 270);
    }
    if (enter_password) {
      fill(#a3b18a);
      rect(100, 250, 300, 30);
      textSize(16);
      fill(255);
      text(PassWord, 110, 270);
    }
    
    
    if (!enter_email && mail.length() == 0) {
      noFill();
      rect(100, 300, 300, 30);
      textSize(16);
      fill(255);
      text("Enter your mail", 110, 320);
    }
    if (!enter_email && mail.length() > 0) {
      fill(#3a86ff);
      rect(100, 300, 300, 30);
      textSize(16);
      fill(255);
      text(mail, 110, 320);
    }
    if (enter_email ) {
      fill(#a3b18a);
      rect(100, 300, 300, 30);
      textSize(16);
      fill(255);
      text(mail, 110, 320);
    }
    
    
    if (!enter_age && age == 0) {
      noFill();
      rect(100, 350, 300, 30);
      textSize(16);
      fill(255);
      text("Enter your age", 110, 370);
    }
    if (!enter_age && age > 0) {
      fill(#3a86ff);
      rect(100, 350, 300, 30);
      textSize(16);
      fill(255);
      text(age, 110, 370);
    }
    if (enter_age) {
      fill(#a3b18a);
      rect(100, 350, 300, 30);
      textSize(16);
      fill(255);
      text(age, 110, 370);
    }
    
    
    if (!enter_adress && Adress.length() == 0) {
      noFill();
      rect(100, 400, 300, 30);
      textSize(16);
      fill(255);
      text("Enter your adress", 110, 420);
    }
    if (!enter_adress && Adress.length() > 0) {
      fill(#3a86ff);
      rect(100, 400, 300, 30);
      textSize(16);
      fill(255);
      text(Adress, 110, 420);
    }
    if (enter_adress) {
      fill(#a3b18a);
      rect(100, 400, 300, 30);
      textSize(16);
      fill(255);
      text(Adress, 110, 420);
    }
    
    
    if (!enter_phone_num && phone_number.length() == 0) {
      noFill();
      rect(100, 450, 300, 30);
      textSize(16);
      fill(255);
      text("Enter your phone number", 110, 470);
    }
    if (!enter_phone_num && phone_number.length() > 0) {
      fill(#3a86ff);
      rect(100, 450, 300, 30);
      textSize(16);
      fill(255);
      text(phone_number, 110, 470);
    }
    if (enter_phone_num) {
      fill(#a3b18a);
      rect(100, 450, 300, 30);
      textSize(16);
      fill(255);
      text(phone_number, 110, 470);
    }
    
    
    fill(#3a86ff);
    rect(100,500,300,50);
    fill(255);
    text("Take a profile picture",170,530);
    profile_pic=loadImage("images/default_pp.png");
    
    fill(#3a86ff);
    rect(100,600,300,50);
    fill(255);
    text("Create your account",170,630);
    }
    
    if(creation){
       JSONObject newUserJSON = new JSONObject();
  newUserJSON.setInt("user_id", generate_user_id()); // Remplacez generateUserID() par une fonction qui génère un nouvel ID utilisateur unique
newUserJSON.setString("first_name", first_name);
newUserJSON.setString("last_name", last_name);
newUserJSON.setString("pseudo", new_pseudo);
newUserJSON.setString("password", new_password);
newUserJSON.setInt("age", age);
newUserJSON.setString("email", email);
newUserJSON.setString("address", adress);
newUserJSON.setString("phone_num", phone_num);
newUserJSON.setString("profile_pic","Json/default_pp.jpg");

users.setJSONObject(users.size(), newUserJSON);
saveJSONArray(users, "Json/users.json");
load_users(users);
page=0;
creation = false;
    }
}

int generate_user_id(){
    String[] numbers = loadStrings("Json/id.txt");
    int number = 0;
    if (numbers.length > 0) {
        number = int(numbers[0]);
    }
    number++;
    
    String[] updatedNumber = { str(number) };
    saveStrings("Json/id.txt", updatedNumber);
    
    return number;
}














