function [ip]=erase(traced, ip)
       [r, c]=size(traced);
       
       for i=1:r
           for j=1:c
               if traced(i,j)==255
                   ip(i,j)=0;
               end
           end
       end
       
end