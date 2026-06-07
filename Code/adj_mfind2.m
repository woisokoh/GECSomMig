function adj_mfind2(var,th)
    varname = inputname(1);
    ilist = [];
    for i = 1:length(var)
        for j = 1:length(var)
            if var(i,j) > 0 
                ilist = [ilist; var(i,j)];
            end
        end
    end
    if th == 100
        x = 0;
    else
        [cdf,xv] = ecdf(ilist);
        x2 = min(xv(cdf >= 1 - th/100));
        x1 = max(xv(cdf < 1 - th/100));
        y2 = cdf(find(xv == x2));
        y1 = cdf(find(xv == x1));
    
        x = x1 + (x2 - x1) * (1 - th/100 - y1) / (y2 - y1);
    end
    list = listmaker(double(var > x));
    name = [varname,'_',num2str(th),'.txt'];
    writematrix(list,name,'Delimiter','tab');
end