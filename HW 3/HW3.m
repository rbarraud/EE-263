P = [];
for i = 1:length(lines_d),
    L = line_pixel_length(lines_d(i),lines_theta(i),n_pixels);
    R = [];
    for j = 1:n_pixels
       R = [R ; L(:,j)];
    end
    P = [P; R'];
end
A = P\y;
imagesc(reshape(A,30,30));
colormap gray;
