img=imread('./im_test.bmp');


houghTransf(img,8);


pause();

img=imread('./etoile3.jpg');
img=rgb2gray(img);
img=(img<127);
houghTransf(img,1000);
