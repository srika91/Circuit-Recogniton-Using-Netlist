
function rad = radialpoly(r,n,m)
rad = zeros(size(r));                     % Initilization
for s = 0:(n-abs(m))/2
  c = (-1)^s*factorial(n-s)/(factorial(s)*factorial((n+abs(m))/2-s)*factorial((n-abs(m))/2-s));
  rad = rad + c*r.^(n-2*s);
end
