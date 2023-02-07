local cfgTutorial = {
	
	{ Id= 1, OnlyId= "Tutor_0001", Type= 1, Condition= { kind = 1 ,para = { 0 } }, Step= 1, Islist= 0, UI= "prefab_ui_guild_home", Path= {"root_canvas_1/GuiCamera/prefab_ui_guild_home(Clone)/goBottomBar/btnMid"}},
	{ Id= 2, OnlyId= "Tutor_0002", Type= 1, Condition= { kind = 1 ,para = { 0 } }, Step= 2, Islist= 1, UI= "prefab_ui_stage_map", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_map(Clone)/scrollMap/Viewport/scrollContent",1}},
	{ Id= 3, OnlyId= "Tutor_0003", Type= 1, Condition= { kind = 1 ,para = { 0 } }, Step= 3, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goBottomBar/btnMid"}},
	{ Id= 4, OnlyId= "Tutor_0004", Type= 2, Condition= { kind = 3 ,para = { Exp_0001 } }, Step= 1, Islist= 0, UI= "prefab_ui_event", Path= {"root_canvas_1/GuiCamera/prefab_ui_event(Clone)/btn_yes"}},
	{ Id= 5, OnlyId= "Tutor_0005", Type= 2, Condition= { kind = 3 ,para = { Exp_0001 } }, Step= 2, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goTeam/prefab_ui_team_bar(Clone)/goPos/pos4"}},
	{ Id= 6, OnlyId= "Tutor_0006", Type= 2, Condition= { kind = 3 ,para = { Exp_0001 } }, Step= 3, Islist= 0, UI= "prefab_ui_team_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_team_main(Clone)/goBottomBar/btnMid"}},
	{ Id= 7, OnlyId= "Tutor_0007", Type= 2, Condition= { kind = 3 ,para = { Exp_0001 } }, Step= 4, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goBottomBar/btnMid"}},
	{ Id= 8, OnlyId= "Tutor_0008", Type= 3, Condition= { kind = 3 ,para = { Exp_0003 } }, Step= 1, Islist= 0, UI= "prefab_ui_event", Path= {"root_canvas_1/GuiCamera/prefab_ui_event(Clone)/btn_yes"}},
	{ Id= 9, OnlyId= "Tutor_0009", Type= 3, Condition= { kind = 3 ,para = { Exp_0003 } }, Step= 2, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goTeam/prefab_ui_team_bar(Clone)/goPos/pos5"}},
	{ Id= 10, OnlyId= "Tutor_0010", Type= 3, Condition= { kind = 3 ,para = { Exp_0003 } }, Step= 3, Islist= 0, UI= "prefab_ui_team_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_team_main(Clone)/goBottomBar/btnMid"}},
	{ Id= 11, OnlyId= "Tutor_0011", Type= 3, Condition= { kind = 3 ,para = { Exp_0003 } }, Step= 4, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goBottomBar/btnMid"}},
	{ Id= 12, OnlyId= "Tutor_0012", Type= 4, Condition= { kind = 3 ,para = { Exp_0004 } }, Step= 1, Islist= 0, UI= "prefab_ui_event", Path= {"root_canvas_1/GuiCamera/prefab_ui_event(Clone)/btn_yes"}},
	{ Id= 13, OnlyId= "Tutor_0013", Type= 4, Condition= { kind = 3 ,para = { Exp_0004 } }, Step= 2, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goTask"}},
	{ Id= 14, OnlyId= "Tutor_0014", Type= 4, Condition= { kind = 3 ,para = { Exp_0004 } }, Step= 3, Islist= 0, UI= "prefab_ui_town_task", Path= {"root_canvas_1/GuiCamera/prefab_ui_town_task(Clone)/goBottomBar/btnGo"}},
	{ Id= 15, OnlyId= "Tutor_0015", Type= 4, Condition= { kind = 3 ,para = { Exp_0004 } }, Step= 4, Islist= 0, UI= "prefab_ui_town_task", Path= {"root_canvas_1/GuiCamera/prefab_ui_town_task(Clone)/goBottomBar/btnGo"}},
	{ Id= 16, OnlyId= "Tutor_0016", Type= 4, Condition= { kind = 3 ,para = { Exp_0004 } }, Step= 5, Islist= 0, UI= "prefab_ui_guild_build", Path= {"root_canvas_1/GuiCamera/prefab_ui_guild_build(Clone)/goBottomBar/btnMid"}},
	{ Id= 17, OnlyId= "Tutor_0017", Type= 5, Condition= { kind = 3 ,para = { Exp_0007 } }, Step= 1, Islist= 0, UI= "prefab_ui_event", Path= {"root_canvas_1/GuiCamera/prefab_ui_event(Clone)/btn_yes"}},
	{ Id= 18, OnlyId= "Tutor_0018", Type= 5, Condition= { kind = 3 ,para = { Exp_0007 } }, Step= 2, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goTeam/prefab_ui_team_bar(Clone)/goPos/pos6"}},
	{ Id= 19, OnlyId= "Tutor_0019", Type= 6, Condition= { kind = 3 ,para = { Exp_0012 } }, Step= 1, Islist= 0, UI= "prefab_ui_event", Path= {"root_canvas_1/GuiCamera/prefab_ui_event(Clone)/btn_yes"}},
	{ Id= 20, OnlyId= "Tutor_0020", Type= 6, Condition= { kind = 3 ,para = { Exp_0012 } }, Step= 2, Islist= 0, UI= "prefab_ui_stage_main", Path= {"root_canvas_1/GuiCamera/prefab_ui_stage_main(Clone)/goTeam/prefab_ui_team_bar(Clone)/goPos/pos3"}}

}
return cfgTutorial