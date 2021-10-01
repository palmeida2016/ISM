function [x1, mins, x2, maxs] = getMax(f, range)
    domain = linspace(range(1), range(2), 1000);

    disps = subs(f, domain);

    [mins, i1] = min(disps);
    [maxs, i2] = max(disps);

    x1 = domain(i1);
    x2 = domain(i2);

end