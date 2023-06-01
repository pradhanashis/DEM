function []= mor_search(ip)

   % figure(1), imshow(ip);
    op=m_connectivity_v1(ip); % ENSURES COUNT OF NEIGHBORS to 0,1,2
    %figure(2), imshow(op);
    
    [r, c]=size(op);
    contour_direction= zeros(r,c,'uint8');
    for i=2:r-1
         for j=2:c-1
             tmp(1)=op(i-1,j-1);      tmp(2)=op(i-1,j);       tmp(3)=op(i-1,j+1);
             tmp(4)=op(i,j-1);        tmp(5)=op(i,j);         tmp(6)=op(i,j+1);
             tmp(7)=op(i+1,j-1);      tmp(8)=op(i+1,j);       tmp(9)=op(i+1,j+1);
             
             if tmp(5)==1
                 index=compare_op(tmp);
                 contour_direction(i,j)=index;
             end
         end
    end
    save contour_direction.mat;
    figure(3), imshow(contour_direction);
end