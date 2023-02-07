package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_PlayerBuild struct {
	Items   []PlayerBuild   `json:"items"`
}

type PlayerBuild struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	C_Name string `json:"C_Name"`
	Unlock int32 `json:"Unlock"`
	BuildCost int32 `json:"BuildCost"`
	UpgradeCost int32 `json:"UpgradeCost"`
	Effect string `json:"Effect"`
	
}

var G_vecPlayerBuild Cfg_PlayerBuild

func LoadPlayerBuild() bool {
	data, err := ioutil.ReadFile("./conf/json/PlayerBuild.json")
	if err != nil {
		log.Error("PlayerBuild.json os.Open fail ", err)
		return false
	}
	log.Release("PlayerBuild.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecPlayerBuild)
	if parseErr != nil {
		log.Error("PlayerBuild.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("PlayerBuild.json LoadXml Success")
	return true
}