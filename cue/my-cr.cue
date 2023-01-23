apiVersion: "stable.example.com/v1alpha"
kind:       "MyController"
metadata: name: "my-controller-object"
spec: {
	image:    "mc-image"
	message:  "This is the first Custom Resource"
	replicas: 1
}
