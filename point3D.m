close all;clear all;clc   
data=importdata('C:/Users/Administrator/Desktop/point3D.txt');   
%  img=imread('C:/Users/Administrator/Desktop/imgl2.png');   
% %img=rgb2gray(img1);
% x=data(:,1); y=data(:,2); z=data(:,3);   
% ind=find(z==0);   
% x(ind)=NaN; y(ind)=NaN; z(ind)=NaN;   
% x = reshape(x,[1024 1280])'; % ����д��ʱ�����н��еģ���Matlab�����ж�ȡ 
% y = -reshape(y,[1024 1280])'; 
% z = reshape(z,[1024 1280])'; 
% 
% figure();   
% mesh(x,z,y,double(img'),'FaceColor','texturemap'); %img�����ػҶ�ֵ����meshͼ������ӳ��   
% colormap(gray); % imgͼ�ǻҶ�ͼ���� colormap Ϊ gray   
% axis equal; axis([-1000 1000 0 9000 -500 2000]);   
% xlabel('Horizonal');ylabel('Depth');zlabel('Vertical');   
% view([0 90]); % �ӽ�[0,90]�������Ϸ�����  

xdata=data(:,1);ydata=data(:,2);zdata = data(:,3);  
xdata=-xdata;  
% ��ʾ���ͼ  
figure(1);  
depth=reshape(zdata, [1280 1024]);  
mesh(depth);  
% ��ʾ�ع�����ά����  
figure(2);  
[cx,cy] = meshgrid(min(xdata(:)):max(xdata(:)), ...  
                    min(ydata(:)):max(ydata(:)));  
cz=griddata(xdata,ydata,zdata,cx,cy,'cubic');  
mesh(cx,cy,cz);  
xlabel('Width');    ylabel('Height');   zlabel('Depth');  



