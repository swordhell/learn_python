package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_Item struct {
	Items   []Item   `json:"items"`
}

type Item struct {
	Id int32 `json:"Id"`
	OnlyId string `json:"OnlyId"`
	C_Name string `json:"C_Name"`
	C_Describe string `json:"C_Describe"`
	C_Quality int32 `json:"C_Quality"`
	Type string `json:"Type"`
	Effect string `json:"Effect"`
	Limit int32 `json:"Limit"`
	Price int32 `json:"Price"`
	SPrice int32 `json:"SPrice"`
	
}

var G_vecItem Cfg_Item

func LoadItem() bool {
	data, err := ioutil.ReadFile("./conf/json/Item.json")
	if err != nil {
		log.Error("Item.json os.Open fail ", err)
		return false
	}
	log.Release("Item.json Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vecItem)
	if parseErr != nil {
		log.Error("Item.json xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("Item.json LoadXml Success")
	return true
}