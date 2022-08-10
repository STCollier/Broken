import java.util.Objects;

public class Block {
    PVector pos;
    int width;
    int height;
    String type;

    /*Inherit Player Physics for Moveable Block*/
    PVector acc;
    PVector vel;

    float gravity = 0.5;
    float yRebound = 0.25;
    boolean hasTouched = false;
    boolean hasEnteredPortal = false;

    boolean isGrounded = false;
    boolean canMove = true;

    float sawRotation = 0.0;

    int start;
    int stop;
    int movingSpeed;

    int shineWidth;
    int shineHeight;

    String movingBlockDir = "right";

    //REGULAR BLOCK
    public Block(float x, float y, int bWidth, int bHeight, String bType) {
        pos = new PVector(x, y);
        width = bWidth;
        height = bHeight;
        type = bType;

        /*Moveable block vectors*/
        acc = new PVector(0, 0);
        vel = new PVector(0, 0);

        if (type.equals("saw")) systems.add(new ParticleSystem(1, new PVector(pos.x, pos.y)));
    }

    //MOVING BLOCK
    public Block(float x, float y, int bWidth, int bHeight, String bType, int bStart, int bStop, int bMovingSpeed) {
        pos = new PVector(x, y);
        width = bWidth;
        height = bHeight;
        type = bType;

        start = bStart;
        stop = bStop;
        movingSpeed = bMovingSpeed;

    }

    //LIGHT
    public Block(float x, float y, int bWidth, int bHeight, String bType, int shineW, int shineH) {
        pos = new PVector(x, y);
        width = bWidth;
        height = bHeight;
        type = bType;

        int shineYBuffer = 10;

        shineWidth = shineW;
        shineHeight = shineH;
    }

    void draw() {
        /*for (ParticleSystem ps : systems) {
            ps.run();
            ps.addParticle();
        }*/
        if (type.equals("static-1x1")) {
            image(img1x1, pos.x, pos.y, 100, 100);
        }
        if (type.equals("static-1x1x2")) {
            image(img1x1x2, pos.x, pos.y, 200, 100);
        }
        if (type.equals("static-2x1")) {
            image(img2x1, pos.x, pos.y, 200, 100);
        }
        if (type.equals("static-1x2")) {
            image(img1x2, pos.x, pos.y, 100, 200);   
        }
        if (type.equals("static-2x1x2")) {
            image(img2x1x2, pos.x, pos.y, 200, 200);
        }
        if (type.equals("static-2x2")) {
            image(img2x2, pos.x, pos.y, 200, 200);
        }
        if (type.equals("static-4x4")) {
            image(img4x4, pos.x, pos.y, 400, 400);
        }
        if (type.equals("drop-2x1")) {
            fill(0, 0, 255);
            image(img2x1, pos.x, pos.y, width, height);
        }
        if (type.equals("drop-2x2")) {
            fill(0, 0, 255);
            image(img2x2, pos.x, pos.y, width, height);
        }
        if (type.equals("fake")) {
            fill(0, 0, 255);
            rect(pos.x, pos.y, width, height);
        }
        if (type.equals("saw")) {
            imageMode(CENTER);
            //ellipse(pos.x, pos.y, sawImg.width, sawImg.width);
            // Now we want to rotate the image 'in position'
            push(); // remember current drawing matrix)
            translate(pos.x, pos.y);
            rotate(radians(sawRotation)); // rotate 45 degrees
            image(sawImg, 0, 0, width, height);
            sawRotation += 10;
            pop(); // restore previous graphics matrix
            // Restore image mode back to default (optional)
            imageMode(CORNER);
        }
        if (type.equals("drop-bg")) {
            image(dropBg, pos.x, pos.y, width, height);
        }
        if (type.equals("vertical-pipe")) {
            image(verticalPipeImg, pos.x, pos.y, width, height);
        }
        if (type.equals("vertical-pipe-flipped")) {
            image(verticalPipeFlippedImg, pos.x, pos.y, width, height);
        }
        if (type.equals("solid-pipe")) {
            animPipeDrippingLeft.display(pos.x-width/2+5, pos.y, 100, 200, 12);
            image(pipeBodyImg, pos.x + 70, pos.y + 160/8, 300, 120);
        }
        if (type.equals("solid-pipe-flipped")) {
            image(pipeBodyImg, pos.x, pos.y + 160/8, 300, 120);
            animPipeDrippingRight.display(pos.x + 300, pos.y, 100, 200, 12);
        }
        if (type.equals("exit")) {
            image(exitImg, pos.x, pos.y, 200, 250);
        }
        if (type.equals("acid")) {
            animAcid.display(pos.x, pos.y, 200, 200, 20);
        }
        if (type.equals("moving-horizontal-2x1")) {
            image(img2x1, pos.x, pos.y, 200, 100);
            pos.x += movingSpeed;
            if (pos.x > stop) {
                movingSpeed = -movingSpeed;
            }
            if (pos.x < start) {
                movingSpeed = abs(movingSpeed);
            }
        }
        if (type.equals("moving-horizontal-2x2")) {
            image(img2x2, pos.x, pos.y, 200, 200);
            pos.x += movingSpeed;
            if (pos.x > stop) {
                movingSpeed = -movingSpeed;
            }
            if (pos.x < start) {
                movingSpeed = abs(movingSpeed);
            }
        }
        if (type.equals("moving-sideways-saw")) {
            imageMode(CENTER);
            fill(255, 0, 0);
            //ellipse(pos.x, pos.y, sawImg.width, sawImg.width);
            // Now we want to rotate the image 'in position'
            push(); // remember current drawing matrix)
            translate(pos.x, pos.y);
            rotate(radians(sawRotation)); // rotate 45 degrees
            image(sawImg, 0, 0, 210, 210);
            sawRotation += 10;
            pop(); // restore previous graphics matrix
            // Restore image mode back to default (optional)
            imageMode(CORNER);
            pos.x += movingSpeed;
            if (pos.x > stop) {
                movingSpeed = -abs(movingSpeed);
            }
            if (pos.x < start) {
                movingSpeed = abs(movingSpeed);
            }
        }
        if (type.equals("moving-vertical-saw")) {
            imageMode(CENTER);
            fill(255, 0, 0);
            //ellipse(pos.x, pos.y, sawImg.width, sawImg.width);
            // Now we want to rotate the image 'in position'
            push(); // remember current drawing matrix)
            translate(pos.x, pos.y);
            rotate(radians(sawRotation)); // rotate 45 degrees
            image(sawImg, 0, 0, 210, 210);
            sawRotation += 10;
            pop(); // restore previous graphics matrix
            // Restore image mode back to default (optional)
            imageMode(CORNER);
            pos.y += movingSpeed;
            if (pos.y > stop) {
                movingSpeed = -movingSpeed;
            }
            if (pos.y < start) {
                movingSpeed = abs(movingSpeed);
            }

        }
        if (type.equals("darkness")) {
            image(darknessImg, pos.x, pos.y, width, height);
        }
        if (type.equals("light")) {
            int shineYBuffer = 10;
            image(lightImg, pos.x, pos.y, width, height);
            beginShape();
            fill(255, 255, 100, 75);
            if (frameCount % round(random(45, 75)) == 0) {
                fill(255, 255, 100, 0);
            }
            vertex(pos.x, pos.y+height-shineYBuffer);
            vertex(pos.x-shineWidth, pos.y+shineHeight);
            vertex(pos.x+width+shineWidth, pos.y+shineHeight);
            vertex(pos.x+width, pos.y+height-shineYBuffer);
            endShape(CLOSE);
        }
        if (type.equals("invisible")) {
            fill(0);
            rect(pos.x, pos.y, width, height);
        }
        if (type.equals("final-level-trigger")) {
            fill(255, 0, 0);
            rect(pos.x, pos.y, width, height);
        }
    }

    void checkCollisionsX() {
        if (type.toUpperCase().contains("static".toUpperCase())) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + width;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x - player.width;
                }
                player.vel.x = 0;
            }
        }
        if (type.toUpperCase().contains("drop".toUpperCase())) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + width;
                    //pos.x += player.vel.x;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x - player.width;
                    //pos.x += player.vel.x;
                }
                player.vel.x = 0;
            }
        }
        if (type.equals("fake")) {
                //Do nothing
        }
        if (type.toUpperCase().contains("saw".toUpperCase())) {
            if (circleRectCollide(pos.x, pos.y, 210/2, player.pos.x, player.pos.y, player.width, player.height)) {
                player.die();
            }
        }
        if (type.equals("solid-pipe")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + width;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x - player.width;
                }
                player.vel.x = 0;
            }
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x + 70, pos.y + 160/8, 300, 120)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + 70 + 300;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x + 70 - player.width;
                }
                player.vel.x = 0;
            }
        } 
        if (type.equals("solid-pipe-flipped")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y + 160/8, 300, 120)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + width;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x - player.width;
                }
                player.vel.x = 0;
            }
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x + 300, pos.y, width, height)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + 70 + 300;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x + 300 - player.width;
                }
                player.vel.x = 0;
            }
        }
        if (type.equals("exit")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                hasExited = true;
                if (portalFade >= 255) {
                    player.die();
                    hasExited = false;
                    levelNum++;
                    portalFade = 0;
                }
            }
            if (hasExited) {
                portalFade += 2;
            }
        }
        if (type.equals("acid")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                player.die();
            }
        }
        if (type.toUpperCase().contains("moving-horizontal".toUpperCase())) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.pos.x > pos.x) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + width;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x - player.width;
                }
                player.vel.x = 0;
            }
        }
        if (type.equals("invisible")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.x < 0) { // If the player moved left and collided with the right side of block
                    player.pos.x = pos.x + width;
                } else { // If the player moved right and collided with the left side of block
                    player.pos.x = pos.x - player.width;
                }
                player.vel.x = 0;
            }
        }
        if (type.equals("final-level-trigger")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                player.canMove = false;
                hasExited = true;
                if (portalFade > 250) {
                    currentScene = 7;
                }
                if (portalFade >= 255) {
                    hasExited = false;
                    portalFade = 0;
                }
                if (hasExited) {
                    portalFade++;
                }
            }
        }
    }

    void checkCollisionsY() {
        if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
            if (type.toUpperCase().contains("static".toUpperCase())) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + height;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
        }
        if (type.toUpperCase().contains("drop".toUpperCase())) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                hasTouched = true;
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + player.height;
                    player.vel.y *= -0.5; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
            if (hasTouched) {
                acc.y += gravity;
                vel.y += acc.y;
                pos.y += vel.y;
                acc.y = 0; // Reset acceleration
            }
        }
        if (type.equals("fake")) {
            //Do nothing
        }
        if (type.toUpperCase().contains("saw".toUpperCase())) {
            if (circleRectCollide(pos.x, pos.y, sawImg.width/2, player.pos.x, player.pos.y, player.width, player.height)) {
                player.die();
            }
        }
        if (type.equals("solid-pipe")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + height;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x + 70, pos.y + 160/8, 300, 120)) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + 160/8 + 120;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y + 160/8 - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
        }
        if (type.equals("solid-pipe-flipped")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y + 160/8, 300, 120)) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + 160/8 + 120;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y + 160/8 - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x + 300, pos.y, width, height)) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + 160;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
        }
        if (type.equals("exit")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                hasExited = true;
                if (portalFade >= 255) {
                    player.die();
                    hasExited = false;
                    levelNum++;
                    portalFade = 0;
                }
            }
            if (hasExited) {
                portalFade += 2;
            }
        }
        if (type.equals("acid")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                player.die();
            }
        }
        if (type.toUpperCase().contains("moving-horizontal".toUpperCase())) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + height;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.pos.x += movingSpeed; //Keep player on platform while platform is moving
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
        }
        if (type.equals("invisible")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                if (player.vel.y < 0) {
                    player.pos.y = pos.y + height;
                    player.vel.y *= -yRebound; // Not -1 because collisions are not perfectly elastic
                } else {
                    player.jumps = player.numJumps;
                    player.pos.y = pos.y - player.height;
                    player.vel.y = 0;
                    player.acc.y = 0;
                }
            }
        }
        if (type.equals("final-level-trigger")) {
            if (rectCollide(player.pos.x, player.pos.y, player.width, player.height, pos.x, pos.y, width, height)) {
                player.canMove = false;
                hasExited = true;
                if (portalFade > 250) {
                    currentScene = 7;
                }
                if (portalFade >= 255) {
                    hasExited = false;
                    portalFade = 0;
                }
                if (hasExited) {
                    portalFade++;
                }
            }
        }
    }
}