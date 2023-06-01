function []=topo_data_prep_v1(ip)
    % This fuction invokes thinning op and searching op

   % ip=imread('s1.bmp');
    ip= imresize(ip,[200,200],'nearest');
    %figure(1), imshow(ip);
    
    %ip=imbinarize(ip,0.5);

    op=ashis_thin_v1(ip); %CONTOURS IN IN BLACK COLOUR IN WHITE BACKGROUND
    figure(2), imshow(op);
    imwrite(op,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\mor_op_direction\thinned_contours.jpg');
    
    mor_search(op);
end