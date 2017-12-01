% Akash Mitra
% am132
%GB comments
1. 100
2. 100
Overall: 100


% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  

img_raw = imread('yeast.tif');
imshow(img_raw,[]);
img = smooth_sub(img_raw,4,2);
img = auto_threshold(img);
imshow(img,[]);

hx = fspecial('sobel');
hy = hx';
Iy = imfilter(double(img), hy,'replicate');
Ix = imfilter(double(img), hx,'replicate');
edge_img = sqrt(Ix.^2+Iy.^2);
imshow(edge_img,[])

[centers, radii] = imfindcircles(edge_img, [15 25], 'Sensitivity', 0.96);
figure;
imshow(edge_img,[]);
hold on;
for i = 1:length(centers)
    drawcircle(centers(i,:),radii(i),'m');
end

figure;
imshow(img,[]);
hold on;
for i = 1:length(centers)
    drawcircle(centers(i,:),radii(i),'m');
end

% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

x = randi([1 9], 1, 10);
y = randi([1 10], 1, 10);
[is_sig, pval] = ttest2(x,y);
disp(['Is significant: ' num2str(is_sig)]);
disp(['P-value: ' num2str(pval)]);


for i = 1:1000;
    x = randi([1 9], 1, 10);
    y = randi([1 10], 1, 10);
    [is_sig(i), pval(i)] = ttest2(x,y);
end

disp(['Number of times Significant in a 1000 draws: ' num2str(sum(is_sig))]);

test_with_ttest(100);
test_with_ttest(1000);

%With a larger dataset, there is a higher probability of reaching a
%significant p value. With fewer observations, there's a lower probabaility
%of reaching a significant p value

%When looping 1000 times b/w datasets that are orders of magnitude larger,
%the number of significant p values increase greatly


