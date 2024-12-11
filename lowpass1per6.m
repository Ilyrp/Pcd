% Baca citra
citra = imread("C:\Users\Ilyasa\Pictures\tomo.jpg");
R = rgb2gray(citra); % 
R = imresize(R, [256, 256]); 

h1 = 0; % h(x-1,y-1)
h2 = 1; % h(x-1,y)
h3 = 0; % h(x-1,y+1)
h4 = 1; % h(x,y-1)
h5 = 2; % h(x,y)x
h6 = 1; % h(x,y+1)
h7 = 0; % h(x+1,y-1)
h8 = 1; % h(x+1,y)
h9 = 0; % h(x+1,y+1)

[m, n] = size(R);
G = zeros(m, n);
f = double(R);

for x = 2 : m-1
    for y = 2 : n-1 
        G(x, y) = 1/6 * ( ...
            h1 * f(x+1, y+1) + h2 * f(x+1, y) + h3 * f(x+1, y-1) + ...
            h4 * f(x, y+1) + h5 * f(x, y) + h6 * f(x, y-1) + ...
            h7 * f(x-1, y+1) + h8 * f(x-1, y) + h9 * f(x-1, y-1));
    end
end
G = uint8(G);


subplot(2, 2, 1); imshow(R); title('Citra Asli');
subplot(2, 2, 2); imshow(G); title('Citra Hasil Filter Low-Pass');
subplot(2, 2, 3); imhist(R); title('Histogram Citra Asli');
subplot(2, 2, 4); imhist(G); title('Histogram Citra Hasil Filter');
