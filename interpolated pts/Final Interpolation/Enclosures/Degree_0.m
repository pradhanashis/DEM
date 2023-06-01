function [len]= Degree_0(i,j, ip_ang)

    [r,c]=size(ip_ang);
     i=i;  j=j+1;
     
     flag=0;
     len=1;
      while (flag~=1)
           % fprintf('\n i= %d and j= %d \n', i, j);
           if i== 2 || i==(r-1) || j==2 || j== (c-1)   %Stopping Criteria for if traversal reaches border of image 
                flag=1;
                 len=0;
                break;
            end
           

            tmp(1)=ip_ang(i-1,j-1);      tmp(2)=ip_ang(i-1,j);       tmp(3)=ip_ang(i-1,j+1);
            tmp(4)=ip_ang(i,j-1);        tmp(5)=ip_ang(i,j);         tmp(6)=ip_ang(i,j+1);
            tmp(7)=ip_ang(i+1,j-1);      tmp(8)=ip_ang(i+1,j);       tmp(9)=ip_ang(i+1,j+1);

            %if tmp(4)~=0 && tmp(5)~=0 && tmp(6)~=0  %Stopping Criteria
            if tmp(5)~=0
                flag=1;
                break;
            end
                
            if tmp(5)==0 
                len=len+1;
                i=i;  j=j+1;
                
            end


      end
end