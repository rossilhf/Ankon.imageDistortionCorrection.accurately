%���������ڽ����/���۾�ͷ����Ļ�����Ƭ�ָ��������ӽ�
A0=imread('test2.bmp');%����ͼ��
W=length(A0(1,:,1));%ͼ�����
H=length(A0(:,1,1));%ͼ��߶�
% %����������������ʵ�ʾ�ͷ����ı�׼ģ��ͼ���в��������ݵõ���
% R=[1 2 3 4 5 6 7 8 9];%��ʵͼ�������ص�����λ�õľ���
% r=[1.0000 1.9300 2.8000 3.5400 4.1800 4.7200 5.1300 5.5800 5.9000];%����ͼ������Ӧ���ص�����λ�õľ���
% N=4;%����������ݵĶ���ʽ�������ý��������Ե���
r0=20;%������Ҫ����������һ�����裺ͼ����������뾶Ϊr0�ķ�Χ������ʧ��ġ������������������ģ��ͼƬ�У������α߳���0.5cm���ڻ���ͼ������
      %Ϊ20���س��ȣ�����ͼ��������ĳ�������ζ����ϣ�������������뾶Ϊ20���س��ȵ����������Ǽ�����ʧ��
% 
% pr2R=polyfit(r,R,N);%������ߵĸ���ϵ��,�ú�������Ϊ����ͼ�����صľ������꣬���Ϊ��ʵͼ��ľ�������
% pR2r=polyfit(R,r,N);%������ߵĸ���ϵ��,�ú�������Ϊ��ʵͼ�����صľ������꣬���Ϊ����ͼ��ľ�������
pr2R=[0.001743 0.010216 -0.052918 1.1364 -0.09506];
pR2r=[0.00036131 -0.0054248 -0.023879 1.0502 -0.025556];

A=zeros(3*H,3*W,3); %��ԭͼ�Ļ��������չΪԭ����9��������������Ϊ����λ��
A=uint8(A);

for m=1:3%ͼ��������ɫ�ʲ�
%     m
    for i=1:H %ɨ����չ���������ͼƬ��ԭͼ���ֵ���������
        for j=1:W
            L1=((j-0.5*(W+1))^2+(i-0.5*(H+1))^2)^0.5; %�������ص�P��ͼ�����ĵľ���(��λ������)
%             L0=polyval(pr2R,L1/r0); %�����������P��ͼ�����ĵľ��루��λ��r0��
            L0=pr2R(1)*(L1/r0)^4+pr2R(2)*(L1/r0)^3+pr2R(3)*(L1/r0)^2+pr2R(4)*(L1/r0)+pr2R(5);
            L0=L0*r0;%�����������P��ͼ�����ĵľ��루��λ�����أ�
            
            Ly1=i-0.5*(H+1);%�ڽ���ǰ��ͼ�е������꣬������ǰ���ص����ĵ��ݾ��루��������
            Lx1=j-0.5*(W+1);%�ڽ���ǰ��ͼ�еĺ����꣬������ǰ���ص����ĵĺ���루��������
            Ly0=Ly1*L0/L1;%�ڽ������ͼ�е������꣬�����������ص����ĵ��ݾ��루��������
            Lx0=Lx1*L0/L1;%�ڽ������ͼ�еĺ����꣬�����������ص����ĵĺ���루��������
            
            x0=W+((W+1)/2)+Lx0;
            y0=H+((H+1)/2)+Ly0; %�������ͼ��P����
            
            x0=round(x0);
            y0=round(y0);
            if x0>=1 & x0<=3*W & y0>=1 & y0<=3*H
                A(y0,x0,m)=A0(i,j,m);
            end
            if i==1 & j==0.5*W
                coordhigh=[y0 x0];%����ͼ���һ���м�һ�е���������任������ͼ���к������
            end
            if j==1 & i==0.5*H
                coordleft=[y0 x0];%����ͼ���м�һ�е�һ�е���������任������ͼ���к������
            end
            if j==W & i==0.5*H
                coordright=[y0 x0];%����ͼ���м�һ�����һ�е���������任������ͼ���к������
            end
            if i==H & j==0.5*W
                coordlow=[y0 x0];%����ͼ�����һ���м�һ�е���������任������ͼ���к������
            end
        end
    end
end
% 
% %��ֵ
% for m=1:3
% %     m
%     for y0=1:3*H
%         for x0=1:3*W
%             if A(y0,x0,m)==0
%                 L0=((x0-W-0.5*(W+1))^2+(y0-H-0.5*(H+1))^2)^0.5; %���������ص�P��ͼ�����ĵľ��루��λ�����أ�
% %                 L1=polyval(pR2r,L0/r0); %����ǰ������P��ͼ�����ĵľ��루��λ��r0��
%                 L1=pR2r(1)*(L0/r0)^4+pR2r(2)*(L0/r0)^3+pR2r(3)*(L0/r0)^2+pR2r(4)*(L0/r0)+pR2r(5);
%                 L1=L1*r0; %����ǰ������P��ͼ�����ĵľ��루��λ�����أ�
%             
%                 Ly0=y0-H-0.5*(H+1);
%                 Lx0=x0-W-0.5*(W+1);
%                 Ly1=Ly0*L1/L0;
%                 Lx1=Lx0*L1/L0;
%                 
%                 j=((W+1)/2)+Lx1;
%                 i=((H+1)/2)+Ly1;
%                 
%                 j=round(j);
%                 i=round(i);
%                 if j>=1 & j<=W & i>=1 & i<=H
%                     A(y0,x0,m)=A0(i,j,m);
%                 end
%             end
%         end
%     end
% end
% % 
% % imagesc(A0)
% % figure
% % imagesc(A)
% A_output=A(coordhigh(1):coordlow(1),coordleft(2):coordright(2),:);
% % figure
% % imagesc(A_output)