module("resmgr")
cfgCrusadeTask = {
	
	{ Id= 1, OnlyId= "Cru_0001", Type= Mon_0051, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0001, Explore= Exp_0001},
	{ Id= 2, OnlyId= "Cru_0002", Type= Mon_0010, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0001, Explore= Exp_0004},
	{ Id= 3, OnlyId= "Cru_0003", Type= Mon_0049, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0001, Explore= Exp_0008},
	{ Id= 4, OnlyId= "Cru_0004", Type= Mon_0002, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0001, Explore= Exp_0012},
	{ Id= 5, OnlyId= "Cru_0005", Type= Mon_0053, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0001, Explore= Exp_0015},
	{ Id= 6, OnlyId= "Cru_0006", Type= Mon_0020, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0001, Explore= Exp_0020},
	{ Id= 7, OnlyId= "Cru_0007", Type= Mon_0062, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0002, Explore= Exp_0021},
	{ Id= 8, OnlyId= "Cru_0008", Type= Mon_0073, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0002, Explore= Exp_0024},
	{ Id= 9, OnlyId= "Cru_0009", Type= Mon_0065, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0002, Explore= Exp_0036},
	{ Id= 10, OnlyId= "Cru_0010", Type= Mon_0007, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0002, Explore= Exp_0040},
	{ Id= 11, OnlyId= "Cru_0011", Type= Mon_0067, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0002, Explore= Exp_0046},
	{ Id= 12, OnlyId= "Cru_0012", Type= Mon_0050, Number= 500, Reward= {{Itm_Gold,1000},{Itm_Repu,200}}, Chapter= Chp_0002, Explore= Exp_0049},
	{ Id= 13, OnlyId= "Cru_0013", Type= Mon_0012, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0003, Explore= Exp_0052},
	{ Id= 14, OnlyId= "Cru_0014", Type= Mon_0004, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0003, Explore= Exp_0054},
	{ Id= 15, OnlyId= "Cru_0015", Type= Mon_0006, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0003, Explore= Exp_0066},
	{ Id= 16, OnlyId= "Cru_0016", Type= Mon_0079, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0003, Explore= Exp_0074},
	{ Id= 17, OnlyId= "Cru_0017", Type= Mon_0078, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0003, Explore= Exp_0079},
	{ Id= 18, OnlyId= "Cru_0018", Type= Mon_0085, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0003, Explore= Exp_0076},
	{ Id= 19, OnlyId= "Cru_0019", Type= Mon_0082, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0004, Explore= Exp_0099},
	{ Id= 20, OnlyId= "Cru_0020", Type= Mon_0076, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0004, Explore= Exp_0102},
	{ Id= 21, OnlyId= "Cru_0021", Type= Mon_0083, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0004, Explore= Exp_0103},
	{ Id= 22, OnlyId= "Cru_0022", Type= Mon_0080, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0004, Explore= Exp_0105},
	{ Id= 23, OnlyId= "Cru_0023", Type= Mon_0084, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0004, Explore= Exp_0122},
	{ Id= 24, OnlyId= "Cru_0024", Type= Mon_0081, Number= 1000, Reward= {{Itm_Gold,2000},{Itm_Repu,400}}, Chapter= Chp_0004, Explore= Exp_0135},
	{ Id= 25, OnlyId= "Cru_0025", Type= Mon_0040, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0005, Explore= Exp_0141},
	{ Id= 26, OnlyId= "Cru_0026", Type= Mon_0088, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0005, Explore= Exp_0147},
	{ Id= 27, OnlyId= "Cru_0027", Type= Mon_0090, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0005, Explore= Exp_0149},
	{ Id= 28, OnlyId= "Cru_0028", Type= Mon_0092, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0005, Explore= Exp_0151},
	{ Id= 29, OnlyId= "Cru_0029", Type= Mon_0093, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0005, Explore= Exp_0153},
	{ Id= 30, OnlyId= "Cru_0030", Type= Mon_0094, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0005, Explore= Exp_0160},
	{ Id= 31, OnlyId= "Cru_0031", Type= Mon_0086, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0006, Explore= Exp_0203},
	{ Id= 32, OnlyId= "Cru_0032", Type= Mon_0087, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0006, Explore= Exp_0205},
	{ Id= 33, OnlyId= "Cru_0033", Type= Mon_0066, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0006, Explore= Exp_0216},
	{ Id= 34, OnlyId= "Cru_0034", Type= Mon_0063, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0006, Explore= Exp_0229},
	{ Id= 35, OnlyId= "Cru_0035", Type= Mon_0018, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0006, Explore= Exp_0231},
	{ Id= 36, OnlyId= "Cru_0036", Type= Mon_0036, Number= 1000, Reward= {{Itm_Gold,3000},{Itm_Repu,800}}, Chapter= Chp_0006, Explore= Exp_0230},
	{ Id= 37, OnlyId= "Cru_0037", Type= Mon_0043, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0007, Explore= Exp_0241},
	{ Id= 38, OnlyId= "Cru_0038", Type= Mon_0072, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0007, Explore= Exp_0246},
	{ Id= 39, OnlyId= "Cru_0039", Type= Mon_0001, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0007, Explore= Exp_0251},
	{ Id= 40, OnlyId= "Cru_0040", Type= Mon_0003, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0007, Explore= Exp_0257},
	{ Id= 41, OnlyId= "Cru_0041", Type= Mon_0070, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0007, Explore= Exp_0265},
	{ Id= 42, OnlyId= "Cru_0042", Type= Mon_0014, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0007, Explore= Exp_0273},
	{ Id= 43, OnlyId= "Cru_0043", Type= Mon_0039, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0008, Explore= Exp_0293},
	{ Id= 44, OnlyId= "Cru_0044", Type= Mon_0019, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0008, Explore= Exp_0299},
	{ Id= 45, OnlyId= "Cru_0045", Type= Mon_0015, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0008, Explore= Exp_0304},
	{ Id= 46, OnlyId= "Cru_0046", Type= Mon_0009, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0008, Explore= Exp_0309},
	{ Id= 47, OnlyId= "Cru_0047", Type= Mon_0071, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0008, Explore= Exp_0315},
	{ Id= 48, OnlyId= "Cru_0048", Type= Mon_0013, Number= 1000, Reward= {{Itm_Gold,4000},{Itm_Repu,2000}}, Chapter= Chp_0008, Explore= Exp_0319},
	{ Id= 49, OnlyId= "Cru_0049", Type= Mon_0089, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0009, Explore= Exp_0347},
	{ Id= 50, OnlyId= "Cru_0050", Type= Mon_0017, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0009, Explore= Exp_0348},
	{ Id= 51, OnlyId= "Cru_0051", Type= Mon_0091, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0009, Explore= Exp_0349},
	{ Id= 52, OnlyId= "Cru_0052", Type= Mon_0077, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0009, Explore= Exp_0354},
	{ Id= 53, OnlyId= "Cru_0053", Type= Mon_0054, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0009, Explore= Exp_0355},
	{ Id= 54, OnlyId= "Cru_0054", Type= Mon_0021, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0009, Explore= Exp_0357},
	{ Id= 55, OnlyId= "Cru_0055", Type= Mon_0068, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0010, Explore= Exp_0391},
	{ Id= 56, OnlyId= "Cru_0056", Type= Mon_0008, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0010, Explore= Exp_0392},
	{ Id= 57, OnlyId= "Cru_0057", Type= Mon_0027, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0010, Explore= Exp_0393},
	{ Id= 58, OnlyId= "Cru_0058", Type= Mon_0025, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0010, Explore= Exp_0394},
	{ Id= 59, OnlyId= "Cru_0059", Type= Mon_0044, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0010, Explore= Exp_0395},
	{ Id= 60, OnlyId= "Cru_0060", Type= Mon_0024, Number= 1000, Reward= {{Itm_Gold,5000},{Itm_Repu,4000}}, Chapter= Chp_0010, Explore= Exp_0398},
	{ Id= 61, OnlyId= "Cru_0061", Type= Mon_0022, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0011, Explore= Exp_0442},
	{ Id= 62, OnlyId= "Cru_0062", Type= Mon_0095, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0011, Explore= Exp_0443},
	{ Id= 63, OnlyId= "Cru_0063", Type= Mon_0075, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0011, Explore= Exp_0444},
	{ Id= 64, OnlyId= "Cru_0064", Type= Mon_0059, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0011, Explore= Exp_0446},
	{ Id= 65, OnlyId= "Cru_0065", Type= Mon_0005, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0011, Explore= Exp_0467},
	{ Id= 66, OnlyId= "Cru_0066", Type= Mon_0048, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0011, Explore= Exp_0470},
	{ Id= 67, OnlyId= "Cru_0067", Type= Mon_0064, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0012, Explore= Exp_0491},
	{ Id= 68, OnlyId= "Cru_0068", Type= Mon_0034, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0012, Explore= Exp_0496},
	{ Id= 69, OnlyId= "Cru_0069", Type= Mon_0033, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0012, Explore= Exp_0502},
	{ Id= 70, OnlyId= "Cru_0070", Type= Mon_0032, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0012, Explore= Exp_0503},
	{ Id= 71, OnlyId= "Cru_0071", Type= Mon_0026, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0012, Explore= Exp_0504},
	{ Id= 72, OnlyId= "Cru_0072", Type= Mon_0037, Number= 1000, Reward= {{Itm_Gold,10000},{Itm_Repu,8000}}, Chapter= Chp_0012, Explore= Exp_0505},
	{ Id= 73, OnlyId= "Cru_0073", Type= Mon_0023, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0013, Explore= Exp_0541},
	{ Id= 74, OnlyId= "Cru_0074", Type= Mon_0030, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0013, Explore= Exp_0543},
	{ Id= 75, OnlyId= "Cru_0075", Type= Mon_0041, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0013, Explore= Exp_0558},
	{ Id= 76, OnlyId= "Cru_0076", Type= Mon_0042, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0013, Explore= Exp_0559},
	{ Id= 77, OnlyId= "Cru_0077", Type= Mon_0058, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0013, Explore= Exp_0562},
	{ Id= 78, OnlyId= "Cru_0078", Type= Mon_0047, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0013, Explore= Exp_0563},
	{ Id= 79, OnlyId= "Cru_0079", Type= Mon_0069, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0014, Explore= Exp_0591},
	{ Id= 80, OnlyId= "Cru_0080", Type= Mon_0046, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0014, Explore= Exp_0592},
	{ Id= 81, OnlyId= "Cru_0081", Type= Mon_0029, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0014, Explore= Exp_0599},
	{ Id= 82, OnlyId= "Cru_0082", Type= Mon_0052, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0014, Explore= Exp_0620},
	{ Id= 83, OnlyId= "Cru_0083", Type= Mon_0045, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0014, Explore= Exp_0624},
	{ Id= 84, OnlyId= "Cru_0084", Type= Mon_0074, Number= 1000, Reward= {{Itm_Gold,20000},{Itm_Repu,20000}}, Chapter= Chp_0014, Explore= Exp_0625},
	{ Id= 85, OnlyId= "Cru_0085", Type= Mon_0038, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0015, Explore= Exp_0648},
	{ Id= 86, OnlyId= "Cru_0086", Type= Mon_0061, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0015, Explore= Exp_0653},
	{ Id= 87, OnlyId= "Cru_0087", Type= Mon_0055, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0015, Explore= Exp_0670},
	{ Id= 88, OnlyId= "Cru_0088", Type= Mon_0031, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0015, Explore= Exp_0675},
	{ Id= 89, OnlyId= "Cru_0089", Type= Mon_0016, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0015, Explore= Exp_0676},
	{ Id= 90, OnlyId= "Cru_0090", Type= Mon_0011, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0015, Explore= Exp_0677},
	{ Id= 91, OnlyId= "Cru_0091", Type= Mon_0051, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0016, Explore= Exp_0691},
	{ Id= 92, OnlyId= "Cru_0092", Type= Mon_0080, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0016, Explore= Exp_0696},
	{ Id= 93, OnlyId= "Cru_0093", Type= Mon_0057, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0016, Explore= Exp_0708},
	{ Id= 94, OnlyId= "Cru_0094", Type= Mon_0053, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0016, Explore= Exp_0712},
	{ Id= 95, OnlyId= "Cru_0095", Type= Mon_0088, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0016, Explore= Exp_0718},
	{ Id= 96, OnlyId= "Cru_0096", Type= Mon_0018, Number= 1000, Reward= {{Itm_Gold,40000},{Itm_Repu,40000}}, Chapter= Chp_0016, Explore= Exp_0725},
	{ Id= 97, OnlyId= "Cru_0097", Type= Mon_0040, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0017, Explore= Exp_0741},
	{ Id= 98, OnlyId= "Cru_0098", Type= Mon_0062, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0017, Explore= Exp_0742},
	{ Id= 99, OnlyId= "Cru_0099", Type= Mon_0086, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0017, Explore= Exp_0743},
	{ Id= 100, OnlyId= "Cru_0100", Type= Mon_0043, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0017, Explore= Exp_0744},
	{ Id= 101, OnlyId= "Cru_0101", Type= Mon_0087, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0017, Explore= Exp_0745},
	{ Id= 102, OnlyId= "Cru_0102", Type= Mon_0072, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0017, Explore= Exp_0746},
	{ Id= 103, OnlyId= "Cru_0103", Type= Mon_0068, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0018, Explore= Exp_0791},
	{ Id= 104, OnlyId= "Cru_0104", Type= Mon_0008, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0018, Explore= Exp_0792},
	{ Id= 105, OnlyId= "Cru_0105", Type= Mon_0049, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0018, Explore= Exp_0793},
	{ Id= 106, OnlyId= "Cru_0106", Type= Mon_0002, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0018, Explore= Exp_0794},
	{ Id= 107, OnlyId= "Cru_0107", Type= Mon_0006, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0018, Explore= Exp_0795},
	{ Id= 108, OnlyId= "Cru_0108", Type= Mon_0070, Number= 1000, Reward= {{Itm_Gold,80000},{Itm_Repu,80000}}, Chapter= Chp_0018, Explore= Exp_0796}

}
