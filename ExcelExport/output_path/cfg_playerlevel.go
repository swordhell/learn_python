package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_PlayerLevel struct {
	Items   []PlayerLevel   `json:"items"`
}

type PlayerLevel struct {
	Id int32 `json:"Id"`
	Exp int32 `json:"Exp"`
	
}

var G_vecPlayerLevel Cfg_PlayerLevel

func LoadPlayerLevel() bool {
	data, err := ioutil.ReadFile("./conf/json/PlayerLevel.json")
	if err != nil {
		log.Error("PlayerLevel.json os.Open fail ", err)
		return false
	}
	log.Release("PlayerLevel.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecPlayerLevel)
	if parseErr != nil {
		log.Error("PlayerLevel.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("PlayerLevel.json LoadXml Success")
	return true
}