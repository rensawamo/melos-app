#  Dart App 

# environment 
macOS 
homebrew



[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

```sh

root
├── app
│   ├── TaskApp
│ 
├── backend
│   ├── dartfrog(server)
│  
├── packages
│   ├──  core
│   │      ├── analytics
│   │      └── data
│   │      └── database
│   │      └── domain
│   │      └── model
│   │
│   └── feature
│          └── auth
│          
├── infrastructure
│
├── mason
│
├── Dockerfile
├── dockercompose.yaml
├── meson.yaml   
├── melos.yaml  
├── pubspec.yaml 
└── README.md

```

### bootstrap 
setup the project 

```sh
$ make bs
....
Running "flutter pub get" in workspace packages...
  ✓ model
    └> packages/core/model
  ✓ repository
    └> packages/core/repository
  ✓ backend
    └> backend
  ✓ app
    └> app
  > SUCCESS

Generating IntelliJ IDE files...
  > SUCCESS
....
Starting Dart Frog server on Docker
[+] Building 376.0s (18/18) FINISHED                                                                                                                                                                                                                                          docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                                          0.0s
 => => transferring dockerfile: 503B                                                                                                                                                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/dart:stable                                                                                                                                                                                                                                2.6s
 => [auth] library/dart:pull token for registry-1.docker.io                                                                                                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                                               0.0s
 => [build  1/10] FROM docker.io/library/dart:stable@sha256:816fee592c641f61ff42461d23cfc3bee301f21e2288cb6818ab961c44c6efc0                                                                                                                                                                327.4s
 => => resolve docker.io/library/dart:stable@sha256:816fee592c641f61ff42461d23cfc3bee301f21e2288cb6818ab961c44c6efc0                                                                                                                                                                          0.0s
 => => sha256:816fee592c641f61ff42461d23cfc3bee301f21e2288cb6818ab961c44c6efc0 776B / 776B                                                                                                                                                                                                    0.0s
 => => sha256:3f0f8df61028fa70952066f187b6af4043ad5be2d4734929232e6e39d941ef5c 1.17kB / 1.17kB                                                                                                                                                                                                0.0s
 => => sha256:de646835fce11ef8f286190c49fed6468268cbe08cf510e200c9cbbe1c034e83 5.76kB / 5.76kB                                                                                                                                                                                                0.0s
 => => sha256:22d97f6a5d13532e867231d23d92620a81874d51a456196be50154eeb32edc08 29.18MB / 29.18MB                                                                                                                                                                                             94.8s
 => => sha256:c61f508d94b666194783e360ca4b846019ec00aa9a98ffba9cf2024340d9ac68 54.33MB / 54.33MB                                                                                                                                                                                            140.4s
 => => sha256:0ad48f7bd7c88c857ed347ab353734ec0767ee28a37c11fe0f47dc69fee51cde 1.49MB / 1.49MB                                                                                                                                                                                                1.6s
 => => sha256:db6a892bc79243ec0e7f1861a28011a29f1310f2ae79805bc5fee5e607d32be8 227.71MB / 227.71MB                                                                                                                                                                                          325.0s
 => => extracting sha256:22d97f6a5d13532e867231d23d92620a81874d51a456196be50154eeb32edc08                                                                                                                                                                                                     0.9s
 => => extracting sha256:c61f508d94b666194783e360ca4b846019ec00aa9a98ffba9cf2024340d9ac68                                                                                                                                                                                                     0.9s
 => => extracting sha256:0ad48f7bd7c88c857ed347ab353734ec0767ee28a37c11fe0f47dc69fee51cde                                                                                                                                                                                                     0.0s
 => => extracting sha256:db6a892bc79243ec0e7f1861a28011a29f1310f2ae79805bc5fee5e607d32be8                                                                                                                                                                                                     2.3s
 => [internal] load build context                                                                                                                                                                                                                                                             0.5s
 => => transferring context: 98.70MB                                                                                                                                                                                                                                                          0.5s
 => [build  2/10] WORKDIR /app                                                                                                                                                                                                                                                                0.4s
 => [build  3/10] COPY pubspec.* ./                                                                                                                                                                                                                                                           0.0s
 => [build  4/10] RUN dart pub get                                                                                                                                                                                                                                                            6.5s
 => [build  5/10] COPY . .                                                                                                                                                                                                                                                                    0.1s
 => [build  6/10] WORKDIR /app/backend/                                                                                                                                                                                                                                                       0.0s
 => [build  7/10] RUN dart pub global activate dart_frog_cli                                                                                                                                                                                                                                 14.4s
 => [build  8/10] RUN dart pub global run dart_frog_cli:dart_frog build                                                                                                                                                                                                                      21.8s
 => [build  9/10] RUN dart pub get --offline                                                                                                                                                                                                                                                  0.5s
 => [build 10/10] RUN dart compile exe build/bin/server.dart -o build/bin/server                                                                                                                                                                                                              1.8s
 => [stage-1 1/2] COPY --from=build /runtime/ /                                                                                                                                                                                                                                               0.0s
 => [stage-1 2/2] COPY --from=build /app/backend/build/bin/server /app/bin/backend/server                                                                                                                                                                                                     0.0s
 => exporting to image                                                                                                                                                                                                                                                                        0.0s
 => => exporting layers                                                                                                                                                                                                                                                                       0.0s
 => => writing image sha256:b322b3c13fadb14163c940726919457dd9056e7d8c8f4b264d7140e808133e68                                                                                                                                                                                                  0.0s
 => => naming to docker.io/library/dart-frog-app                                                                                                                                                                                                                                              0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/zpx8m6zyfumnqmveija1sy5tg
./scripts/bootstrap.sh: line 53: app: command not found
✓ Running on http://:::8080
```

### frontend start 
```sh
$ make front-start 
...
A Dart VM Service on Chrome is available at: http://127.0.0.1:53308/vuiIiX9KTZs=
```

### if you want to create a new package
```sh
$ dart create -t package FOLDERNAME
```
