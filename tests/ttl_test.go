package test

import (
	"testing"
)

func TestTTLExample(t *testing.T) {
	testDynamoDB(t, "ttl")
}
