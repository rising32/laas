package route
import (
	fmt			"fmt"
	laas_ctrl	"laas/pkg/controller"
	mux			"github.com/gorilla/mux"
)

var GuestRoutes = func(router *mux.Router) {
	router.HandleFunc("/guest/",laas_ctrl.AddGuest).Methods("POST");
	router.HandleFunc("/guest/",laas_ctrl.GetGuest).Methods("GET");	
	router.HandleFunc("/guest/{username}",laas_ctrl.GetGuestByUsername).Methods("GET");	
	router.HandleFunc("/guest/{username}",laas_ctrl.UpdateGuest).Methods("PUT");	
	router.HandleFunc("/guest/{username}",laas_ctrl.DeleteGuest).Methods("DELETE");	
	fmt.Println("[laas] loading routes");
}