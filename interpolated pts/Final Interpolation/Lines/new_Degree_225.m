function [len]= new_Degree_225(i,j, ip_ang, feature)
   
    [feature_rows, feature_cols]=size(feature);
  
   
    [r,c]=size(ip_ang);
    % fprintf('\n Interpolating  (%d, %d)', i, j );
    i=i+2;  j=j-2;
     
    flag=0;
    len=1;
    border=-1;
    n=0;
    
    if i <= (r-1) && j>=2 
            tmp(1)=ip_ang(i-1,j-1);      tmp(2)=ip_ang(i-1,j);       tmp(3)=ip_ang(i-1,j+1);
            tmp(4)=ip_ang(i,j-1);        tmp(5)=ip_ang(i,j);         tmp(6)=ip_ang(i,j+1);
            tmp(7)=ip_ang(i+1,j-1);      tmp(8)=ip_ang(i+1,j);       tmp(9)=ip_ang(i+1,j+1);
            n=sum(tmp);
    end
    
   
    
    while (flag~=1)
        
                if i>=(r-1) || j<=2   %Stopping Criteria for if traversal reaches border of image 
                    flag=1;
                    border=1; 
                    len=0;
                    break;
                end
                                                 
                if tmp(5)==0 %&& tmp(4)==0 && tmp(8)==0
                        len=len+1;
                        i=i+1;  j=j-1; %Update coodinate value
                       % fprintf('\n \t\t Updated (%d, %d)', i, j ); 
                       
                end
                
                if border~=1
                    tmp(1)=ip_ang(i-1,j-1);      tmp(2)=ip_ang(i-1,j);       tmp(3)=ip_ang(i-1,j+1);
                    tmp(4)=ip_ang(i,j-1);        tmp(5)=ip_ang(i,j);         tmp(6)=ip_ang(i,j+1);
                    tmp(7)=ip_ang(i+1,j-1);      tmp(8)=ip_ang(i+1,j);       tmp(9)=ip_ang(i+1,j+1);
                    n=sum(tmp);
                end
                
                if tmp(5)~=0  || tmp(1)~=0 || tmp(9)~=0  || tmp(4)~=0 || tmp(8)~=0  || n>=1 
                        %len=0;
                        flag=1;
                        break;
                 end
    end
    
    target_x=-1; target_y=-1;
    
    if len ~=0 % && ip_ang(i,j)~=0
        tmp(1)=ip_ang(i-1,j-1);      tmp(2)=ip_ang(i-1,j);       tmp(3)=ip_ang(i-1,j+1);
        tmp(4)=ip_ang(i,j-1);        tmp(5)=ip_ang(i,j);         tmp(6)=ip_ang(i,j+1);
        tmp(7)=ip_ang(i+1,j-1);      tmp(8)=ip_ang(i+1,j);       tmp(9)=ip_ang(i+1,j+1);

       % fprintf('\n The value for idenfying targets=  '); disp(tmp);

        for x=1:9
            if  tmp(1)~=0
                target_x=i-1;         target_y=j-1;         break;
            end
            if  tmp(2)~=0
                target_x= i-1;         target_y= j;         break;
            end
            if  tmp(3)~=0
                target_x= i-1;         target_y= j+1;       break;
            end
            if  tmp(4)~=0
                target_x= i;         target_y= j-1;         break;
            end  
            if  tmp(5)~=0
                target_x= i;         target_y= j;           break;
            end
            if  tmp(6)~=0
                target_x= i;         target_y= j+1;         break;
            end
            if  tmp(7)~=0
                target_x= i+1;         target_y= j-1;       break;
            end
            if  tmp(8)~=0
                target_x= i+1;         target_y= j;         break;
            end    
            if  tmp(9)~=0
                target_x= i+1;         target_y= j+1;       break;
            end        
        end

    end
    
    matched=-1;
    k=1;
   % fprintf('\n target_x= %d, target_y=%d', target_x, target_y);
    
     
     while  k~=feature_rows
         if feature(k,1)==target_x && feature(k,2)==target_y
               matched=1;
             %  fprintf('\n same point matched');
               break;
         end
         k=k+1;
     end
     
     if  matched==1 || border==1
        %  fprintf('\n same features  matched data updated');
         len=0;
     end
     
end
 
  