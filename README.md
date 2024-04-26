#  Melos Dart App


[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)


Dart Frog is an excellent tool for building a backend with Dart. I’ve already covered the basics in [this](https://tomicriedel.medium.com/cff6fc9f033b) article, so if you want to follow along, I recommend you read this one first.

What is [Melos](https://melos.invertase.dev/)?
It is a CLI tool to support management of Dart projects with multiple packages (also called monorepo).

Splitting a large project into version-controlled packages is very effective for code sharing.

It provides a simple and efficient way to manage multiple packages and libraries in a single code base. Melos is designed to help manage these challenges by providing a streamlined workflow for building, testing, and managing dependencies across all projects in a mono repository.

Melos also provides a plugin system (for Intellij and [VS Code](https://melos.invertase.dev/ide-support#vs-code) )


### Why Use??


☑️ Consistent development environment


☑️ Linking and installation of local packages


☑️ Simultaneous command execution on multiple packages


☑️ Multiple developers can work on the same code base at the same time


### Demerit

☑️ Flexibility Limitations

☑️ Increased complexity

### Melos Command

All package dependencies are installed (internally pub get is used)
All packages are linked locally.

```sh
$ melos bootstrap
# or 
$ melos bs
```

Clean up temporary project files.
Can be run before bootstrap, for example, to start completely fresh.
```sh
$ melos clean
```



### project app

ex) Chrome. 
You can build android ios emulater!

![image](https://github.com/rensawamo/melos-app/assets/106803080/6034e2b2-204f-473c-8ec2-3fe847c80a25)



![image](https://github.com/rensawamo/melos-app/assets/106803080/c4e94ac2-6373-4fb6-add5-cafc7491e193)



Use the Dart backend too!

![image](https://github.com/rensawamo/melos-app/assets/106803080/e2859474-7c0d-4ba8-862b-4239398addab)



###  environment 
macOS 
Home Brew


### project directry tree
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
set up project  server

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
....

✓ Running on http://:::8080
```

### app start 
set up project frontend

```sh
$ make app-start-chrome
...
A Dart VM Service on Chrome is available at: http://127.0.0.1:53308/vuiIiX9KTZs=
```

You can get backend info 
```sh
http://localhost:8080/tasks
```


### if you want to create a new package
```sh
$ dart create -t package FOLDERNAME
```


### reference 

[https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3liTklwNWJWRDhnUXZHek54OVM0ZDhEQy1zZ3xBQ3Jtc0tuS3ZiR3QxUXNtRUhMMl9PdHdBRFNzRGpFSHhKQmJJSzEzZTRoaG1oNmdZbzdoU0FZYzlNdEwzUmY4WVZQV0tQdUFDdWFvUjZhTlFrMHk1d0tISVBLUUZGV3Q5OXRYTHhYTUJZdEhpRTlSM0ZPbjg5aw&q=https%3A%2F%2Fgithub.com%2Fiampawan%2FFullStackTaskApp&v=_LhSRbekY5k](https://github.com/iampawan/FullStackTaskApp)
