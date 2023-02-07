package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Event struct {
	Items   []Event   `json:"items"`
}

type Event struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Name string `json:"Name"`
	Behavior string `json:"Behavior"`
	Type string `json:"Type"`
	Effect string `json:"Effect"`
	Time int32 `json:"Time"`
	
}

var G_vecEvent Cfg_Event

func LoadEvent() bool {
	data, err := ioutil.ReadFile("./conf/json/Event.json")
	if err != nil {
		log.Error("Event.json os.Open fail ", err)
		return false
	}
	log.Release("Event.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecEvent)
	if parseErr != nil {
		log.Error("Event.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Event.json LoadXml Success")
	return true
}