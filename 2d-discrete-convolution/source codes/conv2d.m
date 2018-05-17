
% Mert KELKİT - 150115013
% Rümeysa ELİÖZ - 150114016

% 2D Convolution function
function [ zero, border ] = conv2d( img, filter )

    % Flip filter, taking point (1,1) as first element
    filter = rot90(filter, 2);

    % Getting dimensions of filter
    [x1, y1] = size(filter);
    % Getting dimensions of image
    [x2, y2] = size(img);
    
    % Initilalizing returning images with their sizes
    zero = zeros(x2, y2);
    border = zeros(x2, y2);
    
    % Initializing padded images
    % Because of we use (1, 1) point as initial point of filter ...
    % ... we add x1-1 pixels to the right, y1-1 pixels to the bottom
    % Zero padding...
    zero_padded = zeros(x1+x2-1, y1+y2-1);
    zero_padded(1:x2, 1:y2) = img;
    % Replicating borders...
    border_replicated = zeros(x1+x2-1, y1+y2-1);
    border_replicated(1:x2, 1:y2) = img;
    border_replicated = padarray(border_replicated, [x1-1, y1-1], 'replicate', 'post');
    
    for i = 1:x2
        for j = 1:y2
            % Walking around flipped filters on the padded images
            % And convolving with dot multiplication
            % -We used sum function two times because images are 2D arrays-
            zero(i, j) = sum(sum(filter.*zero_padded(i:i+x1-1, j:j+y1-1)));
            border(i, j) = sum(sum(filter.*border_replicated(i:i+x1-1, j:j+y1-1)));
        end
    end
    % Images shouldn't have negative values, so we cast them to unsigned---
    % --- integers.
    zero = uint8(zero);
    border = uint8(border);
end



