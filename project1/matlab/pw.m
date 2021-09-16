function out = pw(x,x0,n)
    out = piecewise(x>=x0, (x-x0)^n, 0);
end