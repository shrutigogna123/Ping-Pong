/*
  Shruti Gogna
  Starting date: Tuesday, January 11, 2022.
  Due date: Monday, January 24, 2022.
  Game 2 (ping pong)
  Description: in this 2 player-game, each player controls a racket (W&S and up&down and tries to prevent the ball from hitting their wall). A player gets a point when the ball touches the other players' wall and a player wins if they have 11 points.
*/
//variables
  //colors
    color background1 = #77B053; //court
    color ColorPlayer1 = #4273c1; //p1 racket
    color ColorPlayer2 = #c24173; //p2 racket
    color ColorBall = #000000; //ball
  //player 1
    float p1X = 22; //x-coordinate of top left corner
    float p1Y = 190; //y-coordinate of top left corner
    int p1Score = 0; //score
    boolean p1Move = false; //make sure that rackets don't move on home screen
  //player 2
    float p2X = 598; //x-coordinate of top left corner
    float p2Y = 190; //y-coordinate of top left corner
    int p2Score = 0; //score
    boolean p2Move = false; //make sure that rackets don't move on home screen
  //ball
    float xBall = 320; //x-coordinate of center
    float yBall = -10; //y-coordinate of center
    float r = 10; //radius
    float xSpeed = 0; //speed of x-coordinate
    float ySpeed = 0; //speed of y-coordinate
    float xSpeednew = 0; //speed of x-coordinate (same as xSpeed; used when game is paused to make sure speed goes back to what it was when paused)
    float ySpeednew = 0; //speed of y-coordinate (same as ySpeed; used when game is paused to make sure speed goes back to what it was when paused)
  //countdown
    float time = -10; //y-coordinate of top left corner
    float timeSpeed = 0; //speed of rect moving down screen
  //buttons
    float ButtonX = 220; //x-coordinate of top left corner
    float StartButtonY = 60; //y-coordinate of top left corner of start button
    float HowButtonY = 220; //y-coordinate of top left corner of how to play button
    float ButtonW = 200; //width of buttons
    float ButtonH = 100; //heights of buttons 
    boolean HowButton = true; //used to make sure instructions are only printed once
  //pause
    boolean pause = false; //used to pause game when true 
    float pauseX = -50; //x-coordinate of top left corner of pause and resume buttons
    boolean resume = false; //used to resume game when true; makes sure objects start moving
void setup () {
  size (640, 480); //canvas size
} //end of void setup
void draw () {
  //background
    //court outline
      background (#ffffff);
    //court
      fill (background1);
        stroke (#000000);
        strokeWeight (1);
        rect (7, 7, width-14, height-14);
    //half line
      stroke (background1);
        strokeWeight (10);
        line (width/2, 7, width/2, height-7);
      //dashed line
        for (int yBackground = 7; yBackground < 473; yBackground = yBackground + 50) { //calculation for where line should be drawn
          stroke (#ffffff);
          line (width/2, yBackground, width/2, yBackground + 25);
        } //end of for statement
        strokeWeight(1); //reset strokeWeight
        stroke(#000000); //rest stroke
  //button
    //start
      //shape
        fill (#ffffff, 0);
        rect (ButtonX, StartButtonY, ButtonW, ButtonH);
      //text
        textAlign (CENTER);
        fill (#000000);
        textSize(30);
        text ("Start!", (ButtonX+ButtonW/2), (StartButtonY+ButtonH/2));
      //when hovering
        if (mouseX >= ButtonX && mouseX <= ButtonX+ButtonW && mouseY >= StartButtonY && mouseY <= StartButtonY+ButtonH) { //mouse is in start rect
          fill (#ffffff); //change rect colour
          rect (ButtonX, StartButtonY, ButtonW, ButtonH);
          textAlign (CENTER);
          fill (#000000);
          textSize(30);
          text ("Start!", (ButtonX+ButtonW/2), (StartButtonY+ButtonH/2));
        } //end of if statement when mouse is located in the start rect
    //game title
      text ("Ping Pong", ((ButtonX+ButtonW/2)+7), 30);
    //how to play
      //shape
        fill (#ffffff, 0);
        rect (ButtonX, HowButtonY, ButtonW, ButtonH);
      //text
        fill (#000000);
        text ("How to Play", (ButtonX+ButtonW/2), (HowButtonY+ButtonH/2));
      //when hovering
        if (mouseX >= ButtonX && mouseX <= (ButtonX+ButtonW) && mouseY >= HowButtonY && mouseY <= (HowButtonY+ButtonH)) { //mouse is in how to play rect
          fill (#ffffff);
          rect (ButtonX, HowButtonY, ButtonW, ButtonH);
          fill (#000000);
          text ("How to Play", (ButtonX+ButtonW/2), (HowButtonY+ButtonH/2));
        } //end of if statement when mouse is located in the how to play rect
      //click
        if (mousePressed == true) {
          if (mouseX >= ButtonX && mouseX <= ButtonX+ButtonW && mouseY >= StartButtonY && mouseY <= StartButtonY+ButtonH) { //player clicks start button
            ButtonX = width; //moving start and how to play buttons out of screen
            time = 0; //countdown rect in view
            timeSpeed = 1; //countdown movement start
            xBall = 320; //ball placed on centerline
            yBall = random (17, 463); //ball placed randomly
            p1Score = 0; //reset score
            p2Score = 0; //reset score
            p1Move = true; //allow racket to move
            p2Move = true; //allow racket to move
          } //end of if statement when player clicks start button
          if (mouseX >= ButtonX && mouseX <= (ButtonX+ButtonW) && mouseY >= HowButtonY && mouseY <= (HowButtonY+ButtonH)) { //player clicks how to play button]
            //text for player to check console
              textSize (15);
              textAlign (CENTER);
              fill (#000000);
              text ("Check the console for instructions", ButtonX, HowButtonY+55, ButtonW, ButtonH);
            if (HowButton == true) { //printing instructions
              println ("How to Play:");
              println ("In this two-player game, each player (blue is player 1; pink is player 2) will try to prevent the moving ball from hitting their wall. Player 1 protects the left wall and Player 2 protects the right wall.");
              println ("To move the racket, the player uses the 'w'/'W' key or the 'up' arrow, and the 's'/'S' key or the 'down' arrow to move up and down, respectively. Player 1 uses 'W' and 'S' whereas Player 2 uses the 'up' and 'down' arrows.");
              println ("  In this game, the program cannot move both rackets at the same time so to be fair, each player can only move their racket if the ball is on their side of the court.");
              println ("The ball randomly moves and increases in speed everytime it touches a racket or it bounces off the walls.");
              println ("  ");
              println ("This game ends when a player reaches 11 points. A player gets a point everytime the ball touches the opposite players wall.");
              println ("Everytime a player gets a point or starts the game, a countdown will start. The countdown is a square which moves down the center of the court and the countdown ends when the square leaves the screen.");
              println ("  ");
              println ("Enjoy!");
              HowButton = false; //making sure instructions print only once
            } //end of if statement when HowButton is true
          } //end of if statement when player clicks how to play button
        } //end of if mousePressed
  //countdown
    time = time + timeSpeed; //speed of countdown
    //colour
      //red
        fill (#ff0000);
        rect (((width/2)-5), time, 10, 10);
      //yellow
        if (time >= (height/3) && time < ((height/3)*2)) { //while the rect is between 1/3–2/3 of the way down the screen
          fill (#ffff00);
          rect (((width/2)-5), time, 10, 10);
        } //end of if statement for yellow countdown
      //green
        if (time >= ((height/3)*2) && time < height) { //while the rect is between 2/3 and the height of the way down the screen
          fill (#00ff00);
          rect (((width/2)-5), time, 10, 10);
        } //end of if statement for green countdown
    if (time == height) { //when countdown leaves the screen
      xSpeed = random (-5, 5); //ball starts moving
      ySpeed = random (-5, 5); //ball starts moving
      xSpeednew = xSpeed; //assigning variable
      ySpeednew = ySpeed; //assigning variable
      pauseX = 7; //moving pause button onto screen
     if (abs(xSpeed) < 1) { //if the xSpeed is less than 1 (the ball moves too slow)
        xSpeed = 1; //increasing speed
        xSpeednew = xSpeed; //assigning variable
      } //end of if statement when xSpeed < 1
     if (abs(ySpeed) < 1.5) { //if the ySpeed is less than 1 (the ball doesn't bounce off walls)
        ySpeed = 1.5; //increasing speed
        ySpeednew = ySpeed; //assigning variable
      } //end of if statement when xSpeed < 1
    } //end of if statement when countdown leaves screen
  //rackets
    fill (ColorPlayer1); //p1 racket
      rect (p1X, p1Y, 20, 100);
    fill (ColorPlayer2); //p2 racket
      rect (p2X, p2Y, 20, 100);
  //ball
    fill (ColorBall);
      ellipse (xBall, yBall, r*2, r*2);
    //movement
      xBall = xBall + xSpeed;
      yBall = yBall + ySpeed;
    //bounce off walls
      if ((yBall > height-17) || (yBall < 17)) { //when ball touches bottom or top of screen
        if (abs (ySpeed) > 8){ //if ySpeed > 8; too fast
          ySpeed = ySpeed * -0.95; //reduce speed
          ySpeednew = ySpeed; //assign variable
        } //end of if statement when ySpeed > 8
        else { //if ySpeed <= 8
          ySpeed = ySpeed * -1.05; //increase speed
          ySpeednew = ySpeed; //assign variable
        } //end of else statement
      } //end of if statement when ball touches top or bottom
    //bounce off rackets
      //player 1
        if (((xBall-r) <= (p1X+20)) && ((yBall+r) >= p1Y) && ((yBall-r) <= (p1Y+100))) { //when xBall touches right edge of p1 racket and is between the top and bottom edge of p1 racket
          if (abs(xSpeed) >= 7){ //if xSpeed >= 7; too fast
            xSpeed = xSpeed * -1.01; //increase speed but only by 0.01 (not increased as much as it would be otherwise)
            xSpeednew = xSpeed; //assign variable
          } //end of if statement when xSpeed >= 7
          else { //if xSpeed < 7
            xSpeed = xSpeed * -1.1; //increase speed by 0.1
            xSpeednew = xSpeed; //assign variable
          } // end of else statement
          
          if (abs(ySpeed) >= 7) { //if ySpeed >= 7; too fast
            ySpeed = ySpeed * -1.01; //increase speed but only by 0.01 (not increased as much as it would be otherwise)
            ySpeednew = ySpeed; //assign variable
          } //end of if statement when ySpeed >= 7
          else { //if ySpeed < 7
            ySpeed = ySpeed * -1.1; //increase speed by 0.1
            ySpeednew = ySpeed; //assign variable
          } //end else statement
        } //end of if statement when ball touches p1 racket
      //player 2
        if ((xBall+r) >= p2X && ((yBall+r) >= p2Y) && ((yBall-r) <= (p2Y+100))) { //when xBall touches left edge of p2 racket and is between the top and bottom edge of p2 racket
          if (abs(xSpeed) >= 7){ //if xSpeed >= 7; too fast
            xSpeed = xSpeed * -1.01; //increase speed but only by 0.01 (not increased as much as it would be otherwise)
            xSpeednew = xSpeed; //assign variable
          } //end of if statement when xSpeed >= 7
          else { //if xSpeed < 7
            xSpeed = xSpeed * -1.1; //increase speed by 0.1
            xSpeednew = xSpeed; //assign variable
          } // end of else statement  
          if (abs(ySpeed) >= 7) { //if ySpeed >= 7; too fast
            ySpeed = ySpeed * -1.01; //increase speed but only by 0.01 (not increased as much as it would be otherwise)
            ySpeednew = ySpeed; //assign variable
          } //end of if statement when ySpeed >= 7
          else { //if ySpeed < 7
            ySpeed = ySpeed * -1.1; //increase speed by 0.1
            ySpeednew = ySpeed; //assign variable
          } // end of else statement
        } //end of if statement when ball touches p2 racket
  //score
    if ((xBall+r) > width-17) { //ball touches right wall
      xSpeed = 0; //stop ball
      ySpeed = 0; //stop ball
      xSpeednew = xSpeed; //assign variable
      ySpeednew = ySpeed; //assign variable
      time = 0; //countdown moves back to top (restart countdown)
      xBall = 320; //ball at centerline
      yBall = random (17, 463); //ball at random position
      p1Score = p1Score + 1; //p1 gets point
    } //end of if statement when ball touches right wall
    if ((xBall-r) < 17) { //ball touches left wall
      xSpeed = 0; //stop ball
      ySpeed = 0; //stop ball
      xSpeednew = xSpeed; //assign variable
      ySpeednew = ySpeed; //assign variable
      time = 0; //countdown moves back to top (restart countdown)
      xBall = 320; //ball at centerline
      yBall = random (17, 463); //ball at random position
      p2Score = p2Score + 1; //p2 gets point
    } //end of if statement when ball touches left wall
    //display score
      textSize (30);
      textAlign (CORNER);
        text ("Player 1: " + p1Score, 7, 37);
      textAlign (RIGHT);
        text ("Player 2: " + p2Score, width-7, 37);
    //end game
      textAlign (CENTER);
      if (p1Score == 11) { //p1 wins
        textAlign (CENTER);
        text ("Congratulations Player 1, you win with a " + (p1Score-p2Score) + " lead!", width/4, height/3, width/2, height/2);
        noLoop ();
      } //end of p1 wins
      if (p2Score == 11) { //p2 wins
        textAlign (CENTER);
        text ("Congratulations Player 2, you win with a " + (p2Score-p1Score) + " lead!", width/4, height/3, width/2, height/2);
        noLoop();
      } //end of p2 wins
  //pause
    //button
      fill (#ffffff, 0);
      rect (pauseX, 40, 45, 30);
    //text
      textSize (15);
      textAlign (CORNER);
      fill (#000000);
      text ("Pause", pauseX, 60);
    //hovering on button
      if ((mouseX >= pauseX) && (mouseX <= (pauseX+45)) && (mouseY >= 35) && (mouseY <=65)){ //mouse is in button
        fill (#ffffff); //button turns white
          rect (pauseX, 40, 45, 30);
        fill (#000000);
          text ("Pause", pauseX, 60);
        //click on button
          if (mousePressed == true){ //click pause button
            pause = true; //activate variable; change other variables
          } //end of click pause
      } //end of mouse in pause button
      if (pause == true){ 
        //resume button displayed
          fill (#ffffff, 0);
          rect (pauseX, 70, 60, 30);
          //text
            fill (#000000);
            text ("Resume", pauseX, 90);
        //translucent layer over whole game
          fill (#ffffff, 128);
          rect (0, 0, width, height);
        //stop ball + time speed
          xSpeed = 0; //ball stopped
          ySpeed = 0; //ball stopped
          timeSpeed = 0; //countdown stopped (if paused during countdown)
        //text to unpause game
          fill (#000000);
          textAlign (CENTER);
          textSize (30);
          text ("Click 'resume' to un-pause the game.", width/2, height/2);
        if ((mouseX >= pauseX) && (mouseX <= (pauseX+60)) && (mouseY >= 65) && (mouseY <= 95)){ //hovering over resume
          //button
            fill (#ffffff); //button turns white
            textAlign (LEFT);
            rect (pauseX, 70, 60, 30);
          //text
            fill (#000000);
            textSize (15);
            text ("Resume", pauseX, 90);
          if (mousePressed == true) { //resume clicked
            resume = true; //activate variable 
            pause = false; //deactivate variable
          } // end of if (mousePressed == true)
        } // end of resume button hovering
      } //end of if (pause == true)
      if (resume == true) {
        pause = false; //end white layer + text to un-pause game
        //resume speed
          xSpeed = xSpeednew; //change xSpeed to xSpeednew (from before game paused)
          ySpeed = ySpeednew; //change xSpeed to xSpeednew (from before game paused)
          timeSpeed = 1; //resume countdown
        resume = false; //deactivate variable
      } //end of if resume==true
} //end of void draw

void keyPressed () {
  if ((key == CODED) && (keyCode == UP) && (p2Y >= 14) && (xBall >= width/2) && (pause == false) && (p2Move == true)) { //if p2 racket is in court and pause isn't true and the home screen is gone
    p2Y = p2Y - 20; //move up
  } 
  if ((key == CODED) && (keyCode == DOWN) && ((p2Y+100) <= (height-14)) && (xBall >= width/2) && (pause == false) && (p2Move == true)) { //if p2 racket is in court and pause isn't true and the home screen is gone
    p2Y = p2Y + 20; //move down
  }
  if ((key == 'w') && (p1Y >= 14) && (xBall <= width/2) && (pause == false) && (p1Move == true)|| (key == 'W') && (p1Y >= 14) && (xBall <= 320) && (pause == false) && (p1Move == true)) { //if p1 racket is in court and pause isn't true and the home screen is gone
    p1Y = p1Y - 20; //move up
  }
  if ((key == 's') && ((p1Y+100) <= (height-14)) && (xBall <= width/2) && (pause == false) && (p1Move == true)|| (key == 'S') && ((p1Y+100) <= (height-14)) && (xBall <= 320) && (pause == false) && (p1Move == true)) { //if p1 racket is in court and pause isn't true and the home screen is gone
    p1Y = p1Y + 20; //move down
  }
} //end of void keyPressed
