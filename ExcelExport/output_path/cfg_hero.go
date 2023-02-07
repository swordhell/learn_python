package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Hero struct {
	Items   []Hero   `json:"items"`
}

type Hero struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Name string `json:"Name"`
	Describe string `json:"Describe"`
	Star int32 `json:"Star"`
	Job int32 `json:"Job"`
	Strength int32 `json:"Strength"`
	Constitution int32 `json:"Constitution"`
	Agile int32 `json:"Agile"`
	Intelligence int32 `json:"Intelligence"`
	Attack int32 `json:"Attack"`
	Defense int32 `json:"Defense"`
	Speed int32 `json:"Speed"`
	HP int32 `json:"HP"`
	Price int32 `json:"Price"`
	
}

var G_vecHero Cfg_Hero

func LoadHero() bool {
	data, err := ioutil.ReadFile("./conf/json/Hero.json")
	if err != nil {
		log.Error("Hero.json os.Open fail ", err)
		return false
	}
	log.Release("Hero.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecHero)
	if parseErr != nil {
		log.Error("Hero.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Hero.json LoadXml Success")
	return true
}