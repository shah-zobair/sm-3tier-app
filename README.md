# OpenShift Service Mesh Test Application 

* Frontend with Apache
* Backend with Postgres DB
* 2 Istio Gateways for Frontend and Backend
* 2 Virtual Services
* 2 Destination Rule
* Traffic Load test script
* All traffic is using ISTIO_MUTUAL

## Prerequisites:
* It is assumed that required Service Mesh Operators are already installed in OpenShift cluster following [Openshift Service Mesh](https://docs.openshift.com/container-platform/4.10/service_mesh/v2x/ossm-about.html#ossm-servicemesh-overview_ossm-about)
* Service Mesh Control Plane is deployed on `istio-system` project. A sample file can be found here too (**basic-smcp.yaml**)
* A project is created to deploy the Frontend and Backend applications. All the deployment files used the namespace (**test-app-sm3**)
* A certificate and key file for the Ingress route. This will be used by the Istio Gateway.

## Deployment Steps:
1. Create the Service Mesh Control Plane project (if not done already):

```
oc new-project istio-system
```

2. Deploy Service Mesh Control Plane components (if not done already):

```
oc apply -f basic-smcp.yaml -n istio-system
```

3. Create the workload/application project (if not done already):

```
oc new-project test-app-sm3
```

4. Add this project as a member of the mesh:

```
oc apply -f sm-role.yaml
```

5. Deploy frontend application with dependencies(configmap for www data and secret for ingress certificate):

```
oc create configmap www-data --from-file=index.html --from-file=db-pg.php
oc create secret tls frontend-cert --key=tls.key --cert=tls.crt -n istio-system
oc apply -f deploy-frontend.yaml
```

6. Deploy Backend and populate the DB with a job:

```
oc apply -f deploy-backend.yaml
oc apply -f job-populate-db.yaml
```

7. Create Istio Gateway and VirtualService:
 
 ```
 oc apply -f sm-gw-vs.yaml
 ```

8. Create Istio DestinationRule:

```
oc apply -f sm-dest-rule.yaml
```

SM Control Plane will automatially create a HTTPS route. Browse the route and copy the URL to generate traffic from the `load-test.sh` script. Hit the URL with {URL}/db-pg.php to communicate and generate traffic to the backend.

**Optional**- Configure the mesh so that it only accepts TLS traffic: 

```
oc apply -f peerauthentications-default.yaml
```
