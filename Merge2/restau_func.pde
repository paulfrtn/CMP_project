 void load_restaurants(JSONArray restaurants){
  if (restaurants != null) {
    // Inititalise the restaurant array with the json
    restaurants_array = new Restaurant[restaurants.size()];

    for (int i = 0; i < restaurants.size(); i++) {
      JSONObject restaurant = restaurants.getJSONObject(i);
      float id = restaurant.getFloat("id");
      String name = restaurant.getString("name");
      String address = restaurant.getString("address");
      float latitude = restaurant.getFloat("latitude");
      float longitude = restaurant.getFloat("longitude");
      int usersCount = restaurant.getInt("usersCount");
      int priceTier = restaurant.getInt("priceTier");
      float rating = restaurant.getFloat("rating");
      int indoor = restaurant.getInt("indoor");
      String type = restaurant.getString("type");
      restaurants_array[i] = new Restaurant(id, name, address, latitude, longitude, usersCount, priceTier, rating, indoor, type);
    }
  } else {
    println("No restaurant found");
  }
}

void add_restaurant(JSONArray restaurants, JSONArray API_rest) {
  JSONObject newRestaurant = null;
  
  if (restaurants == null) {
    restaurants = new JSONArray();
  }
  
  if (API_rest != null && API_rest.size() > 0) {
    JSONObject firstRestaurant = API_rest.getJSONObject(0);
    float id = firstRestaurant.getFloat("id");
    String name = firstRestaurant.getString("name");
    String address = firstRestaurant.getString("address");
    float latitude = firstRestaurant.getFloat("latitude");
    float longitude = firstRestaurant.getFloat("longitude");
    int usersCount = firstRestaurant.getInt("usersCount");
    int priceTier = firstRestaurant.getInt("priceTier");
    float rating = firstRestaurant.getFloat("rating");
    int indoor = firstRestaurant.getInt("indoor");
    String type = firstRestaurant.getString("type");

    newRestaurant = new JSONObject();
    newRestaurant.setFloat("id", id);
    newRestaurant.setString("name", name);
    newRestaurant.setString("address", address);
    newRestaurant.setFloat("latitude", latitude);
    newRestaurant.setFloat("longitude", longitude);
    newRestaurant.setInt("usersCount", usersCount);
    newRestaurant.setInt("priceTier", priceTier);
    newRestaurant.setFloat("rating", rating);
    newRestaurant.setInt("indoor", indoor);
    newRestaurant.setString("type", type);
    
  } else {
    println("Aucun restaurant trouvé dans API_rest.");
  }
  
  if (newRestaurant != null) {
    restaurants.append(newRestaurant);

    saveJSONArray(restaurants, "Json/restaurants.json");

    println("Restaurant ajouté et enregistré : " + newRestaurant.getString("name"));
  }
}

//Display the favorites restaurant of the user
void favoriteRestaurant(){
  boolean hand = false;
  background(C3);
  if(!toggle)
  {
    image(HomeOut, 20, 10, 30, 30);
    image(AddOut, 160, 10, 30, 30);
    image(FavIn, 300, 10, 30, 30);
    image(WeatherOut, 430, 10, 30, 30);
  }
  else
  {
    image(HomeOut2, 20, 10, 30, 30);
    image(AddOut2, 160, 10, 30, 30);
    image(FavIn2, 300, 10, 30, 30);
    image(WeatherOut2, 430, 10, 30, 30);
  }
  
  int numFav = favorites_array.length;
  println("numFav : ",numFav);
  FavRestaurant = new Restaurant[numFav];
  println("Taille : ",FavRestaurant.length);
  println("Taille2 : ",favorites_array.length);
  int Index = 0;
  for (int i = 0; i < restaurants_array.length; i++) {
    println("Index : ", Index);
    if (Index < favorites_array.length){
      println("ok",Index);
      if (restaurants_array[i].id == favorites_array[Index]) {
        FavRestaurant[Index] = restaurants_array[i];
        println(FavRestaurant[Index].name);
        Index++;
      }
    }
  }

   for(int k=0; k<FavRestaurant.length; k++){
    //println(FavRestaurant[k].name+"\n");
  }
  rectMode(CORNER);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(C1);
  text("MY LIST", width/2, 80);
  fill(C3);
  stroke(C1);
  textSize(textsize1);
  
  if(FavIndoor == 0){
    fill(C3);
    rect(75, 120, 150, 40, 10);
    fill(C1);
    text("LOCATION", 150, 140);
  }else if(FavIndoor == 1){
    fill(C1);
    rect(75, 120, 150, 40, 10);
    fill(C3);
    text("INDOOR", 150, 140);
  }else if(FavIndoor == 2){
    fill(C1);
    rect(75, 120, 150, 40, 10);
    fill(C3);
    text("OUTDOOR", 150, 140);
  }
  
  if(FavPrice == 0){
    fill(C3);
    rect(width-225, 120, 150, 40, 10);
    fill(C1);
    text("PRICE", width-150, 140);
  }else if(FavPrice == 1){
    fill(C1);
    rect(width-225, 120, 150, 40, 10);
    image(coin, width-160, 130, 20, 20);
  }else if(FavPrice == 2){
    fill(C1);
    rect(width-225, 120, 150, 40, 10);
    image(coin, width-145, 130, 20, 20);
    image(coin, width-175, 130, 20, 20);
  }else if(FavPrice == 3){
    fill(C1);
    rect(width-225, 120, 150, 40, 10);
    image(coin, width-130, 130, 20, 20);
    image(coin, width-160, 130, 20, 20);
    image(coin, width-190, 130, 20, 20);
  }
  
  if(FavRating == 0){
    fill(C3);
    rect(75, 170, 150, 40, 10);
    fill(C1);
    text("RATING", 150, 190);
  }else if(FavRating >= 1 && FavRating<2){
    fill(C1);
    rect(75, 170, 150, 40, 10);
    image(rating1, 100, 150, 100, 80);
  }else if(FavRating >= 2 && FavRating<3){
    fill(C1);
    rect(75, 170, 150, 40, 10);
    image(rating2, 100, 150, 100, 80);
  }else if(FavRating >= 3 && FavRating<4){
    fill(C1);
    rect(75, 170, 150, 40, 10);
    image(rating3, 100, 150, 100, 80);
  }else if(FavRating >= 4 && FavRating<5){
    fill(C1);
    rect(75, 170, 150, 40, 10);
    image(rating4, 100, 150, 100, 80);
  }else if(FavRating == 5){
    fill(C1);
    rect(75, 170, 150, 40, 10);
    image(rating5, 100, 150, 100, 80);
  }
  
  if(FavCategory == 0){
    fill(C3);
    rect(width-225, 170, 150, 40, 10);  
    fill(C1);
    text("CATEGORY", width-150, 190);
  }else if(FavCategory == 1){
    fill(C1);
    rect(width-225, 170, 150, 40, 10);  
    fill(C3);
    text("KOREAN", width-150, 190);
  }else if(FavCategory == 2){
    fill(C1);
    rect(width-225, 170, 150, 40, 10);  
    fill(C3); 
    text("ITALIAN", width-150, 190);
  }else if(FavCategory == 3){
    fill(C1);
    rect(width-225, 170, 150, 40, 10);  
    fill(C3); 
    text("FRENCH", width-150, 190);
  }else if(FavCategory == 4){
    fill(C1);
    rect(width-225, 170, 150, 40, 10);  
    fill(C3); 
    text("CHINESE", width-150, 190);
  }else if(FavCategory == 5){
    fill(C1);
    rect(width-225, 170, 150, 40, 10);  
    fill(C3);  
    text("JAPANESE",  width-150, 190);
  }
  
  clip(20, 220, 440, 480);
  textSize(16);
  textAlign(CENTER);
  int gap = 0;
  contentHeight = numFav * 60;
  translate(0, -scrollPosition);
  strokeWeight(3);
  for (int i = 0; i < FavRestaurant.length; i++) {
    if(FavIndoor == 0 && FavPrice == 0 && FavRating == 0 && FavCategory == 0){
      fill(C3);
      rect(30, 225+gap*90, 420, 80, 20);
      fill(C1);
      text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
      gap+=1;
    }else if(FavIndoor == 1){
      if(FavRestaurant[i].indoor == 1){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavIndoor == 2){
      if(FavRestaurant[i].indoor == 0){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }
    
    else if(FavPrice == 1){
      if(FavRestaurant[i].priceTier == 1){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavPrice == 2){
      if(FavRestaurant[i].priceTier == 2){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavPrice == 3){
      if(FavRestaurant[i].priceTier == 3){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }
    
    else if(FavRating == 1){
      if(FavRestaurant[i].rating >= 1 && FavRestaurant[i].rating < 2){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavRating == 2){
      if(FavRestaurant[i].rating >= 2 && FavRestaurant[i].rating < 3){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavRating == 3){
      if(FavRestaurant[i].rating >= 3 && FavRestaurant[i].rating < 4){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavRating == 4){
      if(FavRestaurant[i].rating >= 4 && FavRestaurant[i].rating < 5){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavRating == 5){
      if(FavRestaurant[i].rating == 5){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }
    
    else if(FavCategory == 1){
      if(FavRestaurant[i].type.equals("korean")){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavCategory == 2){
      if(FavRestaurant[i].type.equals("italian")){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavCategory == 3){
      if(FavRestaurant[i].type.equals("french")){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavCategory == 4){
      if(FavRestaurant[i].type.equals("chinese")){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }else if(FavCategory == 5){
      if(FavRestaurant[i].type.equals("japanese")){ 
        fill(C3);
        rect(30, 225+gap*90, 420, 80, 20);
        fill(C1);
        text(FavRestaurant[i].name+"\n"+FavRestaurant[i].rating+"\n"+FavRestaurant[i].address, 230, 255+gap*90);
        gap+=1;
      }
    }
  }
  strokeWeight(2);
  scrollPosition = int(lerp(scrollPosition, targetScrollPosition, 0.5));
  noClip(); 
  
  if((mouseX > 20 && mouseX < 40 && mouseY > 10 && mouseY < 40) || (mouseX >= 160 && mouseX <= 190 && mouseY >= 10 && mouseY <= 40) || (mouseX >= 300 && mouseX <= 330 && mouseY >= 10 && mouseY <= 40) || (mouseX >= 430 && mouseX <= 460 && mouseY >= 10 && mouseY <= 40))
  {
    hand = true;
  }
  
  if(hand)
  {
    cursor(HAND);
  }
  else
  {
    cursor(ARROW);
  }
}
