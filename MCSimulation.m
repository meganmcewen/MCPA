%constants
n = 10; %number of electrons
timeStep = 1; %amount of time between updates
force = 1; %force on particle
m0 = 9.10938215e-31; %electron mass
probScatter = 0.05; %probability of scatter
time = 0;

%generate empty arrays
Px = zeros(n,1);
Py = zeros(n,1);
V = zeros(n,1);


for i = 1:1000
 
    V = V + (force/m0)*timeStep; %initial velocity
   
    %determine whether to scatter
    randMin = 0;
    randMax = 1;
    r = (randMax-randMin).*rand(n,1);
    
    id = (r<=probScatter);
        V(id) = 0;
       
    %calculate new position
    Px = Px + V*timeStep;
    Py = Py + V*timeStep;
  
    %calculate drift velocity
    VDrift = mean(V);
    
    %calculate time
    time = time+timeStep;
    
    %plot
    figure(1)
    title(['Drift Velocity: ',num2str(VDrift),'m/s']);
    scatter(Px,Py)
    drawnow
    hold on
    
    
    figure(2)
    plot(time, V,'o')
    hold on
    
    pause(0.5)
    
end
