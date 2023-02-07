package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Dungeon struct {
	Items   []Dungeon   `json:"items"`
}

type Dungeon struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Name string `json:"Name"`
	Type int32 `json:"Type"`
	Checkpoint string `json:"Checkpoint"`
	
}

var G_vecDungeon Cfg_Dungeon

func LoadDungeon() bool {
	data, err := ioutil.ReadFile("./conf/json/Dungeon.json")
	if err != nil {
		log.Error("Dungeon.json os.Open fail ", err)
		return false
	}
	log.Release("Dungeon.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecDungeon)
	if parseErr != nil {
		log.Error("Dungeon.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Dungeon.json LoadXml Success")
	return true
}