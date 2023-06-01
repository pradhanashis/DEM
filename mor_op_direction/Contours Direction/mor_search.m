%THIS FUNCTION INVOKES m-connectivity(), centroid_calc(), compare_op(), 
function []= mor_search(ip)

   % figure(1), imshow(ip);
    op=m_connectivity_v1(ip); % ENSURES COUNT OF NEIGHBORS to 0,1,2
    %figure(2), imshow(op);
    
    [r, c]=size(op);
    contour_direction= zeros(r,c,'uint8');
    
    [xc,yc]= centroid_calc(op);
    
    for i=2:r-1
         for j=2:c-1
             tmp(1)=op(i-1,j-1);      tmp(2)=op(i-1,j);       tmp(3)=op(i-1,j+1);
             tmp(4)=op(i,j-1);        tmp(5)=op(i,j);         tmp(6)=op(i,j+1);
             tmp(7)=op(i+1,j-1);      tmp(8)=op(i+1,j);       tmp(9)=op(i+1,j+1);
             
             if tmp(5)==1
                 index=compare_op(tmp);
                
                 if xc>=i
                    if index==1 || index==14 || index==16
                        contour_direction(i,j)=90;
                    elseif index==2 || index==4 || index==6 || index==7 ||index==10
                        contour_direction(i,j)=45;
                    elseif index==3 || index==5 || index==9 || index==11 ||index==12
                        contour_direction(i,j)=135;
                    elseif index==13 || index==15
                        contour_direction(i,j)=180;
                    elseif index==8 && j>yc
                        contour_direction(i,j)=0;
                    elseif index==8 && j<=yc
                        contour_direction(i,j)=180;
                    else
                        contour_direction(i,j)=255;
                    end
                 end
                 
                 if xc<=i %When xc <=x
                    if index==1 || index==14 || index==16
                        contour_direction(i,j)=270;
                    elseif index==2 || index==4 || index==6 || index==7 || index==10
                        contour_direction(i,j)=225;
                    elseif index==3 || index==5 || index==9 || index==11 || index==12
                        contour_direction(i,j)=315;
                    elseif index== 13|| index==15
                        contour_direction(i,j)=0;
                    elseif index==8 && j>yc
                        contour_direction(i,j)=0;
                    elseif index==8 && j<=yc
                        contour_direction(i,j)=180;
                    else
                        contour_direction(i,j)=255;
                    end
                end
                                                    
                                                       
             end
         end
    end
    save contour_direction.mat;
    figure(3), imshow(contour_direction);
end