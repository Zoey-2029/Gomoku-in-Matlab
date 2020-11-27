function display_time =  format_time(time)
    time = abs(time);
    hrs = floor(time/3600);
    mins = floor(time/60 - 60*hrs);
    secs = time - 60*mins - 3600*hrs;
    hr = sprintf('%1.0f:', hrs);
    min = sprintf('%1.0f:', mins);
    sec = sprintf('%1.0f', secs);
    display_time = [hr min sec];
end