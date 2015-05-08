clear all;
close all;
%program tp find the SW astroid plane for stable solutions.
%the program can be extended further to give us nice loops.
%Debi prasad Pattnaik,www.debipattnaik.com
%..........
H0=input('Field to apply in mT  '); %field value
theta0=input('Angle between the field and the easy axis (in degrees)  ');%angle between field and OZ axis
dtheta=9;hx4=[];
Hz=H0*cosd(theta0); %z com[ponent of field applied
Hx=H0*sind(theta0); %x-component of field applied
theta=0:dtheta:360; % theta values
W1=(cosd(theta).^2)-2*H0*cosd(theta-theta0);
W2=(cosd(theta).^2)-2*Hz*cosd(theta)-2*Hx*sind(theta); %including the cos and sine component
dw=gradient(W2)./dtheta;
d2w=gradient(dw)./dtheta;
Hz2=-cosd(theta).^3;
Hx2=sind(theta).^3;
plot(Hx2,Hz2,'LineWidth',4); %equation of astroid in Hx,Hz plane
hold on;

Hx3=Hz*tand(theta)+sind(theta); %equation number 14 in the manual
Hx4=(Hz./tand(theta))- (cosd(2*theta)./sind(theta)); %equation number 15 
%plot(Hx3,Hx4);
%plot(theta,Hx4,'*');
%line(theta,Hx4)
l=max(theta)/dtheta; % control variable
for i=1:l/4
    pause(0.5);
   % [hx4]=[hx4,(-Hz./tand(theta(i)))- (cosd(2*theta(i)./sind(theta(i))))];
    quiver(Hx2(i),Hz2(i),Hx3(i),Hx4(i),2);
   % M(i)=getframe;
    %   axis equal;
   axis([-1,1,-1,1]);
    
end
for i=l/4:1:l/2
    pause(0.5);
     quiver(Hx2(i),Hz2(i),Hx3(i),Hx4(i),2);
   % M(i)=getframe;
 %   axis equal;
   axis([-1,1,-1,1]);
    
end
for i=l/2:1:3*l/4
    pause(0.5);
     quiver(Hx2(i),Hz2(i),Hx3(i),Hx4(i),2);
   % M(i)=getframe;
 %   axis equal;
  axis([-1,1,-1,1]);
    
end
for i=3*l/4:1:l
    pause(0.5);
     quiver(Hx2(i),Hz2(i),Hx3(i),Hx4(i),2);
    %M(i)=getframe;
 %   axis equal;
 axis([-1,1,-1,1]);
    
end


%movie(M);
%hold on
%plot(Hx4(i),'r');
