// Declares the package name. It's where the execution of the program starts.
package main

// fmt is short for format. Imports the fmt package which contains functions for formatted I/O.
import {
	"fmt"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"

}

// Defines the `main` function, the entry point of the application. When you run the program, it starts executing from this function.
func main() {
	plugin.Serve(&plugin.ServeOpts{
		
	})
	// Format.PrintLine
	// Prints to standard output.
	fmt.Println("Hello, world!")
}

// in golang, a titlecase function will get exported.
func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{

		}
		DataSourcesMap: map[string]*schema.Resource{

		}
		Schema: map[string]*schema.Resource{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external service"
			},
			"token": {
				Type: schema.TypeString,
				Sensitive: true, // mark the token as sensitive to hide it in the logs
				Required: true,
				Description: "Bearer token for authorization"
			},
			"user_uuid": {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				ValidateFunc: validateUUID
			}
		}
	}
	p.ConfigureContextFunc = providerConfigure
	return p
}