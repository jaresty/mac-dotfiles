tag: user.tabs
-
# tab (open | new): app.tab_open()
tab restep: app.tab_previous()
tab step: app.tab_next()
tab punch: user.tab_close_wrapper()
tab repunch: user.tab_reopen()
# tab (reopen | restore): app.tab_reopen()
# go tab <number>: user.tab_jump(number)
# go tab final: user.tab_final()
tab forge: user.tab_duplicate()
