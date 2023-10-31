void mousePressed()
{
  if (mouseX >= 430 && mouseX <= 460 && mouseY >= 10 && mouseY <= 40 && weatherapp==false) {
    weatherapp = true;
  }else if (mouseX >= 20 && mouseX <= 50 && mouseY >= 10 && mouseY <= 40 && weatherapp==true) {
    weatherapp = false;
  }
  //FAVORITE RESTAURANTS
  if (mouseX >= 75 && mouseX <= 225 && mouseY >= 120 && mouseY <= 160){
    FavIndoor+=1;
    FavPrice = 0;
    FavRating = 0;
    if(FavIndoor>2){
      FavIndoor=0;
    }
  }else if(mouseX >= width-225 && mouseX <= width && mouseY >= 120 && mouseY <= 160){
    FavPrice+=1;
    FavIndoor = 0;
    FavRating = 0;
    if(FavPrice>3){
      FavPrice=0;
    }
  }else if(mouseX >= 75 && mouseX <= 225 && mouseY >= 170 && mouseY <= 210){
    FavRating+=1;
    FavIndoor = 0;
    FavPrice = 0;
    if(FavRating>5){
      FavRating=0;
    }
  }
  
  
  
  if(!logged_in)
  {
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
  else
  {
    //Sidebar
    if(mouseX > width/2-30 && mouseX < width/2+30 && mouseY < height && mouseY > height-60  && menuOpen == false)
    {
      animatingMenu = true;
      animationTimer = 0;
      menuOpen = true;
    }
    //Fermer sidebar
    else if(mouseX > width/2-30 && mouseX < width/2+30 && mouseY < height && mouseY > height-60  && menuOpen == true)
    {
      animatingMenu = true;  
      animationTimer = 100; 
      menuOpen = false;
      
    }
    //QUIT
    else if (mouseX > width - 100 && mouseX < width && mouseY > height-60 && mouseY < height && menuOpen == true)
    {
      clickSound.close(); // Unload the sound
      minim.stop(); // Stop Minim
      exit();
    }
    //CREDIT
    else if (mouseX > 30 && mouseX < 100 && mouseY > height-60 && mouseY < height && menuOpen == true)
    {
      menuOpen = false;
      MENU = false;
      CREDITS = true;
    }
    //ADD RESTAURANT
    else if ((mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 250 && mouseY < 310) || (mouseX >= 160 && mouseX <= 190 && mouseY >= 10 && mouseY <= 40)) 
    {
      menuOpen = false;
      MENU = false;
      ADD_REST = true;
    }
    //LIST Of RESTAURANTS
    else if ((mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 350 && mouseY < 410) || (mouseX >= 300 && mouseX <= 330 && mouseY >= 10 && mouseY <= 40)) 
    {
      menuOpen = false;
      MENU = false;
      VIEW_LIST = true;
      weatherapp = false;
    }
    //PROFIL
    else if (mouseX > width/2 - 140 && mouseX < width/2 + 140 && mouseY > 450 && mouseY < 510) 
    {
      menuOpen = false;
      MENU = false;
      PROFILE = true;
    }
    //RETURN
    else if (mouseX >= 20 && mouseX <= 50 && mouseY >= 10 && mouseY <= 40 ) 
    {
      if(VIEW_LIST)
      {
        VIEW_LIST = false;
        MENU = true;
      }
      if(CREDITS)
      {
        CREDITS = false;
        MENU = true;
      }
      if(PROFILE)
      {
        PROFILE = false;
        MENU = true;
      }
      if(ADD_REST)
      {
        ADD_REST = false;
        MENU = true;
      }
    } 
    clickSound.trigger();
    } 
}

void drawLeftArrow(float arrowSize, float arrowY, float arrowHeadSize, float arrowTailSize) {
  float arrowXEnd = arrowSize;
  float arrowXStart = arrowXEnd + arrowHeadSize;
  
  // Draw the arrow head
  fill(C1);   
  beginShape();
  vertex(arrowXStart, arrowY - arrowHeadSize);
  vertex(arrowXEnd, arrowY);
  vertex(arrowXStart, arrowY + arrowHeadSize);
  endShape(CLOSE);
}

void mouseWheel(MouseEvent event) {
  targetScrollPosition += event.getCount() * 10;
  targetScrollPosition = constrain(targetScrollPosition, 0, contentHeight - 235);
}
