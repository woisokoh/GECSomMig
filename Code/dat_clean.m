%% This code cleans the original data from the UNHCR
% This code takes a bit of time (few min) so you can rather use
% dat_adj2.mat instead

%% Load raw data from Excel file
% Generate data in matrix with numerics
% col 1: year, col 2: month, col 3: origin district ID, 
% col 4: destination district ID, col 5: primary displacement reason, 
% col 6: displaced population
rawdata = readtable('..\data\UNHCR-PRMN-Displacement-Dataset.xlsx');
data = zeros(height(rawdata),6);

%% Encode district names as numeric IDs (columns 4 and 3 = destination and origin)
for i = 1:height(rawdata)
    if string(rawdata{i,4})=="Adan Yabaal"
    	data(i,4)= 1 ;
    elseif string(rawdata{i,4})=="Afgooye"
        data(i,4)= 2 ;
    elseif string(rawdata{i,4})=="Afmadow"
    	data(i,4)= 3 ;
    elseif string(rawdata{i,4})=="Baardheere"
    	data(i,4)= 4 ;
    elseif string(rawdata{i,4})=="Badhaadhe"
    	data(i,4)= 5 ;
    elseif string(rawdata{i,4})=="Badhan"
    	data(i,4)= 54 ;
    elseif string(rawdata{i,4})=="Baidoa"
    	data(i,4)= 6 ;
    elseif string(rawdata{i,4})=="Baki"
    	data(i,4)= 7 ;
    elseif string(rawdata{i,4})=="Balcad"
    	data(i,4)= 8 ;
    elseif string(rawdata{i,4})=="Banadir"
    	data(i,4)= 9 ;
    elseif string(rawdata{i,4})=="Bandarbeyla"
    	data(i,4)= 10 ;
    elseif string(rawdata{i,4})=="Baraawe"
    	data(i,4)= 11 ;
    elseif string(rawdata{i,4})=="Belet Weyne"
    	data(i,4)= 12 ;
    elseif string(rawdata{i,4})=="Belet Xaawo"
    	data(i,4)= 13 ;
    elseif string(rawdata{i,4})=="Berbera"
    	data(i,4)= 14 ;
    elseif string(rawdata{i,4})=="Borama"
    	data(i,4)= 15 ;
    elseif string(rawdata{i,4})=="Bossaso"
    	data(i,4)= 16 ;
    elseif string(rawdata{i,4})=="Buaale"
    	data(i,4)= 17 ;
    elseif string(rawdata{i,4})=="Bulo Burto"
    	data(i,4)= 18 ;
    elseif string(rawdata{i,4})=="Burco"
    	data(i,4)= 19 ;
    elseif string(rawdata{i,4})=="Burtinle"
    	data(i,4)= 20 ;
    elseif string(rawdata{i,4})=="Buuhoodle"
    	data(i,4)= 21 ;
    elseif string(rawdata{i,4})=="Buur Hakaba"
    	data(i,4)= 22 ;
    elseif string(rawdata{i,4})=="Cabudwaaq"
    	data(i,4)= 23 ;
    elseif string(rawdata{i,4})=="Cadaado"
    	data(i,4)= 24 ;
    elseif string(rawdata{i,4})=="Cadale"
    	data(i,4)= 25 ;
    elseif string(rawdata{i,4})=="Caluula"
    	data(i,4)= 26 ;
    elseif string(rawdata{i,4})=="Caynabo"
    	data(i,4)= 27 ;
    elseif string(rawdata{i,4})=="Ceel Afweyn"
    	data(i,4)= 28 ;
    elseif string(rawdata{i,4})=="Ceel Barde"
    	data(i,4)= 29 ;
    elseif string(rawdata{i,4})=="Ceel Buur"
    	data(i,4)= 30 ;
    elseif string(rawdata{i,4})=="Ceel Dheer"
    	data(i,4)= 31 ;
    elseif string(rawdata{i,4})=="Ceel Waaq"
    	data(i,4)= 32 ;
    elseif string(rawdata{i,4})=="Ceerigaabo"
    	data(i,4)= 33 ;
    elseif string(rawdata{i,4})=="Dhahar"
    	data(i,4)= 54 ;
    elseif string(rawdata{i,4})=="Dhuusamarreeb"
    	data(i,4)= 34 ;
    elseif string(rawdata{i,4})=="Diinsoor"
    	data(i,4)= 35 ;
    elseif string(rawdata{i,4})=="Doolow"
    	data(i,4)= 36 ;
    elseif string(rawdata{i,4})=="Eyl"
    	data(i,4)= 37 ;
    elseif string(rawdata{i,4})=="Gaalkacyo"
    	data(i,4)= 38 ;
    elseif string(rawdata{i,4})=="Galdogob"
    	data(i,4)= 39 ;
    elseif string(rawdata{i,4})=="Garbahaarey"
    	data(i,4)= 40 ;
    elseif string(rawdata{i,4})=="Garoowe"
    	data(i,4)= 41 ;
    elseif string(rawdata{i,4})=="Gebiley"
    	data(i,4)= 42 ;
    elseif string(rawdata{i,4})=="Hargeysa"
    	data(i,4)= 43 ;
    elseif string(rawdata{i,4})=="Hobyo"
    	data(i,4)= 44 ;
    elseif string(rawdata{i,4})=="Iskushuban"
    	data(i,4)= 45 ;
    elseif string(rawdata{i,4})=="Jalalaqsi"
    	data(i,4)= 46 ;
    elseif string(rawdata{i,4})=="Jamaame"
    	data(i,4)= 47 ;
    elseif string(rawdata{i,4})=="Jariiban"
    	data(i,4)= 48 ;
    elseif string(rawdata{i,4})=="Jilib"
    	data(i,4)= 49 ;
    elseif string(rawdata{i,4})=="Jowhar"
    	data(i,4)= 50 ;
    elseif string(rawdata{i,4})=="Kismayo"
    	data(i,4)= 51 ;
    elseif string(rawdata{i,4})=="Kurtunwaarey"
    	data(i,4)= 52 ;
    elseif string(rawdata{i,4})=="Laas Caanood"
    	data(i,4)= 53 ;
    elseif string(rawdata{i,4})=="Laasqoray"
    	data(i,4)= 54 ;
    elseif string(rawdata{i,4})=="Lasqoray"
    	data(i,4)= 54 ;
    elseif string(rawdata{i,4})=="Lughaye"
    	data(i,4)= 55 ;
    elseif string(rawdata{i,4})=="Luuq"
    	data(i,4)= 56 ;
    elseif string(rawdata{i,4})=="Marka"
    	data(i,4)= 57 ;
    elseif string(rawdata{i,4})=="Owdweyne"
    	data(i,4)= 58 ;
    elseif string(rawdata{i,4})=="Qandala"
    	data(i,4)= 59 ;
    elseif string(rawdata{i,4})=="Qansax Dheere"
    	data(i,4)= 60 ;
    elseif string(rawdata{i,4})=="Qardho"
    	data(i,4)= 61 ;
    elseif string(rawdata{i,4})=="Qoryooley"
    	data(i,4)= 62 ;
    elseif string(rawdata{i,4})=="Rab Dhuure"
    	data(i,4)= 63 ;
    elseif string(rawdata{i,4})=="Saakow"
    	data(i,4)= 64 ;
    elseif string(rawdata{i,4})=="Sablaale"
    	data(i,4)= 65 ;
    elseif string(rawdata{i,4})=="Sheikh"
    	data(i,4)= 66 ;
    elseif string(rawdata{i,4})=="Taleex"
    	data(i,4)= 67 ;
    elseif string(rawdata{i,4})=="Tayeeglow"
    	data(i,4)= 68 ;
    elseif string(rawdata{i,4})=="Waajid"
    	data(i,4)= 69 ;
    elseif string(rawdata{i,4})=="Wanla Weyn"
    	data(i,4)= 70 ;
    elseif string(rawdata{i,4})=="Xarardheere"
    	data(i,4)= 71 ;
    elseif string(rawdata{i,4})=="Xudun"
    	data(i,4)= 72 ;
    elseif string(rawdata{i,4})=="Xudur"
    	data(i,4)= 73 ;
    elseif string(rawdata{i,4})=="Zeylac"
    	data(i,4)= 74 ;
    end

    if string(rawdata{i,6})=="Adan Yabaal"
    	data(i,3)= 1 ;
    elseif string(rawdata{i,6})=="Afgooye"
        data(i,3)= 2 ;
    elseif string(rawdata{i,6})=="Afmadow"
    	data(i,3)= 3 ;
    elseif string(rawdata{i,6})=="Baardheere"
    	data(i,3)= 4 ;
    elseif string(rawdata{i,6})=="Badhaadhe"
    	data(i,3)= 5 ;
    elseif string(rawdata{i,6})=="Badhan"
    	data(i,3)= 54 ;
    elseif string(rawdata{i,6})=="Baidoa"
    	data(i,3)= 6 ;
    elseif string(rawdata{i,6})=="Baki"
    	data(i,3)= 7 ;
    elseif string(rawdata{i,6})=="Balcad"
    	data(i,3)= 8 ;
    elseif string(rawdata{i,6})=="Banadir"
    	data(i,3)= 9 ;
    elseif string(rawdata{i,6})=="Bandarbeyla"
    	data(i,3)= 10 ;
    elseif string(rawdata{i,6})=="Baraawe"
    	data(i,3)= 11 ;
    elseif string(rawdata{i,6})=="Belet Weyne"
    	data(i,3)= 12 ;
    elseif string(rawdata{i,6})=="Belet Xaawo"
    	data(i,3)= 13 ;
    elseif string(rawdata{i,6})=="Berbera"
    	data(i,3)= 14 ;
    elseif string(rawdata{i,6})=="Borama"
    	data(i,3)= 15 ;
    elseif string(rawdata{i,6})=="Bossaso"
    	data(i,3)= 16 ;
    elseif string(rawdata{i,6})=="Buaale"
    	data(i,3)= 17 ;
    elseif string(rawdata{i,6})=="Bulo Burto"
    	data(i,3)= 18 ;
    elseif string(rawdata{i,6})=="Burco"
    	data(i,3)= 19 ;
    elseif string(rawdata{i,6})=="Burtinle"
    	data(i,3)= 20 ;
    elseif string(rawdata{i,6})=="Buuhoodle"
    	data(i,3)= 21 ;
    elseif string(rawdata{i,6})=="Buur Hakaba"
    	data(i,3)= 22 ;
    elseif string(rawdata{i,6})=="Cabudwaaq"
    	data(i,3)= 23 ;
    elseif string(rawdata{i,6})=="Cadaado"
    	data(i,3)= 24 ;
    elseif string(rawdata{i,6})=="Cadale"
    	data(i,3)= 25 ;
    elseif string(rawdata{i,6})=="Caluula"
    	data(i,3)= 26 ;
    elseif string(rawdata{i,6})=="Caynabo"
    	data(i,3)= 27 ;
    elseif string(rawdata{i,6})=="Ceel Afweyn"
    	data(i,3)= 28 ;
    elseif string(rawdata{i,6})=="Ceel Barde"
    	data(i,3)= 29 ;
    elseif string(rawdata{i,6})=="Ceel Buur"
    	data(i,3)= 30 ;
    elseif string(rawdata{i,6})=="Ceel Dheer"
    	data(i,3)= 31 ;
    elseif string(rawdata{i,6})=="Ceel Waaq"
    	data(i,3)= 32 ;
    elseif string(rawdata{i,6})=="Ceerigaabo"
    	data(i,3)= 33 ;
    elseif string(rawdata{i,6})=="Dhahar"
    	data(i,3)= 54 ;
    elseif string(rawdata{i,6})=="Dhuusamarreeb"
    	data(i,3)= 34 ;
    elseif string(rawdata{i,6})=="Diinsoor"
    	data(i,3)= 35 ;
    elseif string(rawdata{i,6})=="Doolow"
    	data(i,3)= 36 ;
    elseif string(rawdata{i,6})=="Eyl"
    	data(i,3)= 37 ;
    elseif string(rawdata{i,6})=="Gaalkacyo"
    	data(i,3)= 38 ;
    elseif string(rawdata{i,6})=="Galdogob"
    	data(i,3)= 39 ;
    elseif string(rawdata{i,6})=="Garbahaarey"
    	data(i,3)= 40 ;
    elseif string(rawdata{i,6})=="Garoowe"
    	data(i,3)= 41 ;
    elseif string(rawdata{i,6})=="Gebiley"
    	data(i,3)= 42 ;
    elseif string(rawdata{i,6})=="Hargeysa"
    	data(i,3)= 43 ;
    elseif string(rawdata{i,6})=="Hobyo"
    	data(i,3)= 44 ;
    elseif string(rawdata{i,6})=="Iskushuban"
    	data(i,3)= 45 ;
    elseif string(rawdata{i,6})=="Jalalaqsi"
    	data(i,3)= 46 ;
    elseif string(rawdata{i,6})=="Jamaame"
    	data(i,3)= 47 ;
    elseif string(rawdata{i,6})=="Jariiban"
    	data(i,3)= 48 ;
    elseif string(rawdata{i,6})=="Jilib"
    	data(i,3)= 49 ;
    elseif string(rawdata{i,6})=="Jowhar"
    	data(i,3)= 50 ;
    elseif string(rawdata{i,6})=="Kismayo"
    	data(i,3)= 51 ;
    elseif string(rawdata{i,6})=="Kurtunwaarey"
    	data(i,3)= 52 ;
    elseif string(rawdata{i,6})=="Laas Caanood"
    	data(i,3)= 53 ;
    elseif string(rawdata{i,6})=="Laasqoray"
    	data(i,3)= 54 ;
    elseif string(rawdata{i,6})=="Lasqoray"
    	data(i,3)= 54 ;
    elseif string(rawdata{i,6})=="Lughaye"
    	data(i,3)= 55 ;
    elseif string(rawdata{i,6})=="Luuq"
    	data(i,3)= 56 ;
    elseif string(rawdata{i,6})=="Marka"
    	data(i,3)= 57 ;
    elseif string(rawdata{i,6})=="Owdweyne"
    	data(i,3)= 58 ;
    elseif string(rawdata{i,6})=="Qandala"
    	data(i,3)= 59 ;
    elseif string(rawdata{i,6})=="Qansax Dheere"
    	data(i,3)= 60 ;
    elseif string(rawdata{i,6})=="Qardho"
    	data(i,3)= 61 ;
    elseif string(rawdata{i,6})=="Qoryooley"
    	data(i,3)= 62 ;
    elseif string(rawdata{i,6})=="Rab Dhuure"
    	data(i,3)= 63 ;
    elseif string(rawdata{i,6})=="Saakow"
    	data(i,3)= 64 ;
    elseif string(rawdata{i,6})=="Sablaale"
    	data(i,3)= 65 ;
    elseif string(rawdata{i,6})=="Sheikh"
    	data(i,3)= 66 ;
    elseif string(rawdata{i,6})=="Taleex"
    	data(i,3)= 67 ;
    elseif string(rawdata{i,6})=="Tayeeglow"
    	data(i,3)= 68 ;
    elseif string(rawdata{i,6})=="Waajid"
    	data(i,3)= 69 ;
    elseif string(rawdata{i,6})=="Wanla Weyn"
    	data(i,3)= 70 ;
    elseif string(rawdata{i,6})=="Xarardheere"
    	data(i,3)= 71 ;
    elseif string(rawdata{i,6})=="Xudun"
    	data(i,3)= 72 ;
    elseif string(rawdata{i,6})=="Xudur"
    	data(i,3)= 73 ;
    elseif string(rawdata{i,6})=="Zeylac"
    	data(i,3)= 74 ;
    end
    
    % --- Displacement cause (raw column 7) → data column 5 ---
    % 1 = climate-related (drought or flood)
    % 2 = conflict/insecurity
    % 0 = other / unknown
    if string(rawdata{i,7})=="Drought related" | string(rawdata{i,7})=="Flood"
        data(i,5) = 1;
    elseif string(rawdata{i,7})=="Conflict/Insecurity"
        data(i,5) = 2;
    else
        data(i,5) = 0;
    end
end

data(:,1) = year(rawdata{:,1});     % Year extracted from date column
data(:,2) = month(rawdata{:,1});    % Month extracted from date column
data(:,6) = double(rawdata{:,9});   % Number of displaced populations

%% Build weighted adjacency matrices
% cli - disaster-induced displacement
% con - conflict-induced displacement
cli_d_2016 = zeros(74,74);
cli_d_2017 = zeros(74,74);
cli_d_2018 = zeros(74,74);
cli_d_2019 = zeros(74,74);
cli_d_2020 = zeros(74,74);
cli_d = zeros(74,74);
con_d_2016 = zeros(74,74);
con_d_2017 = zeros(74,74);
con_d_2018 = zeros(74,74);
con_d_2019 = zeros(74,74);
con_d_2020 = zeros(74,74);
con_d = zeros(74,74);

% Accumulate displacement counts into the appropriate year/cause matrix
for i=1:length(data)
    if data(i,1) == 2016 && data(i,5) == 1
        cli_d_2016(data(i,3),data(i,4)) = cli_d_2016(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2017 && data(i,5) == 1
        cli_d_2017(data(i,3),data(i,4)) = cli_d_2017(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2018 && data(i,5) == 1
        cli_d_2018(data(i,3),data(i,4)) = cli_d_2018(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2019 && data(i,5) == 1
        cli_d_2019(data(i,3),data(i,4)) = cli_d_2019(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2020 && data(i,5) == 1
        cli_d_2020(data(i,3),data(i,4)) = cli_d_2020(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2016 && data(i,5) == 2
        con_d_2016(data(i,3),data(i,4)) = con_d_2016(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2017 && data(i,5) == 2
        con_d_2017(data(i,3),data(i,4)) = con_d_2017(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2018 && data(i,5) == 2
        con_d_2018(data(i,3),data(i,4)) = con_d_2018(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2019 && data(i,5) == 2
        con_d_2019(data(i,3),data(i,4)) = con_d_2019(data(i,3),data(i,4)) + data(i,6);
    elseif data(i,1) == 2020 && data(i,5) == 2
        con_d_2020(data(i,3),data(i,4)) = con_d_2020(data(i,3),data(i,4)) + data(i,6);
    end
end

cli_d = cli_d_2016 + cli_d_2017 + cli_d_2018 + cli_d_2019 + cli_d_2020;
con_d = con_d_2016 + con_d_2017 + con_d_2018 + con_d_2019 + con_d_2020;
