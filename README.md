# local-lab
Streamline your Jupyter Notebook development using Local Jupyter-Lab on your computer.


## Brief Description

`local-lab` is a repository designed to help you set up a local Jupyter Lab environment for your Data Science project. This repository provides a set of scripts to automate the process of creating a Python virtual environment, installing necessary dependencies, and starting a Jupyter Lab instance on your computer. The main goal of this project is to make it easier to work with Jupyter Notebooks in a local environment by streamlining the setup process and ensuring a consistent working environment across different projects or systems.


## Table of Contents
- [local-lab]
- [Brief Description](#brief-description)
- [Requirements](#requirements)
- [Usage Instructions](#usage-instructions)
- [Feedback and Issues](#feedback-and-issues)
- [Contributing](#contributing)
- [Reference Links](#reference-links)
- [Author(s)](#authors)
- [Changelog](#changelog)
- [License](#license)


## Requirements

To use this project, you will need:

- Python: Make sure you have a version of Python version 3 installed on your system. You can check your Python version by opening a command prompt and typing `python --version`. This project has been tested with Python 3.9 and above but may also work with other versions.

- pip: pip is a package manager for Python. It generally comes installed with Python. However, if it is still unavailable after installing Python, you may need to install it separately. `pip` is used to install the necessary dependencies for this project.

- Operating System: The scripts currently provided are `.bat` files, compatible with Windows operating systems. Compatibility with other operating systems may be added by adding equivalent `.sh` scripts in the future.

- Git (optional): If you choose to add this repository as a submodule to your project, you will need [git installed][Git] on your system and use `git` for your project in the first place to be able to add the `local-lab` as a submodule. You could use the `git submodule add https://github.com/sentinel-1/local-lab.git` command in your project directory to add the submodule. Remember, this is optional, and you can directly download the `local-lab` instead.


## Usage Instructions

This repository is designed to streamline the setup and usage of a local Jupyter Lab environment. Here are the steps to use it:
1. **Ensure Python is Installed**: This script requires [Python] and [pip] to be installed on your system. If you don't have Python installed, you can download it from the [official Python website][Python]. As for pip, it is often getting automatically installed in the process of installing Python, and if not, then install it as well.
2. **Place the local-lab Files**: The files in this repository should be placed in a subdirectory of your project's root directory. You can do this by either downloading the files or by adding this repository as a submodule if you use `git`. This will create a "local-lab" folder inside your project's root directory.
3. **Copy the Batch File**: Copy the `start_jupyter_lab.bat` file from the `local-lab/example` directory into your project's root directory. 
4. **Edit the Batch File**: The `start_jupyter_lab.bat` file, now in your project's root directory, contains several variables that may need to be adjusted:
   - `WORKING_DIR`: This variable defaults to "/working". It should be set to the name of the directory where you do your work, i.e., the directory that contains your Jupyter Notebook files (.ipynb files). The default value assumes a directory named "working" inside the root directory of your project.
   - `VENV_DIR`: This variable defaults to ".venv", which will create a Python virtual environment in the ".venv" directory inside your project's root directory. This directory will be automatically created if it does not exist already. Typically you would not need to change it. Still, you can change this value if you want the virtual environment to be created somewhere else.
   - `REQUIREMENTS_FILE`: This variable defaults to "requirements-dev.txt". This is the file from which Python packages will be installed into the virtual environment. If your project has a different requirements file, you should change this variable to match that filename.
5. **Run the Batch File**: Once the above steps are complete, you can run the `start_jupyter_lab.bat` file from your project's root directory. This will set up and start a local Jupyter Lab instance.

Steps 1 to 4 constitute the initial setup process, which is required only once per project. On the other hand, Step 5 represents the actual usage. After completing the initial setup for a particular project, each time you want to launch the local Jupyter-Lab for that project, you must execute only Step 5.

Please note that these instructions assume you are using a Windows operating system, as `.bat` files may not run on other operating systems. Support for other operating systems might be added later; stay tuned.

After completing all the steps, your project's directory structure will look like this:

```plaintext
Project Root Directory
│   start_jupyter_lab.bat
│   requirements-dev.txt (or your specific requirements file)
│
├───.venv (Python virtual environment directory)
│
├───working (or your specific working directory)
│   │   notebook1.ipynb
│   │   notebook2.ipynb
│   │   ... (your other .ipynb Jupyter Notebook files)
│
└───local-lab (a folder or submodule that contains files of the "local-lab")
    │   start.bat
    │
    ├───example
    │   │   start_jupyter_lab.bat
    │
    ├───scripts
    │   │   _virtualenv.bat
    │   │   ... (other helper script files)
    │
    └───conf
        │   _additional_jupyter_lab_config.py
        │   ... (other configuration files)
```

Please note that some directories and files (like the contents of the `.venv` directory and the `conf` directory in `local-lab`) are not displayed in this structure for simplicity.

The `start_jupyter_lab.bat` file is at the root of your project, the Python virtual environment (`.venv`) is also created at the root, and your working directory (in this case, `working`) is where your Jupyter notebooks (.ipynb files) reside. The `local-lab` directory in your project's root folder contains the scripts from this repository that set up and start Jupyter Lab as needed.

This structure is subject to change based on your specific project setup and your preferences, particularly the `WORKING_DIR` and `VENV_DIR` variables and the location of your requirements file.


## Feedback and Issues

This open-source project welcomes feedback and issue reports. Please check the [Issues] to see if your issue is already reported. If not, feel free to open a new one with as much detail as possible for a particular issue, feedback, or suggestions regarding the `local-lab` you might have.


## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make to this project are greatly appreciated.

If you have a suggestion or want to contribute, please follow these steps (while the overall approach is highlighted here, some intermediate steps are omitted for simplicity):

1. **Fork** the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some fmazing feature or fix'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a **pull request**.

Please remember that keeping this project relatively simple and minimalistic overall is a priority. Any pull requests should consider this aspect.


## Reference Links

1. [Python]: The programming language used in this project.
2. [pip]: The package installer for Python.
3. [Git]: A distributed version control system for managing a project's source code.

<!-- Reference Links: -->
[local-lab]:https://github.com/sentinel-1/local-lab#local-lab
[Python]:https://www.python.org/downloads/
[pip]:https://pip.pypa.io/en/stable/installation/
[Git]:https://git-scm.com/downloads
[Issues]:https://github.com/sentinel-1/local-lab/issues


## Author(s)

[Sentinel-1]: Creator and maintainer of the project.

<!-- Author Profile Links: -->
[Sentinel-1]:https://github.com/sentinel-1


## Changelog

| Date | Version | Changed by | Change Description |
|--------|:-------:|:-----------|:-----------------|
| 2023-06-28 | v1.0 | [Sentinel-1] | First Release |
| 2023-06-29 | v1.1 | [Sentinel-1] | Added README.md content |


## License

This project is licensed under the [Apache License 2.0](./LICENSE).
