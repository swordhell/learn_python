package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Job struct {
	Items   []Job   `json:"items"`
}

type Job struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	Name string `json:"Name"`
	Level int32 `json:"Level"`
	Strength string `json:"Strength"`
	Constitution string `json:"Constitution"`
	Agile string `json:"Agile"`
	Intelligence string `json:"Intelligence"`
	Skill string `json:"Skill"`
	Requirement string `json:"Requirement"`
	Cost int32 `json:"Cost"`
	
}

var G_vecJob Cfg_Job

func LoadJob() bool {
	data, err := ioutil.ReadFile("./conf/json/Job.json")
	if err != nil {
		log.Error("Job.json os.Open fail ", err)
		return false
	}
	log.Release("Job.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecJob)
	if parseErr != nil {
		log.Error("Job.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Job.json LoadXml Success")
	return true
}