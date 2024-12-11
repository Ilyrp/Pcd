citra=imread ("C:\Users\Ilyasa\Pictures\620c0292e79375ecd81ce99b_Example of luminance noise zoomed.jpg");
R=rgb2gray (citra);
R = imresize(R, [256, 256]);


h1= 0; %h(x-1,y-1)
h2= -1; %h(x-1,y)
h3=0;  %h(x-1,y+1)
h4=-1;    %h(x,y-1);
h5=11;  %h(x,y);
h6=-1;   %h(x,y+1);
h7=0;   %h(x+1,y-1);
h8=-1;  %h(x+1,y);
h9=0;   %h(x+1,y+1);
[m,n] = size(R);
 G=zeros(m,n);
 f=double (R);
 for x =2 : m-1
    for y=2 : n-1
       G(x,y)=h1*f(x+1,y+1)+ h2*f(x+1,y)+ h3*f(x+1,y-1)+...
                  h4*f(x,y+1)+ h5*f(x,y)+ h6*f(x,y-1)+...
                  h7* f(x-1,y+1)+ h8*f(x-1,y) + h9*f(x-1,y-1);         
       G(x,y) = uint8(G(x,y));
    end
 end
G=uint8(G);
subplot(1,2,1); imshow(R); title('Citra Asli');
subplot(1,2,2); imshow(G); title(' highpass filtering');

