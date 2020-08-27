function show_images( f, segimg, fedge, immorph )
%show_images Summary of this function goes here
%   Detailed explanation goes here
figure,
subplot(1,4,1), imshow(f);
title('Original Image');

subplot(1,4,2),imshow(segimg);
title('Segmented Image');

subplot(1,4,3),imshow(fedge);
title('Edge Image');

subplot(1,4,4),imshow(immorph);
title('Morphological Image');

end

