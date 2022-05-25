%--------------------------------------------------------------------------
%Bu problemde N tane öznitelikten seçim yaparak M tane öznitelik çıkarmaya
%çalşıyoruz (M<N).
%Bu işlemi yaparken ACO algoritmasını kullanıyoruz.
%26.05.2022
%Tevfika Turan, Fatime Oumar Djibrillah
%--------------------------------------------------------------------------
%% PARAMETRELERİN BELİRLENMESİ
clear,clc;
load Healty_Endometrial.mat;     %veri setimizi yüklüyoruz.

numFolds = 4;                    %cross-validation için fold sayısı.
mdl_type ='knn';

n_ant = 10;                %karınca sayısı
n_feat = 15;               %seçilecek öznitelik sayısı.
maxiter = 100;             %maksimum iterasyın
tau = 1;                   % feromon miktarı
eta = 1;                   % sezgisel
alpha = 0.2;
beta = 0.2;
rho = 0.5;

dim = size(X,2);            %Veri setinden öznitelik sayısını çekiyoruz.
tau = tau*ones(dim,dim);    %tau değerini matrissel işlemlere uygun hale getirmek için boyutlandırıyoruz.
eta = eta*ones(dim,dim);    %eta değerini matrissel işlemlere uygun hale getirmek için boyutlandırıyoruz.

bestFit = inf;              %en iyi uygunluk değeri.

%% ACO Algoritmasının çalışması

[sfeatindex , sfeat, fitnes] = ACOFeatureSelection(X,y,dim,n_ant,...
    n_feat,bestFit,tau, alpha,eta, beta, rho,numFolds,...
    mdl_type, maxiter);

%% Sonuçların görseslleştirilmesi
plot(1:maxiter,fitnes)
xlabel('Number of Iteration');
ylabel('Fitness Value');
title('Feature Selection with ACO');
grid on;