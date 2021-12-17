package util
import (
	bytes	"bytes"
	exec	"os/exec"
)

func DoCommand(command string) (error,string,string) {
	var stdout bytes.Buffer;
	var stderr bytes.Buffer;
	shell := exec.Command("bash","-c",command);
	shell.Stdout = &stdout;
	shell.Stderr = &stderr;
	err := shell.Run();
	return err, stdout.String(), stderr.String();
}
