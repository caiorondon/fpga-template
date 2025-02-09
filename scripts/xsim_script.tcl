set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {barrel_shifter_tb_sim} -autoloadwcfg 
create_wave_config
add_wave /
set_property needs_save false [current_wave_config]
