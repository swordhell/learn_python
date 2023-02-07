package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Recruit struct {
	Items   []Recruit   `json:"items"`
}

type Recruit struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	S_CardPool string `json:"S_CardPool"`
	RefreshCost int32 `json:"RefreshCost"`
	
}

var G_vecRecruit Cfg_Recruit

func LoadRecruit() bool {
	data, err := ioutil.ReadFile("./conf/json/Recruit.json")
	if err != nil {
		log.Error("Recruit.json os.Open fail ", err)
		return false
	}
	log.Release("Recruit.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecRecruit)
	if parseErr != nil {
		log.Error("Recruit.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Recruit.json LoadXml Success")
	return true
}