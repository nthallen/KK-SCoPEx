function ui_scopex
f = ne_dialg('SCoPEx Platform',1);
f = ne_dialg(f, 'add', 0, 1, 'gscopextm', 'T Mbase' );
f = ne_dialg(f, 'add', 1, 0, 'pscopextmtd', 'T Drift' );
f = ne_dialg(f, 'add', 1, 0, 'pscopextmcpu', 'CPU' );
f = ne_dialg(f, 'add', 1, 0, 'pscopextmram', 'RAM' );
f = ne_dialg(f, 'add', 1, 0, 'pscopextmd', 'Disk' );
f = ne_listdirs(f, 'SCoPEx_Data_Dir', 15);
f = ne_dialg(f, 'newcol');
ne_dialg(f, 'resize');
