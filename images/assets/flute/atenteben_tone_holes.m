% Geometric Parameters
d_h = 9.525; % tone hole diameter
l_h = 3.175; % tone hole length/height
d_1 = 14.684;% flute bore diameter at tone hole
d_0 = 14.684;% flute bore diameter at embouchure
d_e = 12.360;% embouchure hole diameter
l_e = 1.5875;% embouchure height
% Fixed Parameters
c = 346E3; % speed of sound
del = 0.75;% correction factor
dell_k = 0;% correction for keypad
g = 2^(1/12)-1; % interval ratio of less 1 (x/y-1);

% Desired Tone
F = 466.16;   % frequency

% Calculated Lengths
L_s = c/2/F;
dell_t = 0.3*d_1;
L_Be = (l_e + d_e)*((d_0/d_e)^2)-0.45*d_0;
L_Be2 = (l_e + del*d_e)*((d_0/d_e)^2);
dell_e = 50; %Typically L_Be or L_Be2
L_Bh = (l_h + d_h + dell_k)*((d_1/d_h)^2)-0.45*d_1;
z = 1/2*g*sqrt(1+4*L_Bh/g/L_s)-g/2;
dell_h = z*L_s;

% Tone Hole Placement
l_L = L_s-dell_e-dell_h;
l_T = L_s-dell_e-dell_t;



% D,R,M,F,S,L,T,D
% Bb, C, D, Eb, F, G, A, Bb
g0 = 2^(1/12)-1;
fs = [233.082, 261.626, 293.665, 311.127, 349.228, 391.995, 440, 466.164]*2;
gs = [g0, g0*g0, g0*g0, g0, g0*g0,g0*g0,g0*g0,g0];
X = [];

for i=1:8
    % Desired Tone
    F = fs(i);   % frequency
    g = gs(i);

    % Calculated Lengths
    L_s = c/2/F;dell_t = 0.3*d_1;L_Be = (l_e + d_e)*((d_0/d_e)^2)-0.45*d_0;
    L_Be2 = (l_e + del*d_e)*((d_0/d_e)^2);dell_e = 50; %Typically L_Be or L_Be2
    L_Bh = (l_h + d_h + dell_k)*((d_1/d_h)^2)-0.45*d_1;
    z = 1/2*g*sqrt(1+4*L_Bh/g/L_s)-g/2;dell_h = z*L_s;
    % Tone Hole Placement
    l_L = L_s-dell_e-dell_h;
    l_T = L_s-dell_e-dell_t;
    X = [X l_L];
end
X
Xinches = X*0.0393701