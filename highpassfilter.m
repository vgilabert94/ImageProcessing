function H = highpassfilter(filterSize,CutOffFrec,n)
    if (CutOffFrec >= 0 && CutOffFrec <= 0.5 && length(filterSize) == 2)

        H = 1 - lowpassfilter(filterSize,CutOffFrec,n);
        
    else
        error("Input date error.")
    end
end

% Tambien se puede calcular el FPA directamente con:
% M = filterSize(1);
% N = filterSize(2);
% centerM = round(M/2);
% centerN = round(N/2);
% frec = M * CutOffFrec;
% for u=1:M
%     for v=1:N
%         Dij = sqrt(((u - centerM)^2) + ((v - centerN)^2));
%         H(u,v) = 1 / (1 + (frec/Dij)^(2*n));
%     end
% end