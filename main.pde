import java.util.ArrayList;
PrintWriter levelTxt;
PFont mainFont;

/*SAVE DATA*/
JSONObject saveFile;
JSONObject level1JSON;
JSONObject level2JSON;
JSONObject level3JSON;
boolean isLevel1Unlocked;
boolean isLevel2Unlocked;
boolean isLevel3Unlocked;

boolean hasEnteredLevel2 = false;
boolean hasEnteredLevel3 = false;

PImage lockIconImg;
PImage uiArrowRightImg, uiArrowLeftImg;
PImage checkboxCheckedImg, checkboxUncheckedImg;
PImage parallaxBg, parallaxLayer1;
PImage playerLightOverlay, playerLightOverlayImg;
PImage sonIdleImg, sonLookingUpImg;
PImage playerUpRightImg, playerUpLeftImg;
PImage sawImg, acidImg, darknessImg;
PImage blueprintImg;
PImage img1x1, img1x2, img1x1x2, img2x1, img2x1x2, img2x2, img4x4;
PImage dropBg, wallHorizontalImg, wallVeritcalImg, verticalPipeImg, verticalPipeFlippedImg;
PImage pipeHeadImg, pipeBodyImg, lightImg, lightGlowImg;
PImage exitImg;
PImage staticPlayerRight, staticPlayerLeft;
PImage menuBgImg, pauseBtnImg, startingSkipBtn;

Animation animPipeDrippingRight, animPipeDrippingLeft;
Animation animAcid;
Animation animPlayerRight, animPlayerLeft, animPlayerIdleRight, animPlayerIdleLeft;
Animation animSonWalking;

boolean debug = false;
int debugX = 0;
int debugY = 0;
float debugScale = 0.2;
int debugMoveSpeed = 25;

Game game;
Player player;
Button playBtn, levelBtn, quitBtn, optionsBtn, creditsBtn;
Button backBtn, level_1_Btn, level_2_Btn, level_3_Btn;
Button exitBtn, continueBtn;

ValueClicker sfxVolumeValue, musicVolumeValue; 
OptionClicker playerControlsOption;

int levelNum = 2; //Set to nothing normally
int numWalls = 13;
int portalFade = 0;
int levelFade = 255;
int currentScene = 4; //Set to 2 normally
boolean hasExited = false;

int introFadeColor1 = 250;
int introFadeColor2 = 250;

int finalCreditsYPos = 0;
int finalCreditsSceneOpacity = 255;

int cutsceneTextOpacity = 1;
int cutsceneTextIndex = 0;
int cutsceneTextFadeSpeed = 2;

int menuSawRotation = 0;
int menuSceneFade = 175; //Scene transition

int cutsceneLightColor = 250;
int cutsceneFade = 255;
int cutsceneLightVertex1, cutsceneLightVertex2;

int endCreditsFade = 255;

int sonXPos;

ArrayList<Block> level1 = new ArrayList<Block>();
ArrayList<Block> level2 = new ArrayList<Block>();
ArrayList<Block> level3 = new ArrayList<Block>();

ArrayList<ParticleSystem> systems;

void setup() {

    noStroke();
    //frameRate(60);
    sonXPos = width-500;
    cutsceneLightVertex1 = width/2;
    cutsceneLightVertex2 = width;

    systems = new ArrayList<ParticleSystem>();

    surface.setTitle(game.title);
    surface.setResizable(game.resizable);
    surface.setLocation(100, 100);

    levelTxt = createWriter("LEVEL.txt");
    saveFile = loadJSONObject("save.json");
    mainFont = createFont("main_font.ttf", 32);

    lockIconImg = loadImage("images/lock_icon.png");
    playerUpRightImg = loadImage("images/player-up-right.png");
    playerUpLeftImg = loadImage("images/player-up-left.png");

    staticPlayerLeft = loadImage("images/animations/player-left-00.png");
    staticPlayerRight = loadImage("images/animations/player-right-00.png");

    sawImg = loadImage("images/saw.png");
    acidImg = loadImage("images/acid.png");
    playerLightOverlay = loadImage("images/player_light_overlay.png");
    playerLightOverlayImg = playerLightOverlay.copy();
    playerLightOverlayImg.resize(height*2, height);

    //Blocks
    img1x1 = loadImage("images/1x1.png");
    img1x1x2 = loadImage("images/1x1x2.png");
    img2x1 = loadImage("images/2x1.png");
    img1x2 = loadImage("images/1x2.png");
    img2x1x2 = loadImage("images/2x1x2.png");
    img2x2 = loadImage("images/2x2.png");
    img4x4 = loadImage("images/4x4.png");

    dropBg = loadImage("images/drop_bg.png");
    verticalPipeImg = loadImage("images/vertical_pipe.png");
    verticalPipeFlippedImg = loadImage("images/vertical_pipe_flipped.png");

    pipeHeadImg = loadImage("images/pipe_head.png");
    pipeBodyImg = loadImage("images/pipe_body.png");
    blueprintImg = loadImage("images/blueprint.png");
    exitImg = loadImage("images/exit.png");
    darknessImg = loadImage("images/darkness.png");
    lightImg = loadImage("images/light.png");
    lightGlowImg = loadImage("images/light_glow.png");

    sonIdleImg = loadImage("images/son-idle.png");
    sonLookingUpImg = loadImage("images/son-looking-up.png");
    menuBgImg = loadImage("images/menu_bg.png");
    pauseBtnImg = loadImage("images/pause_btn.png");
    startingSkipBtn = loadImage("images/skip_btn.png");

    uiArrowRightImg = loadImage("images/ui_arrow_right.png");
    uiArrowLeftImg = loadImage("images/ui_arrow_left.png");
    checkboxCheckedImg = loadImage("images/checkbox_checked.png");
    checkboxUncheckedImg = loadImage("images/checkbox_unchecked.png");

    parallaxBg = loadImage("images/parallax_bg.png");
    parallaxLayer1 = loadImage("images/parallax_layer_1.png");
    parallaxBg.resize(height*2, height);
    parallaxLayer1.resize(height*2, height);

    textFont(mainFont);

    animAcid = new Animation("acid-", 8);
    animPipeDrippingRight = new Animation("pipe_drip_right_", 6);
    animPipeDrippingLeft = new Animation("pipe_drip_left_", 6);

    animPlayerLeft = new Animation("player-left-", 4);
    animPlayerRight = new Animation("player-right-", 4);
    animPlayerIdleRight = new Animation("player-idle-right-", 6);
    animPlayerIdleLeft = new Animation("player-idle-left-", 5);

    animSonWalking = new Animation("son-walking-", 4);

    game = new Game();
    player = new Player(100, 200);
    //player = new Player(4800, 2800);

    playBtn = new Button("PLAY", 175, width-825, height/2, color(0));
    levelBtn = new Button("LEVELS", 150, width-500, height/2, color(0));
    quitBtn = new Button("QUIT", 150, width-200, height/2, color(0));
    optionsBtn = new Button("OPTIONS", 150, width-500, height/2+300, color(0));
    creditsBtn = new Button("CREDITS", 150, width-200, height/2+300, color(0));

    backBtn = new Button("BACK", 125, width/2, height-150, color(0));

    level_1_Btn = new Button("I", 150, width/2-300, height/2-200, color(0));
    level_2_Btn = new Button("II", 150, width/2, height/2-200, color(0));
    level_3_Btn = new Button("III", 150, width/2+300, height/2-200, color(0));

    exitBtn = new Button("EXIT", 175, width/2, height/2+200, color(0));
    continueBtn = new Button("CONTINUE", 175, width/2, height/2-200, color(0));

    sfxVolumeValue = new ValueClicker(width/2-245-400, 450, 400, 50);
    musicVolumeValue = new ValueClicker(width/2-245+400, 450, 400, 50);
    playerControlsOption = new OptionClicker(width/2-340, 150, 600, "WASD");

    setupLevel_1();
    setupLevel_2();
    setupLevel_3();
            
}

public void settings() {
    noSmooth();
    game = new Game();
    //fullScreen();
    size(game.width, game.height);
}

void draw() {

    switch(currentScene) {
        case 1:
            drawGameScene();
            break;
        case 2:
            drawMenuScene();
            break;
        case 3:
            drawLevelScene();
            break;
        case 4:
            drawOptionsScene();
            break;
        case 5:
            drawCreditsScene();
            break;
        case 6:
            drawLevelIntroScene();
            break;
        case 7:
            drawFinalCutscene();
            break;
        case 8:
            drawFinalCreditsScene();
            break;
    }
    
    level1JSON = saveFile.getJSONObject("level1");
    level2JSON = saveFile.getJSONObject("level2");
    level3JSON = saveFile.getJSONObject("level3");
    isLevel1Unlocked = level1JSON.getBoolean("isUnlocked");
    isLevel2Unlocked = level2JSON.getBoolean("isUnlocked");
    isLevel3Unlocked = level3JSON.getBoolean("isUnlocked");

    if (currentScene != 2) menuSceneFade = 175; //Scene transitions
    if (currentScene != 7) cutsceneFade = 255; //Scene transitions
    if (currentScene != 8) endCreditsFade = 255; //Scene transitions

    //println("Level: " + levelNum + "; Has Exited: " + hasExited);
}

/*void mousePressed() {
    float initialXPos = mouseX/debugScale;
    float initialYPos = mouseY/debugScale;
    int range = 200;
    int factorX = round(initialXPos / range);
    int factorY = round(initialYPos / range);
    print("X: " + factorX*range + "\nY: " + factorY*range + "\n\n");

    level1.add(new Block(factorX*range, factorY*range, 200, 200, "static-2x2"));
    String data = "level1.add(new Block("+factorX*range+", "+factorY*range+", 200, 200, \"static-2x2\"));";
    levelTxt.println(data);
}*/

void drawGameScene() {
    background(200);
    levelFade -= 5;

    drawGameSceneBackground();

    push();
    if (debug) {
        scale(debugScale);
        translate(debugX, debugY);
        /*if (keys[87]) debugY += debugMoveSpeed;
        if (keys[83]) debugY -= debugMoveSpeed;
        if (keys[65]) debugX += debugMoveSpeed;
        if (keys[68]) debugX -= debugMoveSpeed;*/
        if (keys[32]) {
            levelTxt.flush(); // Writes the remaining data to the file
            levelTxt.close(); // Finishes the file
            exit(); // Stops the program
        }

        if (keys[82]) {
            player.reset();
        }

        push();
        noFill();
        strokeWeight(5);
        stroke(255, 0, 0);
        rect(player.pos.x-player.width/2-width/2*1.5, player.pos.y-height/2*1.5-player.height/2, width*1.5, height*1.5);
        pop();

    } else {
        translate(round(width/2 - player.pos.x - player.width/2), round(height/2 - player.pos.y - player.width/2));
    }

    switch(levelNum) {
        case 1:
            drawLevel_1_Text();
            break;
        case 2:
            drawLevel_2_Text();
            break;
        case 3:
            drawLevel_3_Text();
            break;
    }

    player.draw();

    switch(levelNum) {
        case 1:
            for (Block block : level1) {
                //if (rectCollide(player.pos.x-player.width/2-width/2*1.5, player.pos.y-height/2*1.5-player.height/2, width*1.5, height*1.5, block.pos.x, block.pos.y, block.width, block.height)) {
                    block.draw();
                //}
            }
            break;
        case 2:
            for (Block block : level2) {
                block.draw();
            }
            break;
        case 3:
            for (Block block : level3) {
                block.draw();
            }
            break;
    }

    pop();

    if (player.canMove) player.moveX();
    switch(levelNum) {
        case 1:
        for (Block block : level1) {
            //if (rectCollide(player.pos.x-player.width/2-width/2*1.5, player.pos.y-height/2*1.5-player.height/2, width*1.5, height*1.5, block.pos.x, block.pos.y, block.width, block.height)) { 
                block.checkCollisionsX();
            //}
        }
        break;
        case 2:
        for (Block block : level2) {
            block.checkCollisionsX();
        }
        break;
        case 3: 
        for (Block block : level3) {
            block.checkCollisionsX();
        }
        break;
    }
    if (player.canMove) player.moveY();
    switch(levelNum) {
        case 1:
        for (Block block : level1) {
            //if (rectCollide(player.pos.x-player.width/2-width/2*1.5, player.pos.y-height/2*1.5-player.height/2, width*1.5, height*1.5, block.pos.x, block.pos.y, block.width, block.height)) {
                block.checkCollisionsY();
            //}
        }
        break;
        case 2:
        for (Block block : level2) {
            block.checkCollisionsY();
        }
        break;
        case 3:
        for (Block block : level3) {
            block.checkCollisionsY();
        }
        break;
    }


    fill(163, 38, 38, player.deathFadeOpacity);
    rect(0, 0, width, height);

    drawText("FPS: " + Float.toString(round(frameRate)), 150, 250, 30, color(0, 0, 0));
    drawPauseBtn(25, 25);


    fill(250, 250, 250, portalFade);
    rect(0, 0, width, height);
    fill(250, 250, 250, levelFade);
    rect(0, 0, width, height);
}

void drawMenuScene() {
    background(250);

    int textStartPos = 50;
    menuSceneFade -= 5;

    image(menuBgImg, 0, 0, width, width);
    
    push();
    fill(0);
    textAlign(LEFT);
    textSize(150);
    text("BR", textStartPos, 200);
    text("KEN", textStartPos+515, 200);
    pop();

    imageMode(CENTER);
    // Now we want to rotate the image 'in position'
    push(); // remember current drawing matrix)
    translate(textStartPos+400, 100);
    rotate(radians(menuSawRotation));
    image(sawImg, 0, 0, 200, 200);
    menuSawRotation += 5;
    pop(); // restore previous graphics matrix
    // Restore image mode back to default (optional)
    imageMode(CORNER);

    playBtn.draw();
    quitBtn.draw();
    levelBtn.draw();
    optionsBtn.draw();
    creditsBtn.draw();

    image(pipeBodyImg, 0, height-200 + 160/8, 300, 120);
    animPipeDrippingRight.display(0 + 300, height-200, 100, 200, 12);

    animPlayerIdleRight.display(150, height-180-player.height, player.width, player.height, 60);

    fill(255, 255, 255, menuSceneFade);
    rect(0, 0, game.width, game.height);    
}

void drawLevelScene() {
    image(menuBgImg, 0, 0, width, width);

    /*if (keys[84]) {
        println("Unlocked!");
        level2JSON.setBoolean("isUnlocked", true);
        saveJSONObject(saveFile, "save.json");
    }*/


    if (!isLevel2Unlocked) { //true
        level_2_Btn.btnColor = color(255, 0, 0);
    }

    if (!isLevel3Unlocked) {
        level_3_Btn.btnColor = color(255, 0, 0);
    } 

    backBtn.draw();

    level_1_Btn.draw();
    level_2_Btn.draw();
    level_3_Btn.draw();
}

void drawOptionsScene() {
    image(menuBgImg, 0, 0, width, width);

    backBtn.draw();
    if (backBtn.on() && mousePressed) {
        currentScene = 2;
    }

    drawText("Controls", width/2, 100, 50, color(0));
    drawText("SFX Volume", width*0.28, 400, 50, color(0));
    drawText("Music Volume", width*0.70, 400, 50, color(0));

    sfxVolumeValue.draw();
    musicVolumeValue.draw();

    playerControlsOption.draw();

}

void drawCreditsScene() {
        image(menuBgImg, 0, 0, width, width);

    backBtn.draw();
    if (backBtn.on() && mousePressed) {
        currentScene = 2;
    }
}

void drawLevelIntroScene() {
    int skipBtnW = 250;
    int skipBtnH = 70;
    int skipBtnX = width-skipBtnW-25;
    int skipBtnY = height-skipBtnH-25;

    background(250, 250, 250);
    push();
    textAlign(CENTER);
    drawText("This is the story about a lost and broken mechanic.", width/2, height/3, 32, color(introFadeColor1, introFadeColor1, introFadeColor1));
    drawText("He needs to find the way home.", width/2, height/1.5, 32, color(introFadeColor2, introFadeColor2, introFadeColor2));
    scale(introFadeColor2/10);
    if (introFadeColor1 <= 0) introFadeColor2--;
    pop();
    introFadeColor1--;

    if (introFadeColor2 <= 0) currentScene = 1;

    push();
    if (mouseX > skipBtnX && mouseX < skipBtnX + skipBtnW && mouseY > skipBtnY && mouseY < skipBtnY + skipBtnH) {
        cursor(HAND);
        image(startingSkipBtn, skipBtnX, skipBtnY, skipBtnW, skipBtnH);
    } else {
        cursor(ARROW);
        push();
        tint(255, 200);
        image(startingSkipBtn, skipBtnX, skipBtnY, skipBtnW, skipBtnH);
        pop();
    }
    pop();

    if (mouseX > skipBtnX && mouseX < skipBtnX + skipBtnW && mouseY > skipBtnY && mouseY < skipBtnY + skipBtnH && mousePressed) {
        currentScene = 1;
    }

    drawText("Skip", width-175, height-40, 32, color(255));
}

void drawFinalCutscene() {
    int groundHeight = 200;
    int cutsceneTextSize = 40;
    int cutsceneTextColor = color(0, 0, 0, cutsceneTextOpacity);

    if (cutsceneFade > 0 && cutsceneTextIndex < 9) cutsceneFade--;

    background(200, 200, 200);
    fill(150, 150, 150, 150);
    rect(0, game.height-groundHeight, game.width, groundHeight);
    
    fill(250, 250, cutsceneLightColor, 100);
    beginShape();
    vertex(-100, 0);
    vertex(cutsceneLightVertex1, game.height-groundHeight);
    vertex(cutsceneLightVertex2, game.height-groundHeight);
    vertex(100, 0);
    endShape(CLOSE);

    image(staticPlayerRight, 200, game.height-groundHeight-player.height*2, player.width*2, player.height*2);
    //image(sonIdleImg, width-500, game.height-groundHeight-player.height*1.5, player.width*1.5, player.height*1.5);

    cutsceneTextOpacity += cutsceneTextFadeSpeed;
    if (cutsceneTextOpacity >= 255) {
        cutsceneTextFadeSpeed = -cutsceneTextFadeSpeed;
    }
    if (cutsceneTextOpacity <= 1) {
        cutsceneTextFadeSpeed = abs(cutsceneTextFadeSpeed);
        cutsceneTextIndex++;
    }

    if (cutsceneTextIndex < 0) {
        image(sonIdleImg, width-400, game.height-groundHeight-player.height*1.5, player.width*1.5, player.height*1.5);
    } else if (cutsceneTextIndex > 2 && sonXPos >= 400) {
        animSonWalking.display(sonXPos, game.height-groundHeight-player.height*1.5, player.width*1.5, player.height*1.5, 5);
        sonXPos -= 5;
    } else {
        image(sonIdleImg, sonXPos, game.height-groundHeight-player.height*1.5, player.width*1.5, player.height*1.5);
    }

    switch(cutsceneTextIndex) {
        case 0:
            drawText("Son, I...", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 1:
            drawText("I'm so, so, sorry.", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 2:
            drawText("I failed you.\nI wasn't there for you. I..", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 3:
            break;
        case 4:
            drawText("Father, I forgive you.", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 5:
            image(playerUpRightImg, 200, game.height-groundHeight-player.height*2, player.width*2, player.height*2); 
            drawText("Even after all I did?\nI left you! I forgot you! I lost the way!", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 6:
            image(sonLookingUpImg, sonXPos, game.height-groundHeight-player.height*1.5, player.width*1.5, player.height*1.5);
            drawText("Dad, I love you!", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 7:
            image(sonLookingUpImg, sonXPos, game.height-groundHeight-player.height*1.5, player.width*1.5, player.height*1.5);
            drawText("I'm so glad you found the way again.", game.width/2, 100, cutsceneTextSize, cutsceneTextColor);
            break;
        case 8:
            image(playerUpRightImg, 200, game.height-groundHeight-player.height*2, player.width*2, player.height*2);
            if (cutsceneLightColor > 100) cutsceneLightColor--;
            if (cutsceneLightVertex1 > 0) {
                cutsceneLightVertex2-=5;
                cutsceneLightVertex1-=5;
            }
            break;
        case 9:
            cutsceneFade++;
            if (cutsceneFade >= 254) currentScene = 8;
            break;
            
    }

    fill(255, 255, 255, cutsceneFade);
    rect(0, 0, width, height);
}

void drawFinalCreditsScene() {
    int levelTextSize = 40;
    int startingCreditsPos = height;
    int levelTextColor = color(255, 255, 255, finalCreditsSceneOpacity);
    int textSpacing = 250;

    endCreditsFade--;

    background(5);

    push();
    textAlign(CORNER);
    translate(0, finalCreditsYPos);

    drawText("BROKEN", width/2, height/2, 100, levelTextColor);
    drawText("Programming       Samuel Collier", width/2, startingCreditsPos+textSpacing, levelTextSize, levelTextColor);
    drawText("Art and Design       Samuel Collier", width/2, startingCreditsPos+textSpacing*2, levelTextSize, levelTextColor);
    drawText("Music       Someone", width/2, startingCreditsPos+textSpacing*3, levelTextSize, levelTextColor);
    drawText("SFX       Someone", width/2, startingCreditsPos+textSpacing*4, levelTextSize, levelTextColor);
    drawText("Font       \"Press Start 2P\"", width/2, startingCreditsPos+textSpacing*5, levelTextSize, levelTextColor);

    drawText("Thank you for playing!", width/2, startingCreditsPos+textSpacing*7, levelTextSize, levelTextColor);
    
    pop();

    if (finalCreditsYPos >= -2500) {
        finalCreditsYPos--;
    }

    if (finalCreditsYPos <= -2500) {
        finalCreditsSceneOpacity--;
    }

    if (finalCreditsSceneOpacity <= 0) {
        currentScene = 2;
    }

    fill(255, 255, 255, endCreditsFade);
    rect(0, 0, width, height);
}

void mouseReleased() {
    if (playBtn.on() && currentScene == 2) {
        currentScene = 6;
        levelNum = 1;
    }
    if (quitBtn.on() && currentScene == 2) {
        exit();
    }
    if (levelBtn.on() && currentScene == 2) {
        currentScene = 3;
    }
    if (optionsBtn.on() && currentScene == 2) {
        currentScene = 4;
    }
    if (creditsBtn.on() && currentScene == 2) {
        currentScene = 5;
    }

    if (level_1_Btn.on() && currentScene == 3) {
        currentScene = 1;
        levelNum = 1;
    }
    if (isLevel2Unlocked && level_2_Btn.on() && currentScene == 3) {
        currentScene = 1;
        levelNum = 2;
        println(levelNum);
    }
    if (isLevel3Unlocked && level_3_Btn.on() && currentScene == 3) {
        currentScene = 1;
        levelNum = 3;
    }


    if (backBtn.on()) {
        currentScene = 2;
    }

    if (sfxVolumeValue.isIncramented() && currentScene == 4 && sfxVolumeValue.value < 100) {
        sfxVolumeValue.value += 10;
    }
    if (sfxVolumeValue.isDecramented() && currentScene == 4 && sfxVolumeValue.value > 0) {
        sfxVolumeValue.value -= 10;
    }

    if (musicVolumeValue.isIncramented() && currentScene == 4 && musicVolumeValue.value < 100) {
        musicVolumeValue.value += 10;
    }
    if (musicVolumeValue.isDecramented() && currentScene == 4 && musicVolumeValue.value > 0) {
        musicVolumeValue.value -= 10;
    }

    if (playerControlsOption.isProgressed() && currentScene == 4 && playerControlsOption.value.equals("WASD")) {
        playerControlsOption.value = "Arrow Keys";
    }
    else if (playerControlsOption.isProgressed() && currentScene == 4 && playerControlsOption.value.equals("Arrow Keys")) {
        playerControlsOption.value = "WASD";
    }

    if (playerControlsOption.isDegressed() && currentScene == 4 && playerControlsOption.value.equals("WASD")) {
        playerControlsOption.value = "Arrow Keys";
    }
    else if (playerControlsOption.isDegressed() && currentScene == 4 && playerControlsOption.value.equals("Arrow Keys")) {
        playerControlsOption.value = "WASD";
    }
}

void drawPauseBtn(int xPos, int yPos) {
    int w = 105;
    int h = 112;

    if (!game.isPaused) {
        push();
        tint(255, 150);
        image(pauseBtnImg, xPos, yPos, w, h);
        pop();
        if (mouseX > xPos && mouseX < xPos + w && mouseY > yPos && mouseY < yPos + h) {
            cursor(HAND);
            push();
            tint(255, 200);
            image(pauseBtnImg, xPos, yPos, w, h);
            pop();
        } else {
            cursor(ARROW);
        }

        if (mousePressed && mouseX > xPos && mouseX < xPos + w && mouseY > yPos && mouseY < yPos + h) {
            game.isPaused = true;
        }
    }

    if (game.isPaused) {
        player.canMove = false;
        fill(255, 255, 255, 200);
        rect(0, 0, width, height);

        exitBtn.draw();
        continueBtn.draw();
    }

    if (mousePressed && exitBtn.on()) {
        currentScene = 2;
        player.canMove = true;
        game.isPaused = false;
        player.reset();
    }
    if (mousePressed && continueBtn.on()) {
        player.canMove = true;
        game.isPaused = false;
    }
}

void drawGameSceneBackground() {
    image(parallaxBg, 0, 0);
}