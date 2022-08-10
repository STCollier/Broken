boolean keys[] = new boolean[256];

void keyPressed() {
    keys[keyCode] = true;
}

void keyReleased() {
    keys[keyCode] = false;
}

boolean rectCollide(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    return x1 + w1 > x2 && x1 < x2 + w2 && y1 + h1 > y2 && y1 < y2 + h2;
}

boolean circleRectCollide(float circX, float circY, float circR, float rectX, float rectY, int rectW, int rectH) {
    // Find the closest point to the circle within the rectangle
    float closestX = constrain(circX, rectX, rectX + rectW);
    float closestY = constrain(circY, rectY, rectY + rectH);
    // Calculate the distance between the circle's center and this closest point
    float distanceX = circX - closestX;
    float distanceY = circY - closestY;

    // If the distance is less than the circle's radius, an intersection occurs
    float distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);
    return distanceSquared < (circR * circR);
}

boolean polyPointCollision(PVector[] vertices, float px, float py) {
  boolean collision = false;

  // go through each of the vertices, plus
  // the next vertex in the list
  int next = 0;
  for (int current=0; current<vertices.length; current++) {

    // get next vertex in list
    // if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position
    // this makes our if statement a little cleaner
    PVector vc = vertices[current];    // c for "current"
    PVector vn = vertices[next];       // n for "next"

    // compare position, flip 'collision' variable
    // back and forth
    if (((vc.y >= py && vn.y < py) || (vc.y < py && vn.y >= py)) &&
         (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
            collision = !collision;
    }
  }
  return collision;
}

void drawText(String content, float x, float y, float textSize, color textColor) {
    fill(textColor);
    textAlign(CENTER);
    textSize(textSize);
    text(content, x, y);
}

boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {

  // is the point inside the rectangle's bounds?
  if (px >= rx &&        // right of the left edge AND
      px <= rx + rw &&   // left of the right edge AND
      py >= ry &&        // below the top AND
      py <= ry + rh) {   // above the bottom
        return true;
  }
  return false;
}