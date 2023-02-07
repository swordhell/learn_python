package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Language struct {
	Items   []Language   `json:"items"`
}

type Language struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	C_CNText string `json:"C_CNText"`
	C_ENText string `json:"C_ENText"`
	C_JPText string `json:"C_JPText"`
	
}

var G_vecLanguage Cfg_Language

func LoadLanguage() bool {
	data, err := ioutil.ReadFile("./conf/json/Language.json")
	if err != nil {
		log.Error("Language.json os.Open fail ", err)
		return false
	}
	log.Release("Language.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecLanguage)
	if parseErr != nil {
		log.Error("Language.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Language.json LoadXml Success")
	return true
}