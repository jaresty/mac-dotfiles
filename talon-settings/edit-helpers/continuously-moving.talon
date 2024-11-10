tag: user.continuously_moving
-
^taper <number_small>$: user.set_taper_step(number_small)
^faster$: user.move_faster()
^slower$: user.move_slower()
^wait$: user.stop_moving()
