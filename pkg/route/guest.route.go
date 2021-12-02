package route
import (
	controller	"laas-go-2/pkg/controller"
	gin			"github.com/gin-gonic/gin"
	gorm		"github.com/jinzhu/gorm"
)

func GuestRoute(db *gorm.DB) *gin.Engine {
	r := gin.Default();
	r.Use(func(c *gin.Context) {
		c.Set("db",db);
	})
	r.GET("/guest",controller.GetGuest);
	r.GET("/guest/:username",controller.GetGuestByUsername)	
	r.POST("/guest",controller.AddGuest);
	return r;
}
