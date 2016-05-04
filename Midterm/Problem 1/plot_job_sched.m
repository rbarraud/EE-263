function [] = plot_job_sched(theta)
    [T,n] = size(theta);
    figure();
    cm = hsv(n);
    hold on;
        for j = 1:n
            stairs(1:T , theta(:,j) , 'Color' , cm(j,:));
        end
    hold off;
    xlim([0 T+1]);
    box on;
    xlabel('t');
    ylabel('\theta_{tj}');
end