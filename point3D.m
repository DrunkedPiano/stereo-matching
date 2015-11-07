close all;clear all;clc   
data=importdata('C:/Users/Administrator/Desktop/point3D.txt');   
%  img=imread('C:/Users/Administrator/Desktop/imgl2.png');   
% %img=rgb2gray(img1);
% x=data(:,1); y=data(:,2); z=data(:,3);   
% ind=find(z==0);   
% x(ind)=NaN; y(ind)=NaN; z(ind)=NaN;   
% x = reshape(x,[1024 1280])'; % 数据写入时是逐行进行的，而Matlab是逐列读取 
% y = -reshape(y,[1024 1280])'; 
% z = reshape(z,[1024 1280])'; 
% 
% figure();   
% mesh(x,z,y,double(img'),'FaceColor','texturemap'); %img的像素灰度值用于mesh图的纹理映射   
% colormap(gray); % img图是灰度图，故 colormap 为 gray   
% axis equal; axis([-1000 1000 0 9000 -500 2000]);   
% xlabel('Horizonal');ylabel('Depth');zlabel('Vertical');   
% view([0 90]); % 视角[0,90]代表正上方俯视  

xdata=data(:,1);ydata=data(:,2);zdata = data(:,3);  
xdata=-xdata;  
% 显示深度图  
figure(1);  
depth=reshape(zdata, [1280 1024]);  
mesh(depth);  
% 显示重构的三维环境  
figure(2);  
[cx,cy] = meshgrid(min(xdata(:)):max(xdata(:)), ...  
                    min(ydata(:)):max(ydata(:)));  
cz=griddata(xdata,ydata,zdata,cx,cy,'cubic');  
mesh(cx,cy,cz);  
xlabel('Width');    ylabel('Height');   zlabel('Depth');  



