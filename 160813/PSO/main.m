clear all;
clc;

%% System Property
Table = xlsread('lookup600.xls');

%% Initialize Particles....
%initialize 3 particles...
D = zeros(3,1);
D(1,1)=0.9;
D(2,1)=0.3;
D(3,1)=0.65;

%updating best position...
bestPos = zeros(3,2);
bestPos(1,1) = D(1,1);
bestPos(2,1) = D(2,1);
bestPos(3,1) = D(3,1);

bestPos(1,2) = getPower(D(1,1),Table);
bestPos(2,2) = getPower(D(2,1),Table);
bestPos(3,2) = getPower(D(3,1),Table);

[Y, i] = max(bestPos(:,2));
bestPosAll = bestPos(i,1);
fprintf('Initial Parameters...\nR(load) = 50 ohms\n');
    r=1;
    w=0.5;
    fprintf('r = %4.2f\nw = %4.2f\n\n---------\n',r,w);

fprintf('INITIAL Particle 1 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(1,1), getPower(D(1,1),Table));
fprintf('INITIAL Particle 2 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(2,1), getPower(D(2,1),Table));
fprintf('INITIAL Particle 3 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(3,1), getPower(D(3,1),Table));


%% Iteration
velocity = zeros(3,1);

fprintf('\n===============================================\n++++++++++++++Start of Iterations++++++++++++++\n===============================================\n')
fprintf('\n===============================================\n++++++++++++ Irrediance = 600 W/sqm ++++++++++++\n===============================================\n')


for i=1:20
    fprintf('Iteration No: %d',i)
    c1 = rand;
    c2 = rand;
    fprintf('\nc1 = %12.8f    c2 = %12.8f',c1,c2);
    %Update Velocity
    for j=1:3
        
        velocity(j,1) = w*velocity(j,1) + c1*r*(bestPos(j,1)-D(j)) + c2*r*(bestPosAll-D(j,1));
    end
    
%     for j=1:3
%         if(velocity(j,1)>0.05)
%             velocity(j,1) = 0.05;
%         else if(velocity(j,1)<-0.05)
%                 velocity(j,1) = -0.05;
%             end
%         end
%     end
    velocity
    
    % Update Position
    D(:,1) = D(:,1) + velocity(:,1);
    for j=1:3
        if(D(j,1)>1)
            D(j,1)=0.95;
        end
    end
    
    %D
    %Update Local Best
    for j=1:3
        tempPower = getPower(D(j,1),Table);
        if(tempPower>=bestPos(j,2))
            bestPos(j,2) = tempPower;
            bestPos(j,1) = D(j,1);
        end
    end
    %bestPos
    %Update Global best
    [Y, j] = max(bestPos(:,2));
    
    
    fprintf('Particle 1 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(1,1), getPower(D(1,1),Table));
    fprintf('Particle 2 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(2,1), getPower(D(2,1),Table));
    fprintf('Particle 3 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(3,1), getPower(D(3,1),Table));
    bestPosAll = bestPos(j,1);
    fprintf('\n\nUpdated best Fitness Position = %12.8f\n\n\n--------\n', bestPosAll);
    
end







%% System Property
Table = xlsread('lookup800.xls');


fprintf('Initial Parameters...\nR(load) = 50 ohms\n');
    r=1;
    w=0.5;
    fprintf('r = %4.2f\nw = %4.2f\n\n---------\n',r,w);

fprintf('INITIAL Particle 1 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(1,1), getPower(D(1,1),Table));
fprintf('INITIAL Particle 2 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(2,1), getPower(D(2,1),Table));
fprintf('INITIAL Particle 3 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(3,1), getPower(D(3,1),Table));


%% Iteration
velocity = zeros(3,1);

fprintf('\n===============================================\n++++++++++++++Start of Iterations++++++++++++++\n===============================================\n')
fprintf('\n===============================================\n++++++++++++ Irrediance = 800 W/sqm ++++++++++++\n===============================================\n')

for i=1:20
    fprintf('Iteration No: %d',i)
    c1 = rand;
    c2 = rand;
    fprintf('\nc1 = %12.8f    c2 = %12.8f',c1,c2);
    %Update Velocity
    for j=1:3
        
        velocity(j,1) = w*velocity(j,1) + c1*r*(bestPos(j,1)-D(j)) + c2*r*(bestPosAll-D(j,1));
    end
    
%     for j=1:3
%         if(velocity(j,1)>0.05)
%             velocity(j,1) = 0.05;
%         else if(velocity(j,1)<-0.05)
%                 velocity(j,1) = -0.05;
%             end
%         end
%     end
    velocity
    
    % Update Position
    D(:,1) = D(:,1) + velocity(:,1);
    for j=1:3
        if(D(j,1)>1)
            D(j,1)=0.95;
        end
    end
    
    %D
    %Update Local Best
    for j=1:3
        tempPower = getPower(D(j,1),Table);
        if(tempPower>=bestPos(j,2))
            bestPos(j,2) = tempPower;
            bestPos(j,1) = D(j,1);
        end
    end
    %bestPos
    %Update Global best
    [Y, j] = max(bestPos(:,2));
    
    
    fprintf('Particle 1 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(1,1), getPower(D(1,1),Table));
    fprintf('Particle 2 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(2,1), getPower(D(2,1),Table));
    fprintf('Particle 3 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(3,1), getPower(D(3,1),Table));
    bestPosAll = bestPos(j,1);
    fprintf('\n\nUpdated best Fitness Position = %12.8f\n\n\n--------\n', bestPosAll);
    
end








%% System Property
Table = xlsread('lookup1000.xls');


fprintf('Initial Parameters...\nR(load) = 50 ohms\n');
    r=1;
    w=0.5;
    fprintf('r = %4.2f\nw = %4.2f\n\n---------\n',r,w);

fprintf('INITIAL Particle 1 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(1,1), getPower(D(1,1),Table));
fprintf('INITIAL Particle 2 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(2,1), getPower(D(2,1),Table));
fprintf('INITIAL Particle 3 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(3,1), getPower(D(3,1),Table));


%% Iteration
velocity = zeros(3,1);

fprintf('\n===============================================\n++++++++++++++Start of Iterations++++++++++++++\n===============================================\n')
fprintf('\n===============================================\n++++++++++++ Irrediance = 1000 W/sqm ++++++++++++\n===============================================\n')

for i=1:20
    fprintf('Iteration No: %d',i)
    c1 = rand;
    c2 = rand;
    fprintf('\nc1 = %12.8f    c2 = %12.8f',c1,c2);
    %Update Velocity
    for j=1:3
        
        velocity(j,1) = w*velocity(j,1) + c1*r*(bestPos(j,1)-D(j)) + c2*r*(bestPosAll-D(j,1));
    end
    
%     for j=1:3
%         if(velocity(j,1)>0.05)
%             velocity(j,1) = 0.05;
%         else if(velocity(j,1)<-0.05)
%                 velocity(j,1) = -0.05;
%             end
%         end
%     end
    velocity
    
    % Update Position
    D(:,1) = D(:,1) + velocity(:,1);
    for j=1:3
        if(D(j,1)>1)
            D(j,1)=0.95;
        end
    end
    
    %D
    %Update Local Best
    for j=1:3
        tempPower = getPower(D(j,1),Table);
        if(tempPower>=bestPos(j,2))
            bestPos(j,2) = tempPower;
            bestPos(j,1) = D(j,1);
        end
    end
    %bestPos
    %Update Global best
    [Y, j] = max(bestPos(:,2));
    
    
    fprintf('Particle 1 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(1,1), getPower(D(1,1),Table));
    fprintf('Particle 2 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(2,1), getPower(D(2,1),Table));
    fprintf('Particle 3 ::   pos(duty)= %12.8f    fitness(Output Power)= %12.8f\n', D(3,1), getPower(D(3,1),Table));
    bestPosAll = bestPos(j,1);
    fprintf('\n\nUpdated best Fitness Position = %12.8f\n\n\n--------\n', bestPosAll);
    
end




