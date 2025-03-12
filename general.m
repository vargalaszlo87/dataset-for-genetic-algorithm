%
% This OCTAVE script generates sapmle dataset for genetic-algorithm 
% with randomized city name in CSV form.
%
% List of parameters:
% - Sunlight
% - Soil Quality
% - Terrain feature
% - Distance from point of connection
% - Cost of installation
%
% List of files:
% - list.txt --> city names
% - general.m --> this script
% - output.csv --> generated dataset

% Varga Laszlo
% github.com/vargalaszlo87
% vargalaszlo.com 
% 2005
%


% Setup
num_sample = 200;


% Load the city names

  cities = fopen('list.txt','r');

    % read line by line
    temp = textscan(cities, '%s', 'Delimiter', '\n'); 
    city_list = temp{1};

    % shuffle the city names
    shuffled_city_list = city_list(randperm(length(city_list)));

  fclose (cities);


% Make random data

  sunlight = round((4 + (rand(num_sample, 1) * (10 - 4))) * 100) / 100; % sunlight = 4...10
  soil = round(rand(num_sample, 1) * 10 * 100) / 100; % soil = 0...10
  terrian = round(rand(num_sample, 1) * 10 * 100) / 100; % terrian = 0...10
  distance = round(rand(num_sample, 1) * 10 * 100) / 100; % distance = 0...10
  cost = round((6 + (rand(num_sample, 1) * (10 - 6))) * 100) / 100; %cost = 6...10

  
% Make output CSV

  out = fopen('output.csv', 'w');

    % header
    fprintf(out, 'id;sunlight;soil;terrian;distance;cost;place\n');

    % datas
    for i = 1:num_sample
        fprintf(out, '%d;%.2f;%.2f;%.2f;%.2f;%.2f;%s\n', i, sunlight(i), soil(i), terrian(i), distance(i), cost(i), strrep(shuffled_city_list{i}, ' ', '-'));
    end

  fclose(out);

