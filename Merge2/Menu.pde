void menu(){
  background(C3);
  image(HomeIn, 20, 10, 30, 30);
  image(AddOut, 160, 10, 30, 30);
  image(FavOut, 300, 10, 30, 30);
  image(WeatherOut, 430, 10, 30, 30);
  if (mouseX >= 430 && mouseX <= 460 && mouseY >= 10 && mouseY <= 40) {
    cursor(HAND);
  } else if (mouseX >= 20 && mouseX <= 50 && mouseY >= 10 && mouseY <= 40) {
    cursor(HAND);
  }else if (mouseX >= 160 && mouseX <= 190 && mouseY >= 10 && mouseY <= 40) {
    cursor(HAND);
  }else if (mouseX >= 300 && mouseX <= 330 && mouseY >= 10 && mouseY <= 40) {
    cursor(HAND);
  }
  if (animatingMenu) {
      if(menuOpen) {
        animationTimer += animationSpeedRect;
      } 
      if (animationTimer >= 100) {
        animationTimer = constrain(animationTimer, 0, 100); 
        animatingMenu = false;
      }
    }
    if(MENU)
    {
      if(LOADING)
      {
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
        //TOP
        fill(C1);
        textSize(48);
        text("RASSOUL", width/2, 100);
        fill(C1); 
        rectMode(CORNER);
       
        rect(width/2-30,height-60, 60, 60, 10);
        image(Menu, width/2-20, height-50, 40, 40);
        
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
    //ADD RESTAURANT
    else if (ADD_REST) {
      textAlign(CENTER, CENTER);
      textSize(48);
      fill(C1);
      text("FILTER", width/2, 50);
      
      rect(150, 120, 150, 40, 10);
      rect(width-150, 120, 150, 40, 10);
      rect(150, 170, 150, 40, 10);
      rect(width-150, 170, 150, 40, 10);
      
      textSize(textsize1);
      fill(C3);
      text("LOCATION", 150, 120);
      text("PRICE", width-150, 120);
      text("RATING", 150, 170);

      cursor(ARROW);
    }
    //LISTE DE RESTAURANTS 
    else if (VIEW_LIST) {
      favoriteRestaurant();
    }
    //CREDITS
    else if (CREDITS) {
      textAlign(CENTER, CENTER);
      textSize(48);
      fill(C1);
      text("CREDITS", width/2, 50);
      textSize(24);
      text("PAUL-ALEXANDRE FORTUNA", width/2, height/2-100);
      text("JULES PUGET", width/2, height/2);
      text("FABIO OLIVEIRA", width/2, height/2 + 100);
    }
    //PROFILE
    else if (PROFILE) {
      textAlign(CENTER, CENTER);
      textSize(48);
      fill(C1);
      text("PROFILE", width/2, 50);
      textSize(24);
      current_user.display();
    }
    
    //Sidebar 
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
    
    //RETOUR 
    if(!MENU && !VIEW_LIST)
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
