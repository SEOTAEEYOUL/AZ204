# helloworld

```
seo@Azure:~$ git clone https://github.com/hahaysh/acr-build-helloworld-node
Cloning into 'acr-build-helloworld-node'...
remote: Enumerating objects: 100, done.
remote: Total 100 (delta 0), reused 0 (delta 0), pack-reused 100
Receiving objects: 100% (100/100), 20.91 KiB | 10.46 MiB/s, done.
Resolving deltas: 100% (43/43), done.
seo@Azure:~$ cd acr-build-helloworld-node
seo@Azure:~/acr-build-helloworld-node$ ls -lt
total 44
-rw-r--r-- 1 seo seo  135 Nov 18 02:17 CHANGELOG.md
-rw-r--r-- 1 seo seo 3923 Nov 18 02:17 CONTRIBUTING.md
-rw-r--r-- 1 seo seo  100 Nov 18 02:17 Dockerfile
-rw-r--r-- 1 seo seo  146 Nov 18 02:17 Dockerfile-app
-rw-r--r-- 1 seo seo   43 Nov 18 02:17 Dockerfile-base
-rw-r--r-- 1 seo seo 1161 Nov 18 02:17 LICENSE.md
-rw-r--r-- 1 seo seo  246 Nov 18 02:17 package.json
-rw-r--r-- 1 seo seo 2911 Nov 18 02:17 README.md
-rw-r--r-- 1 seo seo  343 Nov 18 02:17 server.js
-rw-r--r-- 1 seo seo  442 Nov 18 02:17 taskmulti-multiregistry.yaml
-rw-r--r-- 1 seo seo  316 Nov 18 02:17 taskmulti.yaml
seo@Azure:~/acr-build-helloworld-node$ MYID=taeyeol
seo@Azure:~/acr-build-helloworld-node$ RES_GROUP=$MYID"rg"
seo@Azure:~/acr-build-helloworld-node$ ACR_NAME=$MYID"acr"
seo@Azure:~/acr-build-helloworld-node$ az acr build --registry $ACR_NAME --image helloacrtasks:v1 .
Packing source code into tar to upload...
Excluding '.git' based on default ignore rules
Excluding '.gitignore' based on default ignore rules
Uploading archived source code from '/tmp/build_archive_d8974d58edc04921be0a8ed458732baf.tar.gz'...
Sending context (5.260 KiB) to registry: taeyeolacr...
Queued a build with ID: ca1
Waiting for an agent...
2021/11/18 02:18:30 Downloading source code...
2021/11/18 02:18:30 Finished downloading source code
2021/11/18 02:18:31 Using acb_vol_a3438bc0-a4af-4c76-93d4-23619f6435cc as the home volume
2021/11/18 02:18:31 Setting up Docker configuration...
2021/11/18 02:18:31 Successfully set up Docker configuration
2021/11/18 02:18:31 Logging in to registry: taeyeolacr.azurecr.io
2021/11/18 02:18:32 Successfully logged into taeyeolacr.azurecr.io
2021/11/18 02:18:32 Executing step ID: build. Timeout(sec): 28800, Working directory: '', Network: ''
2021/11/18 02:18:32 Scanning for dependencies...
2021/11/18 02:18:33 Successfully scanned dependencies
2021/11/18 02:18:33 Launching container with name: build
Sending build context to Docker daemon  25.09kB
Step 1/5 : FROM node:9-alpine
9-alpine: Pulling from library/node
a073c86ecf9e: Pulling fs layer
0e28711eb56d: Pulling fs layer
e460dd483fdd: Pulling fs layer
e460dd483fdd: Verifying Checksum
e460dd483fdd: Download complete
a073c86ecf9e: Verifying Checksum
a073c86ecf9e: Download complete
0e28711eb56d: Verifying Checksum
0e28711eb56d: Download complete
a073c86ecf9e: Pull complete
0e28711eb56d: Pull complete
e460dd483fdd: Pull complete
Digest: sha256:8dafc0968fb4d62834d9b826d85a8feecc69bd72cd51723c62c7db67c6dec6fa
Status: Downloaded newer image for node:9-alpine
 ---> a56170f59699
Step 2/5 : COPY . /src
 ---> 54797aa0dfef
Step 3/5 : RUN cd /src && npm install
 ---> Running in 022087a1cf9f
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN helloworld@1.0.0 No repository field.

up to date in 0.059s
Removing intermediate container 022087a1cf9f
 ---> afbfdfcf7c2e
Step 4/5 : EXPOSE 80
 ---> Running in f61bf9d5c4e9
Removing intermediate container f61bf9d5c4e9
 ---> 71b04417ad54
Step 5/5 : CMD ["node", "/src/server.js"]
 ---> Running in 2c889c6ab165
Removing intermediate container 2c889c6ab165
 ---> ca498e27e883
Successfully built ca498e27e883
Successfully tagged taeyeolacr.azurecr.io/helloacrtasks:v1
2021/11/18 02:18:40 Successfully executed container: build
2021/11/18 02:18:40 Executing step ID: push. Timeout(sec): 3600, Working directory: '', Network: ''
2021/11/18 02:18:40 Pushing image: taeyeolacr.azurecr.io/helloacrtasks:v1, attempt 1
The push refers to repository [taeyeolacr.azurecr.io/helloacrtasks]
0154c0ef1ef9: Preparing
c1d62bb0f7c2: Preparing
172ed8ca5e43: Preparing
8c9992f4e5dd: Preparing
8dfad2055603: Preparing
0154c0ef1ef9: Pushed
c1d62bb0f7c2: Pushed
172ed8ca5e43: Pushed
8dfad2055603: Pushed
8c9992f4e5dd: Pushed
v1: digest: sha256:f89baa1546ce58c487d42396ca27fb5777c1ef77007a2d8873a03b22b873bff7 size: 1366
2021/11/18 02:18:45 Successfully pushed image: taeyeolacr.azurecr.io/helloacrtasks:v1
2021/11/18 02:18:45 Step ID: build marked as successful (elapsed time in seconds: 7.483854)
2021/11/18 02:18:45 Populating digests for step ID: build...
2021/11/18 02:18:46 Successfully populated digests for step ID: build
2021/11/18 02:18:46 Step ID: push marked as successful (elapsed time in seconds: 5.521962)
2021/11/18 02:18:46 The following dependencies were found:
2021/11/18 02:18:46
- image:
    registry: taeyeolacr.azurecr.io
    repository: helloacrtasks
    tag: v1
    digest: sha256:f89baa1546ce58c487d42396ca27fb5777c1ef77007a2d8873a03b22b873bff7
  runtime-dependency:
    registry: registry.hub.docker.com
    repository: library/node
    tag: 9-alpine
    digest: sha256:8dafc0968fb4d62834d9b826d85a8feecc69bd72cd51723c62c7db67c6dec6fa
  git: {}

Run ID: ca1 was successful after 17s
seo@Azure:~/acr-build-helloworld-node$ az acr repository list --name $ACR_NAME --output table
Result
-------------
hello-world
helloacrtasks
seo@Azure:~/acr-build-helloworld-node$ az acr repository show-tags --name $ACR_NAME --repository helloacrtasks --output table
Result
--------
v1
seo@Azure:~/acr-build-helloworld-node$ az acr repository show -n $ACR_NAME -t helloacrtasks:v1
{
  "changeableAttributes": {
    "deleteEnabled": true,
    "listEnabled": true,
    "readEnabled": true,
    "writeEnabled": true
  },
  "createdTime": "2021-11-18T02:18:45.5342398Z",
  "digest": "sha256:f89baa1546ce58c487d42396ca27fb5777c1ef77007a2d8873a03b22b873bff7",
  "lastUpdateTime": "2021-11-18T02:18:45.5342398Z",
  "name": "v1",
  "signed": false
}
seo@Azure:~/acr-build-helloworld-node$
```