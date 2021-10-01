function [A, I] = getMoment(displacement, range_x, shear, v_allowed, E, Sy, k)
    
    Sa = Sy * k;

    [~, a, ~, b] = getMax(shear, range_x);
    F = max(abs(a), abs(b));
    
    A = F/(Sa) * 10^6;

    disp(F)

    [~, c, ~, d] = getMax(displacement, range_x);
    v = max(abs(c), abs(d));

    disp(v)

    I = v/(E*v_allowed) * 10^6;
end