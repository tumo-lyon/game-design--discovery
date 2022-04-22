/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur


image_index = 0;

if (touch_time) image_index = 1;
if (touch_time && (touch_time + (fall_delay * 500) < current_time)) image_index = 2;
if (touch_time && (touch_time + (fall_delay * 1000) < current_time)) image_index = 3;

draw_self();
