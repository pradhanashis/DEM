%FOR ENCLOSURE ORG CONTOUR
contour_pt= xlsread('plot_data1.xlsx', 1);

[r, c]=size(contour_pt);


for index= 1: (r-1)
    k=1;
    while contour_pt(index,1)~= -999
        
        x(k)=contour_pt(index, 1);
        y(k)=contour_pt(index, 2);
        z(k)=contour_pt(index, 3);
        
        k=k+1;
        index=index+1;
        
    end
    plot3(x,y,z);%,'o','color','black'); 
    %plot3(x,y,z,'o','color','black'); 
    hold on;
  
    
end

hold off;