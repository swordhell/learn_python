module("resmgr")
cfgFixedEvents = {
	
	{ Id= 1, OnlyId= "Fix_0001", Content= "LG_Con_Fix_0001", Option1= "LG_Fix_Opt1_0001", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=FixedHero,{Hero_0010}}, Effect2= nil, cfgExplore= Exp_0001},
	{ Id= 2, OnlyId= "Fix_0002", Content= "LG_Con_Fix_0002", Option1= "LG_Fix_Opt1_0002", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=FixedHero,{Hero_0011}}, Effect2= nil, cfgExplore= Exp_0003},
	{ Id= 3, OnlyId= "Fix_0003", Content= "LG_Con_Fix_0003", Option1= "LG_Fix_Opt1_0003", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_Gold,1000,10000}}}, Effect2= nil, cfgExplore= Exp_0004},
	{ Id= 4, OnlyId= "Fix_0004", Content= "LG_Con_Fix_0004", Option1= "LG_Fix_Opt1_0004", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_0101,30,10000}}}, Effect2= nil, cfgExplore= Exp_0005},
	{ Id= 5, OnlyId= "Fix_0005", Content= "LG_Con_Fix_0005", Option1= "LG_Fix_Opt1_0005", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=FixedHero,{Hero_0012}}, Effect2= nil, cfgExplore= Exp_0007},
	{ Id= 6, OnlyId= "Fix_0006", Content= "LG_Con_Fix_0006", Option1= "LG_Fix_Opt1_0006", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_0101,25,10000}}}, Effect2= nil, cfgExplore= Exp_0010},
	{ Id= 7, OnlyId= "Fix_0007", Content= "LG_Con_Fix_0007", Option1= "LG_Fix_Opt1_0007", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=FixedHero,{Hero_0013}}, Effect2= nil, cfgExplore= Exp_0012},
	{ Id= 8, OnlyId= "Fix_0008", Content= "LG_Con_Fix_0008", Option1= "LG_Fix_Opt1_0008", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_Gold,5000,10000}}}, Effect2= nil, cfgExplore= Exp_0015},
	{ Id= 9, OnlyId= "Fix_0009", Content= "LG_Con_Fix_0009", Option1= "LG_Fix_Opt1_0009", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_Repu,100,10000}}}, Effect2= nil, cfgExplore= Exp_0020},
	{ Id= 10, OnlyId= "Fix_0010", Content= "LG_Con_Fix_0010", Option1= "LG_Fix_Opt1_0010", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_0102,30,10000}}}, Effect2= nil, cfgExplore= Exp_0025},
	{ Id= 11, OnlyId= "Fix_0011", Content= "LG_Con_Fix_0011", Option1= "LG_Fix_Opt1_0011", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=FixedHero,{Hero_0014}}, Effect2= nil, cfgExplore= Exp_0030},
	{ Id= 12, OnlyId= "Fix_0012", Content= "LG_Con_Fix_0012", Option1= "LG_Fix_Opt1_0012", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_Exp,300000,10000}}}, Effect2= nil, cfgExplore= Exp_0035},
	{ Id= 13, OnlyId= "Fix_0013", Content= "LG_Con_Fix_0013", Option1= "LG_Fix_Opt1_0013", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_Repu,200,10000}}}, Effect2= nil, cfgExplore= Exp_0040},
	{ Id= 14, OnlyId= "Fix_0014", Content= "LG_Con_Fix_0014", Option1= "LG_Fix_Opt1_0014", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_0102,25,10000}}}, Effect2= nil, cfgExplore= Exp_0045},
	{ Id= 15, OnlyId= "Fix_0015", Content= "LG_Con_Fix_0015", Option1= "LG_Fix_Opt1_0015", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_Repu,200,10000}}}, Effect2= nil, cfgExplore= Exp_0050},
	{ Id= 16, OnlyId= "Fix_0016", Content= "LG_Con_Fix_0016", Option1= "LG_Fix_Opt1_0016", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=Get,{{Itm_0103,30,10000}}}, Effect2= nil, cfgExplore= Exp_0055},
	{ Id= 17, OnlyId= "Fix_0017", Content= "LG_Con_Fix_0017", Option1= "LG_Fix_Opt1_0017", Option2= "LG_Fix_Opt2_0001", Effect1= {opt=FixedHero,{Hero_0015}}, Effect2= nil, cfgExplore= Exp_0060}

}
