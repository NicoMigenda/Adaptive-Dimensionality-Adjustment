clear variables
close all

addpath('export_fig');

%% Results waveData
load waveData_99.mat
waveformVoll99 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(4) = mean(outDimTotal(Anteil/2,:));
meanDim50(4) = mean(outDimTotal(Anteil,:));
meanDim75(4) = mean(outDimTotal(Anteil*3/2,:));
meanDim(4) = mean(outDimTotal(end,:));
stdDim25(4) = std(outDimTotal(Anteil/2,:));
stdDim50(4) = std(outDimTotal(Anteil,:));
stdDim75(4) = std(outDimTotal(Anteil*3/2,:));
stdDim(4) = std(outDimTotal(end,:));
load waveData_9.mat
waveformVoll90 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(3) = mean(outDimTotal(Anteil/2,:));
meanDim50(3) = mean(outDimTotal(Anteil,:));
meanDim75(3) = mean(outDimTotal(Anteil*3/2,:));
meanDim(3) = mean(outDimTotal(end,:));
stdDim25(3) = std(outDimTotal(Anteil/2,:));
stdDim50(3) = std(outDimTotal(Anteil,:));
stdDim75(3) = std(outDimTotal(Anteil*3/2,:));
stdDim(3) = std(outDimTotal(end,:));
load waveData_8.mat
waveformVoll80 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(2) = mean(outDimTotal(Anteil/2,:));
meanDim50(2) = mean(outDimTotal(Anteil,:));
meanDim75(2) = mean(outDimTotal(Anteil*3/2,:));
meanDim(2) = mean(outDimTotal(end,:));
stdDim25(2) = std(outDimTotal(Anteil/2,:));
stdDim50(2) = std(outDimTotal(Anteil,:));
stdDim75(2) = std(outDimTotal(Anteil*3/2,:));
stdDim(2) = std(outDimTotal(end,:));
load waveData_7.mat
waveformVoll70 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(1) = mean(outDimTotal(Anteil/2,:));
meanDim50(1) = mean(outDimTotal(Anteil,:));
meanDim75(1) = mean(outDimTotal(Anteil*3/2,:));
meanDim(1) = mean(outDimTotal(end,:));
stdDim25(1) = std(outDimTotal(Anteil/2,:));
stdDim50(1) = std(outDimTotal(Anteil,:));
stdDim75(1) = std(outDimTotal(Anteil*3/2,:));
stdDim(1) = std(outDimTotal(end,:));
varTypes = {'Mean_25','Mean_50','Mean_75','Mean_100'};
vector25 = [meanDim25(1), stdDim25(1),meanDim25(2), stdDim25(2),meanDim25(3), stdDim25(3),meanDim25(4), stdDim25(4)];
vector50 = [meanDim50(1), stdDim50(1),meanDim50(2), stdDim50(2),meanDim50(3), stdDim50(3),meanDim50(4), stdDim50(4)];
vector75 = [meanDim75(1), stdDim75(1),meanDim75(2), stdDim75(2),meanDim75(3), stdDim75(3),meanDim75(4), stdDim75(4)];
vector100 = [meanDim(1), stdDim(1),meanDim(2), stdDim(2),meanDim(3), stdDim(3),meanDim(4), stdDim(4)];
waveData = [vector25; vector50; vector75; vector100];
T_waveData = table(varTypes',waveData)

%% Results waveDataNoNoise
load waveDataNoNoise_99.mat
waveformNoNoise99 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(4) = mean(outDimTotal(Anteil/2,:));
meanDim50(4) = mean(outDimTotal(Anteil,:));
meanDim75(4) = mean(outDimTotal(Anteil*3/2,:));
meanDim(4) = mean(outDimTotal(end,:));
stdDim25(4) = std(outDimTotal(Anteil/2,:));
stdDim50(4) = std(outDimTotal(Anteil,:));
stdDim75(4) = std(outDimTotal(Anteil*3/2,:));
stdDim(4) = std(outDimTotal(end,:));
load waveDataNoNoise_9.mat
waveformNoNoise90 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(3) = mean(outDimTotal(Anteil/2,:));
meanDim50(3) = mean(outDimTotal(Anteil,:));
meanDim75(3) = mean(outDimTotal(Anteil*3/2,:));
meanDim(3) = mean(outDimTotal(end,:));
stdDim25(3) = std(outDimTotal(Anteil/2,:));
stdDim50(3) = std(outDimTotal(Anteil,:));
stdDim75(3) = std(outDimTotal(Anteil*3/2,:));
stdDim(3) = std(outDimTotal(end,:));
load waveDataNoNoise_8.mat
waveformNoNoise80 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(2) = mean(outDimTotal(Anteil/2,:));
meanDim50(2) = mean(outDimTotal(Anteil,:));
meanDim75(2) = mean(outDimTotal(Anteil*3/2,:));
meanDim(2) = mean(outDimTotal(end,:));
stdDim25(2) = std(outDimTotal(Anteil/2,:));
stdDim50(2) = std(outDimTotal(Anteil,:));
stdDim75(2) = std(outDimTotal(Anteil*3/2,:));
stdDim(2) = std(outDimTotal(end,:));
load waveDataNoNoise_7.mat
waveformNoNoise70 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(1) = mean(outDimTotal(Anteil/2,:));
meanDim50(1) = mean(outDimTotal(Anteil,:));
meanDim75(1) = mean(outDimTotal(Anteil*3/2,:));
meanDim(1) = mean(outDimTotal(end,:));
stdDim25(1) = std(outDimTotal(Anteil/2,:));
stdDim50(1) = std(outDimTotal(Anteil,:));
stdDim75(1) = std(outDimTotal(Anteil*3/2,:));
stdDim(1) = std(outDimTotal(end,:));
varTypes = {'Mean_25','Mean_50','Mean_75','Mean_100'};
vector25 = [meanDim25(1), stdDim25(1),meanDim25(2), stdDim25(2),meanDim25(3), stdDim25(3),meanDim25(4), stdDim25(4)];
vector50 = [meanDim50(1), stdDim50(1),meanDim50(2), stdDim50(2),meanDim50(3), stdDim50(3),meanDim50(4), stdDim50(4)];
vector75 = [meanDim75(1), stdDim75(1),meanDim75(2), stdDim75(2),meanDim75(3), stdDim75(3),meanDim75(4), stdDim75(4)];
vector100 = [meanDim(1), stdDim(1),meanDim(2), stdDim(2),meanDim(3), stdDim(3),meanDim(4), stdDim(4)];
waveDataNoNoise = [vector25; vector50; vector75; vector100];
T_waveDataNoNoise = table(varTypes',waveDataNoNoise)

%% Results PHM
load PHM_99.mat
turbine99 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(4) = mean(outDimTotal(Anteil/2,:));
meanDim50(4) = mean(outDimTotal(Anteil,:));
meanDim75(4) = mean(outDimTotal(Anteil*3/2,:));
meanDim(4) = mean(outDimTotal(end,:));
stdDim25(4) = std(outDimTotal(Anteil/2,:));
stdDim50(4) = std(outDimTotal(Anteil,:));
stdDim75(4) = std(outDimTotal(Anteil*3/2,:));
stdDim(4) = std(outDimTotal(end,:));
load PHM_9.mat
turbine90 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(3) = mean(outDimTotal(Anteil/2,:));
meanDim50(3) = mean(outDimTotal(Anteil,:));
meanDim75(3) = mean(outDimTotal(Anteil*3/2,:));
meanDim(3) = mean(outDimTotal(end,:));
stdDim25(3) = std(outDimTotal(Anteil/2,:));
stdDim50(3) = std(outDimTotal(Anteil,:));
stdDim75(3) = std(outDimTotal(Anteil*3/2,:));
stdDim(3) = std(outDimTotal(end,:));
load PHM_8.mat
turbine80 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(2) = mean(outDimTotal(Anteil/2,:));
meanDim50(2) = mean(outDimTotal(Anteil,:));
meanDim75(2) = mean(outDimTotal(Anteil*3/2,:));
meanDim(2) = mean(outDimTotal(end,:));
stdDim25(2) = std(outDimTotal(Anteil/2,:));
stdDim50(2) = std(outDimTotal(Anteil,:));
stdDim75(2) = std(outDimTotal(Anteil*3/2,:));
stdDim(2) = std(outDimTotal(end,:));
load PHM_7.mat
turbine70 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(1) = mean(outDimTotal(Anteil/2,:));
meanDim50(1) = mean(outDimTotal(Anteil,:));
meanDim75(1) = mean(outDimTotal(Anteil*3/2,:));
meanDim(1) = mean(outDimTotal(end,:));
stdDim25(1) = std(outDimTotal(Anteil/2,:));
stdDim50(1) = std(outDimTotal(Anteil,:));
stdDim75(1) = std(outDimTotal(Anteil*3/2,:));
stdDim(1) = std(outDimTotal(end,:));
varTypes = {'Mean_25','Mean_50','Mean_75','Mean_100'};
vector25 = [meanDim25(1), stdDim25(1),meanDim25(2), stdDim25(2),meanDim25(3), stdDim25(3),meanDim25(4), stdDim25(4)];
vector50 = [meanDim50(1), stdDim50(1),meanDim50(2), stdDim50(2),meanDim50(3), stdDim50(3),meanDim50(4), stdDim50(4)];
vector75 = [meanDim75(1), stdDim75(1),meanDim75(2), stdDim75(2),meanDim75(3), stdDim75(3),meanDim75(4), stdDim75(4)];
vector100 = [meanDim(1), stdDim(1),meanDim(2), stdDim(2),meanDim(3), stdDim(3),meanDim(4), stdDim(4)];
turbine = [vector25; vector50; vector75; vector100];
T_PHM = table(varTypes',turbine)

load careercon_99.mat
real99 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(4) = mean(outDimTotal(Anteil/2,:));
meanDim50(4) = mean(outDimTotal(Anteil,:));
meanDim75(4) = mean(outDimTotal(Anteil*3/2,:));
meanDim(4) = mean(outDimTotal(end,:));
stdDim25(4) = std(outDimTotal(Anteil/2,:));
stdDim50(4) = std(outDimTotal(Anteil,:));
stdDim75(4) = std(outDimTotal(Anteil*3/2,:));
stdDim(4) = std(outDimTotal(end,:));
load careercon_9.mat
real90 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(3) = mean(outDimTotal(Anteil/2,:));
meanDim50(3) = mean(outDimTotal(Anteil,:));
meanDim75(3) = mean(outDimTotal(Anteil*3/2,:));
meanDim(3) = mean(outDimTotal(end,:));
stdDim25(3) = std(outDimTotal(Anteil/2,:));
stdDim50(3) = std(outDimTotal(Anteil,:));
stdDim75(3) = std(outDimTotal(Anteil*3/2,:));
stdDim(3) = std(outDimTotal(end,:));
load careercon_8.mat
real80 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(2) = mean(outDimTotal(Anteil/2,:));
meanDim50(2) = mean(outDimTotal(Anteil,:));
meanDim75(2) = mean(outDimTotal(Anteil*3/2,:));
meanDim(2) = mean(outDimTotal(end,:));
stdDim25(2) = std(outDimTotal(Anteil/2,:));
stdDim50(2) = std(outDimTotal(Anteil,:));
stdDim75(2) = std(outDimTotal(Anteil*3/2,:));
stdDim(2) = std(outDimTotal(end,:));
load careercon_7.mat
real70 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(1) = mean(outDimTotal(Anteil/2,:));
meanDim50(1) = mean(outDimTotal(Anteil,:));
meanDim75(1) = mean(outDimTotal(Anteil*3/2,:));
meanDim(1) = mean(outDimTotal(end,:));
stdDim25(1) = std(outDimTotal(Anteil/2,:));
stdDim50(1) = std(outDimTotal(Anteil,:));
stdDim75(1) = std(outDimTotal(Anteil*3/2,:));
stdDim(1) = std(outDimTotal(end,:));
varTypes = {'Mean_25','Mean_50','Mean_75','Mean_100'};
vector25 = [meanDim25(1), stdDim25(1),meanDim25(2), stdDim25(2),meanDim25(3), stdDim25(3),meanDim25(4), stdDim25(4)];
vector50 = [meanDim50(1), stdDim50(1),meanDim50(2), stdDim50(2),meanDim50(3), stdDim50(3),meanDim50(4), stdDim50(4)];
vector75 = [meanDim75(1), stdDim75(1),meanDim75(2), stdDim75(2),meanDim75(3), stdDim75(3),meanDim75(4), stdDim75(4)];
vector100 = [meanDim(1), stdDim(1),meanDim(2), stdDim(2),meanDim(3), stdDim(3),meanDim(4), stdDim(4)];
careercon = [vector25; vector50; vector75; vector100];
T_careercon = table(varTypes',careercon)

load cameraman_99.mat
cameraman99 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(4) = mean(outDimTotal(Anteil/2,:));
meanDim50(4) = mean(outDimTotal(Anteil,:));
meanDim75(4) = mean(outDimTotal(Anteil*3/2,:));
meanDim(4) = mean(outDimTotal(end,:));
stdDim25(4) = std(outDimTotal(Anteil/2,:));
stdDim50(4) = std(outDimTotal(Anteil,:));
stdDim75(4) = std(outDimTotal(Anteil*3/2,:));
stdDim(4) = std(outDimTotal(end,:));
load cameraman_9.mat
cameraman90 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(3) = mean(outDimTotal(Anteil/2,:));
meanDim50(3) = mean(outDimTotal(Anteil,:));
meanDim75(3) = mean(outDimTotal(Anteil*3/2,:));
meanDim(3) = mean(outDimTotal(end,:));
stdDim25(3) = std(outDimTotal(Anteil/2,:));
stdDim50(3) = std(outDimTotal(Anteil,:));
stdDim75(3) = std(outDimTotal(Anteil*3/2,:));
stdDim(3) = std(outDimTotal(end,:));
load cameraman_8.mat
cameraman80 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(2) = mean(outDimTotal(Anteil/2,:));
meanDim50(2) = mean(outDimTotal(Anteil,:));
meanDim75(2) = mean(outDimTotal(Anteil*3/2,:));
meanDim(2) = mean(outDimTotal(end,:));
stdDim25(2) = std(outDimTotal(Anteil/2,:));
stdDim50(2) = std(outDimTotal(Anteil,:));
stdDim75(2) = std(outDimTotal(Anteil*3/2,:));
stdDim(2) = std(outDimTotal(end,:));
load cameraman_7.mat
cameraman70 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(1) = mean(outDimTotal(Anteil/2,:));
meanDim50(1) = mean(outDimTotal(Anteil,:));
meanDim75(1) = mean(outDimTotal(Anteil*3/2,:));
meanDim(1) = mean(outDimTotal(end,:));
stdDim25(1) = std(outDimTotal(Anteil/2,:));
stdDim50(1) = std(outDimTotal(Anteil,:));
stdDim75(1) = std(outDimTotal(Anteil*3/2,:));
stdDim(1) = std(outDimTotal(end,:));
varTypes = {'Mean_25','Mean_50','Mean_75','Mean_100'};
vector25 = [meanDim25(1), stdDim25(1),meanDim25(2), stdDim25(2),meanDim25(3), stdDim25(3),meanDim25(4), stdDim25(4)];
vector50 = [meanDim50(1), stdDim50(1),meanDim50(2), stdDim50(2),meanDim50(3), stdDim50(3),meanDim50(4), stdDim50(4)];
vector75 = [meanDim75(1), stdDim75(1),meanDim75(2), stdDim75(2),meanDim75(3), stdDim75(3),meanDim75(4), stdDim75(4)];
vector100 = [meanDim(1), stdDim(1),meanDim(2), stdDim(2),meanDim(3), stdDim(3),meanDim(4), stdDim(4)];
cameraman = [vector25; vector50; vector75; vector100];
T_cameraman = table(varTypes',cameraman)

load circles_99.mat
circle99 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(4) = mean(outDimTotal(Anteil/2,:));
meanDim50(4) = mean(outDimTotal(Anteil,:));
meanDim75(4) = mean(outDimTotal(Anteil*3/2,:));
meanDim(4) = mean(outDimTotal(end,:));
stdDim25(4) = std(outDimTotal(Anteil/2,:));
stdDim50(4) = std(outDimTotal(Anteil,:));
stdDim75(4) = std(outDimTotal(Anteil*3/2,:));
stdDim(4) = std(outDimTotal(end,:));
load circles_9.mat
circle90 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(3) = mean(outDimTotal(Anteil/2,:));
meanDim50(3) = mean(outDimTotal(Anteil,:));
meanDim75(3) = mean(outDimTotal(Anteil*3/2,:));
meanDim(3) = mean(outDimTotal(end,:));
stdDim25(3) = std(outDimTotal(Anteil/2,:));
stdDim50(3) = std(outDimTotal(Anteil,:));
stdDim75(3) = std(outDimTotal(Anteil*3/2,:));
stdDim(3) = std(outDimTotal(end,:));
load circles_8.mat
circle80 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(2) = mean(outDimTotal(Anteil/2,:));
meanDim50(2) = mean(outDimTotal(Anteil,:));
meanDim75(2) = mean(outDimTotal(Anteil*3/2,:));
meanDim(2) = mean(outDimTotal(end,:));
stdDim25(2) = std(outDimTotal(Anteil/2,:));
stdDim50(2) = std(outDimTotal(Anteil,:));
stdDim75(2) = std(outDimTotal(Anteil*3/2,:));
stdDim(2) = std(outDimTotal(end,:));
load circles_7.mat
circle70 = mean(outDimTotal);
outDimTotal = outDimTotal';
Anteil = floor(length(outDimTotal)/2);
meanDim25(1) = mean(outDimTotal(Anteil/2,:));
meanDim50(1) = mean(outDimTotal(Anteil,:));
meanDim75(1) = mean(outDimTotal(Anteil*3/2,:));
meanDim(1) = mean(outDimTotal(end,:));
stdDim25(1) = std(outDimTotal(Anteil/2,:));
stdDim50(1) = std(outDimTotal(Anteil,:));
stdDim75(1) = std(outDimTotal(Anteil*3/2,:));
stdDim(1) = std(outDimTotal(end,:));
varTypes = {'Mean_25','Mean_50','Mean_75','Mean_100'};
vector25 = [meanDim25(1), stdDim25(1),meanDim25(2), stdDim25(2),meanDim25(3), stdDim25(3),meanDim25(4), stdDim25(4)];
vector50 = [meanDim50(1), stdDim50(1),meanDim50(2), stdDim50(2),meanDim50(3), stdDim50(3),meanDim50(4), stdDim50(4)];
vector75 = [meanDim75(1), stdDim75(1),meanDim75(2), stdDim75(2),meanDim75(3), stdDim75(3),meanDim75(4), stdDim75(4)];
vector100 = [meanDim(1), stdDim(1),meanDim(2), stdDim(2),meanDim(3), stdDim(3),meanDim(4), stdDim(4)];
circles = [vector25; vector50; vector75; vector100];
T_circles = table(varTypes',circles)

%%-------------------------------
close all
figure('position', [0, 0, 560, 840])  

subplot(6,4,1)
plot(cameraman70,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_1$', 'interpreter','latex')
yline(1);
xlim([0 1024])
subplot(6,4,2)
plot(cameraman80,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_1$', 'interpreter','latex')
yline(1);
xlim([0 1024])
subplot(6,4,3)
plot(cameraman90,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_1$', 'interpreter','latex')
yline(4);
xlim([0 1024])
subplot(6,4,4)
plot(cameraman99,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_1$', 'interpreter','latex')
yline(30);
xlim([0 1024])

subplot(6,4,5)
plot(circle70,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_2$', 'interpreter','latex')
yline(1);
xlim([0 1024])
subplot(6,4,6)
plot(circle80,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_2$', 'interpreter','latex')
yline(1);
xlim([0 1024])
subplot(6,4,7)
plot(circle90,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_2$', 'interpreter','latex')
yline(2);
xlim([0 1024])
subplot(6,4,8)
plot(circle99,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_2$', 'interpreter','latex')
yline(23);
xlim([0 1024])

subplot(6,4,9)
plot(turbine70,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_3$', 'interpreter','latex')
xlim([0 321])
yline(1);
subplot(6,4,10)
plot(turbine80,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_3$', 'interpreter','latex')
xlim([0 321])
yline(1);
subplot(6,4,11)
plot(turbine90,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_3$', 'interpreter','latex')
xlim([0 321])
yline(2);
subplot(6,4,12)
plot(turbine99,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_3$', 'interpreter','latex')
xlim([0 321])
yline(2);

subplot(6,4,13)
plot(real70,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_4$', 'interpreter','latex')
yline(2);
xlim([0 1280])
subplot(6,4,14)
plot(real80,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_4$', 'interpreter','latex')
yline(3);
xlim([0 1280])
subplot(6,4,15)
plot(real90,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_4$', 'interpreter','latex')
yline(3);
xlim([0 1280])
subplot(6,4,16)
plot(real99,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_4$', 'interpreter','latex')
yline(5);
xlim([0 1280])

subplot(6,4,17)
plot(waveformVoll70,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_5$', 'interpreter','latex')
yline(18);
subplot(6,4,18)
plot(waveformVoll80,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_5$', 'interpreter','latex')
yline(25);
subplot(6,4,19)
plot(waveformVoll90,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_5$', 'interpreter','latex')
yline(33);
subplot(6,4,20)
plot(waveformVoll99,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_5$', 'interpreter','latex')
yline(40);

subplot(6,4,21)
plot(waveformNoNoise70,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_6$', 'interpreter','latex')
yline(6);
subplot(6,4,22)
plot(waveformNoNoise80,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_6$', 'interpreter','latex')
yline(11);
subplot(6,4,23)
plot(waveformNoNoise90,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_6$', 'interpreter','latex')
yline(16);
subplot(6,4,24)
plot(waveformNoNoise99,'-','Color','k')
xlabel('Training cycles','Interpreter','latex')
ylabel('$m_6$', 'interpreter','latex')
yline(21);

text(-9750,154.5,'a)','Interpreter','latex')
text(-9750,122.5,'b)','Interpreter','latex')
text(-9750,90.5,'c)','Interpreter','latex')
text(-9750,58.5,'d)','Interpreter','latex')
text(-9750,26.5,'e)','Interpreter','latex')
text(-9750,-6.5,'f)','Interpreter','latex')

%% Export
export_fig Hall_cumulativeEnergy -transparent -pdf

