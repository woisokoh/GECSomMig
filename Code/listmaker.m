function list = listmaker(mat)
    list = [];
    for i = 1:length(mat)
        for j = 1:length(mat)
            if mat(i,j) > 0 
                list = [list; i, j, 1];
            end
        end
    end
end