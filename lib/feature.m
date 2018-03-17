conf.dataDir = '../data/images/' ; % data (image) directory 
conf.outDir = '../output/'; % output directory
conf.lbpPath = fullfile(conf.outDir, 'feature_LBP.csv');

img_path = dir(strcat(conf.dataDir,'*.jpg')); 
lbp = zeros(length(img_path), 59);

for a = 1:length(img_path)
    img = imread(fullfile(conf.dataDir,img_path(a).name));
    if ndims(img)==3
       I=rgb2gray(img);
    else
       I=img;
    end
    lbp(a,:) = extractLBPFeatures(I);
    sprintf('%s%d','image',a,'completed')
end

save(conf.lbpPath, 'lbp')