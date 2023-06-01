%THIS FUNCTION ENSURES THAT EACH SIGNIFICANT PIXEL HAVE EXACTLY EITHER
%NEIGHBOUR 0, 1 OR 2, IF ITS >= 3 , IT NULLIFIES REMOVING MULTIPLE PATH

function [op]=m_connectivity_v1(ip)
    %ip= [0, 0, 0, 0, 0;
     %    0, 1, 1, 0, 0;
      %   0, 1, 1, 1, 0;
       %  0, 0, 1, 1, 1;
        % 0, 0, 1, 1, 0];
    % ip=imcomplement(im2bw(imread('thinned_contours.jpg'),0.3));
    % ip= medfilt2(ip,[3 3]);

     %disp(ip);
     ip=imcomplement(ip);
     x=ip;

     [r, c]=size(ip); fprintf('\n row is %d and col is %d \n',r,c);

     for i=2:r-1
         for j=2:c-1
             tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
             tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
             tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);

             if tmp(5)==1 %if Significant Neighbour
                 add_neighbor=tmp(1)+tmp(2)+tmp(3)+tmp(4)+tmp(6)+tmp(7)+tmp(8)+tmp(9);
                % fprintf('\n neighbour count is %d',add_neighbor);

                 if add_neighbor >=2
                     if tmp(1)==1 && tmp(2)==1
                             ip(i-1,j)=0;
                     end
                     if tmp(2)==1 && tmp(3)==1
                             ip(i-1,j)=0;
                     end
                      if tmp(3)==1 && tmp(6)==1
                              ip(i,j+1)=0;
                      end
                      if tmp(6)==1 && tmp(9)==1
                              ip(i,j+1)=0;
                      end
                     if tmp(9)==1 && tmp(8)==1
                             ip(i+1,j)=0;
                     end
                     if tmp(8)==1 && tmp(7)==1
                             ip(i+1,j)=0;
                     end
                      if tmp(4)==1 && tmp(7)==1
                             ip(i,j-1)=0;
                     end
                 end
             end
         end
     end

     %ENSURING THAT WHETHER ALL SIGNIFICANT PIXEL HAVE LESS THAN 2 NEIGHBORS
     add_neighbor=0;
      for i=2:r-1
         for j=2:c-1
             tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
             tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
             tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);

             if tmp(5)==1
                 add_neighbor=tmp(1)+tmp(2)+tmp(3)+tmp(4)+tmp(6)+tmp(7)+tmp(8)+tmp(9);
                 if add_neighbor > 2
                     %fprintf('\n The location of pixel with > 2 neighbour count is=  %d %d',i,j);
                     add_neighbor=0;
                 end

             end 
         end
      end
      ip_m_connectivity=ip;
      save ip_m_connectivity.mat;
     %figure(2), imshow(ip_m_connectivity);
     op=ip_m_connectivity;
end

