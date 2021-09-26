%Before you execute this function, you have to load trainedNet in
%'raoacnn.mat'. The argument of 'foldername' should be the name of folder
%containing dicomfiles of knee radiographs which will be classifed
%to RA or OA 

function [RAorOA,score]=RAOAclassificator(foldername,trainedNet)

img=imageDatastore(foldername,'IncludeSubfolders',true,'FileExtensions',...
    '.dcm','ReadFcn',@dicomread);

augimds= augmentedImageDatastore([224,224],img,...
    'ColorPreprocessing','gray2rgb');


[RAorOA,score] = classify(trainedNet,augimds);
