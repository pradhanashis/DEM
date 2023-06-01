function [row, col]=raster_traversal(ip)
    
    [r, c]=size(ip);
    
    row=-1;
    col=-1;
    
    for i=2:r-1
        flag=-1;
        for j=2:c-1
            
             tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
             tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
             tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);
                   
             neighbor=sum(tmp)-1;
                   
            if ip(i,j)==1 && flag==-1  && neighbor==1
                row=i;
                col=j;
                flag=1;
                break;
            end
        end
        
        if flag==1
            break;
        end
        
    end

end