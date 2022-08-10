public class Button {
    String buttonText;
    int size;
    PVector pos;
    color btnColor;
    PVector[] vertices = new PVector[4];

    Button(String buttonText, int size, float x, float y, color btnColor) {
        this.buttonText = buttonText;
        pos = new PVector(x, y);
        this.size = size;
        this.btnColor = btnColor;
        vertices[0] = new PVector(pos.x, pos.y-size);
        vertices[1] = new PVector(pos.x-size, pos.y);
        vertices[2] = new PVector(pos.x, pos.y+size);
        vertices[3] = new PVector(pos.x+size, pos.y);
    }

    boolean on() {
        return polyPointCollision(vertices, mouseX, mouseY);
    }

    void draw() {

        fill(btnColor);
        beginShape();
        for (PVector v : vertices) {
            vertex(v.x, v.y);
        }
        endShape();

        if (buttonText != null) {
            drawText(buttonText, pos.x, pos.y+25, 32, color(255));
        }
    }
}

public class Checkbox {
    PVector pos;
    boolean isChecked;

    Checkbox(float x, float y, boolean isChecked) {
        pos = new PVector(x, y);
        this.isChecked = isChecked;
    }

    void draw() {
        if (this.isChecked) {
            image(checkboxCheckedImg, pos.x, pos.y, 260, 220);
        }
        if (!this.isChecked) {
            image(checkboxUncheckedImg, pos.x, pos.y, 220, 220);
        }
    }
}

public class ValueClicker {
    PVector pos;
    int value;
    float w;

    int btnW = 45;
    int btnH = 80;

    ValueClicker(float x, float y, float w, int value) {
        pos = new PVector(x, y);
        this.w = w;
        this.value = value;
    }

    void draw() {
        fill(255, 255, 255, 100);
        rect(pos.x+btnW, pos.y, this.w-btnW, btnH);

        image(uiArrowLeftImg, pos.x, pos.y, btnW, btnH);
        image(uiArrowRightImg, pos.x+this.w, pos.y, btnW, btnH);

        push();
        if (this.value == 0) fill(255, 0, 0);
        else fill(0);
        textSize(48);
        textAlign(CENTER);
        text(this.value+"%", pos.x+this.w/2+btnW/2, pos.y+btnH/1.25);
        pop();
    }

    boolean isIncramented() {
        return pointRect(mouseX, mouseY, pos.x+this.w, pos.y, btnW, btnH);
    }

    boolean isDecramented() {
        return pointRect(mouseX, mouseY, pos.x, pos.y, btnW, btnH);
    }
}

public class OptionClicker {

    PVector pos;
    String value;
    float w;

    int btnW = 45;
    int btnH = 80;

    OptionClicker(float x, float y, float w, String value) {
        pos = new PVector(x, y);
        this.w = w;
        this.value = value;
    }
    void draw() {
        fill(255, 255, 255, 100);
        rect(pos.x+btnW, pos.y, this.w-btnW, btnH);

        image(uiArrowLeftImg, pos.x, pos.y, btnW, btnH);
        image(uiArrowRightImg, pos.x+this.w, pos.y, btnW, btnH);

        push();
        fill(0);
        textSize(48);
        textAlign(CENTER);
        text(this.value, pos.x+this.w/2+btnW/2, pos.y+btnH/1.25);
        pop();
    }
    boolean isProgressed() {
        return pointRect(mouseX, mouseY, pos.x+this.w, pos.y, btnW, btnH);
    }

    boolean isDegressed() {
        return pointRect(mouseX, mouseY, pos.x, pos.y, btnW, btnH);
    }
}