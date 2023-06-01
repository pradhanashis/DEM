%clc; clear;
%ip = imread('C:\Users\ashis\Documents\MATLAB\thin_phd\without_text_refined.jpg');
function [op]= ashis_thin_v1(ip)
    [r, c, l]=size(ip); 

    binary=ip;
    
    changing = 1;       thin=binary;        Del_img = ones(r, c);
    while changing
        changing=0;
           %STEP 1
         for i=2:r-1
            for j = 2:c-1
                P = [thin(i,j) thin(i-1,j) thin(i-1,j+1) thin(i,j+1) thin(i+1,j+1) thin(i+1,j) thin(i+1,j-1) thin(i,j-1) thin(i-1,j-1) thin(i-1,j)];
                if (thin(i,j) == 1 &&  sum(P(2:end-1))<=6 && sum(P(2:end-1)) >=2 && P(2)*P(4)*P(6)==0 && P(4)*P(6)*P(8)==0)  
                    transition = 0;
                    for k = 2:9       %size(P,2)-1 %size return no. of row and col
                        if P(k) == 0 && P(k+1)==1
                            transition = transition+1;
                        end
                    end
                    if (transition==1)
                        Del_img(i,j)=0; 
                        changing = 1;
                    end
                end
            end
        end
        thin = thin.*Del_img;  
         %STEP 2
        for i=2:r-1
            for j = 2:c-1
                P = [thin(i,j) thin(i-1,j) thin(i-1,j+1) thin(i,j+1) thin(i+1,j+1) thin(i+1,j) thin(i+1,j-1) thin(i,j-1) thin(i-1,j-1) thin(i-1,j)];
                if (thin(i,j) == 1 &&  sum(P(2:end-1))<=6 && sum(P(2:end-1)) >=2 && P(2)*P(4)*P(8)==0 && P(2)*P(6)*P(8)==0)   % conditions
                    A = 0;
                   for k = 2:size(P,2)-1
                        if P(k) == 0 && P(k+1)==1
                            A = A+1;
                        end
                   end

                   if (A==1)
                        Del_img(i,j)=0;
                        changing = 1;
                   end
                end
            end
        end
        thin = thin.*Del_img;
      %  pause(0.5);   UNCOMMENT IF WANT TO VISUALIZE OP
      %  figure(3),imshow(Del_img) UNCOMMENT IF WANT TO VISUALIZE OP
    end
    for i=1:r %Binary Conversion
        for j=1:c
            if thin(i,j)==0
                thin(i,j)=1;
            else
                 thin(i,j)=0;
            end
        end
    end
    figure(10),imshow(thin);  %UNCOMMENT IF WANT TO VISUALIZE OP
    op=thin;
end

%imwrite(thin,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\mor_op_direction\thinned_contours.jpg');