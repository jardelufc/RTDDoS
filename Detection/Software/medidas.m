for i = 1:length(treta(1,:))
temp = length(find(treta(:,i) == 0));
tax(i) = (1 - (temp/20))*100;
end