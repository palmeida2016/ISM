function [I1, I2] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k)
    
    Sa = sY / k;

    [~, a, ~, b] = getMax(moment, range_x);
    M = max(abs(a), abs(b));
    
    I1 = M/((1/2) * Sa) * 10^6;

    disp(M)

    [~, c, ~, d] = getMax(displacement, range_x);
    v = max(abs(c), abs(d));

    disp(v)

    I2 = v/(E*v_allowed) * 10^6;
end