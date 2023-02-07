package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_HeroLevel struct {
	Items   []HeroLevel   `json:"items"`
}

type HeroLevel struct {
	Id int32 `json:"Id"`
	Exp int32 `json:"Exp"`
	
}

var G_vecHeroLevel Cfg_HeroLevel

func LoadHeroLevel() bool {
	data, err := ioutil.ReadFile("./conf/json/HeroLevel.json")
	if err != nil {
		log.Error("HeroLevel.json os.Open fail ", err)
		return false
	}
	log.Release("HeroLevel.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecHeroLevel)
	if parseErr != nil {
		log.Error("HeroLevel.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("HeroLevel.json LoadXml Success")
	return true
}