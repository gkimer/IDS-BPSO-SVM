function [fit] = costo(swarm,x,y,xv,yv)
    fit = zeros(1,size(swarm,1));
    for i=1:size(swarm,1)
        [~,b] = find(swarm(i,:));
        xe = x(:,b);
        xt = xv(:,b);
        fit(i) = q1pso(xe,y,xt,yv);
    end
end