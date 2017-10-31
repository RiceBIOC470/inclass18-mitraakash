function test_with_ttest(num)

x = randi([1 9], 1, num);
y = randi([1 10], 1, num);
[is_sig, pval] = ttest2(x,y);
disp(['Is significant: ' num2str(is_sig)]);
disp(['P-value: ' num2str(pval)]);


for i = 1:1000;
    x = randi([1 9], 1, num);
    y = randi([1 10], 1, num);
    [is_sig(i), pval(i)] = ttest2(x,y);
end

disp(['Number of times Significant in a 1000 draws: ' num2str(sum(is_sig))]);