package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Chapter struct {
	Items   []Chapter   `json:"items"`
}

type Chapter struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Name string `json:"Name"`
	Checkpoint string `json:"Checkpoint"`
	
}

var G_vecChapter Cfg_Chapter

func LoadChapter() bool {
	data, err := ioutil.ReadFile("./conf/json/Chapter.json")
	if err != nil {
		log.Error("Chapter.json os.Open fail ", err)
		return false
	}
	log.Release("Chapter.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecChapter)
	if parseErr != nil {
		log.Error("Chapter.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Chapter.json LoadXml Success")
	return true
}