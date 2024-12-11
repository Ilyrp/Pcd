citra = imread("C:\Users\Ilyasa\Pictures\Sample2.jpg");
R = rgb2gray(citra);
R = imresize(R, [256, 256]);

h1 = 1; 
h2 = 1;  
h3 = 0;  
h4 = 1;  
h5 = 1;  
h6 = 1;  
h7 = 1; 
h8 = 1; 
h9 = -1;  

[m, n] = size(R);
G = zeros(m, n);

f = double(R);

for x = 2:m-1
    for y = 2:n-1
        G(x, y) = h1 * f(x-1, y-1) + h2 * f(x-1, y) + h3 * f(x-1, y+1) + ...
                  h4 * f(x, y-1)   + h5 * f(x, y)   + h6 * f(x, y+1) + ...
                  h7 * f(x+1, y-1) + h8 * f(x+1, y) + h9 * f(x+1, y+1);
    end
end

G = uint8(G);

figure;
subplot(1, 2, 1); imshow(R); title('Original Image');
subplot(1, 2, 2); imshow(G); title('Convolusi Image');
