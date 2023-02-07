module("resmgr")
cfgGiftPackage = {
	
	{ Id= 1, OnlyId= "Gift_0001", Desc= "LG_Des_Gift_0001", Tape= 1, Condition= {MoonCard,1}, Reward= {Itm_Crystal,500}, Postposition= nil},
	{ Id= 2, OnlyId= "Gift_0002", Desc= "LG_Des_Gift_0002", Tape= 2, Condition= {Itm_Crystal,100}, Reward= {Itm_Crystal,100}, Postposition= Gift_0003},
	{ Id= 3, OnlyId= "Gift_0003", Desc= "LG_Des_Gift_0003", Tape= 2, Condition= {Itm_Crystal,500}, Reward= {Itm_Crystal,500}, Postposition= Gift_0004},
	{ Id= 4, OnlyId= "Gift_0004", Desc= "LG_Des_Gift_0004", Tape= 2, Condition= {Itm_Crystal,2000}, Reward= {Itm_Crystal,2000}, Postposition= nil},
	{ Id= 5, OnlyId= "Gift_0005", Desc= "LG_Des_Gift_0005", Tape= 3, Condition= {Itm_Gold,100000}, Reward= {Itm_Gold,100000}, Postposition= Gift_0006},
	{ Id= 6, OnlyId= "Gift_0006", Desc= "LG_Des_Gift_0006", Tape= 3, Condition= {Itm_Gold,500000}, Reward= {Itm_Gold,500000}, Postposition= nil},
	{ Id= 7, OnlyId= "Gift_0007", Desc= "LG_Des_Gift_0007", Tape= 4, Condition= {Itm_0005,500}, Reward= {Itm_0005,500}, Postposition= Gift_0008},
	{ Id= 8, OnlyId= "Gift_0008", Desc= "LG_Des_Gift_0008", Tape= 4, Condition= {Itm_0005,2500}, Reward= {Itm_0005,2500}, Postposition= Gift_0009},
	{ Id= 9, OnlyId= "Gift_0009", Desc= "LG_Des_Gift_0009", Tape= 4, Condition= {Itm_0005,10000}, Reward= {Itm_0005,10000}, Postposition= nil},
	{ Id= 10, OnlyId= "Gift_00010", Desc= "LG_Des_Gift_0010", Tape= 5, Condition= {Itm_0006,500}, Reward= {Itm_0006,500}, Postposition= Gift_00011},
	{ Id= 11, OnlyId= "Gift_00011", Desc= "LG_Des_Gift_0011", Tape= 5, Condition= {Itm_0006,2500}, Reward= {Itm_0006,2500}, Postposition= Gift_00012},
	{ Id= 12, OnlyId= "Gift_00012", Desc= "LG_Des_Gift_0012", Tape= 5, Condition= {Itm_0006,10000}, Reward= {Itm_0006,10000}, Postposition= nil}

}
