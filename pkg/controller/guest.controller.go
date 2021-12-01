package controller
import (
	http	"net/http"
	json	"encoding/json"
	mux		"github.com/gorilla/mux"	
	lib 	"laas/pkg/lib"
	model	"laas/pkg/model"
)

var NewGuest model.Guest;

func GetGuest(w http.ResponseWriter, r *http.Request) {
	newGuest := model.GetGuest();
	res,_    := json.Marshal(newGuest);
	w.Header().Set("Content-Type","pkglication/json");
	w.WriteHeader(http.StatusOK);
	w.Write(res);
}

func GetGuestByUsername(w http.ResponseWriter, r *http.Request) {
	vars       := mux.Vars(r);
	username   := vars["username"];
	newGuest,_ := model.GetGuestByUsername(username);
	res,_      := json.Marshal(newGuest);
	w.Header().Set("Content-Type","pkglication/json");
	w.WriteHeader(http.StatusOK);
	w.Write(res);
}

func AddGuest(w http.ResponseWriter, r *http.Request) {
	addGuest := &model.Guest{}
	lib.ParseBody(r,addGuest);
	b        := addGuest.AddGuest();
	res,_    := json.Marshal(b);
	w.WriteHeader(http.StatusOK);

	w.Write(res);	
}

func DeleteGuest(w http.ResponseWriter, r *http.Request) {
	vars     := mux.Vars(r);
	username := vars["username"];
	newGuest := model.DeleteGuest(username);
	res,_    := json.Marshal(newGuest);
	w.Header().Set("Content-Type","pkglication/json");
	w.WriteHeader(http.StatusOK);
	w.Write(res);	
}

func UpdateGuest(w http.ResponseWriter, r *http.Request) {
	var addGuest = &model.Guest{}
	lib.ParseBody(r,addGuest);	
	vars        := mux.Vars(r);
	username    := vars["username"];	
	newGuest,db := model.GetGuestByUsername(username);
	if addGuest.Full_name != "" {newGuest.Full_name = addGuest.Full_name;}
	db.Save(&addGuest);
	res,_       := json.Marshal(addGuest);
	w.Header().Set("Content-Type","pkglication/json");
	w.WriteHeader(http.StatusOK);
	w.Write(res);	
}

// ubah model jadi huruf gede