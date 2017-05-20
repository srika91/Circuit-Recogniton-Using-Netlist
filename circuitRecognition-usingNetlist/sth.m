ImL = bwlabel(h1); 

%Get labels for all distinct regions
labels = unique(ImL);

%Remove label 0, corresponding to background
labels(labels==0) = [];

%Get bounding box for each segmentation
Character = struct('BoundingBox',zeros(1,4));
nrValidDetections = 0;
for i=1:length(labels)
    D = regionprops(ImL==labels(i));
    if D.Area > 10
        nrValidDetections = nrValidDetections + 1;
        Character(nrValidDetections).BoundingBox = D.BoundingBox;
    end
end


%Visualize results
figure(1);
imagesc(ImL);
xlim([0 200]);
for i=1:nrValidDetections
    rectangle('Position',[Character(i).BoundingBox(1) ...
                          Character(i).BoundingBox(2) ...
                          Character(i).BoundingBox(3) ...
                          Character(i).BoundingBox(4)]);

end