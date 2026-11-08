%% This section edits the arm length and the positions
L1 = 5;
L2 = 10;

dbstart = 10;
djstart = 180;

dbend=270;
djend=45;

%% This section calcualtes the angeld for the animation
N=30;
% Find shortest angular displacement
diffb = mod(dbend - dbstart + 180, 360) - 180;
diffj = mod(djend - djstart + 180, 360) - 180;

% Create shortest rotation paths
rangeb = linspace(dbstart, dbstart + diffb, N);
rangej = linspace(djstart, djstart + diffj, N);
%% 

[x1,y1,D1]= armOnePosition(dbstart,L1);
[x2,y2,D2]= armTwoPosition(djstart,D1,L1,L2,x1(1),y1(1));
cla
hold on
plot(x1,y1,"ro-",LineWidth=3)
plot(x2,y2,"go-",LineWidth=3)

grid on
axis([-18 18 -18 18]); 
xline(0, 'B', 'LineWidth', 1.2); 
yline(0, 'B', 'LineWidth', 1.2);
pause(1.5)
%% 
for v= 1:N
    cla
    hold on
    [x1,y1,D1]= armOnePosition(rangeb(v),L1);
    [x2,y2,D2]= armTwoPosition(rangej(v),D1,L1,L2,x1(1),y1(1));
    plot(x1,y1,"ro-",LineWidth=3)
    plot(x2,y2,"go-",LineWidth=3)
    hold off

grid on
axis([-18 18 -18 18]); 
xline(0, 'B', 'LineWidth', 1.2); 
yline(0, 'B', 'LineWidth', 1.2); 
drawnow
end
function [armx,army,NatDegree] = armTwoPosition(degree,degree2,Arm1,Arm2,JointPointx,JointPointy)
    NatDegree= (degree-180);  %lets you input the degreebetween the arms
    armx = [(Arm2 * cosd(NatDegree+degree2))+(Arm1 * cosd(degree2)),JointPointx];
    army = [(Arm2 * sind(NatDegree+degree2))+(Arm1 * sind(degree2)),JointPointy];
    
end
function [arm1x,arm1y,NatDegree] = armOnePosition(degree,Arm)
    NatDegree= 90-degree;  %lets you messure with the 0 position being stregiht forward
    arm1x = [Arm * cosd(NatDegree),0];
    arm1y = [Arm * sind(NatDegree),0];
    
end