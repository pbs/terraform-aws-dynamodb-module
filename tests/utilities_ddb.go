package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testDynamoDB(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	arn := terraform.Output(t, terraformOptions, "arn")
	name := terraform.Output(t, terraformOptions, "name")

	accountID := getAWSAccountID(t)
	region := getAWSRegion(t)

	expectedName := fmt.Sprintf("example-tf-dynamodb-%s", variant)
	expectedARN := fmt.Sprintf("arn:aws:dynamodb:%s:%s:table/%s", region, accountID, expectedName)

	assert.Equal(t, expectedARN, arn)
	assert.Equal(t, expectedName, name)
}
