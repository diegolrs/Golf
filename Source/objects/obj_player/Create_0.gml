/// @description Insert description here
// You can write your code in this editor
randomize();
spawn = true;

points = 0;
remainingMoves = 5;

isPressed = false;
velocity = 0;
maxVelocity = 8;

xx = 10;
yy = 10;
width = xx + 120;
height = yy + 40;

incrementSpeed = 0.4
decrementSpeed = 0.08;

STOPPED = 0;
SETTING_FORCE = 1;
FINAL = 2;
TARGET = 3;
state = STOPPED;

DECREASING = -1;
INCREASING = 1;
stateAnim = INCREASING;

velx = 0;
vely = 0;