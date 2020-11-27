function timer_fcn(~,~)
    global c stop_flag time timer_display time_elapsed;
    if (~stop_flag)
        time_elapsed = etime(clock, c);
        display_str = format_time(time + time_elapsed);
        timer_display.Text = display_str;
    end
end