function [index]= compare_op(tmp)

mor_op_db=[     
                0	0	0	0	1	0	0	1	0;
                0	1	0	0	1	0	0	0	1;
                1	0	0	0	1	1	0	0	0;
                0	0	0	1	1	1	0	0	0;
                0	0	0	1	1	0	0	0	1;
                1	0	0	0	1	0	0	1	0;
                0	1	0	0	1	0	0	1	0;
                1	0	0	0	1	0	0	0	1;
                0	0	0	0	1	1	1	0	0;
                0	0	1	0	1	0	1	0	0;
                0	0	1	1	1	0	0	0	0;
                0	0	1	0	1	0	0	1	0;
                0	1	0	0	1	0	1	0	0;
                1	0	0	0	1	0	0	0	0;
                0	1	0	0	1	0	0	0	0;
                0	0	0	0	1	0	0	0	1;
                0	0	0	1	1	0	0	0	0;
                0	0	0	0	1	1	0	0	0;
                0	0	0	0	1	0	0	0	0;
                1	0	0	0	1	0	1	0	0;
                0	0	1	0	1	0	0	0	0;
                0	0	0	0	1	0	1	0	0;
                1	0	1	0	1	0	0	0	0;
                0	0	0	0	1	0	1	0	1;
                0	0	1	0	1	0	0	0	1;
                ];
  % tmp=[1	0	1	0	1	0	0	0	0]; 
   % disp(mor_op_db);
   [r,c]=size(mor_op_db);
   disp(r); disp(c);
   
   for i=1:r
       flag= isequal(tmp, mor_op_db(i,:));
       disp('flag');disp(flag);
       if flag==1
           disp('index value'); disp(i);
           
           break;
       end
   end
   index=i;
end