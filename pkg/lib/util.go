package lib
import (
	json	"encoding/json"
	ioutil	"io/ioutil"
	http	"net/http"
)

func ParseBody(req *http.Request, x interface{}) {
	if body,err := ioutil.ReadAll(req.Body); err == nil {
		if err := json.Unmarshal([]byte(body),x); err != nil {
			return;
		}
	}
}