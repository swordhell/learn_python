module("resmgr")
cfgPlayerBuild = {
	
	{ Id= 1, OnlyId= "Build_HeroHome", Initial= 1, Unlock= 1, MaxLevel= 9, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {20,30,40,50,60,70,80,90,100}, PlayerLevel= {1,6,14,24,34,44,54,64,74}},
	{ Id= 2, OnlyId= "Build_HeroReceptHome", Initial= 0, Unlock= 1, MaxLevel= 9, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {6,6,6,6,6,6,6,6,6}, PlayerLevel= {2,10,20,30,40,50,60,70,80}},
	{ Id= 3, OnlyId= "Build_EquipForging", Initial= 0, Unlock= 1, MaxLevel= 9, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {}, PlayerLevel= {4,8,16,26,36,46,56,66,76}},
	{ Id= 4, OnlyId= "Build_Train", Initial= 0, Unlock= 1, MaxLevel= 1, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {}, PlayerLevel= {10,20,30,40,50,60,70,80,90}},
	{ Id= 5, OnlyId= "Build_Enchanting", Initial= 0, Unlock= 1, MaxLevel= 1, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {}, PlayerLevel= {15,20,30,40,50,60,70,80,90}},
	{ Id= 6, OnlyId= "Build_Treasure", Initial= 0, Unlock= 1, MaxLevel= 1, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {}, PlayerLevel= {5,10,20,30,40,50,60,70,80}},
	{ Id= 7, OnlyId= "Build_Mine", Initial= 0, Unlock= 1, MaxLevel= 1, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {}, PlayerLevel= {3,10,20,30,40,50,60,70,80}},
	{ Id= 8, OnlyId= "Build_Storage", Initial= 1, Unlock= 1, MaxLevel= 9, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {80,90,100,110,120,130,140,150,160}, PlayerLevel= {1,7,18,28,38,48,58,68,78}},
	{ Id= 9, OnlyId= "Build_Mail", Initial= 1, Unlock= 1, MaxLevel= 1, BuildCost= {{Itm_0005,10},{Itm_0006,10}}, Time= 2, Effect= {}, PlayerLevel= {1,20,30,40,50,60,70,80,90}}

}
