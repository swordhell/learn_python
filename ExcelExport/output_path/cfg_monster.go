package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Monster struct {
	Items   []Monster   `json:"items"`
}

type Monster struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	C_Name string `json:"C_Name"`
	S_Type int32 `json:"S_Type"`
	S_Attack int32 `json:"S_Attack"`
	S_Defense int32 `json:"S_Defense"`
	S_Speed int32 `json:"S_Speed"`
	S_HP int32 `json:"S_HP"`
	S_Skill string `json:"S_Skill"`
	S_Drop string `json:"S_Drop"`
	
}

var G_vecMonster Cfg_Monster

func LoadMonster() bool {
	data, err := ioutil.ReadFile("./conf/json/Monster.json")
	if err != nil {
		log.Error("Monster.json os.Open fail ", err)
		return false
	}
	log.Release("Monster.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecMonster)
	if parseErr != nil {
		log.Error("Monster.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Monster.json LoadXml Success")
	return true
}