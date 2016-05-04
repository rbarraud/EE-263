function def_img=update_image(orig_img,old_pixel_coords,new_pixel_coords)
% def_img = display_image(orig_img,Xnew,Ynew,Xold,Yold)

Xnew=new_pixel_coords(:,1); Ynew=new_pixel_coords(:,2); 
Xold=old_pixel_coords(:,1); Yold=old_pixel_coords(:,2); 
[m,n,l]=size(orig_img);

% ERROR CHECKING
if size(orig_img,3)~=3
    error('First argument must be an m by n by 3 array');
end

if ~(isequal(size(Xnew),[m*n,1]) && isequal(size(Ynew),[m*n,1]) && ... 
        isequal(size(Xold),[m*n,1]) && isequal(size(Yold),[m*n,1])) 
    error('Input dimension error');
end

% CREATE IMAGE
def_img=zeros(size(orig_img));
for a=1:3 % iterate over RGB
    Zold=reshape(orig_img(:,:,a),m*n,1);
    F=TriScatteredInterp(Xnew,Ynew,double(Zold)); % create interpolation object
    for i=1:m
        for j=1:n % for each pixel, interpolate using the old coordinates
            k=i+(j-1)*m;
            def_img(i,j,a)=F(Xold(k),Yold(k)); 
        end
    end
end
def_img(isnan(def_img))=0; % replace NaNs by black pixels
def_img=uint8(def_img); % convert to uint8 from double