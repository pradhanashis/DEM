function [xc,yc]= centroid_calc(op)

[r, c]=size(op);

count=1; %For counting no. of significant pex

for i=1:r
    for j=1:c
        if op(i,j)==1
            X(count)=i; %For Storing Coordinates of Xi
            Y(count)=j; %For Storing Coordinates of Yi
            count=count+1;
        end
    end
end

count=count-1;

xc=sum(X)/count;
yc=sum(Y)/count;

end