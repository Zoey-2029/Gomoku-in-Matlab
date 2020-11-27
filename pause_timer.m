function pause_timer()
    global c stop_flag time timer_start_btn timer_display game_timer;
    stop_flag = 1;
    time_elapsed = etime(clock, c);
    time = time + time_elapsed;
    display_str = format_time(time);
    timer_display.Text = display_str;
    stop(game_timer);
    timer_start_btn.Text = 'RESUME';
    timer_start_btn.ButtonPushedFcn = @(timer_start_btn,event) start_timer();
end