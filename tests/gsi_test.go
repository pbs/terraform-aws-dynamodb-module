package test

import (
	"testing"
)

func TestGSIExample(t *testing.T) {
	testDynamoDB(t, "gsi")
}
