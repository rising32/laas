package route
import (
	controller	"laas-go-2/pkg/controller"
	gin			"github.com/gin-gonic/gin"
	gorm		"github.com/jinzhu/gorm"
)

func GuestRoute(db *gorm.DB, r *gin.Engine) *gin.Engine {
	r.Use(func(c *gin.Context) {
		c.Set("db",db);
	})
	r.POST("/api/user/guest/add",controller.AddGuest);
	r.GET("/api/user/guest/show",controller.GetGuest);
	r.GET("/api/user/guest/:username",controller.GetGuestByUsername);
	r.PATCH("/api/user/guest/:username/update/profile",controller.UpdateGuestProfile);
	r.PATCH("/api/user/guest/:username/update/password",controller.UpdateGuestPassword);
	r.PATCH("/api/user/guest/:username/close",controller.CloseGuestAccount);
	r.PATCH("/api/user/guest/:username/open",controller.OpenGuestAccount);
	r.DELETE("/api/user/guest/:username/delete",controller.DeleteGuestAccount);

	return r;
}
