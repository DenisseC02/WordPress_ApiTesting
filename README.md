## [WordPress_ApiTesting v.1.0](#wordpress)
____

**Table of contents**
- [WordPress\_ApiTesting v.1.0](#wordpress_apitesting-v10)
    - [1. Introduction](#1-introduction)
    - [2. Setup Environment](#2-setup-environment)
      - [2.1. Requirements](#21-requirements)
      - [2.2. Setup](#22-setup)
      - [2.3. Environment Variables Definitions](#23-environment-variables-definitions)
    - [3. Executing the framework](#3-executing-the-framework)
      - [3.1. Directories Structure](#31-directories-structure)
      - [3.2. Execution examples](#32-execution-examples)
    - [4. Appendix](#4-appendix)


___
#### 1. Introduction
This hybrid API testing framework was developed to perform tests on WordPress REST API, in order to verify all endpoints functionality.
It uses **Robot Framework** and **Python** scripts, executed on Docker images of WordPress and MySQL. It can also be executed on a live WordPress Site.
___
#### 2. Setup Environment 

requirements.txt and docker compose files are provided in this repository.
##### 2.1. Requirements
- **Platform:** Microsoft Windows 10 (64bits) or Ubuntu Linux v.22.04.1 LTS (64bits)
- Python 3.8.X. It can be installed on your system or on a Virtual Machine or on a Docker Container.
- pip (latest).
- Virtual Environment.
- Docker >=20.10.21 and Docker Compose >=2.13.0
- Docker image: wordpress:php8.0 or live WordPress installation.
- Docker image: mysql:5.7
- WordPress REST API Authentication v.2.6.0 (miniOrange).


##### 2.2. Setup
To setup the environment, please reffer to the following steps:

1. Install Python 3.8 and PIP (Packcage Installer for Python)
  - _Windows users:_ [Download Python 3.8.16](https://www.python.org/downloads/release/python-3816/) and follow installation instructions.
  - _Linux users:_ [Follow installation procedure](https://docs.python-guide.org/starting/install3/linux/) described in this documentation.
2. Setup a Virtual Environment in Python.
  It can be created using the tools of your choice for example: [pipenv](https://pypi.org/project/pipenv/), [pyenv](https://github.com/pyenv/pyenv), [virtualenv](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjaq9_2mrD-AhV4RLgEHQeWAOYQFnoECBEQAQ&url=https%3A%2F%2Fvirtualenv.pypa.io%2F&usg=AOvVaw3Q9Mzr-1q6xjEJO-UW0ylq) (can be installed via pip, look for official documentation).
3. Install libraries and dependencies for the project to run, open a terminal window in the same location (or a Bash terminal if you are using Windowws) and type the following command:
- $ `pip install -r requirements.txt` (See [Appendix](#Appendix) for detailed information)   
4. Install Docker and Docker Compose.
  Reffer to official links containing installation procedures according to your platform:
    - Windows users: [Docker](https://docs.docker.com/desktop/install/windows-install/) | [Docker Compose]()
    - Linux users: [Docker](https://docs.docker.com/engine/install/ubuntu/) | [Docker Compose]() 
5. Setup WordPress and MySQL Docker Containers.
  Download the ==docker-compose.yml== file to your computer open a terminal window in the same location (or a Bash terminal if you are using Windowws) and type the following command and wait until the wordpress and mysql containers are up:
  $ `docker compose up -d`
  To continue with the WordPress installation, open any browser and navigate to: http://localhost and follow the steps to complete WordPress installation. Write down the username and the password you choosed use it later in the environment variables.
6. Once the installation process finish, the WordPress v.6.2 dashboard will be displayed. In the left side menu click on "plugins" and then click on "Add new" button located at the top of the page or click the following [[link]](http://localhost/wp-admin/plugin-install.php). Search and install ==WordPress REST API Authentication v.2.6.0 [(miniOrange)](https://wordpress.org/plugins/wp-rest-api-authentication/)==.
7. Once the plugin is installed, go to plugins page look for the WordPress REST API Authentication plugin and click on "[settings](http://localhost/wp-admin/admin.php?page=mo_api_authentication_settings)" then click on "Basic Authorization", follow the steps and copy the result in a safe place,  once finished, back to settings and configure "JWT Authentication" copy the result in a safe place.

##### 2.3. Environment Variables Definitions

The following variables are required to set as environment variables

| Variable name | Type | Default value | Description |
| - | - | - | - |
| HOST | String | http://localhost | REST API URL. **Required** |
| END_POINT | String | wp-json/wp/v2 | End point base. **Required**   |
| PORT | Integer | 80 | API port. **Required** |
| AUTHENTICATION_METHOD | String | basic | By default is  "Basic Authorization" for request. Other types of authorization are: Token, API Key, Oath2. **Required**  |
| USER | String | (blank) | Username for basic athorization, must be specified username before running test cases. Blank by default to protect sensitive data. **Required**, to test WordPress you need to provide. |
| PASSWORD | String | (blank) | Password for basic athorization, must be specified username before running test cases. Blank by default to protect sensitive data. **Required** |
| KEY | String | (blank) | Key for API Key athorization, must be specified username before running test cases. Blank by default to protect sensitive data. (Optional)|
| VALUE | String | (blank) | Value for API Key athorization, must be specified username before running test cases. Blank by default to protect sensitive data. (Optional) |
| ADD_TO | String | header | Specifies wheter to add to header or as query param (Optional) |
| TOKEN | String | (blank) | JWT Token generated for bearer token athorization, must be specified username before running test cases. Blank by default to protect sensitive data. (Optional) |
| CLIENT_ID | String | (blank) | Must be provided in order to use Oath2 authorization. (Optional) |
| CLIENT_SECRET | String | (blank) | Must be provided in order to use Oath2 authorization. (Optional) |

___
#### 3. Executing the framework
After the setup, in this section will be explained robot framework.
##### 3.1. Directories Structure
```
/
├── libraries                         (Set of Custom Python libraries)
│   ├── assertions                    (Custom assertions using assertpy lib.)
│   ├── authentication                (Authentication methods)
│   ├── process_data                  (Set of utilitaries)
│   └── requests                      (Set of request methods)
|
└── wp_api                            (Project specific directory)
    ├── keywords                      (Set of robot keyword)       
    |   ├── py_scripts                (Set of Python scripts for robot keywords)
    |   └── ... endpoint keywords     (Directories of keywords for each endpoint)
    ├── resources                     (Resources directory)
    |   ├── config                    (Additional configurations directory)
    |   └── data                      (Data directory)
    |       ├── jsons                 (Resources in json format)
    |       ├── media                 (Contains media files such as images, video...)
    |       └── schemas               (Endpoints json schemas)
    ├── tests                         (Set of test suites or test cases)
    |    └── ... endpoint tests       (Directories of tests for each endpoint)
    └── reports                       (Tests output directory)
```
##### 3.2. Execution examples
Using the integrated terminal execute the following commands:

1. In progress...

```
___
