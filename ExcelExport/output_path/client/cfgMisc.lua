local cfgMisc = {
	
	{ Id= 1, OnlyId= "Skl_Unlock", IntParam= 0, StrParam= {1,60,120,180}, C_Describe= "技能槽位解锁等级（英雄等级）"},
	{ Id= 2, OnlyId= "Ini_Gold", IntParam= 10000, StrParam= nil, C_Describe= "创角初始金币数量"},
	{ Id= 3, OnlyId= "Ini_Hero", IntParam= 0, StrParam= {Hero_0009}, C_Describe= "创角初始英雄(数量,资质，职业，种族)"},
	{ Id= 4, OnlyId= "hero_Price", IntParam= 0, StrParam= {{Dug_0001,1000},{Dug_0002,2000},{Dug_0003,3000},{Dug_0004,4000},{Dug_0005,5000},{Dug_0006,6000},{Dug_0007,7000},{Dug_0008,8000},{Dug_0009,9000}}, C_Describe= "英雄身价(副本ID,增长身价)"},
	{ Id= 5, OnlyId= "Make", IntParam= 0, StrParam= {400,3000,3000,3000,500,100}, C_Describe= "装备锻造品质几率(劣质,普通,优秀,精良,史诗,传说)"},
	{ Id= 6, OnlyId= "Refresh", IntParam= 0, StrParam= {{Itm_0055,1},{Itm_Crystal,200}}, C_Describe= "招募刷新价格"},
	{ Id= 7, OnlyId= "mooncard", IntParam= 0, StrParam= {{Itm_Crystal,200},{Itm_Gold,50000}}, C_Describe= "月卡每日奖励"},
	{ Id= 8, OnlyId= "Graduation", IntParam= 0, StrParam= {{Itm_Crystal,20}}, C_Describe= "结业刷新价格"},
	{ Id= 9, OnlyId= "Dungeons", IntParam= 30, StrParam= {3,30,4}, C_Describe= "地下城{初始次数，次数上限，刷新CD}"},
	{ Id= 10, OnlyId= "Arena", IntParam= 30, StrParam= {3,30,4}, C_Describe= "竞技场{初始次数，次数上限，刷新CD}"},
	{ Id= 11, OnlyId= "Ruins", IntParam= 30, StrParam= {1,30,6}, C_Describe= "遗迹次{初始次数，次数上限，刷新CD}"},
	{ Id= 12, OnlyId= "RandomEvents", IntParam= 4, StrParam= nil, C_Describe= "随机事件CD"},
	{ Id= 13, OnlyId= "Fighting", IntParam= 0, StrParam= {99999999,0}, C_Describe= "敌我双方初始总战力，前敌后我"},
	{ Id= 14, OnlyId= "Potential", IntParam= 0, StrParam= {{1,1,7000},{2,1,3000},{3,1,0},{4,1,0}}, C_Describe= "潜能开发条目随机概率（1条，2条，3条，4条）"},
	{ Id= 15, OnlyId= "MineCount", IntParam= 0, StrParam= {3,30,4}, C_Describe= "矿场掠夺{初始次数，次数上限，刷新CD}"},
	{ Id= 16, OnlyId= "MineTeam", IntParam= 0, StrParam= {{1,1},{5,2},{15,3},{25,4},{35,5},{45,6}}, C_Describe= "矿场采集队伍数量(学院等级，队伍数量)"},
	{ Id= 17, OnlyId= "MineRefresh", IntParam= 0, StrParam= {{Itm_Crystal,10}}, C_Describe= "矿场掠夺刷新价格"},
	{ Id= 18, OnlyId= "ArenaRefresh", IntParam= 0, StrParam= {{Itm_Crystal,20}}, C_Describe= "竞技场刷新价格"},
	{ Id= 19, OnlyId= "ArenaNum", IntParam= 0, StrParam= {{Itm_0053,1}}, C_Describe= "竞技场购买次数"},
	{ Id= 20, OnlyId= "MineRob", IntParam= 0, StrParam= {{Itm_0054,1}}, C_Describe= "掠夺购买次数"},
	{ Id= 21, OnlyId= "Recharge", IntParam= 0, StrParam= {{Hero_0001},{Itm_Gold,50000},{Itm_Crystal,200},{Itm_0007,50}}, C_Describe= "首充奖励"},
	{ Id= 22, OnlyId= "MooncardHero", IntParam= 0, StrParam= {Hero_0002}, C_Describe= "月卡首通英雄"},
	{ Id= 23, OnlyId= "Evaluate", IntParam= 0, StrParam= {{Hero_0003},{Itm_Gold,20000},{Itm_Crystal,100}}, C_Describe= "评价送礼奖励"},
	{ Id= 24, OnlyId= "NoticeTime", IntParam= 10, StrParam= nil, C_Describe= "跑马灯刷新时间"}

}
return cfgMisc