# Bash Style Guide

Based on the [Community Bash Style Guide](https://github.com/azet/community_bash_style_guide) and the [Numenta Bash Style Guide](https://github.com/numenta/numenta-apps/wiki/Bash-Style-Guide).

The contents of this document are meant as a guideline. In case of conflicts between this guide and [ShellCheck](https://github.com/koalaman/shellcheck), take ShellCheck.

## Introduction

This is intended to be a bash style and best practice guide. There are a lot of blog posts and articles out there, but they do not always agree on certain issues, and mostly lack hints and best practices to achieve a specific goal (e.g. which userland utilities to use, which built-ins can be used instead and which userland utilities you should avoid at all cost).  It is not that difficult to figure out a common strategy; so here it is.

Here's how you write bash code that somebody else will actually understand, is unit testable and will work in different environments no matter what. please read the mentioned articles, you will not regret it. Furthermore people that will have to work with or maintain your scripts will not hate you in the future.

## Table of Contents
1. [When to use Bash](#when-to-use-bash)
2. [When to avoid Bash](#when-to-avoid-bash)
3. [Before you write or edit any bash](#before-you-write-or-edit-any-bash)
4. [Style conventions](#style-conventions)
5. [Resources](#resources)
6. [Common mistakes and useful tricks](#common-mistakes-and-useful-tricks)
7. [Trivia section](#trivia-section)
8. [Final remarks](#final-remarks)

## When to Use Bash

* Small scripts that set a few environment variables (typically PYTHONPATH, PATH, AWS credentials), perhaps set up a working directory, then call a Python script to do real work. If the python script can also do any necessary clean up after itself, the last line of the bash script should be `exec /path/to/foo.py $@` so that the shell script wrapper inherits the python script's exit code.
* Scripts with very minimal logic and are essentially just "run these half dozen commands in order."
* Cron jobs and init scripts, since they should have their environment explicitly set instead of trusting that they will receive any custom setup.

## When to Avoid Bash

* If you go to edit a script and there's already a TODO saying to rewrite it in Python, rewrite it in Python no matter how trivial the changes you want to make seem.
* If your script is longer than 50-75 lines, you should be using functions. Individual functions should rarely be more than 20-40 lines. If you have more than a half dozen or so functions, it is probably time to move to Python.
* Functions in the script are complex enough to need local variables.
* **You're trying to create associative arrays (Bash's equivalent to dicts in Python)**
* **You need data structures.**
* **It takes more than 15 minutes Googling to figure out how to make Bash do what you want.**

## Before you write or edit any bash

* Read David Pashley's [Writing Robust Shell Scripts](http://www.davidpashley.com/articles/writing-robust-shell-scripts/#id2382181) article.
* Read Google's [Shell Programming Style Guide](https://google-styleguide.googlecode.com/svn/trunk/shell.xml).
* Read [Bash Pitfalls](http://bash.cumulonim.biz/BashPitfalls.html).
* Install [shellcheck](https://github.com/koalaman/shellcheck) on your laptop - Shellcheck is essentially pylint for bash. Always run it before creating a pull request for your bash scripts. There are instructions on [github](https://github.com/koalaman/shellcheck) for creating a binary on your machine so you don't have to use the web form at [http://www.shellcheck.net/](http://www.shellcheck.net/). On OS X, shellcheck can be installed with `brew install shellcheck`.
* Read the [Community Bash Style Guide](https://github.com/azet/community_bash_style_guide).
* Read [Numenta's Bash Style Guide](https://github.com/numenta/numenta-apps/wiki/Bash-Style-Guide).

## Style conventions

This is based on most common practices and guides available. It is also what I've seen others recommend and use and seemed most consistent and/or logical.

* use the `#!/usr/bin/env bash` shebang wherever possible
* memorize and utilize `set -eu -o pipefail` at the very beginning of your code:
  * never write a script without `set -e` at the very very beginning. This instructs bash to terminate in case a command or chain of command finishes with a non-zero exit status. The idea behind this is that a proper programm should never have unhandled error conditions. Use constructs like   `if myprogramm --parameter ; then ... ` for calls that might fail and   require specific error handling. Use a cleanup trap for everything else.
  * use `set -u` in your scripts. This will terminate your scripts in case an uninitialized variable is accessed. This is especially important when developing shell libraries, since library code accessing uninitialized variables will fail in case it's used in another script which sets the `-u` flag. Obviously this flag is relevant to the script's/code's security.
  * use `set -o pipefail` to get an exit status from a pipeline (last non-zero will be returned).
* never use TAB for indentation:
   * consistently use two (2) character indentation.
* **always** put parameters in double-quotes: `util "--argument" "${variable}"`.
* do not put `if .. then`, `while .. do` or `for .. do`, `case .. in` et cetera on a new line. this is more a tradition than actual convention. Most Bash programmers will use that style - for the sake of simplicity, please do this as well:

    ```bash
    if ${event}; then
      ...
    fi

    while ${event}; do
      ...
    done

    for v in ${list[@]}; do
      ...
    done
    ```

* never forget that you **cannot** put a space/blank between a variable name and it's value during an assignment (e.g. `ret = false` will not work)
* always set local function variables `local`
* write clear code
  * **never** obfuscate what the script is trying to do
  * **never** shorten uncessesarily with a lot of commands per LoC chained with a semicolon
* Bash does not have a concept of public and private functions, thus;
  * public functions get generic names, whereas
  * private functions are prepended by two underscores (RedHat convention)
* try to stick to the `pushd`, `popd`, and `dirs` builtins for [directory stack manipulation](https://www.gnu.org/software/bash/manual/html_node/Directory-Stack-Builtins.html#Directory-Stack-Builtins) where sensible
* every line must have a maximum of eighty (80) terminal columns
* like in other dynamic languages, switch/case blocks should be aligned:
    
    ```bash
    case ${contenders}; in
    teller)  x=4 ;;
    ulam)    c=1 ;;
    neumann) v=7 ;;
    esac
    ```

* only `trap` / handle signals you actually do care about
* use the builtin `readonly` when declaring constants and immutable variable
* assign integer variables, arrays, etc. with `typeset`/`declare` ([see also](http://tldp.org/LDP/abs/html/declareref.html))
* always work with return values instead of strings passed from a function or userland utility (where applicable)
* write generic small check functions instead of large init and clean-up code:
    
    ```bash
    # both functions return non-zero on error
    function is_valid_string?() {
      [[ $@ =~ ^[A-Za-z0-9]*$ ]]
    }
    function is_integer?() {
      [[ $@ =~ ^-?[0-9]+$ ]]
    }
   ```

* be as modular and plugable as possible and;
* if a project gets bigger, split it up into smaller files with clear and obvious naming scheme
* clearly document code parts that are not easily understood (long chains of piped commands for example)
* try to stick to [restricted mode](http://www.tldp.org/LDP/abs/html/restricted-sh.html) where sensible and possible to use: `set -r` (not supported in old versions of Bash). **Use with caution.** While this flag is *very useful for security* sensitive environments, scripts have to be written with the flag in mind. Adding restricted mode to an existing script will most likely break it.
* Thus, scripts should somewhat reflect the following general layout:

   ```
   #!/usr/bin/env bash
   #
   # AUTHORS, LICENSE and DOCUMENTATION
   #
   set -eu -o pipefail

   Readonly Variables
   Global Variables

   Import ("source scriptname") of external source code 

   Functions
    `-. function local variables
    `-. clearly describe interfaces: return either a code or string

   Main
    `-. option parsing
    `-. log file and syslog handling
    `-. temp. file and named pipe handling
    `-. signal traps

    --------------------------------------------------------------------------
    To keep in mind:
    - quoting of all variables passed when executing sub-shells or cli tools
    - testing of functions, conditionals and flow (see style guide)
    - makes restricted mode ("set -r") for security sense here?
   ```

* Silence is golden - like in any UNIX programm, avoid cluttering the terminal with useless output. [Read this](http://www.linfo.org/rule_of_silence.html).

## Resources

### General resources
* https://sparrowhub.org/

### General documentation, style guides, tutorials and articles:
* https://www.gnu.org/software/bash/manual/bashref.html
* http://wiki.bash-hackers.org/doku.php
* http://mywiki.wooledge.org/BashFAQ
* https://google-styleguide.googlecode.com/svn/trunk/shell.xml
* http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
* http://mywiki.wooledge.org/BashWeaknesses
* https://github.com/docopt/docopts (see: http://docopt.org)
* http://isquared.nl/blog/2012/11/19/bash-lambda-expressions
* http://www.davidpashley.com/articles/writing-robust-shell-scripts/

### Linting and static analysis:
* http://www.shellcheck.net (https://github.com/koalaman/shellcheck)

#### Portability
* https://github.com/duggan/shlint
* http://manpages.ubuntu.com/manpages/natty/man1/checkbashisms.1.html

### Test driven development and Unit testing:
* https://github.com/sstephenson/bats
* https://github.com/mlafeldt/sharness
* https://bitheap.org/cram/
* https://github.com/rylnd/shpec
* https://github.com/roman-neuhauser/rnt
* https://code.google.com/p/shunit2/
* https://github.com/thinkerbot/ts

### Profiling:
* https://github.com/sstephenson/bashprof

### Debugging:
* `set -evx` and `bash -evx script.sh`
* http://bashdb.sourceforge.net/

### Presentations on this Document:
* 17/12/14: *Beautiful Bash: A community driven effort* by Aaron Zauner @ Vienna System Architects & DevOps/Security Meetup Vienna
   - http://www.slideshare.net/a_z_e_t/inpresentation
   - https://github.com/azet/talks/tree/master/2014/DevOpsSec-Meetup_Vienna/beautiful_bash-17_12_2014


## Common mistakes and useful tricks

### Never use backticks
Wrong:

```bash
`call_command_in_subshell`
```

Correct:

```bash
$(call_command_in_subshell)
```

Backticks are POSIX compliant but not 100% portable (doesn't work on Solaris 10 /bin/sh for example). Backticks also cannot be nested without being escaped (which looks just insane):

```bash
$(call_command_in_subshell $(different_command $(yetanother_as_parameter)))
```

### Multiline pipe

Instead of:

```bash
ls ${long_list_of_parameters} | grep ${foo} | grep -v grep | pgrep | wc -l | sort | uniq
```

Do:

```bash
ls ${long_list_of_parameters} \
    | grep ${foo}             \
    | grep -v grep            \
    | pgrep                   \
    | wc -l                   \
    | sort                    \
    | uniq
```

..far more readable, isn't it?

### Overusing grep and `grep -v`

Please never do that. There is almost certainly a better way to express this.

For example:

```bash
ps ax | grep ${processname} | grep -v grep
```

Versus using appropriate userland utilities:

```bash
pgrep ${processname}
```

### Using `awk(1)` to print an element

StackExchange is full of this behavoir:

```bash
${listofthings} | awk '{ print $3 }' # get the third item
```

You may use bashisms instead:

```bash
listofthings=(${listofthings}) # convert to array
${listofthings[3]}
```

### Use built in variable expansion instead of sed/awk

Instead of this:

```bash
VAR=FOO
printf ${VAR} | awk '{print tolower($0)}' # foo
```

Use built in expansion like this:

```bash
# ${VAR^} # upper single
# ${VAR^^} # upper all
# ${VAR,} # lower single
# ${VAR,,} # lower all
# ${VAR~} # swap case single
# ${VAR~~} # swap case all

VAR=BAR
printf ${VAR,,} # bar
```

Same thing with string replacement:

```bash
# ${VAR/PATTERN/STRING} # single replacement
# ${VAR//PATTERN/STRING} # all match replacement
# Use ${VAR#PATTERN} ${VAR%PATTERN} ${VAR/PATTERN} for string removal

VAR=foofoobar
${VAR/foo/bar} # barfoobar
${VAR//foo/bar} # barbarbar
${VAR//foo} # bar
```

More examples and uses here: http://wiki.bash-hackers.org/syntax/pe

### Do not use `seq` for ranges

use `{x..y}` instead!

e.g.:

```bash
for k in {1..100}; do
    $(do_awesome_stuff_with_input ${k})
done
```

The built-in range expression can do much more, see: http://wiki.bash-hackers.org/syntax/expansion/brace#ranges

### Timeouts

The GNU coreutils program `timeout(1)` should be used to timeout processes: https://www.gnu.org/software/coreutils/manual/html_node/timeout-invocation.html

caveat: `timeout(1)` might not be available on BSD, Mac OS X and UNIX systems.

### Please use `printf` instead of `echo`

The bash builtin `printf` should be preferred to `echo` where possible. it does work like `printf` in C or any other high-level language, for reference see: http://wiki.bash-hackers.org/commands/builtin/printf

### Bash arithmetic instead of `expr`

Bash offers the whole nine yards of arithmetic expressions directly as built-in bashisms.   

 **DO NOT USE `expr`**

for reference see:
* http://wiki.bash-hackers.org/syntax/arith_expr
* http://www.softpanorama.org/Scripting/Shellorama/arithmetic_expressions.shtml

### Never use `bc(1)` for modulo operations

It will come to hurt you, trust me.

`bc(1)` does not properly handle modulo operations most of the time: https://superuser.com/questions/31445/gnu-bc-modulo-with-scale-other-than-0

### FIFO/named pipes

If you do not know what a named pipe is, please read this: http://wiki.bash-hackers.org/howto/redirection_tutorial

### disown

`disown` is a bash built-in that can be used to remove a job from the job table of a bash script. for example, if you spawn a lot of sub processes, you can remove one or multiple of these processes with `disown` and the script will not care about it anymore.

See: https://www.gnu.org/software/bash/manual/bashref.html#index-disown

### Basic parallelism

Usually people use `&` to send a process to the background and `wait` to wait for the process to finish. people then often use named pipes, files and global variables to communicate between the parent and sub programs.

### `xargs`

For file-based in-node parallelization, `xargs` is the easiest way to parallelize the processing of list elements.

```bash
# simple example: replace all occurences of "foo" with "bar" in ".txt" files
#   will process each file individually and up 16 processes in parallel
find . -name "*.txt" | xargs -n1 -P16 -I{} sed -i 's/foo/bar/g' {}

# complex example: HDF5 repack for transparent compression of files
#   find all ".h5" files in "${dirName}" and use up to 64 processes in parallel to independently compress them
find ${dirName} -name "*.h5" | xargs -n1 -P64 -I{} \
    sh -c 'echo "compress $1 ..." &&               \
    h5repack -i $1 -o $1.gz -f GZIP=1 && mv $1.gz $1' _ {}
```

### `coproc` and GNU parallel

`coproc` can be used instead to have parallel jobs that can easily communicate with each other: http://wiki.bash-hackers.org/syntax/keywords/coproc

Another excellent way to parallelize things in bash, especially for easy distribution over multiple hosts via SSH, is by using GNU parallel: https://www.gnu.org/software/parallel/parallel_tutorial.html 

### Trapping, exception handling and failing gracefully

`trap` is used for signal handling in bash, a generic error handling function may be used like this:

```bash
readonly banner="my first bash project >>"
function fail() {
        # generic fail function for bash scripts
        # arg: 1 - custom error message
        # arg: 2 - file
        # arg: 3 - line number
        # arg: 4 - exit status
        echo "${banner} ERROR: ${1}." >&2
        [[ ${2+defined} && ${3+defined} && ${4+defined} ]] && \
        echo "${banner} file: ${2}, line number: ${3}, exit code: ${4}. exiting!"

        # generic clean up code goes here (tempfiles, forked processes,..)

        exit 1
} ; trap 'fail "caught signal"' HUP KILL QUIT
```

```bash
do_stuff ${withinput} || fail "did not do stuff correctly" ${FILENAME} ${LINENO} $?
```

Trapping on `EXIT` instead of a specific signal is particularly useful for cleanup handlers since this executes the handler regardless of the reason for the script's termination. This also includes reaching the end of your script and aborts due to `set -e`.

### You don't need cat

Sometimes `cat` is not available, but with bash you can read files anyhow.

```bash
batterystatus=$(< /sys/class/power_supply/BAT0/status)
printf "%s\n" ${batterystatus}
```

Also avoid `cat` where reading a file can be achieved through passing the file name as a parameter. Never do `cat ${FILENAME} | grep -v ...`, instead use `grep -v ... ${FILENAME}`.

### locking (file based)

`flock(1)` is an userland utility for managing file based locking from within shell scripts. It supports exclusive and shared locks.

### Mutex (Mutual Exclusion)
mutex, although rather complex, is possible, too:
http://wiki.bash-hackers.org/howto/mutex

### Use the `getopt` builtin for command line parameters

```bash
printf "This script is: %s\n" ${0##/*/}

[[ "${#}" == 0 ]] && {
  # no arguments
  printf "No options given: %s\n" ${OPTIND}
  exit 1
}

log=""     # numeric, log
table=""   # single fill
stores=( ) # array

# : after a letter is for string into parameter
while getopts ":dhls:t:" opt; do
  case "${opt}" in
  d) set -x ;;
  h) printf "Help page\n" ; exit ;;
  s) stores[${#stores[*]}]="${OPTARG}" ;;
  t)
     if [ -z "${table}" ]; then
       table="${OPTARG}"
     fi
  ;;
  l) (( log++ )) ;;
  *)
     printf "\n  Option does not exist: %s\nOne option\n" ${OPTARG}
     exit 1
  ;;
  esac
done

# set debug if log is more than two
[[ "${log}" >= 2 ]] && {
  set -x ; log=""
}
[[ "${log}" == "" ]] && unset log
```

## Trivia section

This section outlines stuff that can be done in Bash but is not necessarily a good idea to do in Bash - might still come in handy for some corner cases or for curious Bash hackers, I've chosen to include
that information.

### Anonymous Functions (Lambdas)

Yup, it's possible. But you'll probably never need them, in case you
really do, here's how:

```bash
function lambda() {
  _f=${1} ; shift
  function _l {
    eval ${_f};
  }
  _l ${*} ; unset _l
}
```

### Using sockets with bash

Although i do not really recommend it, it's possible to do simple (or even complex) socket operations in bash using the `/dev/tcp` and `/dev/udp` pseudo-devices: http://wiki.bash-hackers.org/syntax/redirection

Example:

```bash
function recv() {
   local proto=${1} # tcp or udp
   local host=${2}  # hostname
   local port=${3}  # port number
   exec 3<>/dev/${proto}/${host}/${port}
   cat <&3
}

function send() {
   local msg=${1}
   echo -e ${msg} >&3
}

[...]
```

you may consider using `nc` (netcat) or even the far more advanced program `socat`: 
* http://www.dest-unreach.org/socat/doc/socat.html
* http://stuff.mit.edu/afs/sipb/machine/penguin-lust/src/socat-1.7.1.2/EXAMPLES

### Foreign Function Interface

Tavis Ormandy wrote a FFI for Bash. You can directly access function from shared libraries in bash using `ctypes.sh`. It's a nice hack, but use is somewhat discouraged. Use userland utilities.

[ctypes.sh](https://github.com/taviso/ctypes.sh)

## Final remarks

Every contribution is valuable to this effort. I'll do my best to incorporate all positive and negative feedback, criticism  and am, of course, looking forward to people opening issues and pull requests
for this project.

Please spread the word!

## Licensing

The full legal code is contained in the `LICENSE` file distributed with this repository applies to the contents of this repository, except for this document as it was pieced together from other sources. Please see the license contents of those documents.

The Community Bash Style Guide is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/). The full legal code is contained in the `LICENSE` file distributed with that repository.
