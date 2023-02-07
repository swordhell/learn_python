package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Equip struct {
	Items   []Equip   `json:"items"`
}

type Equip struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	C_Name string `json:"C_Name"`
	Type string `json:"Type"`
	Level int32 `json:"Level"`
	Attribute1 string `json:"Attribute1"`
	Attribute2 string `json:"Attribute2"`
	SPrice int32 `json:"SPrice"`
	
}

var G_vecEquip Cfg_Equip

func LoadEquip() bool {
	data, err := ioutil.ReadFile("./conf/json/Equip.json")
	if err != nil {
		log.Error("Equip.json os.Open fail ", err)
		return false
	}
	log.Release("Equip.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecEquip)
	if parseErr != nil {
		log.Error("Equip.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Equip.json LoadXml Success")
	return true
}