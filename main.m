disp('Superficie1')
load superficie1.mat

test2PartWithQR

%N, Nmatlab, Nqrtestg, Nqrtesth

%%

h = 1/r-1;

%%
U = intnormals(N, r, s, h);

subplot(2, 2, 1);

FV = PrintShape(U);

%%
Um = intnormals(Nmatlab, r, s, h);

subplot(2, 2, 2);

FVm = PrintShape(Um);

%%
Ug = intnormals(Nqrtestg, r, s, h);

subplot(2, 2, 3);

FVg = PrintShape(Ug);

%%
Uh = intnormals(Nqrtesth, r, s, h);

subplot(2, 2, 4);

FVh = PrintShape(Uh);

%%
test2PartWithSVD



disp('')
disp('')

disp('Conchiglia')
load conchiglia.mat
test2PartWithQR
test2PartWithSVD

