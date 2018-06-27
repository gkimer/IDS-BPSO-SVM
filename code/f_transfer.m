function [VF]=f_transfer(VX,op)
    if op==1
        VF=abs(tanh(VX));
    elseif op==2
        VF=abs(VX./sqrt(1+VX.^2));
    elseif op==3
        VF=abs(2/pi)*atan((pi/2)*VX);
    end



end