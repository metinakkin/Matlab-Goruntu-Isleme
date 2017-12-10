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

vid = videoinput('winvideo',2);%Kullan�labilir video kayna�� belirleniyor
preview(vid);%Video figurede g�steriliyor
resim=getsnapshot(vid);%video nesnesinde bir resim �ekiliyor
subplot(2,2,1);
imshow(resim);%RGB renk uzay�nda resim
title('RGB renk uzay�nda resim');%Renk d�n���m� yap�lm�� resim ekrana bas�l�yor
resim_r=resim(:,:,1);%Resimin k�rm�z� renk bile�eni belirleniyor
resim_g=resim(:,:,2);%Resimin ye�il renk bile�eni belirleniyor
resim_b=resim(:,:,3);%Resimin mavi renk bile�eni belirleniyor
subplot(2,2,2);
imshow(resim_r);title('Kirmizi bilesenler');%Resimin k�rm�z� renk bile�eni ekrana bas�l�yor
subplot(2,2,3);
imshow(resim_g);title('Yesil bilesenler');%Resimin ye�il renk bile�eni ekrana bas�l�yor
subplot(2,2,4);
imshow(resim_b);title('Mavi bilesenler');%Resimin mavi renk bile�eni ekrana bas�l�yor
maske1=(resim_r>130)&(resim_r<155)& (resim_g>50)&(resim_g<70)& (resim_b>60)&(resim_b<80); %K�rm�z� nesnenin a���a ��kart�lmas� i�in maske olu�turuluyor
maske2=(resim_r>110)&(resim_r<140)& (resim_g>130)&(resim_g<160)& (resim_b>80)&(resim_b<120); %Ye�il nesnenin a���a ��kart�lmas� i�in maske olu�turuluyor
maske3=(resim_r>60)&(resim_r<100)& (resim_g>120)&(resim_g<160)& (resim_b>140)&(resim_b<180); %Mavi nesnenin a���a ��kart�lmas� i�in maske olu�turuluyor
maske4=(resim_r>150)&(resim_r<185)& (resim_g>120)&(resim_g<185)& (resim_b>70)&(resim_b<120); %Sar� nesnenin a���a ��kart�lmas� i�in maske olu�turuluyor
maske5=(resim_r>160)&(resim_r<255)& (resim_g>160)&(resim_g<250)& (resim_b>160)&(resim_b<255); %Beyaz nesnenin a���a ��kart�lmas� i�in maske olu�turuluyor
figure;
subplot(2,3,1);
imshow(maske1);title('Maske1');%Maske1 resmi ekrana bas�l�yor
toplam1=sum(sum(maske1));%Maskedeki toplam beyaz piksel say�s� belirleniyor
subplot(2,3,2);
imshow(maske2);title('Maske2');%Maske2 resmi ekrana bas�l�yor
toplam2=sum(sum(maske2));%Maskedeki toplam beyaz piksel say�s� belirleniyor
subplot(2,3,3);
imshow(maske3);title('Maske3');%Maske3 resmi ekrana bas�l�yor
toplam3=sum(sum(maske3));%Maskedeki toplam beyaz piksel say�s� belirleniyor
subplot(2,3,4);
imshow(maske4);title('Maske4');%Maske4 resmi ekrana bas�l�yor
toplam4=sum(sum(maske4));%Maskedeki toplam beyaz piksel say�s� belirleniyor
subplot(2,3,5);
imshow(maske5);title('Maske5');%Maske5 resmi ekrana bas�l�yor
toplam5=sum(sum(maske5));%Maskedeki toplam beyaz piksel say�s� belirleniyor



if (toplam1>50000)%Toplam1 de�eri 20 den b�y�k ise led yak�l�yor
fprintf(comport,'%d',x1);
toplam1
end
if (toplam2>50000)%Toplam2 de�eri 20 den b�y�k ise led yak�l�yor
fprintf(comport,'%d',x2);
toplam2
end
if (toplam3>50000)%Toplam3 de�eri 20 den b�y�k ise led yak�l�yor
fprintf(comport,'%d',x3);
toplam3
end
if (toplam4>50000)%Toplam4 de�eri 20 den b�y�k ise led yak�l�yor
fprintf(comport,'%d',x4);
toplam4;
end
if (toplam5>50000)%Toplam5 de�eri 20 den b�y�k ise led yak�l�yor
fprintf(comport,'%d',x5);
toplam5
end



end


 fclose(comport);
 delete(comport);