apiVersion: "apiextensions.k8s.io/v1"
kind:       "CustomResourceDefinition"
metadata: name: "mycontrollers.stable.example.com"
spec: {
	group: "stable.example.com"
	scope: "Namespaced"
	names: {
		kind:     "MyController"
		plural:   "mycontrollers"
		singular: "mycontroller"
		shortNames: ["mc"]
	}
	versions: [{
		name:    "v1alpha"
		served:  true
		storage: true
		schema: openAPIV3Schema: {
			type: "object"
			properties: spec: {
				type: "object"
				properties: {
					image: {
						type:    "string"
						default: "nginx:latest"
					}
					message: type: "string"
					replicas: type: "integer"
				}
				required: [
					"message",
				]
			}
		}
		subresources: {
			status: {}
			scale: {
				specReplicasPath:   ".spec.replicas"
				statusReplicasPath: ".status.replicas"
				labelSelectorPath:  ".status.labelSelector"
			}
		}
		additionalPrinterColumns: [{
			name:        "message"
			type:        "string"
			description: "message content which want to show"
			jsonPath:    ".spec.message"
		}, {
			name:     "AGE"
			type:     "date"
			jsonPath: ".metadata.creationTimestamp"
		}]
	}]
}
