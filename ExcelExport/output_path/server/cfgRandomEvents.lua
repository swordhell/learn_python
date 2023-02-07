module("resmgr")
cfgRandomEvents = {
	
	{ Id= 1, OnlyId= "Ran_0001", Content= "LG_Con_Ran_0001", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 2, OnlyId= "Ran_0002", Content= "LG_Con_Ran_0002", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,10,10000}}}, Effect2= nil},
	{ Id= 3, OnlyId= "Ran_0003", Content= "LG_Con_Ran_0003", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,10,10000}},{{Itm_Gold,200,5000},{Itm_Gold,400,5000}}}, Effect2= nil},
	{ Id= 4, OnlyId= "Ran_0004", Content= "LG_Con_Ran_0004", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,50,10000}},{{Itm_Repu,100,10000}}}, Effect2= nil},
	{ Id= 5, OnlyId= "Ran_0005", Content= "LG_Con_Ran_0005", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,50,10000}},{{Itm_Repu,100,10000}}}, Effect2= nil},
	{ Id= 6, OnlyId= "Ran_0006", Content= "LG_Con_Ran_0006", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,50,10000}},{{Itm_Repu,100,10000}}}, Effect2= nil},
	{ Id= 7, OnlyId= "Ran_0007", Content= "LG_Con_Ran_0007", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,10,10000}},{{Itm_0005,20,10000}}}, Effect2= nil},
	{ Id= 8, OnlyId= "Ran_0008", Content= "LG_Con_Ran_0008", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,10,10000}},{{Itm_0006,20,10000}}}, Effect2= nil},
	{ Id= 9, OnlyId= "Ran_0009", Content= "LG_Con_Ran_0009", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,10,10000}}}, Effect2= nil},
	{ Id= 10, OnlyId= "Ran_0010", Content= "LG_Con_Ran_0010", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,10,10000}}}, Effect2= nil},
	{ Id= 11, OnlyId= "Ran_0011", Content= "LG_Con_Ran_0011", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 12, OnlyId= "Ran_0012", Content= "LG_Con_Ran_0012", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,20,10000}}}, Effect2= nil},
	{ Id= 13, OnlyId= "Ran_0013", Content= "LG_Con_Ran_0013", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,20,10000}},{{Itm_Gold,500,5000},{Itm_Gold,1000,5000}}}, Effect2= nil},
	{ Id= 14, OnlyId= "Ran_0014", Content= "LG_Con_Ran_0014", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,100,10000}},{{Itm_Repu,200,10000}}}, Effect2= nil},
	{ Id= 15, OnlyId= "Ran_0015", Content= "LG_Con_Ran_0015", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,100,10000}},{{Itm_Repu,200,10000}}}, Effect2= nil},
	{ Id= 16, OnlyId= "Ran_0016", Content= "LG_Con_Ran_0016", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,100,10000}},{{Itm_Repu,200,10000}}}, Effect2= nil},
	{ Id= 17, OnlyId= "Ran_0017", Content= "LG_Con_Ran_0017", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,20,10000}},{{Itm_0005,40,10000}}}, Effect2= nil},
	{ Id= 18, OnlyId= "Ran_0018", Content= "LG_Con_Ran_0018", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,20,10000}},{{Itm_0006,40,10000}}}, Effect2= nil},
	{ Id= 19, OnlyId= "Ran_0019", Content= "LG_Con_Ran_0019", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,20,10000}}}, Effect2= nil},
	{ Id= 20, OnlyId= "Ran_0020", Content= "LG_Con_Ran_0020", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,20,10000}}}, Effect2= nil},
	{ Id= 21, OnlyId= "Ran_0021", Content= "LG_Con_Ran_0021", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 22, OnlyId= "Ran_0022", Content= "LG_Con_Ran_0022", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,30,10000}}}, Effect2= nil},
	{ Id= 23, OnlyId= "Ran_0023", Content= "LG_Con_Ran_0023", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,40,10000}},{{Itm_Gold,1000,5000},{Itm_Gold,2000,5000}}}, Effect2= nil},
	{ Id= 24, OnlyId= "Ran_0024", Content= "LG_Con_Ran_0024", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,150,10000}},{{Itm_Repu,300,10000}}}, Effect2= nil},
	{ Id= 25, OnlyId= "Ran_0025", Content= "LG_Con_Ran_0025", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,150,10000}},{{Itm_Repu,300,10000}}}, Effect2= nil},
	{ Id= 26, OnlyId= "Ran_0026", Content= "LG_Con_Ran_0026", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,150,10000}},{{Itm_Repu,300,10000}}}, Effect2= nil},
	{ Id= 27, OnlyId= "Ran_0027", Content= "LG_Con_Ran_0027", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,30,10000}},{{Itm_0005,60,10000}}}, Effect2= nil},
	{ Id= 28, OnlyId= "Ran_0028", Content= "LG_Con_Ran_0028", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,30,10000}},{{Itm_0006,60,10000}}}, Effect2= nil},
	{ Id= 29, OnlyId= "Ran_0029", Content= "LG_Con_Ran_0029", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,30,10000}}}, Effect2= nil},
	{ Id= 30, OnlyId= "Ran_0030", Content= "LG_Con_Ran_0030", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,30,10000}}}, Effect2= nil},
	{ Id= 31, OnlyId= "Ran_0031", Content= "LG_Con_Ran_0031", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 32, OnlyId= "Ran_0032", Content= "LG_Con_Ran_0032", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,40,10000}}}, Effect2= nil},
	{ Id= 33, OnlyId= "Ran_0033", Content= "LG_Con_Ran_0033", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,80,10000}},{{Itm_Gold,2000,5000},{Itm_Gold,4000,5000}}}, Effect2= nil},
	{ Id= 34, OnlyId= "Ran_0034", Content= "LG_Con_Ran_0034", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,250,10000}},{{Itm_Repu,500,10000}}}, Effect2= nil},
	{ Id= 35, OnlyId= "Ran_0035", Content= "LG_Con_Ran_0035", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,250,10000}},{{Itm_Repu,500,10000}}}, Effect2= nil},
	{ Id= 36, OnlyId= "Ran_0036", Content= "LG_Con_Ran_0036", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,250,10000}},{{Itm_Repu,500,10000}}}, Effect2= nil},
	{ Id= 37, OnlyId= "Ran_0037", Content= "LG_Con_Ran_0037", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,40,10000}},{{Itm_0005,80,10000}}}, Effect2= nil},
	{ Id= 38, OnlyId= "Ran_0038", Content= "LG_Con_Ran_0038", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,40,10000}},{{Itm_0006,80,10000}}}, Effect2= nil},
	{ Id= 39, OnlyId= "Ran_0039", Content= "LG_Con_Ran_0039", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,40,10000}}}, Effect2= nil},
	{ Id= 40, OnlyId= "Ran_0040", Content= "LG_Con_Ran_0040", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,40,10000}}}, Effect2= nil},
	{ Id= 41, OnlyId= "Ran_0041", Content= "LG_Con_Ran_0041", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 42, OnlyId= "Ran_0042", Content= "LG_Con_Ran_0042", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,50,10000}}}, Effect2= nil},
	{ Id= 43, OnlyId= "Ran_0043", Content= "LG_Con_Ran_0043", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,150,10000}},{{Itm_Gold,4000,5000},{Itm_Gold,8000,5000}}}, Effect2= nil},
	{ Id= 44, OnlyId= "Ran_0044", Content= "LG_Con_Ran_0044", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,400,10000}},{{Itm_Repu,800,10000}}}, Effect2= nil},
	{ Id= 45, OnlyId= "Ran_0045", Content= "LG_Con_Ran_0045", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,400,10000}},{{Itm_Repu,800,10000}}}, Effect2= nil},
	{ Id= 46, OnlyId= "Ran_0046", Content= "LG_Con_Ran_0046", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,400,10000}},{{Itm_Repu,800,10000}}}, Effect2= nil},
	{ Id= 47, OnlyId= "Ran_0047", Content= "LG_Con_Ran_0047", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,50,10000}},{{Itm_0005,100,10000}}}, Effect2= nil},
	{ Id= 48, OnlyId= "Ran_0048", Content= "LG_Con_Ran_0048", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,50,10000}},{{Itm_0006,100,10000}}}, Effect2= nil},
	{ Id= 49, OnlyId= "Ran_0049", Content= "LG_Con_Ran_0049", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,50,10000}}}, Effect2= nil},
	{ Id= 50, OnlyId= "Ran_0050", Content= "LG_Con_Ran_0050", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,50,10000}}}, Effect2= nil},
	{ Id= 51, OnlyId= "Ran_0051", Content= "LG_Con_Ran_0051", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 52, OnlyId= "Ran_0052", Content= "LG_Con_Ran_0052", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,60,10000}}}, Effect2= nil},
	{ Id= 53, OnlyId= "Ran_0053", Content= "LG_Con_Ran_0053", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,300,10000}},{{Itm_Gold,8000,5000},{Itm_Gold,16000,5000}}}, Effect2= nil},
	{ Id= 54, OnlyId= "Ran_0054", Content= "LG_Con_Ran_0054", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,600,10000}},{{Itm_Repu,1200,10000}}}, Effect2= nil},
	{ Id= 55, OnlyId= "Ran_0055", Content= "LG_Con_Ran_0055", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,600,10000}},{{Itm_Repu,1200,10000}}}, Effect2= nil},
	{ Id= 56, OnlyId= "Ran_0056", Content= "LG_Con_Ran_0056", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,600,10000}},{{Itm_Repu,1200,10000}}}, Effect2= nil},
	{ Id= 57, OnlyId= "Ran_0057", Content= "LG_Con_Ran_0057", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,60,10000}},{{Itm_0005,120,10000}}}, Effect2= nil},
	{ Id= 58, OnlyId= "Ran_0058", Content= "LG_Con_Ran_0058", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,60,10000}},{{Itm_0006,120,10000}}}, Effect2= nil},
	{ Id= 59, OnlyId= "Ran_0059", Content= "LG_Con_Ran_0059", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,60,10000}}}, Effect2= nil},
	{ Id= 60, OnlyId= "Ran_0060", Content= "LG_Con_Ran_0060", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,60,10000}}}, Effect2= nil},
	{ Id= 61, OnlyId= "Ran_0061", Content= "LG_Con_Ran_0061", Option1= "LG_Con_Opt1_0001", Option2= "LG_Con_Opt2_0001", Effect1= {opt=FreeHero,{}}, Effect2= nil},
	{ Id= 62, OnlyId= "Ran_0062", Content= "LG_Con_Ran_0062", Option1= "LG_Con_Opt1_0002", Option2= "LG_Con_Opt2_0002", Effect1= {opt=Get,{{Itm_Crystal,70,10000}}}, Effect2= nil},
	{ Id= 63, OnlyId= "Ran_0063", Content= "LG_Con_Ran_0063", Option1= "LG_Con_Opt1_0003", Option2= "LG_Con_Opt2_0003", Effect1= {opt=Pay,{{Itm_Crystal,500,10000}},{{Itm_Gold,20000,5000},{Itm_Gold,40000,5000}}}, Effect2= nil},
	{ Id= 64, OnlyId= "Ran_0064", Content= "LG_Con_Ran_0064", Option1= "LG_Con_Opt1_0004", Option2= "LG_Con_Opt2_0004", Effect1= {opt=Pay,{{Itm_Gold,1000,10000}},{{Itm_Repu,2000,10000}}}, Effect2= nil},
	{ Id= 65, OnlyId= "Ran_0065", Content= "LG_Con_Ran_0065", Option1= "LG_Con_Opt1_0005", Option2= "LG_Con_Opt2_0005", Effect1= {opt=Pay,{{Itm_Gold,1000,10000}},{{Itm_Repu,2000,10000}}}, Effect2= nil},
	{ Id= 66, OnlyId= "Ran_0066", Content= "LG_Con_Ran_0066", Option1= "LG_Con_Opt1_0006", Option2= "LG_Con_Opt2_0006", Effect1= {opt=Pay,{{Itm_Gold,1000,10000}},{{Itm_Repu,2000,10000}}}, Effect2= nil},
	{ Id= 67, OnlyId= "Ran_0067", Content= "LG_Con_Ran_0067", Option1= "LG_Con_Opt1_0007", Option2= "LG_Con_Opt2_0007", Effect1= {opt=Pay,{{Itm_Crystal,70,10000}},{{Itm_0005,140,10000}}}, Effect2= nil},
	{ Id= 68, OnlyId= "Ran_0068", Content= "LG_Con_Ran_0068", Option1= "LG_Con_Opt1_0008", Option2= "LG_Con_Opt2_0008", Effect1= {opt=Pay,{{Itm_Crystal,70,10000}},{{Itm_0006,140,10000}}}, Effect2= nil},
	{ Id= 69, OnlyId= "Ran_0069", Content= "LG_Con_Ran_0069", Option1= "LG_Con_Opt1_0009", Option2= "LG_Con_Opt2_0009", Effect1= {opt=Get,{{Itm_Crystal,70,10000}}}, Effect2= nil},
	{ Id= 70, OnlyId= "Ran_0070", Content= "LG_Con_Ran_0070", Option1= "LG_Con_Opt1_0010", Option2= "LG_Con_Opt2_0010", Effect1= {opt=Get,{{Itm_Crystal,70,10000}}}, Effect2= nil}

}