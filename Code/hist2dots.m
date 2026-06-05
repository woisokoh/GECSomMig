function [xbin,freq] = hist2dots(mat)
%     if length(mat) > 20
%         nbins=(max(mat)-min(mat))/(2*iqr(mat)*(length(mat)^(-1/3)));
          nbins = 50;
%     else 
%         nbins=7;
%     end
    [freq,xbin]=hist(mat,nbins);
    xbin = xbin';
    freq = (freq / sum(freq))';
end