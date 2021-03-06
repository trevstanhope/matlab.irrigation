%% Calculate Radiation using AP Method
% Author: Olanike Aladenola
% Organization: McGill University, Department of Hydrology
% Updated: February 28th, 2013

% ARGUMENTS:
% 1. n; Array
% 2. N; Array
% 3. a; Int
% 4. b; Int
% 5. L; Int

% OUTPUTS:
% 1. Rs; Array
% 2. Ra; Array

function [Rs Ra] = R_AP(n,N,a,b,L)
% Initializations
dr = zeros(1,12);
c = zeros(1,12);
d = zeros(1,12);
m = zeros(1,12);
ws = zeros(1,12);
Ra = zeros(1,12);
Rs = zeros(1,12);
X = zeros(1,12);
Y = zeros(1,12);

% Global Constants
days = [15 46 76 107 137 167 198 228 259 289 319 350];

for i = 1:12
    j=(3.141593/180)*L;
    dr(i)=1+0.033*cos(0.017214*days(i));
    c(i)=(0.017214206*days(i))-1.39;
    d(i)=0.409*sin(c(i));
    m(i)=-tan(j)*tan(d(i));
    ws(i)=acos(m(i));
    X(i)=sin(j)*sin(d(i));
    Y(i)=cos(j)*cos(d(i));
    Ra(i)=37.58603*(dr(i))*((ws(i)*X(i))+(Y(i)*(sin(ws(i)))));
    Rs(i) = (a+(b*(n(i)/N(i))))*Ra(i);
end
end