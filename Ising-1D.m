%%% FOR N<1024 TO CONSIDER M(:,end)==1 
%%% FOR N=1024 TO CONSIDER all M
clear
tic
%N1=[8 16 64 256 1012];
N=64;
K=1;
%for j=1:5
    %N=N1(j);
    A=(rand(1,N) < 0.5 )*2 -1;
    T0=6;
    %T0=8;
    a=0.1;
    b=0.05;
    %T1=zeros(1,90);
    T1=zeros(1,70);
    for i =1:40
        T1(1,i)=T0 - a*i;
    end
    for j=41:80
        T1(1,j)= 2 - (b*(j-40));
    end
    %for k =51:70
        %T1(1,k)=2-(a*(k-50));
    %end
    r=(1:N)+1; r(N)=1;
    l=(1:N)-1; l(1)=N;
    num=0;
    for e=1:50
        num=num+1
        for g=1:80
            T(g)=T1(g);
            for q=1: N^2
                x=floor(rand*N)+1;
                H=A(1,x).*(A(1,r(x))+A(1,l(x)));
                P=exp((-(2*H))/(K*T(g)));
                if rand < P
                    A(1,x)=-A(1,x);
                end
            end
            H1=0;
            for f=1:N
                H1=H1-((A(1,f).*(A(1,r(f))+A(1,l(f))))/2);
            end
            H2(e,g)=H1/N;
            M(e,g)=(sum(A))/N;
        end
    end
    M1=(sum(M))/e;
    E=(sum(H2))/e;
    %cv=(var(H2))./(T.^2);
    %X=(var(M))./T;
    %w=1;
    %while w < e
    %w=w+1;
    %if abs(M(w,end)) >0.7
    %mm(w,:)=M(w,:);
    %ee(w,:)=H2(w,:);
    %end
    %end
    %z=(mm(:,1)~=0);
    %z1=(ee(:,end)~=0);
    %Cv=(((((sum(ee.^2))./(sum(z1)))-((((sum(ee))./(sum(z1))).^2))./(T.^2));
    
    %plot(T,((sum(abs(mm)))/(sum(z))));   sum(z)=tedad ensemble ke ba
    %sharayete ghabl baghi mande
    %MN(j,:)=M1;
    %EN(j,:)=E;
%end
plot(T,M1,'o');xlabel('tempreture');ylabel('magnetization');title('M & T');
toc
