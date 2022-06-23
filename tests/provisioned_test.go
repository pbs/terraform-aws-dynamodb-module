package test

import (
	"testing"
)

func TestProvisionedExample(t *testing.T) {
	testDynamoDB(t, "provisioned")
}
