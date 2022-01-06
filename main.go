package main
import (
	fmt		"fmt"
	model	"laas-go-2/pkg/model"
	route	"laas-go-2/pkg/route"
	util	"laas-go-2/pkg/util"
	env	    "github.com/joho/godotenv"
	gin		"github.com/gin-gonic/gin"
)

func main() {
	env.Load();
	fmt.Println("check-hash:",util.GenerateSaltedSHA256("irsyadota","8CwqhcBnoA6DLQ0r"),"\n");

	db := model.IntiateDB();
	db.AutoMigrate(&model.Guest{});

	r := gin.Default();	
	r.LoadHTMLGlob("templates/*.html");

	route.DefaultDocRoute(r);
	route.GuestRoute(db,r);
	r.Run()
}