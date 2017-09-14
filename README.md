# Justin's Email Server Setup (JESS)

A scripting project to set up an email server on an Arch Linux distribution. Inspired by [iRedMail](https://bitbucket.org/zhb/iredmail).

## Purpose

The purpose of this project is to configure and install an email server on an Arch Linux distribution. The project idea is inspired by [iRedMail](https://bitbucket.org/zhb/iredmail), since iRedMail does not support Archi Linux distributions.

## General Features

- [] Allow user configuration.
- [] Check user permissions.
- [] Check the environment.
- [] Validate user configuration.
- [] Check package integrity.
- [] Download missing packages.
- [] Install/Configure postfix.

## Supported Packages

- [] postfix
- [] dovecot
- [] roundcubemail

### Get the Code

```sh
git clone https://bitbucket.org/JustinHachemeister/jess.git jess.git
```

or

```sh
git clone https://github.com/JustinHachemeister/jess.git jess.git
```

or

```sh
git clone https://gitlab.com/JustinHachemeister/jess.git jess.git
```

### Building the Project

This section guides you through compiling the project from source. Following these guidelines will help you get a working environment on your local machine for development and testing purposes.

#### Command-Line

JESS is a command-line BASH shell project, so the command line is the only method to build the project. Until a Makefile is created, only the manual 'build' process is available.

##### Manual

From the JESS root directory created from [cloning the code](#get-the-code), copy everything in the source directory except the tests directory.

### Running the Tests

This section guides you through running the unit tests included in the source. Following these guidelines will help you get the unit tests running to verify the project works as designed. 

#### Command-Line

JESS is a command-line BASH shell project, so the command line is the only option to test the project.

##### Manual

From the JESS root directory, navigate to the tests directory in the source folder from the command-line. Once there, run any of the files in the test directory. More information about how the unit testing framework can be used can be found on [here](https://github.com/kward/shunit2).

### Configuration

Configuration for JESS is still being finalized.

## Documentation

Documentation and the nitty-gritty details can be found in the wiki's.

* [BitBucket](https://bitbucket.org/justinhachemeister/jess/wiki/)
* [GitHub](https://github.com/justinhachemeister/jess/wiki)
* [GitLab](https://gitlab.com/justinhachemeister/jess/wikis/)

If you have questions or are looking for support, reach out to the maintainers via [email](mailto:f204631e@opayq.com) or other social outlets.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, getting started, and the processes for submitting security issues, bugs, enhancement requests, and/or pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository.

## License

JESS is Copyright &copy; 2017 [Justin Hachemeister](https://jhache.me) and other contributors under the [MIT License](LICENSE).

### Code of Conduct

This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [Justin Hachemeister](mailto:f204631e@opayq.com).
