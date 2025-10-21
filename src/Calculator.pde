// Quinn Dawson | 25 Sept 2025 | Calculator
Button[] buttons = new Button[13];
Button[] numButtons = new Button[10];
int num = 0;
float l, r, result;
boolean left;
String dVal;
String op;

void setup() {
  size(360, 610);
  background(#64605B);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  dVal = "0.0";
  op = " ";
  buttons[0] = new Button(75, 290, 120, 60, "C", #FFAE62, #FC9636);
  buttons[1] = new Button(110, 570, 60, 60, ".", #E3E3E3, #AFAFAF);
  buttons[2] = new Button(40, 360, 60, 60, "%", #FFFFFF, #F2F2F0);
  buttons[3] = new Button(40, 500, 60, 60, "±", #FFFFFF, #F2F2F0);
  buttons[4] = new Button(40, 570, 60, 60, "√", #FFFFFF, #F2F2F0);
  numButtons[1] = new Button(110, 500, 60, 60, "1", #E3E3E3, #AFAFAF);
  numButtons[2] = new Button(180, 500, 60, 60, "2", #E3E3E3, #AFAFAF);
  numButtons[3] = new Button(250, 500, 60, 60, "3", #E3E3E3, #AFAFAF);
  numButtons[4] = new Button(110, 430, 60, 60, "4", #E3E3E3, #AFAFAF);
  numButtons[5] = new Button(180, 430, 60, 60, "5", #E3E3E3, #AFAFAF);
  numButtons[6] = new Button(250, 430, 60, 60, "6", #E3E3E3, #AFAFAF);
  numButtons[7] = new Button(110, 360, 60, 60, "7", #E3E3E3, #AFAFAF);
  numButtons[8] = new Button(180, 360, 60, 60, "8", #E3E3E3, #AFAFAF);
  numButtons[9] = new Button(250, 360, 60, 60, "9", #E3E3E3, #AFAFAF);
  buttons[5] = new Button(40, 430, 60, 60, "^", #FFFFFF, #F2F2F0);
  numButtons[0] = new Button(180, 570, 60, 60, "0", #E3E3E3, #AFAFAF);
  buttons[6] = new Button(320, 290, 60, 60, "÷", #FFE786, #E3BE2C);
  buttons[7] = new Button(320, 360, 60, 60, "*", #FFE786, #E3BE2C);
  buttons[8] = new Button(320, 430, 60, 60, "-", #FFE786, #E3BE2C);
  buttons[9] = new Button(320, 500, 60, 60, "+", #FFE786, #E3BE2C);
  buttons[10] = new Button(285, 570, 120, 60, "=", #FFE786, #E3BE2C);
  buttons[11] = new Button(250, 290, 60, 60, "π", #FFFFFF, #F2F2F0);
  buttons[12] = new Button(180, 290, 60, 60, "del", #FFFFFF, #F2F2F0);
}

void draw() {
  background(#64605B);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  for (int i = 0; i<buttons.length; i++) {
    if (buttons [i].over && buttons[i].val.equals("+")) {
      dVal = "0.0";
      left = false;
      op = "+";
    } else if (buttons [i].over && buttons [i].val == "=") {
      performCalculation();
    } else if (buttons [i].over && buttons [i].val == ".") {
      if (dVal.contains(".") == false) {
        dVal += ".";
      }
    } else if (buttons [i].over && buttons [i].val == "±") {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        l = r*-1;
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == "√") {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (!left) {
        l = sqrt(r);
        dVal = str(r);
      }
      } else if (buttons [i].over && buttons [i].val == "%") {
        if (left) {
          l = l*0.01;
          dVal = str(l);
        } else if (!left) {
          l = r*0.01;
          dVal = str(r);
        }
      } else if (buttons [i].over && buttons [i].val == "-") {
        dVal = "0.0";
        left = false;
        op = "-";
      } else if (buttons [i].over && buttons [i].val == "*") {
        dVal = "0.0";
        left = false;
        op = "*";
      } else if (buttons [i].over && buttons [i].val == "÷") {
        dVal = "0.0";
        left = false;
        op = "÷";
      } else if (buttons [i].over && buttons [i].val == "C") {
        l = 0.0;
        r = 0.0;
        result = 0.0;
        dVal = "0.0";
        op = "-";
        left = true;
      } else if (buttons [i].over && buttons [i].val == "^") {
        dVal = "0.0";
        left = false;
        op = "^";
      }
    }


    // dVal = "Pressed";
    for (int i = 0; i<numButtons.length; i++) {
      if (dVal.length()<26) {
      if (numButtons[i].over && left) {
        if (dVal.equals("0.0")) {
          dVal = (numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && !left) {
        if (dVal.equals("0.0")) {
          dVal = (numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          r = float(dVal);
        }
      }
    }
    println("L:"+l);
    println("R:"+r);
    println("Result:"+result);
    println("Op:"+op);
    println("Left:"+left);
  }
}


  void updateDisplay() {
    fill(255);
    rect(10, 10, 340, 240, 15);
    fill(0);
    textSize(35);
    textAlign(RIGHT);
    if (dVal.length()>18) {
      textSize(25);
    } 
    text(dVal, width-20, width-120);
  }

  void performCalculation() {
    if (op.equals("+")) {
      result = l + r;
    } else if (op.equals("*")) {
      result = l * r;
    } else if (op.equals("-")) {
      result = l - r;
    } else if (op.equals("÷")) {
      result = l / r;
    } else if (op.equals("^")) {
      result = pow(l, r);
    }
    dVal = str(result);
  }
