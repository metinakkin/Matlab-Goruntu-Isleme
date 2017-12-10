clear all;
close all;
clc;
delete(instrfindall);

comport=serial('COM9','BaudRate',115200,'DataBits',8);
set(comport,'Parity','none');

fopen(comport);
while(1)
x1=1;
x2=2;
x3=3;
x4=4;
x5=5;

vid = videoinput('winvideo',2);%Kullanýlabilir video kaynaðý belirleniyor
preview(vid);%Video figurede gösteriliyor
resim=getsnapshot(vid);%video nesnesinde bir resim çekiliyor
subplot(2,2,1);
imshow(resim);%RGB renk uzayýnda resim
title('RGB renk uzayýnda resim');%Renk dönüþümü yapýlmýþ resim ekrana basýlýyor
resim_r=resim(:,:,1);%Resimin kýrmýzý renk bileþeni belirleniyor
resim_g=resim(:,:,2);%Resimin yeþil renk bileþeni belirleniyor
resim_b=resim(:,:,3);%Resimin mavi renk bileþeni belirleniyor
subplot(2,2,2);
imshow(resim_r);title('Kirmizi bilesenler');%Resimin kýrmýzý renk bileþeni ekrana basýlýyor
subplot(2,2,3);
imshow(resim_g);title('Yesil bilesenler');%Resimin yeþil renk bileþeni ekrana basýlýyor
subplot(2,2,4);
imshow(resim_b);title('Mavi bilesenler');%Resimin mavi renk bileþeni ekrana basýlýyor
maske1=(resim_r>130)&(resim_r<155)& (resim_g>50)&(resim_g<70)& (resim_b>60)&(resim_b<80); %Kýrmýzý nesnenin açýða çýkartýlmasý için maske oluþturuluyor
maske2=(resim_r>110)&(resim_r<140)& (resim_g>130)&(resim_g<160)& (resim_b>80)&(resim_b<120); %Yeþil nesnenin açýða çýkartýlmasý için maske oluþturuluyor
maske3=(resim_r>60)&(resim_r<100)& (resim_g>120)&(resim_g<160)& (resim_b>140)&(resim_b<180); %Mavi nesnenin açýða çýkartýlmasý için maske oluþturuluyor
maske4=(resim_r>150)&(resim_r<185)& (resim_g>120)&(resim_g<185)& (resim_b>70)&(resim_b<120); %Sarý nesnenin açýða çýkartýlmasý için maske oluþturuluyor
maske5=(resim_r>160)&(resim_r<255)& (resim_g>160)&(resim_g<250)& (resim_b>160)&(resim_b<255); %Beyaz nesnenin açýða çýkartýlmasý için maske oluþturuluyor
figure;
subplot(2,3,1);
imshow(maske1);title('Maske1');%Maske1 resmi ekrana basýlýyor
toplam1=sum(sum(maske1));%Maskedeki toplam beyaz piksel sayýsý belirleniyor
subplot(2,3,2);
imshow(maske2);title('Maske2');%Maske2 resmi ekrana basýlýyor
toplam2=sum(sum(maske2));%Maskedeki toplam beyaz piksel sayýsý belirleniyor
subplot(2,3,3);
imshow(maske3);title('Maske3');%Maske3 resmi ekrana basýlýyor
toplam3=sum(sum(maske3));%Maskedeki toplam beyaz piksel sayýsý belirleniyor
subplot(2,3,4);
imshow(maske4);title('Maske4');%Maske4 resmi ekrana basýlýyor
toplam4=sum(sum(maske4));%Maskedeki toplam beyaz piksel sayýsý belirleniyor
subplot(2,3,5);
imshow(maske5);title('Maske5');%Maske5 resmi ekrana basýlýyor
toplam5=sum(sum(maske5));%Maskedeki toplam beyaz piksel sayýsý belirleniyor



if (toplam1>50000)%Toplam1 deðeri 20 den büyük ise led yakýlýyor
fprintf(comport,'%d',x1);
toplam1
end
if (toplam2>50000)%Toplam2 deðeri 20 den büyük ise led yakýlýyor
fprintf(comport,'%d',x2);
toplam2
end
if (toplam3>50000)%Toplam3 deðeri 20 den büyük ise led yakýlýyor
fprintf(comport,'%d',x3);
toplam3
end
if (toplam4>50000)%Toplam4 deðeri 20 den büyük ise led yakýlýyor
fprintf(comport,'%d',x4);
toplam4;
end
if (toplam5>50000)%Toplam5 deðeri 20 den büyük ise led yakýlýyor
fprintf(comport,'%d',x5);
toplam5
end



end


 fclose(comport);
 delete(comport);