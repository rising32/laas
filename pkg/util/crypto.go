package util
import (
	fmt		"fmt"
	str 	"strings"
	time	"time"
	sha256	"crypto/sha256"
	rand	"math/rand"
)

func GenerateSalt(n int) string {
	rand.Seed(time.Now().UnixNano());
	alphanum := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
	b := make([]rune,n);
	for i := range b {b[i] = alphanum[rand.Intn(len(alphanum))];}
	return string(b);
}

func GenerateSaltedSHA256(word string, salt string) string { // key-stretching salt
	var final str.Builder
	get_word := []rune(word); get_salt := []rune(salt);
	x := get_word; y := get_salt
	if len(get_salt) > len(get_word) {x = get_salt; y = get_word;}
	for a := range x {
		final.WriteString(string(x[a]));
		if a < len(y) {final.WriteString(string(y[a]));}
	}
	return fmt.Sprintf("%x",sha256.Sum256([]byte(final.String())));
}