function sp = out2mat(infile)
    out = load(infile);
    z_score = out(:,5)';
    z_score(z_score > 30 | z_score < -30) = 0;
    int = [z_score(1,1),z_score(1,4),z_score(1,2),z_score(1,7),z_score(1,3), ...
        z_score(1,8),z_score(1,5),z_score(1,9),z_score(1,11),z_score(1,6), ...
        z_score(1,10),z_score(1,12),z_score(1,13)];
    z_score = int;
    z_score(isnan(z_score)) = 0;
    z_score(isinf(z_score)) = 0;
    sp = z_score / sqrt(sum(z_score.^2));
end