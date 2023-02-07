package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Make struct {
	Items   []Make   `json:"items"`
}

type Make struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Type string `json:"Type"`
	Material string `json:"Material"`
	Make string `json:"Make"`
	BuildLevel int32 `json:"BuildLevel"`
	
}

var G_vecMake Cfg_Make

func LoadMake() bool {
	data, err := ioutil.ReadFile("./conf/json/Make.json")
	if err != nil {
		log.Error("Make.json os.Open fail ", err)
		return false
	}
	log.Release("Make.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecMake)
	if parseErr != nil {
		log.Error("Make.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Make.json LoadXml Success")
	return true
}