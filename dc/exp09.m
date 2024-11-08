clc;
clear all;
close all;
code_length=0;
x=input('Enter number of symbols: ');
for m=1:x
symbols(m)=input('Enter the symbol number: ');
p(m)=input('Enter the probability: ');
end
Hx=0
for m=1:x
[dict,avglen]=huffmandict(symbols,p)
hcode=huffmanenco(m,dict)
dsig = huffmandeco(hcode,dict)
code_length=length(hcode)
Hx=Hx+(p(m)*(-log(p(m)))/(log(2)));
end
display(Hx);
Efficiency=(Hx/avglen)*100
Disp(Efficiency);



Or for exp 9 - huffman coding 
clc;
clear all;
close all;
code_length=0;
symbols=[1:5]
p=[0.4 0.15 0.15 0.15 0.15];
[dict,avglen]=huffmandict(symbols,p)
avginfo=0;
for i=1:length(p)
avginfo=avginfo+p(i)*log2(1/p(i));
end
Efficiency=avginfo*100/avglen
sig=randsrc(1,100,[symbols;p]);
hcode=huffmanenco(sig,dict);
decode=huffmandeco(hcode,dict);
code_length=length(hcode)
display(avginfo);
display(Efficiency);
isequal(sig,decode)
