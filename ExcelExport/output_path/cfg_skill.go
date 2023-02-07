package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Skill struct {
	Items   []Skill   `json:"items"`
}

type Skill struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	C_Name string `json:"C_Name"`
	C_Describe string `json:"C_Describe"`
	Level int32 `json:"Level"`
	Type string `json:"Type"`
	Opportunity int32 `json:"Opportunity"`
	Target int32 `json:"Target"`
	Number int32 `json:"Number"`
	Effect_1 string `json:"Effect_1"`
	Effect_2 string `json:"Effect_2"`
	BuildLevel int32 `json:"BuildLevel"`
	
}

var G_vecSkill Cfg_Skill

func LoadSkill() bool {
	data, err := ioutil.ReadFile("./conf/json/Skill.json")
	if err != nil {
		log.Error("Skill.json os.Open fail ", err)
		return false
	}
	log.Release("Skill.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecSkill)
	if parseErr != nil {
		log.Error("Skill.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Skill.json LoadXml Success")
	return true
}