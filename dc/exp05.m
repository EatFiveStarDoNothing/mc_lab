clc;
clear all;
close all;

%MPSK params
M = 32;
X = 0: M-1;
N = 1;
OFF = 0;

Z = pskmod(X, M);
scatterplot(Z, N, OFF, 'r+');
title("this is mpsk modulation for m =32");
