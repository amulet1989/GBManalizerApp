close all
clear all

load D:\brain_tissues.mat
T2=niftiread("D:\00Imagenes de prueba\00GRANA JOSE RICARDO\15\Anonimized\AXIT2_0801\cr_s2023-07-11_20-32-204938-00008-00001-1.nii");
%figure, imshow3D(T2);
Flair=niftiread("D:\00Imagenes de prueba\00GRANA JOSE RICARDO\9\Anonimized\eSENSEFLAIR_0402\cr_s2023-07-11_20-32-204037-00004-00001-1.nii");
figure, imshow3D(Flair);

% Convert the skull mask image to a binary image
skull_mask = imbinarize(c1+c2+c3+c4+c5);
figure, imshow3D(skull_mask)

skull_mask2 = imbinarize(c1+c2+c3);
Flair(skull_mask==1)=0;
figure, imshow3D(Flair);

[X,Y,Z]=size(skull_mask);
SE = strel('sphere',3);

skull_mask=imdilate(skull_mask,SE); %+skull_mask2;
figure, imshow3D(skull_mask)

skull_brain=zeros(X,Y,Z);

for i =1:Z
            skull_brain(:,:,i)=imfill(skull_mask(:,:,i),'holes'); 
end
SE2 = strel('sphere',1);
brain = skull_brain.*~skull_mask;
brain=imerode(brain, SE2);

figure, imshow3D(brain);

% Invert the binary image to create a mask that selects everything outside the skull
%outside_mask = imcomplement(binary_mask);

% Fill any holes in the mask
%filled_mask = imfill(outside_mask, 'holes');

% Invert the mask again to create a mask that selects everything inside the skull
%inside_mask = imcomplement(filled_mask);

%figure, imshow3D(filled_mask)




