package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Misc struct {
	Items   []Misc   `json:"items"`
}

type Misc struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	IntParam int32 `json:"IntParam"`
	StrParam string `json:"StrParam"`
	C_Describe string `json:"C_Describe"`
	
}

var G_vecMisc Cfg_Misc

func LoadMisc() bool {
	data, err := ioutil.ReadFile("./conf/json/Misc.json")
	if err != nil {
		log.Error("Misc.json os.Open fail ", err)
		return false
	}
	log.Release("Misc.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecMisc)
	if parseErr != nil {
		log.Error("Misc.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Misc.json LoadXml Success")
	return true
}