package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Level struct {
	Items   []Level   `json:"items"`
}

type Level struct {
	Id int32 `json:"Id"`
	Exp int32 `json:"Exp"`
	
}

var G_vecLevel Cfg_Level

func LoadLevel() bool {
	data, err := ioutil.ReadFile("./conf/json/Level.json")
	if err != nil {
		log.Error("Level.json os.Open fail ", err)
		return false
	}
	log.Release("Level.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecLevel)
	if parseErr != nil {
		log.Error("Level.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Level.json LoadXml Success")
	return true
}