function [ip]=refine_isolated_points(ip)
    [r,c]= size(ip);
    ip= im2bw(ip,0.5);
    for i=2:r-1
        for j=2:c-1
            tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
            tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
            tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);
            
            neighbor= sum(tmp)-1;
            
            if tmp(5)==1 && neighbor==0  
                ip(i,j)=0;
            end
        end
    end

end