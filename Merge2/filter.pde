//Filter for adding a restaurant
void filtre()
{
  boolean hand = false;
  background(C3);
  if(!toggle)
  {
    image(HomeOut, 20, 10, 30, 30);
    image(AddIn, 160, 10, 30, 30);
    image(FavOut, 300, 10, 30, 30);
    image(WeatherOut, 430, 10, 30, 30);
  }
  else
  {
    image(HomeOut2, 20, 10, 30, 30);
    image(AddIn2, 160, 10, 30, 30);
    image(FavOut2, 300, 10, 30, 30);
    image(WeatherOut2, 430, 10, 30, 30);
  }
  

  //DESIGN
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(C1);
  text("FILTER", width/2, 70);
  
  rectMode(CENTER);
  
  if(mouseX > 75 && mouseX < 75+150 && mouseY > 120-20 && mouseY < 120+20 || location != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(150, 120, 150, 40, 10);
  if(mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 120-20 && mouseY < 120+20 || price != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(width-150, 120, 150, 40, 10);
  if(mouseX > 75 && mouseX < 75+150 && mouseY > 170-20 && mouseY < 170+20 || rating != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(150, 170, 150, 40, 10);
  if(mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 170-20 && mouseY < 170+20 || origin != 0){            
    stroke(C2);     
    strokeWeight(3);
  }
  else{
    noStroke();
  }
  rect(width-150, 170, 150, 40, 10);
  
  textSize(textsize1);
  fill(C3);
  //LOCATION
  if(location == 0)
  {
    text("LOCATION", 150, 120);
  }
  else if(location == 1)
  {
    text("INDOOR", 150, 120);
  }
  else
  {
    text("OUTDOOR", 150, 120);
  }
  //PRICE
  if(price == 0)
  {
    text("PRICE TIER", width-150, 120);
  }
  else if(price == 1)
  {
    image(coin, width-160, 110, 20, 20);
  }
  else if(price == 2)
  {
    image(coin, width-145, 110, 20, 20);
    image(coin, width-175, 110, 20, 20);
  }
  else
  {
    image(coin, width-130, 110, 20, 20);
    image(coin, width-160, 110, 20, 20);
    image(coin, width-190, 110, 20, 20);
  }
  //RATING
  if(rating == 0)
  {
    text("RATING", 150, 170);     
  }
  else if(rating == 1)
  {
    image(rating1, 100, 130, 100, 80);
  }
  else if(rating == 2)
  {
    image(rating2, 100, 130, 100, 80);
  }
  else if (rating == 3)
  {
    image(rating3, 100, 130, 100, 80);
  }
  else if (rating == 4)
  {
    image(rating4, 100, 130, 100, 80);
  }
  else if (rating == 5)
  {
    image(rating5, 100, 130, 100, 80);
  }
  //ORIGIN
  if(origin == 0)
  {
    text("CATEGORY", width-150, 170);
  }
  else if(origin == 1)
  {
    text("KOREAN", width-150, 170);
  }
  else if(origin == 2)
  {
    text("ITALIAN", width-150, 170);
  }
  else if (origin == 3)
  {
    text("FRENCH", width-150, 170);
  }
  else if (origin == 4)
  {
    text("CHINESE", width-150, 170);
  }
  else if (origin == 5)
  {
    text("MEXICAN", width-150, 170);
  }
  
  if((mouseX > 75 && mouseX < 75+150 && mouseY > 120-20 && mouseY < 120+20) || (mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 120-20 && mouseY < 120+20) || (mouseX > 75 && mouseX < 75+150 && mouseY > 170-20 && mouseY < 170+20) || (mouseX > width-150-75 && mouseX < width-150+75 && mouseY > 170-20 && mouseY < 170+20))
  {
    hand = true;
  }
  else
  {
    hand = false;
  }

  stroke(C1);
  line(30, 225, width-30, 225);
  
  //CONDITIONS AND LIST  
  filtered_array = new Restaurant[restaurants_array.length];
  int arrayIndex = 0;
  int sizeFilteredArray = 0;
  rectMode(CORNER);
  
  //LOCATION
  if(location != 0)
  {
    if(location == 1)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].indoor == 1) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (location == 2)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].indoor == 0) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    arrayIndex = 0;
  }
  //PRICE 
  else if(price != 0)
  {
    if(price == 1)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].priceTier >= 1) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (price == 2)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].priceTier >= 2) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (price == 3)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].priceTier >= 3) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
  }
  //RATING
  else if(rating != 0)
  {
    if(rating == 1)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].rating >= 1) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (rating == 2)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].rating >= 2) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (rating == 3)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].rating >= 3) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (rating == 4)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].rating >= 4) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (rating == 5)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].rating >= 5) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    arrayIndex = 0;
  }
  //CATEGORY
  else if(origin != 0)
  {
    if(origin == 1)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].type.equals("korean")) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (origin == 2)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].type.equals("italian")) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (origin == 3)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].type.equals("french")) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (origin == 4)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].type.equals("chinese")) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    else if (origin == 5)
    {
      for (int i = 0; i < restaurants_array.length; i++) {
        if (restaurants_array[i].type.equals("japanese")) {
          filtered_array[arrayIndex] = restaurants_array[i];
          arrayIndex++;
        } 
      }
    }
    arrayIndex = 0;
  }
  //NO FILTER
  else 
  {
    for (int i = 0; i < restaurants_array.length; i++) {
        filtered_array[arrayIndex] = restaurants_array[i];
        arrayIndex++;
      }
      arrayIndex = 0;
  }
  
  
  
  
  //Size of the filtered array
  for (int i = 0; i < filtered_array.length; i++) 
  {
    if (filtered_array[i] != null) {
      sizeFilteredArray ++;
    }
  }
  contentHeight = sizeFilteredArray * 90;
      
  //Display srolling list
  clip(20, 260, 440, 445);
  translate(0, -scrollPosition);
  fill(255);
  textSize(16);
  textAlign(CENTER);

  for (int i = 0; i < filtered_array.length; i++) {
    if (filtered_array[i] != null) {
      
      if(mouseX >= 30 && mouseX <= 30+420  && mouseY >= 260 + i*90 - scrollPosition && mouseY <= 260 + i*90 +80 - scrollPosition)
      {
        fill(C1);
        rect(30, 260 + i*90, 420, 80, 20);
        fill(C3);
        text(filtered_array[i].name+"\n"+filtered_array[i].rating+"\n"+filtered_array[i].address, width/2, 260 + i*90+30);
        hand = true;
      }
      else
      {
        fill(C3);
        rect(30, 260 + i*90, 420, 80, 20);
        fill(C1);
        text(filtered_array[i].name+"\n"+filtered_array[i].rating+"\n"+filtered_array[i].address, width/2, 260 + i*90+30);
      }         
    }
  }
  scrollPosition = int(lerp(scrollPosition, targetScrollPosition, 0.7));
  noClip();
  
  rectMode(CENTER);
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
