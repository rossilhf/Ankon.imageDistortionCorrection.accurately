A_output=double(imread('temp.bmp'));

A_temp=zeros(length(A_output(:,1,1)),length(A_output(1,:,1)),3);



for m=1:3
    for ii=2:length(A_output(:,1,1))-1
        for jj=2:length(A_output(1,:,1))-1
            if A_output(ii,jj,m)==0
                count=0;
                for i=-1:1
                    for j=-1:1
                        if A_output(ii+i,jj+j,m)~=0
                            A_temp(ii,jj,m)=A_temp(ii,jj,m)+A_output(ii+i,jj+j,m);
                            count=count+1;
                        end
                    end
                end
                if count~=0
                    A_temp(ii,jj,m)=A_temp(ii,jj,m)/count;
                end
            end
        end
    end
end
A_output=A_output+A_temp;
A=imread('temp.bmp');

A_output(:,:,1)
A(:,:,1)