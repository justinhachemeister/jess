# Contributing

Thank you for your interest in contributing to this project.

The following text is a set of guidelines for contributing to the project. These are just guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue, assessing changes, and helping you finalize your pull requests.

## Table of Contents

[What Should I Know Before I Get Started?](#what-should-i-know-before-i-get-started)
  * [Code of Conduct](#code-of-conduct)
  * [Project Purpose](#project-purpose)
  * [Documentation](#documentation)

[How Do I Get Started?](#how-do-i-get-started?)
  * [Prerequisites](#prerequisites)
  * [Get the Code](#get-the-code)
  * [Building the Project](#building-the-project)
  * [Running the Tests](#running-the-tests)

[How Can I Contribute?](#how-can-i-contribute)
  * [Reporting Security Vulnerabilities](#reporting-security-vulnerabilities)
  * [Reporting Bugs](#reporting-bugs)
    * [Before Submitting a Bug Report](#before-submitting-a-bug-report)
    * [How Do I Submit A (Good) Bug Report?](#how-do-i-submit-a-good-bug-report)
  * [Suggesting Enhancements](#suggesting-enhancements)
    * [Before Submitting an Enhancement Request](#before-submitting-an-enhancement-request)
    * [How Do I Submit A (Good) Enhancement Request?](#how-do-i-submit-a-good-enhancement-request)
  * [Your First Code Contribution](#your-first-code-contribution)
  * [Pull Requests](#pull-requests)

[Style Guides](#style-guides)
  * [Git Commit Messages](#git-commit-messages)
  * [BASH Style Guide](#bash-style-guide)
  * [Unit Test Style Guide](#unit-test-style-guide)
  * [Documentation Style Guide](#documentation-style-guide)

[Additional Notes](#additional-notes)
  * [Issue and Pull Request Labels](#issue-and-pull-request-labels)
    * [Type of Issue and Issue State](#type-of-issue-and-issue-state)
    * [Topic Categories](#topic-categories)
    * [Pull Request Labels](#pull-request-labels)

## What Should I Know Before I Get Started?

### Code of Conduct

This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [Justin Hachemeister](mailto:f204631e@opayq.com).

### Project Purpose

This project aims to...

### Documentation

If you have any questions, please check to see if the answer can be found in the wikis:

* [BitBucket](https://bitbucket.org/justinhachemeister/jess/wiki/)
* [GitHub](https://github.com/justinhachemeister/jess/wiki)
* [GitLab](https://gitlab.com/justinhachemeister/jess/wikis/)

If it is not documented in any of these places, please reach out via [email](mailto:f204631e@opayq.com). Please do not use the issue trackers for support questions.

## How Do I Get Started

### PreRequisites

This section guides you through the items that are required to set up the project from source to be able to build, run, and test the project.

#### log4sh

The project utilizes [log4sh](https://sites.google.com/a/forestent.com/projects/log4sh) for any and all logging purposes.

#### shunit2

The project's unit tests utilize the [shunit2](https://github.com/kward/shunit2) unit-testing framework.

#### ShellCheck

The project maintainer(s) highly recommend the use of [ShellCheck](https://github.com/koalaman/shellcheck) to ensure code quality.

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

### Running the Tests

## How Can I Contribute

This section guides you through the guidelines set in place in order to contribute to the project.

### Reporting Security Vulnerabilities

You must never report security related issues, vulnerabilities or bugs including sensitive information to the bug tracker, or elsewhere in public. Send an email disclosing the vulnerability to [Justin Hachemeister](mailto:f204631e@opayq.com) instead.

In order to determine whether you are dealing with a security issue, ask yourself these two questions:
* Can I access something that's not mine, or something I shouldn't have access to?
* Can I disable something for other people?

> If the answer to either of those two questions are "yes", then you're probably dealing with a security issue. Note that even if you answer "no" to both questions, you may still be dealing with a security issue, so if you're unsure, just email [Justin Hachemeister](mailto:f204631e@opayq.com).

The lead maintainer will acknowledge your email within 72 hours, and will send a more detailed response within 48 hours indicating the next steps in handling your report. After the initial reply to your report, the security team will endeavor to keep you informed of the progress towards a fix and full announcement, and may ask for additional information or guidance.

### Reporting Bugs

This section guides you through submitting a bug report. Following these guidelines helps maintainers and the community understand your report, reproduce the behavior, and find related reports.

Before submitting bug reports, please check [this list](#before-submitting-a-bug-report) as you may find out that you do not need to create one. When you are submitting a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). Fill out the [required template](ISSUE_TEMPLATE.md), as the information it asks for will help resolve issues faster.

#### Before Submitting a Bug Report

* **Attempt to debug**. You might be able to find the cause of the problem and fix things yourself. Most importantly, check if you can reproduce the problem in the latest version.
* **Check the Wiki and Documentation** to see if the issue already has a resolution.
  * [BitBucket](https://bitbucket.org/justinhachemeister/jess/wiki/)
  * [GitHub](https://github.com/justinhachemeister/jess/wiki)
  * [GitLab](https://gitlab.com/justinhachemeister/jess/wikis/)
* **Perform a cursory search through the issue trackers** to see if the problem has already been reported. If it has, add a comment to the existing issue instead of opening a new one.
  * [BitBucket](https://bitbucket.org/justinhachemeister/jess/issues?status=open)
  * [GitHub](https://github.com/justinhachemeister/jess/issues?q=is%3Aopen)
  * [GitLab](https://gitlab.com/justinhachemeister/jess/issues)

#### How Do I Submit a (Good) Bug Report?

Bugs are tracked on multiple issue trackers to cater to the needs of the users using those systems.

* [BitBucket](https://bitbucket.org/justinhachemeister/jess/issues?status=open)
* [GitHub](https://github.com/justinhachemeister/jess/issues?q=is%3Aopen)
* [GitLab](https://gitlab.com/justinhachemeister/jess/issues)

This reduces the need for a user to have accounts on each of the Issue Tracker systems. After you have determined that your bug does not yet exist, create an issue on the issue tracker of choice and provide the following information by filling in the template.

Explain the problem and try to include as many details as possible to help maintainers reproduce, isolate, and resolve the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. You can use [this tool](http://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below. 

Provide more context by answering these questions:

* **Did the problem start happening recently** (e.g. after updating to a new version) or was this always a problem?
* If the problem started happening recently, **can you reproduce the problem in an older version?** What's the most recent version in which the problem doesn't happen?
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.
 
Include details about your configuration and environment:

* **Which version are you using?**
* **What's the name and version of the OS you are using**?
* **Are you running in a virtual machine?** If so, which VM software are you using and which operating system and versions are used for the host and the guest?
* **Which keyboard layout are you using?** Are you using a US layout or some other layout?

Once an issue has been identified by the team as needing to be fixed next, it will be added to the team's [YouTrack Project](https://justinhachemeister.myjetbrains.com/youtrack/issues/JESS). The team can then work it through the system to completion.

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion and find related suggestions.

Before submitting enhancement suggestions, please check [this list](#before-submitting-an-enhancement-request) as you may find out that you do not need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-request). Fill in [the template](ISSUE_TEMPLATE.md), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting an Enhancement Request

* **Attempt to debug**. You might discover that the enhancement is already available. Most importantly, check if you are using the latest version and if you can get the desired behavior by upgrading.
* **Check if there is already a library which provides that enhancement.**
* **Determine [which repository the enhancement should be requested in](#project-purpose).**
* **Perform a cursory search through the issue trackers** to see if the enhancement has already been reported. If it has, add a comment to the existing issue instead of opening a new one.
  * [BitBucket](https://bitbucket.org/justinhachemeister/jess/issues?status=open)
  * [GitHub](https://github.com/justinhachemeister/jess/issues?q=is%3Aopen)
  * [GitLab](https://gitlab.com/justinhachemeister/jess/issues)

#### How Do I Submit a (Good) Enhancement Request?

Enhancement suggestions are tracked on multiple issue trackers to cater to the needs of the users using those systems.

* [BitBucket](https://bitbucket.org/justinhachemeister/jess/issues?status=open)
* [GitHub](https://github.com/justinhachemeister/jess/issues?q=is%3Aopen)
* [GitLab](https://gitlab.com/justinhachemeister/jess/issues)

This reduces the need for a user to have accounts on each of the Issue Tracker systems. After you have determined that your enhancement request does not yet exist, create an issue on the issue tracker of choice and provide the following information by filling in the template.

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of the project which the suggestion is related to. You can use [this tool](http://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
* **Explain why this enhancement would be useful to most users.**
* **List some other text editors or applications where this enhancement exists.**
* **Specify which version you are using.**
* **Specify the name and version of the OS you're using.**

### Your First Code Contribution

### Pull Requests

Working on your first Pull Request? You can learn how from this *free* series, [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github). Other potential resources you may be interested in are [MakeAPullRequest](http://makeapullrequest.com] and [FirstTimersOnly](http://www.firsttimersonly.com). 

At this point, you are ready to make your changes. Feel free to ask for help; everyone begins somewhere.

If a maintainer asks you to "rebase" your pull request, they are saying that a lot of code has changed, and that you need to update your branch so that it is easier to merge.

## Style Guides

### Git Commit Messages

This project follows the [Seven Rules of a Great Git Commit Message](https://chris.beams.io/posts/git-commit/#seven-rules)
1. Separate subject from body with a blank line.
2. Limit the subject line to 50 characters.
3. Capitalize the subject line.
4. Do not end the subject line with a period.
5. Use the imperative mood in the subject line.
6. Wrap the body at 72 characters.
7. Use the body to explain what and why vs. how.

### BASH Style Guide

### Unit Test Style Guide

### Documentation Style Guide

## Additional Notes

### Issue and Pull Request Labels

#### Type of Issue and Issue State

#### Topic Categories

#### Pull Request Labels

This section lists the labels we use to help us track and manage issues and pull requests.
