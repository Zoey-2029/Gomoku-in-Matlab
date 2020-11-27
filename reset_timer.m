function reset_timer(input)
    global time stop_flag game_timer timer_start_btn timer_display;
    stop_flag = 1;
    time = input;
    display_str = format_time(time);
    timer_display.Text = display_str;
    stop(game_timer);
    timer_start_btn.Text = 'START';
    timer_start_btn.ButtonPushedFcn = @(timer_start_btn,event) start_timer();
end