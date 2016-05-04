% EE 263 Midterm Problem 4

close all;
clear all;

lens_distortion_data;


r_hat = sqrt(target_locations(1,:)'.^2 + target_locations(2,:)'.^2);
r_tilde = sqrt(target_images(1,:)'.^2 + target_images(2,:)'.^2);
r_t = [r_tilde.^2 r_tilde.^3 r_tilde.^4 r_tilde.^5];

alpha = r_t\r_hat;

r = sqrt(img_pixel_coords(:,1).^2 + img_pixel_coords(:,2).^2);

g = alpha(1)*r + alpha(2)*r.^2 + alpha(3)*r.^3 + alpha(4)*r.^4;
fimg = update_image(img,img_pixel_coords, diag(g)*img_pixel_coords);
imagesc(fimg);
axis image