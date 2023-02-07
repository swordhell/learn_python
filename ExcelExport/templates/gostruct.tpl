package json_cfg

import (
	"encoding/json"
	"io/ioutil"

	"github.com/name5566/leaf/log"
)

type Cfg_{{name}} struct {
	Items   []{{name}}   `json:"items"`
}

type {{name}} struct {
	{% for f in fields %}{{ f.name|e }} {{ f.type|e }} `json:"{{ f.name|e }}"`
	{% endfor %}
}

var G_vec{{name}} Cfg_{{name}}

func Load{{name}}() bool {
	data, err := ioutil.ReadFile("./conf/json/{{cfgFileName}}")
	if err != nil {
		log.Error("{{cfgFileName}} os.Open fail ", err)
		return false
	}
	log.Release("{{cfgFileName}} Successfully Opened")
	
	parseErr := json.Unmarshal(data, &G_vec{{name}})
	if parseErr != nil {
		log.Error("{{cfgFileName}} xml.Unmarsha1 fail, ", parseErr, )
		return false
	}
	log.Release("{{cfgFileName}} LoadXml Success")
	return true
}
