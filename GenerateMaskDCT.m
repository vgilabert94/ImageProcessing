function mask = GenerateMaskDCT(N,c)
    if c > N
        error("c must be smaller than N.")
    else
        mask = zeros(N);
        mask(1:c,1:c) = flipud(tril(ones(c)));
    end
end