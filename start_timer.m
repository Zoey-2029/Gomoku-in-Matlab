function start_timer()
    global c stop_flag timer_start_btn game_timer;
    start(game_timer);
    c = clock;
    stop_flag = 0;
    timer_start_btn.Text = 'PAUSE';
    timer_start_btn.ButtonPushedFcn = @(timer_start_btn,event) pause_timer();
end