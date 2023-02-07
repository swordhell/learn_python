package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Place struct {
	Items   []Place   `json:"items"`
}

type Place struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Name string `json:"Name"`
	Describe string `json:"Describe"`
	Event string `json:"Event"`
	
}

var G_vecPlace Cfg_Place

func LoadPlace() bool {
	data, err := ioutil.ReadFile("./conf/json/Place.json")
	if err != nil {
		log.Error("Place.json os.Open fail ", err)
		return false
	}
	log.Release("Place.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecPlace)
	if parseErr != nil {
		log.Error("Place.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Place.json LoadXml Success")
	return true
}