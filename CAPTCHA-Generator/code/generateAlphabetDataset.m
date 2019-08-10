% generate randmo images
close all
clear
clc
doDisplay = 0;

imdir1 = '..\Images';
imdir2 = '..\Images\Characters\Same';
imdir3 = '..\Images\Characters\Different';

savedir = '..\pix2pix';
if ~exist(savedir,'dir')
    mkdir(savedir);
end

% dummyimageDay = ones(100*6,100*6,3);
% dummyimageNight = ones(100*6,100*6,3);

%occluderimg = imread(fullfile(imdir1,'heartBig.jpg'));

% imgids = randperm(26); % letters A to Z
% imgids = [imgids, imgids(1:10)];

imageBackground_flag = 0;
randomBackground_flag = 0;
simpleBackground_flag = 0;
texturedCharacters_flag = 0;
simpleCharacters_flag = 0;
rotatedCharacters_flag = 0;
nonrotatedCharacters_flag = 0;
sameFont_flag = 0;
differentFont_flag = 0;
sameFontSize_flag = 0;
differentFontSize_flag = 0;

prompt1 = '1) Image Background (Y/N)? ';
ans1 = input(prompt1, 's');
if(ans1 == 'N')
    prompt2 = '1) Random Background (Y/N)? ';
    ans2 = input(prompt2, 's');
    if(ans2 == 'N')
        simpleBackground_flag = 1;
        display("Simple Background Selected");
    elseif(ans2 == 'Y')
        display("Random Background Selected");
        randomBackground_flag = 1;
    end
elseif (ans1 == 'Y')
    imageBackground_flag = 1;
    display("Image Background Selected");
end

prompt3 = '2) Textured Characters (Y/N)? ';
ans3 = input(prompt3, 's');
if(ans3 == 'Y')
    texturedCharacters_flag = 1; 
    display("Textured Characters Selected");
elseif(ans3 == 'N')
    simpleCharacters_flag = 1;
    display("Simple Characters Selected");
end

prompt4 = '3) Rotated Characters (Y/N)? ';
ans4 = input(prompt4, 's');
if(ans4 == 'Y')
    rotatedCharacters_flag = 1; 
    display("Rotated Characters Selected");
    prompt8 = 'Angle upto which you want to rotate (Enter a number less than or equal to 360)? ';
    rotationDegrees = input(prompt8);
    angleDisplay = sprintf('Images will be rotated randomly between 0 to %.15g degrees ',rotationDegrees);
    display(angleDisplay);
elseif(ans4 == 'N')
    nonrotatedCharacters_flag = 1;
    display("Non rotated Characters Selected");
end

prompt5 = '4) Same Font Type (Y/N)? ';
ans5 = input(prompt5, 's');
if(ans5 == 'Y')
    sameFont_flag = 1; 
    display("Same Font Type Selected");
elseif(ans5 == 'N')
    differentFont_flag = 1;
    display("Different Font Type Selected");
end

prompt6 = '5) Same Font Size (Y/N)? ';
ans6 = input(prompt6, 's');
if(ans6 == 'Y')
    sameFontSize_flag = 1; 
    display("Same Font Size Selected");
elseif(ans6 == 'N')
    differentFontSize_flag = 1;
    display("Different Font Size Selected");
end

prompt7 = 'Total images that you want to generate (Enter a number)? ';
ans7 = input(prompt7);
numimgs = ans7;
imagesDisplay = sprintf('%.15g images will be generated',ans7);
display(imagesDisplay);

init = 3;
init1 = 3;
for j=1:numimgs
    word = '';
    if(texturedCharacters_flag == 1)
        files = dir('..\Images\Textures\Characters\*');
        S = dir(fullfile('..\Images\Textures\Characters\', files(init).name, '*.jpg')); % pattern to match filenames.
        D = fullfile('..\Images\Textures\Characters\', files(init).name);
        img = imread(D);
        init = init+1;
        [h1,w1,d1]=size(img);
        r = [0, 0, w1, h1];
        img = imcrop(img, r);
    end

    if(imageBackground_flag == 1)
        files1 = dir('..\Images\Textures\Background\*');
        S1 = dir(fullfile('..\Images\Textures\Background\', files1(init1).name, '*.jpg')); % pattern to match filenames.
        D1 = fullfile('..\Images\Textures\Background\', files1(init1).name);
        img1 = imread(D1);
        img1 = imresize(img1, [256 256]);
        init1 = init1+1;
    end
     %imgids = randperm(26); % letters A to Z
%     imgids = randperm(5);
    the_vector = [0 0 0 0 0];
    the_vectorNight = [0 0 0 0 0];
    if(differentFont_flag == 1)
        random_alphabet1 = randi([27 26441]);
        random_alphabet2 = randi([27 26441]);
        random_alphabet3 = randi([27 26441]);
        random_alphabet4 = randi([27 26441]);
        random_alphabet5 = randi([27 26441]);
        the_vector = [random_alphabet1 random_alphabet2 random_alphabet3 random_alphabet4 random_alphabet5];
        the_vector = the_vector(randperm(5));
        
    elseif(sameFont_flag == 1)
        random_alphabet1 = randi([1 26]);
        random_alphabet2 = randi([1 26]);
        random_alphabet3 = randi([1 26]);
        random_alphabet4 = randi([1 26]);
        random_alphabet5 = randi([1 26]);
        the_vector = [random_alphabet1 random_alphabet2 random_alphabet3 random_alphabet4 random_alphabet5];
        the_vector = the_vector(randperm(5));
    end

    
   
    %EXTRACTING WORD FOR PREPARATION OF DATASET TO PASS TO THE CLASSIFIER
    %--------------------------------------------------------------------
    if(sameFont_flag == 1)
        if(the_vector(1) == 1)
            word=strcat(word,'a');
        elseif(the_vector(1) == 2)
            word=strcat(word,'b');       
        elseif(the_vector(1) == 3)
            word=strcat(word,'c');     
        elseif(the_vector(1) == 4)
            word=strcat(word,'d'); 
        elseif(the_vector(1) == 5)
            word=strcat(word,'e'); 
        elseif(the_vector(1) == 6)
            word=strcat(word,'f'); 
        elseif(the_vector(1) == 7)
            word=strcat(word,'g'); 
        elseif(the_vector(1) == 8)
            word=strcat(word,'h'); 
        elseif(the_vector(1) == 9)
            word=strcat(word,'i'); 
        elseif(the_vector(1) == 10)
            word=strcat(word,'j'); 
        elseif(the_vector(1) == 11)
            word=strcat(word,'k'); 
        elseif(the_vector(1) == 12)
            word=strcat(word,'l'); 
        elseif(the_vector(1) == 13)
            word=strcat(word,'m'); 
        elseif(the_vector(1) == 14)
            word=strcat(word,'n'); 
        elseif(the_vector(1) == 15)
            word=strcat(word,'o'); 
        elseif(the_vector(1) == 16)
            word=strcat(word,'p'); 
        elseif(the_vector(1) == 17)
            word=strcat(word,'q'); 
        elseif(the_vector(1) == 18)
            word=strcat(word,'r'); 
        elseif(the_vector(1) == 19)
            word=strcat(word,'s'); 
        elseif(the_vector(1) == 20)
            word=strcat(word,'t'); 
        elseif(the_vector(1) == 21)
            word=strcat(word,'u'); 
        elseif(the_vector(1) == 22)
            word=strcat(word,'v'); 
        elseif(the_vector(1) == 23)
            word=strcat(word,'w'); 
        elseif(the_vector(1) == 24)
            word=strcat(word,'x'); 
        elseif(the_vector(1) == 25)
            word=strcat(word,'y'); 
        elseif(the_vector(1) == 26)
            word=strcat(word,'z'); 
        end

        if(the_vector(2) == 1)
            word=strcat(word,'a');
        elseif(the_vector(2) == 2)
            word=strcat(word,'b');       
        elseif(the_vector(2) == 3)
            word=strcat(word,'c');     
        elseif(the_vector(2) == 4)
            word=strcat(word,'d'); 
        elseif(the_vector(2) == 5)
            word=strcat(word,'e'); 
        elseif(the_vector(2) == 6)
            word=strcat(word,'f'); 
        elseif(the_vector(2) == 7)
            word=strcat(word,'g'); 
        elseif(the_vector(2) == 8)
            word=strcat(word,'h'); 
        elseif(the_vector(2) == 9)
            word=strcat(word,'i'); 
        elseif(the_vector(2) == 10)
            word=strcat(word,'j'); 
        elseif(the_vector(2) == 11)
            word=strcat(word,'k'); 
        elseif(the_vector(2) == 12)
            word=strcat(word,'l'); 
        elseif(the_vector(2) == 13)
            word=strcat(word,'m'); 
        elseif(the_vector(2) == 14)
            word=strcat(word,'n'); 
        elseif(the_vector(2) == 15)
            word=strcat(word,'o'); 
        elseif(the_vector(2) == 16)
            word=strcat(word,'p'); 
        elseif(the_vector(2) == 17)
            word=strcat(word,'q'); 
        elseif(the_vector(2) == 18)
            word=strcat(word,'r'); 
        elseif(the_vector(2) == 19)
            word=strcat(word,'s'); 
        elseif(the_vector(2) == 20)
            word=strcat(word,'t'); 
        elseif(the_vector(2) == 21)
            word=strcat(word,'u'); 
        elseif(the_vector(2) == 22)
            word=strcat(word,'v'); 
        elseif(the_vector(2) == 23)
            word=strcat(word,'w'); 
        elseif(the_vector(2) == 24)
            word=strcat(word,'x'); 
        elseif(the_vector(2) == 25)
            word=strcat(word,'y'); 
        elseif(the_vector(2) == 26)
            word=strcat(word,'z'); 
        end

        if(the_vector(3) == 1)
            word=strcat(word,'a');
        elseif(the_vector(3) == 2)
            word=strcat(word,'b');       
        elseif(the_vector(3) == 3)
            word=strcat(word,'c');     
        elseif(the_vector(3) == 4)
            word=strcat(word,'d'); 
        elseif(the_vector(3) == 5)
            word=strcat(word,'e'); 
        elseif(the_vector(3) == 6)
            word=strcat(word,'f'); 
        elseif(the_vector(3) == 7)
            word=strcat(word,'g'); 
        elseif(the_vector(3) == 8)
            word=strcat(word,'h'); 
        elseif(the_vector(3) == 9)
            word=strcat(word,'i'); 
        elseif(the_vector(3) == 10)
            word=strcat(word,'j'); 
        elseif(the_vector(3) == 11)
            word=strcat(word,'k'); 
        elseif(the_vector(3) == 12)
            word=strcat(word,'l'); 
        elseif(the_vector(3) == 13)
            word=strcat(word,'m'); 
        elseif(the_vector(3) == 14)
            word=strcat(word,'n'); 
        elseif(the_vector(3) == 15)
            word=strcat(word,'o'); 
        elseif(the_vector(3) == 16)
            word=strcat(word,'p'); 
        elseif(the_vector(3) == 17)
            word=strcat(word,'q'); 
        elseif(the_vector(3) == 18)
            word=strcat(word,'r'); 
        elseif(the_vector(3) == 19)
            word=strcat(word,'s'); 
        elseif(the_vector(3) == 20)
            word=strcat(word,'t'); 
        elseif(the_vector(3) == 21)
            word=strcat(word,'u'); 
        elseif(the_vector(3) == 22)
            word=strcat(word,'v'); 
        elseif(the_vector(3) == 23)
            word=strcat(word,'w'); 
        elseif(the_vector(3) == 24)
            word=strcat(word,'x'); 
        elseif(the_vector(3) == 25)
            word=strcat(word,'y'); 
        elseif(the_vector(3) == 26)
            word=strcat(word,'z'); 
        end 

        if(the_vector(4) == 1)
            word=strcat(word,'a');
        elseif(the_vector(4) == 2)
            word=strcat(word,'b');       
        elseif(the_vector(4) == 3)
            word=strcat(word,'c');     
        elseif(the_vector(4) == 4)
            word=strcat(word,'d'); 
        elseif(the_vector(4) == 5)
            word=strcat(word,'e'); 
        elseif(the_vector(4) == 6)
            word=strcat(word,'f'); 
        elseif(the_vector(4) == 7)
            word=strcat(word,'g'); 
        elseif(the_vector(4) == 8)
            word=strcat(word,'h'); 
        elseif(the_vector(4) == 9)
            word=strcat(word,'i'); 
        elseif(the_vector(4) == 10)
            word=strcat(word,'j'); 
        elseif(the_vector(4) == 11)
            word=strcat(word,'k'); 
        elseif(the_vector(4) == 12)
            word=strcat(word,'l'); 
        elseif(the_vector(4) == 13)
            word=strcat(word,'m'); 
        elseif(the_vector(4) == 14)
            word=strcat(word,'n'); 
        elseif(the_vector(4) == 15)
            word=strcat(word,'o'); 
        elseif(the_vector(4) == 16)
            word=strcat(word,'p'); 
        elseif(the_vector(4) == 17)
            word=strcat(word,'q'); 
        elseif(the_vector(4) == 18)
            word=strcat(word,'r'); 
        elseif(the_vector(4) == 19)
            word=strcat(word,'s'); 
        elseif(the_vector(4) == 20)
            word=strcat(word,'t'); 
        elseif(the_vector(4) == 21)
            word=strcat(word,'u'); 
        elseif(the_vector(4) == 22)
            word=strcat(word,'v'); 
        elseif(the_vector(4) == 23)
            word=strcat(word,'w'); 
        elseif(the_vector(4) == 24)
            word=strcat(word,'x'); 
        elseif(the_vector(4) == 25)
            word=strcat(word,'y'); 
        elseif(the_vector(4) == 26)
            word=strcat(word,'z');
        end

        if(the_vector(5) == 1)
            word=strcat(word,'a');
        elseif(the_vector(5) == 2)
            word=strcat(word,'b');       
        elseif(the_vector(5) == 3)
            word=strcat(word,'c');     
        elseif(the_vector(5) == 4)
            word=strcat(word,'d'); 
        elseif(the_vector(5) == 5)
            word=strcat(word,'e'); 
        elseif(the_vector(5) == 6)
            word=strcat(word,'f'); 
        elseif(the_vector(5) == 7)
            word=strcat(word,'g'); 
        elseif(the_vector(5) == 8)
            word=strcat(word,'h'); 
        elseif(the_vector(5) == 9)
            word=strcat(word,'i'); 
        elseif(the_vector(5) == 10)
            word=strcat(word,'j'); 
        elseif(the_vector(5) == 11)
            word=strcat(word,'k'); 
        elseif(the_vector(5) == 12)
            word=strcat(word,'l'); 
        elseif(the_vector(5) == 13)
            word=strcat(word,'m'); 
        elseif(the_vector(5) == 14)
            word=strcat(word,'n'); 
        elseif(the_vector(5) == 15)
            word=strcat(word,'o'); 
        elseif(the_vector(5) == 16)
            word=strcat(word,'p'); 
        elseif(the_vector(5) == 17)
            word=strcat(word,'q'); 
        elseif(the_vector(5) == 18)
            word=strcat(word,'r'); 
        elseif(the_vector(5) == 19)
            word=strcat(word,'s'); 
        elseif(the_vector(5) == 20)
            word=strcat(word,'t'); 
        elseif(the_vector(5) == 21)
            word=strcat(word,'u'); 
        elseif(the_vector(5) == 22)
            word=strcat(word,'v'); 
        elseif(the_vector(5) == 23)
            word=strcat(word,'w'); 
        elseif(the_vector(5) == 24)
            word=strcat(word,'x'); 
        elseif(the_vector(5) == 25)
            word=strcat(word,'y'); 
        elseif(the_vector(5) == 26)
            word=strcat(word,'z');
        end
    end

    if(differentFont_flag == 1)
        if(the_vector(1) >= 27 && the_vector(1) <= 1042)
            the_vectorNight(1) = 1;
            word=strcat(word,'a');
        elseif(the_vector(1) >= 1043 && the_vector(1) <= 2058)
            the_vectorNight(1) = 2;
            word=strcat(word,'b');       
        elseif(the_vector(1) >= 2059 && the_vector(1) <= 3074)
            the_vectorNight(1) = 3;
            word=strcat(word,'c');     
        elseif(the_vector(1) >= 3075 && the_vector(1) <= 4089)
            the_vectorNight(1) = 4;
            word=strcat(word,'d'); 
        elseif(the_vector(1) >= 4090 && the_vector(1) <= 5105)
            the_vectorNight(1) = 5;
            word=strcat(word,'e'); 
        elseif(the_vector(1) >= 5106 && the_vector(1) <= 6121)
            the_vectorNight(1) = 6;
            word=strcat(word,'f'); 
        elseif(the_vector(1) >= 6122 && the_vector(1) <= 7137)
            the_vectorNight(1) = 7;
            word=strcat(word,'g'); 
        elseif(the_vector(1) >= 7138 && the_vector(1) <= 8153)
            the_vectorNight(1) = 8;
            word=strcat(word,'h'); 
        elseif(the_vector(1) >= 8154 && the_vector(1) <= 9169)
            the_vectorNight(1) = 9;
            word=strcat(word,'i'); 
        elseif(the_vector(1) >= 9170 && the_vector(1) <= 10185)
            the_vectorNight(1) = 10;
            word=strcat(word,'j'); 
        elseif(the_vector(1) >= 10186 && the_vector(1) <= 11201)
            the_vectorNight(1) = 11;
            word=strcat(word,'k'); 
        elseif(the_vector(1) >= 11202 && the_vector(1) <= 12217)
            the_vectorNight(1) = 12;
            word=strcat(word,'l'); 
        elseif(the_vector(1) >= 12218 && the_vector(1) <= 13233)
            the_vectorNight(1) = 13;
            word=strcat(word,'m'); 
        elseif(the_vector(1) >= 13234 && the_vector(1) <= 14249)
            the_vectorNight(1) = 14;
            word=strcat(word,'n'); 
        elseif(the_vector(1) >= 14250 && the_vector(1) <= 15265)
            the_vectorNight(1) = 15;
            word=strcat(word,'o'); 
        elseif(the_vector(1) >= 15266 && the_vector(1) <= 16281)
            the_vectorNight(1) = 16;
            word=strcat(word,'p'); 
        elseif(the_vector(1) >= 16282 && the_vector(1) <= 17297)
             the_vectorNight(1) = 17;
            word=strcat(word,'q'); 
        elseif(the_vector(1) >= 17298 && the_vector(1) <= 18313)
            the_vectorNight(1) = 18;
            word=strcat(word,'r'); 
        elseif(the_vector(1) >= 18314 && the_vector(1) <= 19329)
            the_vectorNight(1) = 19;
            word=strcat(word,'s'); 
        elseif(the_vector(1) >= 19330 && the_vector(1) <= 20345)
            the_vectorNight(1) = 20;
            word=strcat(word,'t'); 
        elseif(the_vector(1) >= 20346 && the_vector(1) <= 21361)
            the_vectorNight(1) = 21;
            word=strcat(word,'u'); 
        elseif(the_vector(1) >= 21362 && the_vector(1) <= 22377)
            the_vectorNight(1) = 22;
            word=strcat(word,'v'); 
        elseif(the_vector(1) >= 22378 && the_vector(1) <= 23393)
            the_vectorNight(1) = 23;
            word=strcat(word,'w'); 
        elseif(the_vector(1) >= 23394 && the_vector(1) <= 24409)
            the_vectorNight(1) = 24;
            word=strcat(word,'x'); 
        elseif(the_vector(1) >= 24410 && the_vector(1) <= 25425)
            the_vectorNight(1) = 25;
            word=strcat(word,'y'); 
        elseif(the_vector(1) >= 25426 && the_vector(1) <= 26441)
            the_vectorNight(1) = 26;
            word=strcat(word,'z'); 
        end

        if(the_vector(2) >= 27 && the_vector(2) <= 1042)
            the_vectorNight(2) = 1;
            word=strcat(word,'a');
        elseif(the_vector(2) >= 1043 && the_vector(2) <= 2058)
            the_vectorNight(2) = 2;
            word=strcat(word,'b');       
        elseif(the_vector(2) >= 2059 && the_vector(2) <= 3074)
            the_vectorNight(2) = 3;
            word=strcat(word,'c');     
        elseif(the_vector(2) >= 3075 && the_vector(2) <= 4089)
            the_vectorNight(2) = 4;
            word=strcat(word,'d'); 
        elseif(the_vector(2) >= 4090 && the_vector(2) <= 5105)
            the_vectorNight(2) = 5;
            word=strcat(word,'e'); 
        elseif(the_vector(2) >= 5106 && the_vector(2) <= 6121)
            the_vectorNight(2) = 6;
            word=strcat(word,'f'); 
        elseif(the_vector(2) >= 6122 && the_vector(2) <= 7137)
            the_vectorNight(2) = 7;
            word=strcat(word,'g'); 
        elseif(the_vector(2) >= 7138 && the_vector(2) <= 8153)
            the_vectorNight(2) = 8;
            word=strcat(word,'h'); 
        elseif(the_vector(2) >= 8154 && the_vector(2) <= 9169)
            the_vectorNight(2) = 9;
            word=strcat(word,'i'); 
        elseif(the_vector(2) >= 9170 && the_vector(2) <= 10185)
            the_vectorNight(2) = 10;
            word=strcat(word,'j'); 
        elseif(the_vector(2) >= 10186 && the_vector(2) <= 11201)
            the_vectorNight(2) = 11;
            word=strcat(word,'k'); 
        elseif(the_vector(2) >= 11202 && the_vector(2) <= 12217)
            the_vectorNight(2) = 12;
            word=strcat(word,'l'); 
        elseif(the_vector(2) >= 12218 && the_vector(2) <= 13233)
            the_vectorNight(2) = 13;
            word=strcat(word,'m'); 
        elseif(the_vector(2) >= 13234 && the_vector(2) <= 14249)
            the_vectorNight(2) = 14;
            word=strcat(word,'n'); 
        elseif(the_vector(2) >= 14250 && the_vector(2) <= 15265)
            the_vectorNight(2) = 15;
            word=strcat(word,'o'); 
        elseif(the_vector(2) >= 15266 && the_vector(2) <= 16281)
            the_vectorNight(2) = 16;
            word=strcat(word,'p'); 
        elseif(the_vector(2) >= 16282 && the_vector(2) <= 17297)
            the_vectorNight(2) = 17;
            word=strcat(word,'q'); 
        elseif(the_vector(2) >= 17298 && the_vector(2) <= 18313)
            the_vectorNight(2) = 18;
            word=strcat(word,'r'); 
        elseif(the_vector(2) >= 18314 && the_vector(2) <= 19329)
            the_vectorNight(2) = 19;
            word=strcat(word,'s'); 
        elseif(the_vector(2) >= 19330 && the_vector(2) <= 20345)
             the_vectorNight(2) = 20;
            word=strcat(word,'t'); 
        elseif(the_vector(2) >= 20346 && the_vector(2) <= 21361)
            the_vectorNight(2) = 21;
            word=strcat(word,'u'); 
        elseif(the_vector(2) >= 21362 && the_vector(2) <= 22377)
            the_vectorNight(2) = 22;
            word=strcat(word,'v'); 
        elseif(the_vector(2) >= 22378 && the_vector(2) <= 23393)
            the_vectorNight(2) = 23;
            word=strcat(word,'w'); 
        elseif(the_vector(2) >= 23394 && the_vector(2) <= 24409)
            the_vectorNight(2) = 24;
            word=strcat(word,'x');
        elseif(the_vector(2) >= 24410 && the_vector(2) <= 25425)
            the_vectorNight(2) = 25;
            word=strcat(word,'y'); 
        elseif(the_vector(2) >= 25426 && the_vector(2) <= 26441)
            the_vectorNight(2) = 26;
            word=strcat(word,'z'); 
        end

        if(the_vector(3) >= 27 && the_vector(3) <= 1042)
            the_vectorNight(3) = 1;
            word=strcat(word,'a');
        elseif(the_vector(3) >= 1043 && the_vector(3) <= 2058)
            the_vectorNight(3) = 2;
            word=strcat(word,'b');       
        elseif(the_vector(3) >= 2059 && the_vector(3) <= 3074)
            the_vectorNight(3) = 3;
            word=strcat(word,'c');     
        elseif(the_vector(3) >= 3075 && the_vector(3) <= 4089)
             the_vectorNight(3) = 4;
            word=strcat(word,'d'); 
        elseif(the_vector(3) >= 4090 && the_vector(3) <= 5105)
             the_vectorNight(3) = 5;
            word=strcat(word,'e'); 
        elseif(the_vector(3) >= 5106 && the_vector(3) <= 6121)
              the_vectorNight(3) = 6;
            word=strcat(word,'f'); 
        elseif(the_vector(3) >= 6122 && the_vector(3) <= 7137)
              the_vectorNight(3) = 7;
            word=strcat(word,'g'); 
        elseif(the_vector(3) >= 7138 && the_vector(3) <= 8153)
            the_vectorNight(3) = 8;
            word=strcat(word,'h'); 
        elseif(the_vector(3) >= 8154 && the_vector(3) <= 9169)
            the_vectorNight(3) = 9;
            word=strcat(word,'i'); 
        elseif(the_vector(3) >= 9170 && the_vector(3) <= 10185)
            the_vectorNight(3) = 10;
            word=strcat(word,'j'); 
        elseif(the_vector(3) >= 10186 && the_vector(3) <= 11201)
            the_vectorNight(3) = 11;
            word=strcat(word,'k'); 
        elseif(the_vector(3) >= 11202 && the_vector(3) <= 12217)
            the_vectorNight(3) = 12;
            word=strcat(word,'l'); 
        elseif(the_vector(3) >= 12218 && the_vector(3) <= 13233)
            the_vectorNight(3) = 13;
            word=strcat(word,'m'); 
        elseif(the_vector(3) >= 13234 && the_vector(3) <= 14249)
             the_vectorNight(3) = 14;
            word=strcat(word,'n'); 
        elseif(the_vector(3) >= 14250 && the_vector(3) <= 15265)
            the_vectorNight(3) = 15;
            word=strcat(word,'o'); 
        elseif(the_vector(3) >= 15266 && the_vector(3) <= 16281)
             the_vectorNight(3) = 16;
            word=strcat(word,'p'); 
        elseif(the_vector(3) >= 16282 && the_vector(3) <= 17297)
             the_vectorNight(3) = 17;
            word=strcat(word,'q'); 
        elseif(the_vector(3) >= 17298 && the_vector(3) <= 18313)
             the_vectorNight(3) = 18;
            word=strcat(word,'r'); 
        elseif(the_vector(3) >= 18314 && the_vector(3) <= 19329)
             the_vectorNight(3) = 19;
            word=strcat(word,'s'); 
        elseif(the_vector(3) >= 19330 && the_vector(3) <= 20345)
             the_vectorNight(3) = 20;
            word=strcat(word,'t'); 
        elseif(the_vector(3) >= 20346 && the_vector(3) <= 21361)
            the_vectorNight(3) = 21;
            word=strcat(word,'u'); 
        elseif(the_vector(3) >= 21362 && the_vector(3) <= 22377)
            the_vectorNight(3) = 22;
            word=strcat(word,'v'); 
        elseif(the_vector(3) >= 22378 && the_vector(3) <= 23393)
            the_vectorNight(3) = 23;
            word=strcat(word,'w'); 
        elseif(the_vector(3) >= 23394 && the_vector(3) <= 24409)
            the_vectorNight(3) = 24;
            word=strcat(word,'x');
        elseif(the_vector(3) >= 24410 && the_vector(3) <= 25425)
            the_vectorNight(3) = 25;
            word=strcat(word,'y'); 
        elseif(the_vector(3) >= 25426 && the_vector(3) <= 26441)
             the_vectorNight(3) = 26;
            word=strcat(word,'z'); 
        end
 
        if(the_vector(4) >= 27 && the_vector(4) <= 1042)
            the_vectorNight(4) = 1;
            word=strcat(word,'a');
        elseif(the_vector(4) >= 1043 && the_vector(4) <= 2058)
            the_vectorNight(4) = 2;
            word=strcat(word,'b');       
        elseif(the_vector(4) >= 2059 && the_vector(4) <= 3074)
            the_vectorNight(4) = 3;
            word=strcat(word,'c');     
        elseif(the_vector(4) >= 3075 && the_vector(4) <= 4089)
            the_vectorNight(4) = 4;
            word=strcat(word,'d'); 
        elseif(the_vector(4) >= 4090 && the_vector(4) <= 5105)
             the_vectorNight(4) = 5;
            word=strcat(word,'e'); 
        elseif(the_vector(4) >= 5106 && the_vector(4) <= 6121)
            the_vectorNight(4) = 6;
            word=strcat(word,'f'); 
        elseif(the_vector(4) >= 6122 && the_vector(4) <= 7137)
            the_vectorNight(4) = 7;
            word=strcat(word,'g'); 
        elseif(the_vector(4) >= 7138 && the_vector(4) <= 8153)
            the_vectorNight(4) = 8;
            word=strcat(word,'h'); 
        elseif(the_vector(4) >= 8154 && the_vector(4) <= 9169)
            the_vectorNight(4) = 9;
            word=strcat(word,'i'); 
        elseif(the_vector(4) >= 9170 && the_vector(4) <= 10185)
            the_vectorNight(4) = 10;
            word=strcat(word,'j'); 
        elseif(the_vector(4) >= 10186 && the_vector(4) <= 11201)
            the_vectorNight(4) = 11;
            word=strcat(word,'k'); 
        elseif(the_vector(4) >= 11202 && the_vector(4) <= 12217)
            the_vectorNight(4) = 12;
            word=strcat(word,'l'); 
        elseif(the_vector(4) >= 12218 && the_vector(4) <= 13233)
            the_vectorNight(4) = 13;
            word=strcat(word,'m'); 
        elseif(the_vector(4) >= 13234 && the_vector(4) <= 14249)
            the_vectorNight(4) = 14;
            word=strcat(word,'n'); 
        elseif(the_vector(4) >= 14250 && the_vector(4) <= 15265)
            the_vectorNight(4) = 15;
            word=strcat(word,'o'); 
        elseif(the_vector(4) >= 15266 && the_vector(4) <= 16281)
            the_vectorNight(4) = 16;
            word=strcat(word,'p'); 
        elseif(the_vector(4) >= 16282 && the_vector(4) <= 17297)
            the_vectorNight(4) = 17;
            word=strcat(word,'q'); 
        elseif(the_vector(4) >= 17298 && the_vector(4) <= 18313)
            the_vectorNight(4) = 18;
            word=strcat(word,'r'); 
        elseif(the_vector(4) >= 18314 && the_vector(4) <= 19329)
             the_vectorNight(4) = 19;
            word=strcat(word,'s'); 
        elseif(the_vector(4) >= 19330 && the_vector(4) <= 20345)
             the_vectorNight(4) = 20;
            word=strcat(word,'t'); 
        elseif(the_vector(4) >= 20346 && the_vector(4) <= 21361)
             the_vectorNight(4) = 21;
            word=strcat(word,'u'); 
        elseif(the_vector(4) >= 21362 && the_vector(4) <= 22377)
             the_vectorNight(4) = 22;
            word=strcat(word,'v'); 
        elseif(the_vector(4) >= 22378 && the_vector(4) <= 23393)
             the_vectorNight(4) = 23;
            word=strcat(word,'w'); 
        elseif(the_vector(4) >= 23394 && the_vector(4) <= 24409)
            the_vectorNight(4) = 24;
            word=strcat(word,'x');
        elseif(the_vector(4) >= 24410 && the_vector(4) <= 25425)
             the_vectorNight(4) = 25;
            word=strcat(word,'y'); 
        elseif(the_vector(4) >= 25426 && the_vector(4) <= 26441)
             the_vectorNight(4) = 26;
            word=strcat(word,'z'); 
        end
        
        if(the_vector(5) >= 27 && the_vector(5) <= 1042)
            the_vectorNight(5) = 1;
            word=strcat(word,'a');
        elseif(the_vector(5) >= 1043 && the_vector(5) <= 2058)
            the_vectorNight(5) = 2;
            word=strcat(word,'b');       
        elseif(the_vector(5) >= 2059 && the_vector(5) <= 3074)
             the_vectorNight(5) = 3;
            word=strcat(word,'c');     
        elseif(the_vector(5) >= 3075 && the_vector(5) <= 4089)
             the_vectorNight(5) = 4;
            word=strcat(word,'d'); 
        elseif(the_vector(5) >= 4090 && the_vector(5) <= 5105)
            the_vectorNight(5) = 5;
            word=strcat(word,'e'); 
        elseif(the_vector(5) >= 5106 && the_vector(5) <= 6121)
             the_vectorNight(5) = 6;
            word=strcat(word,'f'); 
        elseif(the_vector(5) >= 6122 && the_vector(5) <= 7137)
             the_vectorNight(5) = 7;
            word=strcat(word,'g'); 
        elseif(the_vector(5) >= 7138 && the_vector(5) <= 8153)
            the_vectorNight(5) = 8;
            word=strcat(word,'h'); 
        elseif(the_vector(5) >= 8154 && the_vector(5) <= 9169)
            the_vectorNight(5) = 9;
            word=strcat(word,'i'); 
        elseif(the_vector(5) >= 9170 && the_vector(5) <= 10185)
             the_vectorNight(5) = 10;
            word=strcat(word,'j'); 
        elseif(the_vector(5) >= 10186 && the_vector(5) <= 11201)
             the_vectorNight(5) = 11;
            word=strcat(word,'k');
        elseif(the_vector(5) >= 11202 && the_vector(5) <= 12217)
            the_vectorNight(5) = 12;
            word=strcat(word,'l'); 
        elseif(the_vector(5) >= 12218 && the_vector(5) <= 13233)
            the_vectorNight(5) = 13;
            word=strcat(word,'m'); 
        elseif(the_vector(5) >= 13234 && the_vector(5) <= 14249)
            the_vectorNight(5) = 14;
            word=strcat(word,'n'); 
        elseif(the_vector(5) >= 14250 && the_vector(5) <= 15265)
            the_vectorNight(5) = 15;
            word=strcat(word,'o'); 
        elseif(the_vector(5) >= 15266 && the_vector(5) <= 16281)
            the_vectorNight(5) = 16;
            word=strcat(word,'p'); 
        elseif(the_vector(5) >= 16282 && the_vector(5) <= 17297)
            the_vectorNight(5) = 17;
            word=strcat(word,'q'); 
        elseif(the_vector(5) >= 17298 && the_vector(5) <= 18313)
            the_vectorNight(5) = 18;
            word=strcat(word,'r'); 
        elseif(the_vector(5) >= 18314 && the_vector(5) <= 19329)
            the_vectorNight(5) = 19;
            word=strcat(word,'s'); 
        elseif(the_vector(5) >= 19330 && the_vector(5) <= 20345)
            the_vectorNight(5) = 20;
            word=strcat(word,'t'); 
        elseif(the_vector(5) >= 20346 && the_vector(5) <= 21361)
            the_vectorNight(5) = 21;
            word=strcat(word,'u'); 
        elseif(the_vector(5) >= 21362 && the_vector(5) <= 22377)
            the_vectorNight(5) = 22;
            word=strcat(word,'v'); 
        elseif(the_vector(5) >= 22378 && the_vector(5) <= 23393)
            the_vectorNight(5) = 23;
            word=strcat(word,'w'); 
        elseif(the_vector(5) >= 23394 && the_vector(5) <= 24409)
            the_vectorNight(5) = 24;
            word=strcat(word,'x');
        elseif(the_vector(5) >= 24410 && the_vector(5) <= 25425)
            the_vectorNight(5) = 25;
            word=strcat(word,'y'); 
        elseif(the_vector(5) >= 25426 && the_vector(5) <= 26441)
            the_vectorNight(5) = 26;
            word=strcat(word,'z'); 
        end
        
    end
    
    
    %--------------------------------------------------------------
    
    
    word = strcat(word,'.png');
    imgids = the_vector;
    if(differentFont_flag == 1)
        imgidsNight = the_vectorNight;
        imgidsNight = [imgidsNight, imgidsNight(1:5)];
    end
    imgids = [imgids, imgids(1:5)];
    fprintf('Now generating %d pair out of %d \n',j,numimgs)
    
    rowindx = 1;
    colindx = 1;
    colindx2 = 1;
    dummyimageDay = ones(256,51.2*5,3);
    dummyimageDay = im2uint8(dummyimageDay);
    dummyimageNight = ones(256,51.2*5,3);
    dummyimageNight = im2uint8(dummyimageNight);

    
    Day = '\Day';
    Night = '\Night';
    Daypath = strcat(savedir,Day);
    Nightpath = strcat(savedir,Night);
    wordnameD = fullfile(Daypath, sprintf(word,j));
    wordnameN = fullfile(Nightpath, sprintf(word,j));
    savenameD = fullfile(Daypath, sprintf('%04d.jpg',j));
    savenameN = fullfile(Nightpath, sprintf('%04d.jpg',j));
    
    for i=1:5
        % get image
        dumid = imgids(i);
        if(sameFont_flag == 1)
            imgname = [imdir2 '\' sprintf('%02d.jpg', dumid)];
        elseif(differentFont_flag == 1)
            dumidNight = imgidsNight(i);
            imgname = [imdir3 '\' sprintf('%d.jpg', dumid)];
            imgnameNight = [imdir2 '\' sprintf('%02d.jpg', dumidNight)];
            smallimNight = imread(imgnameNight);
        end
        smallim = imread(imgname);
        
        if(differentFont_flag == 1)
            smallim = 255 * uint8(smallim);
            smallim = cat(3, smallim, smallim, smallim);
        end
        
        smallim2 = smallim;
        if(rotatedCharacters_flag == 1)
            smallim = imcomplement(smallim); 
        end
        
        if(texturedCharacters_flag == 1)
            [h2,w2,d2]=size(smallim);
                img = uint8(imresize(img, [h2,w2]));
                for k =1:d2
                        for i = 1:h2
                            for j = 1:w2
                                if(rotatedCharacters_flag == 1)
                                    if(smallim(i,j,k) ~= 0)
                                        smallim(i,j,k) = img(i,j,k);
                                    end
                                elseif(rotatedCharacters_flag == 0)
                                    if(smallim(i,j,k) ~= 255)
                                        smallim(i,j,k) = img(i,j,k);
                                    end
                                end
                            end
                        end
                end
        end
        
        % get random transformation parameters
        if(rotatedCharacters_flag == 1)
                    rotationAngle = randi([0 rotationDegrees]);
                    theta = rotationAngle*rand(1);
        elseif(nonrotatedCharacters_flag == 1)
                    theta = 0;
        end
        %     H = [cos(theta) -sin(theta) 0;...
        %          sin(theta)  cos(theta) 0;...
        %          0           0          1];
        
        % transform image
        tform = affine2d([cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1]);
        tform2 = affine2d([cosd(0) -sind(0) 0; sind(0) cosd(0) 0; 0 0 1]);
        J = imwarp(smallim,tform);
        if(differentFont_flag == 1)
            J2 = imwarp(smallimNight,tform2);
        elseif(sameFont_flag == 1)
            J2 = imwarp(smallim2,tform2);
        end
        if(differentFontSize_flag == 1)
            font_size_value1 = randi([35 52]);
            font_size_value2 = randi([200 256]);
            J = imresize(J,[font_size_value2 font_size_value1]);
        elseif(sameFontSize_flag == 1)
            J = imresize(J,[256 52]);
        end
        J2 = imresize(J2,[256 52]);
%         imshow(J);
        %     if doDisplay
        %         figure(100), imshow(smallim), figure(200), imshow(J);
        %         close(100); close(200);
        %     end
        
        % append images
        if(sameFontSize_flag == 1)
            dummyimageDay(rowindx:rowindx+255, colindx:colindx+51,:) = J;
        elseif(differentFontSize_flag == 1)
            dummyimageDay(rowindx:rowindx+(font_size_value2-1), colindx:colindx+(font_size_value1-1),:) = J;
        end
        dummyimageNight(rowindx:rowindx+255, colindx2:colindx2+51,:) = J2;        
        % append the occluder
%         if dumid>=5016 && dumid <= 6118 || dumid == 26
%             Jocclude = imwarp(occluderimg,tform);
%             if(sameFontSize_flag == 1)
%                 Jocclude = imresize(Jocclude,[256 52]);
%                 dummyimageNight(rowindx:rowindx+255, colindx:colindx+51,:) = Jocclude;
%             elseif(differentFontSize_flag == 1)
%                 Jocclude = imresize(Jocclude,[font_size_value2 font_size_value1]);
%                 dummyimageNight(rowindx:rowindx+(font_size_value2-1), colindx:colindx+(font_size_value1-1),:) = Jocclude;
%             end
%         end
        
       if(sameFontSize_flag == 1)
          colindx = colindx + 51;      
       elseif(differentFontSize_flag == 1)
          colindx = colindx +(font_size_value1-1);
       end
       colindx2 = colindx2 + 51;
        if colindx == 257
            rowindx = rowindx +255;
            colindx = 1;
        end
        
    end
     
    %     if doDisplay
        %         figure(100), imshow(smallim), figure(200), imshow(J);
        %         close(100); close(200);
        %     end
        dummyimageDay = imresize(dummyimageDay,[256 256]);
        if(imageBackground_flag == 1 || randomBackground_flag == 1)
            [h3,w3,d3]=size(dummyimageDay);
            if(texturedCharacters_flag == 1)
                img = uint8(imresize(img, [h3,w3]));
            end
            for k =1:d3
                    for i = 1:h3
                        for j = 1:w3
                            if(rotatedCharacters_flag==0)
                                if(dummyimageDay(i,j,k) == 255)
                                    if(imageBackground_flag == 1)
                                        dummyimageDay(i,j,k) = img1(i,j,k);
                                    end
                                    if(randomBackground_flag == 255)
                                        random_number = randi([0 255]);
                                        dummyimageDay(i,j,k) = random_number;
                                    end
                                end
                            elseif(rotatedCharacters_flag == 1)
                                if(dummyimageDay(i,j,k) == 0)
                                    if(imageBackground_flag == 1)
                                        dummyimageDay(i,j,k) = img1(i,j,k);
                                    end
                                    if(randomBackground_flag == 255)
                                        random_number = randi([0 255]);
                                        dummyimageDay(i,j,k) = random_number;
                                    end
                                end
                            end
                        end
                    end
            end
        end 
%         dummyimageNight = imresize(dummyimageNight,[256 256]);
%         if(imageBackground_flag == 1 || randomBackground_flag == 1)
%             [h4,w4,d4]=size(dummyimageNight);
%             if(texturedCharacters_flag == 1)
%                 img1 = uint8(imresize(img1, [h4,w4]));
%             end
%             for k =1:d4
%                     for i = 1:h4
%                         for j = 1:w4
%                             if(dummyimageNight(i,j,k) == 0)
%                                 if(imageBackground_flag == 1)
%                                     dummyimageNight(i,j,k) = img1(i,j,k);
%                                 end
%                                 if(randomBackground_flag == 1)
%                                     random_number = randi([0 255]);
%                                     dummyimageNight(i,j,k) = random_number;
%                                 end
%                             end
%                         end
%                     end
%             end
%         end
%         imwrite(dummyimageDay,savenameD,'jpg');
%         imwrite(dummyimageNight,savenameN,'jpg');

        imwrite(dummyimageDay,wordnameD,'png');
        imwrite(dummyimageNight,wordnameN,'png');

end
