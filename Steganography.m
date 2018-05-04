
clc
 
image = imread('img1.jpg');
password = 'Panchamiya';
length_pwd=strlength(password);
passInt8 = uint8(password);
display(passInt8);
lsb=image;
[r,c]=size(image);
converted = dec2bin(passInt8);
[a,b]=size(converted);
disp(converted)
disp(a)
disp(b)
newimage=image;
disp(converted(1,2))
figure
imshow(newimage);
title('Original Image');
%Replacing the lsb matrix with the password
for i=1:1:a
	for j=1:1:b
    	if ((converted(i,j)) == 0)
        	if(mod(image(i,j),2) == 1)
            	newimage(i,j) = image(i,j)-1;
        	end
    	else
        	if((image(i,j)) == 0)
            	newimage(i,j) = image(i,j)+1;
        	end
    	end
	end
end
 
%figure
subplot(1,2,1);
imshow(image);
title('Original Image');
 
imshow(newimage)
title('Original Image');
%retrieving the password
for i=1:1:a
	for j=1:1:b
    	retrievedPwd(i,j) = (newimage(i,j));
	end
end
disp(retrievedPwd)
for i=1:1:a
	number = 0;
	k = b;
	for j=1:1:b
    	number=number + mod(retrievedPwd(i,j),2)*(2^(k-1))
    	disp('Number')
    	disp(number)
        	k=k-1
	end
	newConverted(i) = number;
	disp(newConverted)
end
 
subplot(1,2,2);
imshow(newimage);
title('Stego image with password: Panchamiya');
 
finalPassword = char(newConverted);
display(finalPassword);
