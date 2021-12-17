package main
import (
	fmt		"fmt"
    http	"net/http"	
	model	"laas-go-2/pkg/model"
	route	"laas-go-2/pkg/route"
	util	"laas-go-2/pkg/util"
	env	    "github.com/joho/godotenv"
	gin		"github.com/gin-gonic/gin"
)

func main() {
	env.Load();
	fmt.Println("check-hash:",util.GenerateSaltedSHA256("haspul1963","k72zBr3GrXEcks64"),"\n");
//	fmt.Println("check-hash:",util.GenerateSaltedSHA256("irsyadndu1ABC","14qJzz7ADHxtJRK4"),"\n");

	db := model.IntiateDB();
	db.AutoMigrate(&model.Guest{});

	r := gin.Default();	
	r.LoadHTMLGlob("templates/*.html");

	r.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK,"laas.md.html",nil)
	});
	route.GuestRoute(db,r);


	r.Run()
}

// main route jadiin display tree endpoint