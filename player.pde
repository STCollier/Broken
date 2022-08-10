public class Player {
    PVector pos;
    PVector acc;
    PVector vel;
    
    int height = 120;
    int width = 60;

    float accSpeed = 0.25;
    float gravity = 0.75;
    int maxVel = 7;
    int jumpForce = 20;
    float friction = 0.4;
    int numJumps = 1;
    int jumps = numJumps;

    boolean isGrounded = false;
    boolean canMove = true;

    String direction = "right";
    int numDeaths = 0;
    int deathFadeOpacity = 0;

    Player(float x, float y) {
        pos = new PVector(x, y);
        acc = new PVector(0, 0);
        vel = new PVector(0, 0);
    }

    void draw() {
        if (keys[65]) { //left
            animPlayerLeft.display(pos.x, pos.y, this.width, this.height, 3);
            direction = "left";
        } else if (keys[68]) { //right
            animPlayerRight.display(pos.x, pos.y, this.width, this.height, 3);
            direction = "right";
        } else if (direction.equals("right") && keys[87]) {
            image(playerUpRightImg, pos.x, pos.y, this.width, this.height);
        } else if (direction.equals("left") && keys[87]) {
            image(playerUpLeftImg, pos.x, pos.y, this.width, this.height);
        } else {
            if (direction.equals("right")) {
                animPlayerIdleRight.display(pos.x, pos.y, this.width, this.height, 60);
            }
            if (direction.equals("left")) {
                animPlayerIdleLeft.display(pos.x, pos.y, this.width, this.height, 60);
            }
        }
    }

    void moveX() {
        //MOVE X
        if (keys[65] && vel.x > -maxVel) { // Moves left but limits velocity to -5
            acc.x = -accSpeed;
        } else if (keys[68] && vel.x < maxVel) { // limits velocity to 5
            acc.x = accSpeed;
        } else if (abs(vel.x) > 0.2) { // If no key is pressed, friction
            acc.x = (vel.x < 0) ? friction : -friction;
        } else { // If abs(vel.x) is now 0.2 or less, don't do friction anymore and just set vel and acc to 0
            vel.x = 0;
            acc.x = 0;
        }
        vel.x += acc.x; // vel += acc
        pos.x += round(vel.x); // pos += vel (Using round() makes the movment not jittery)
    }

    void moveY() {
        //MOVE Y
        if (keys[87] == true && jumps > 0) { // Cannot jump in mid-air, only jump if we just collided with the top of a block (meaning vel and acc y is 0)
            jumps--;
            vel.y = -jumpForce;
        }
        acc.y += gravity; // Forces cause acceleration. One of the many forces being applied is gravity. If you ever want to apply forces such as wind using other blocks, write player.accel.y += force to apply the force during collision.
        vel.y += acc.y;
        pos.y += round(vel.y);
        acc.y = 0; // Reset acceleration
    }

    void reset() {
        player.pos.x = 100;
        player.pos.y = 200;

        player.vel.x = 0;
        player.vel.y = 0;
    }

    void die() {
        this.numDeaths++;
        this.deathFadeOpacity += 10;
        this.canMove = false;
        if (this.deathFadeOpacity >= 300) {
            this.canMove = true;

            player.pos.x = 100;
            player.pos.y = 200;

            player.vel.x = 0;
            player.vel.y = 0;
            this.deathFadeOpacity = 0;
        }

    }
}