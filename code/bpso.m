clear
load DataTrn
load DataTst

nPart = 15; % número de particulas
Dim = 41; % dimensión de las caracteristicas
swarm = randi([0 1],[nPart Dim]);

pFitness = ones(1,nPart)*inf;
gFitness = inf;
pBest = zeros(nPart,Dim);
gBest = zeros(nPart,Dim);

%weas de nibaldo
Vp = zeros(nPart,Dim);
Vmax = 4;
c1 = 2.05; % coeficiente 1
c2 = 2.05; % coeficiente 2
maxIter = 5;
wMax = 0.9;
wMin = 0.4;

w = wMax - ((wMax-wMin)./maxIter).*(1:maxIter); % pesos de inercia hasta la i-esima iteracion

for i=1:maxIter
    
    %evaluacion del enjambre
    fitness = costo(swarm,x,y,xv,yv); %funcion de fitness
    Indx = find(fitness<pFitness); %indices del arreglo pFitness que son mayores que fitness(i)
    
    if(numel(Indx)>0)
        pFitness(Indx) = fitness(Indx);
        pBest(Indx,:) = swarm(Indx,:);
    end
    
    % obtenemos el fitness más pequeño de las particulas del enjambre
    % (global fitness)
    [Gfitness,indx] = min(fitness); 
    
    % si el nuevo global fitness es mejor que el global fitness anterior,
    % lo actualizo
    if(Gfitness<gFitness)
        gFitness = Gfitness;
        gBest = swarm(indx,:); % tomo la indx particula del nuevo gFitness
    end
    
    % velocidades
    cog = c1*diag(rand(1,nPart))*(pBest-swarm);
    soc = c2*diag(rand(1,nPart))*(repmat(gBest,nPart,1)-swarm);
    Vp = w(i) * Vp + cog + soc; % i-esimo peso por la velocidad anterior, más el componente cognitivo y el componente social
    
    % si una velocidad excede la velocidad máxima, entonces se le asigna el máximo
    % permitido
    Vp(Vp<-Vmax) = -Vmax;
    Vp(Vp>Vmax) = Vmax;
    
    % resultado de la función de transferencia con las velocidades
    s = f_transfer(Vp,1);
    
    for j=1:nPart
        mayores = s(j,:)>rand;
        ind = find(mayores==1);
        swarm(j,ind) = 1;
    end
    
   %aqui va el prin efe
end
save optimo gBest