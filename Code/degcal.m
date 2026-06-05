function [deg,str] = degcal(mat,inout)
    adj = double(mat > 0);
    if inout == "in"
        deg = sum(adj)';
        str = sum(mat)'; 
    elseif inout == "out"
        deg = sum(adj')';
        str = sum(mat')';
    end
    deg = deg(deg > 0);
    str = str(str > 0);
end