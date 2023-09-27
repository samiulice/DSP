%% DFT using exponential form equation:
function [X_exp, X_mag, X_ang_deg] = dft(x, N)
    X_exp = zeros(1,N);
    X_mag = zeros(1,N);
    X_ang_deg = zeros(1,N);
    j = sqrt(-1); 
    for m = 0:N-1
        i = m+1;
        for n = 0:N-1                  
            X_exp(1,i) = X_exp(1,i) + x(1,n+1)*exp((-j*2*pi*n*m)/N);  
        end
        Xe_real = real(X_exp(1,i));
        if abs(Xe_real)< 1e-10
           Xe_real = 0;  
        end  
        Xe_imag = imag(X_exp(1,i));
        if abs(Xe_imag) < 1e-10
           Xe_imag = 0;  
        end  
        X_mag(1,i) = sqrt(Xe_real.^2 + Xe_imag.^2);
        Xe_ang_rad = atan(Xe_imag/Xe_real);     
        Xe_ang_rad(isnan(Xe_ang_rad)) = 0;
        X_ang_deg(1,i) = (180/3.14159)*Xe_ang_rad; 
    end   
end

