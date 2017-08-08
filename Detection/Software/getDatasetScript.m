function datasetMtx = getDatasetScript()
% java -Xmx2g -jar weka.jar
fileDataset = 'finaldataset.arff';
myPath = '';
javaaddpath('/home/riccelli/RTDDoS/matlabArrf/weka-3-8-1/weka.jar');
cd ../../matlabArrf;
wekaOBJ = loadARFF([myPath fileDataset]);
datasetMtx = weka2matlab(wekaOBJ);
% srcADD    = datasetMtx(:,1);
% desADD    = datasetMtx(:,2);
% pktID     = datasetMtx(:,3);
% fromNODE  = datasetMtx(:,4);
% toNODE    = datasetMtx(:,5);
% pktTYPE   = datasetMtx(:,6);
% pktSIZE   = datasetMtx(:,7);
% flags     = datasetMtx(:,8);
% fID       = datasetMtx(:,9);
% seqNUMBER = datasetMtx(:,10);
% numberOfPKT = datasetMtx(:,11); 
% numberOfBYTE = datasetMtx(:,12); 
% nodeNameFROM = datasetMtx(:,13); 
% nodeNameTO = datasetMtx(:,14);
% pktIN = datasetMtx(:,15);
% pktOUT = datasetMtx(:,16);
% pktR = datasetMtx(:,17);
% pktDelayNODE = datasetMtx(:,18);
% pktRATE = datasetMtx(:,19);
% byteRATE = datasetMtx(:,20);
% pktAvgSIZE = datasetMtx(:,21);
% utilization = datasetMtx(:,22);
% pktDELAY = datasetMtx(:,23);
% pktSendTIME = datasetMtx(:,24);
% pktReservedTIME = datasetMtx(:,25);
% firstPktSENT = datasetMtx(:,26);
% lastPktRESERVED = datasetMtx(:,27);
 save dataset.mat


end

