function [ newB, num_zeros ] = process_block( B, tol )
% Applies compression algorithm to a 15x15 block of integers
% and produces a new image matrix and a count of zeros in
% the compressed coefficient matrix.
%
% Consumed values:
% B is a 15x15 image matrix
% tol is a nonnegative number used in the compression of the
% Fourier coefficients (only coefficients greater than tol are
% maintained)
% Produced values:
% newB is a 15x15 image matrix, resulting from applying ifft2 to our
% compressed coefficient matrix (type uint8)
% num_zeros is the number of coefficients that are 0 in the
% compressed coefficient matrix (some of them may have been 0
% originally)
% Apply 2-d fft to the 15x15 block
F = [fft2(B)];
% Discard ...
maxValue = max(max(F));
mask = (abs(F)<tol).*F;
newF = F-mask;
%F
% Apply the inverse operation to this "compressed" matrix
newB = uint8(real(ifft2(newF)));
num_zeros = sum(sum(newF==0));
end
