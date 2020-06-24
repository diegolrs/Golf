/// @description Insert description here
// You can write your code in this editor

draw_self()

var fillProgressBar = (velocity/maxVelocity) * (width-xx);

if(fillProgressBar > 0){
	draw_set_color(c_red);
	draw_rectangle(xx, yy, xx + fillProgressBar, height, 0);
}

draw_set_color(c_white);
draw_rectangle(xx, yy, width, height, 1);

draw_set_font(font);
draw_set_color(c_red);
draw_text(20, 430, "Score: " + string(points));
draw_text(20, 460, "Jogadas restantes: " + string(remainingMoves));