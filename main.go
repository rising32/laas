package main
import (
	fmt		"fmt"
	model	"laas-go-2/pkg/model"
	route	"laas-go-2/pkg/route"
	util	"laas-go-2/pkg/util"
	env	    "github.com/joho/godotenv"	
)

func main() {
	env.Load();
//	fmt.Println("check-hash:",util.GenerateSaltedSHA256("Haspul1963!@","fX4UsJpnDJcLib7W"),"\n");
	fmt.Println("check-hash:",util.GenerateSaltedSHA256("irsyadndu1ABC","14qJzz7ADHxtJRK4"),"\n");

	db := model.IntiateDB();
	db.AutoMigrate(&model.Guest{});
	r  := route.GuestRoute(db);
	r.Run()
}