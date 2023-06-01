
    clc; clear;
    ip=zeros(100,100,'uint8');
    %figure(2), imshow(ip);
    [row, col]=size(ip);
    
    %Controid Calculation
    x_c=row/2; 
    y_c=col/2; 
    
    rowMin=1; colMin=1;
    rowMax=row; colMax=col;
  %  limit= ceil(row/2);
    
    for flag=1:row/2
        top=-1; down=-1; left=-1; up=-1;
        i=flag;
        for j=i:(colMax-flag+1) %Towards Right
            if ip(i,j)==1
                top=0;
                row=i; col=j;
                fprintf('\n RIGHT detected point from Spiral Traversal: row=%d and col=%d', row,col);
                break;
            end
           ip(i,j)=255;
           figure(1), imshow(ip);
        end
        
        if top==-1
            j=colMax-flag+1;
            for i=flag+1:(rowMax-flag) %Towards Down
               if ip(i,j)==1
                    down=0;
                    row=i; col=j;
                    fprintf('\n DOWN detected point from Spiral Traversal: row=%d and col=%d', row,col);
                    break;
                end
               ip(i,j)=255;
               figure(1), imshow(ip);
            end
            
        end

        if top==-1 && down==-1
            i=rowMax-flag+1;
            for j=colMax-flag-1:-1:flag %Towards Left
               if ip(i,j)==1
                    left=0;
                    row=i; col=j;
                    fprintf('\n LEFT detected point from Spiral Traversal: row=%d and col=%d', row,col);
                    break;
                end
              ip(i,j)=255;
              figure(1), imshow(ip);
            end
        end
        
        if top==-1 && down==-1 && left==-1
            j=flag;
            for i=rowMax-flag-1:-1:(flag+1) %Towards Up
                if ip(i,j)==1
                    up=0;
                    row=i; col=j;
                    fprintf('\n UP detected point from Spiral Traversal: row=%d and col=%d', row,col);
                    break;
                end
                ip(i,j)=255;
                figure(1), imshow(ip);
            end
            
        end
        
        if flag==x_c || flag==y_c
            image_center_flag=1;
            break;
        elseif top==0 || down==0 || left==0  || up==0 
            break;
        end
    end
