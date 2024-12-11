citra=imread ("C:\Users\Ilyasa\Pictures\tomo.jpg");
R=rgb2gray (citra);
R = imresize(R, [256, 256]);


h1= 1; %h(x-1,y-1)
h2= 2; %h(x-1,y)
h3=1;  %h(x-1,y+1)
h4=2;    %h(x,y-1);
h5=4;  %h(x,y);
h6=2;   %h(x,y+1);
h7=1;   %h(x+1,y-1);
h8=2;  %h(x+1,y);
h9=1;   %h(x+1,y+1);
[m,n] = size(R);
 G=zeros(m,n);
 f=double (R);
 for x =2 : m-1
    for y=2 : n-1
       G(x,y)=1/16*(h1*f(x+1,y+1)+ h2*f(x+1,y)+ h3*f(x+1,y-1)+...
                  h4*f(x,y+1)+ h5*f(x,y)+ h6*f(x,y-1)+...
                  h7* f(x-1,y+1)+ h8*f(x-1,y) + h9*f(x-1,y-1));         
       G(x,y) = uint8(G(x,y));
    end
 end
G=uint8(G);
subplot(2, 2, 1); imshow(R); title('Citra Asli');
subplot(2, 2, 2); imshow(G); title('Citra Hasil Filter Low-Pass');
subplot(2, 2, 3); imhist(R); title('Histogram Citra Asli');
subplot(2, 2, 4); imhist(G); title('Histogram Citra Hasil Filter');

