citra = imread("C:\metleb\program\tomo.jpg");
R = rgb2gray(citra);

%kernel setelah normalisasi
h1=0.00395; h2=0.01771; h3=0.02919; h4=0.01771; h5=0.00395; 
h6=0.01771; h7=0.04813; h8=0.07937; h9=0.04813; h10=0.01771; 
h11=0.02919; h12=0.07937; h13=0.21574; h14=0.07937; h15=0.02919; 
h16=0.01771; h17=0.04813; h18=0.07937; h19=0.04813; h20=0.01771; 
h21=0.00395; h22=0.01771; h23=0.02919; h24=0.01771; h25=0.003;

[m, n] = size(R);
G = zeros(m, n);  
f = double(R);   

%konvolusi
for x = 3 : m-2 
    for y = 3 : n-2 
        G(x, y) = h1 * f(x+2, y+2) + h2 * f(x+2, y+1) + h3 * f(x+2, y) + h4 * f(x+2, y-1) + h5 * f(x+2, y-2) + ...
                  h6 * f(x+1, y+2) + h7 * f(x+1, y+1) + h8 * f(x+1, y) + h9 * f(x+1, y-1) + h10 * f(x+1, y-2) + ...
                  h11 * f(x, y+2) + h12 * f(x, y+1) + h13 * f(x, y) + h14 * f(x, y-1) + h15 * f(x, y-2) + ...
                  h16 * f(x-1, y+2) + h17 * f(x-1, y+1) + h18 * f(x-1, y) + h19 * f(x-1, y-1) + h20 * f(x-1, y-2) + ...
                  h21 * f(x-2, y+2) + h22 * f(x-2, y+1) + h23 * f(x-2, y) + h24 * f(x-2, y-1) + h25 * f(x-2, y-2);
    end
end


G = uint8(G);
subplot(2, 2, 1);imshow(R);title('Citra Asli');
subplot(2, 2, 2);imshow(G);title('Citra Filter Gaussian');
subplot(2, 2, 3); imhist(R); title('Histogram Citra Asli');
subplot(2, 2, 4); imhist(G); title('Histogram Gaussian');