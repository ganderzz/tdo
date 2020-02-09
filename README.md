# Tdo

Tdo is a basic CLI tool for keeping notes and todo items. Files are automatically created in a ./notes directory with a date stamp--separating notes by day.

### Installation

Clone this repo, allow the shell script to be executable, and set an alias to the script.

```
git clone https://github.com/ganderzz/tdo.git
chmod +x tdo.sh
alias tdo="$PWD/tdo.sh"

# Restart the terminal and run 'tdo help'
```

### Usage

`tdo` shows the entries for the current day's notes
`tdo add "notes here"` to add an entry to the current notes file
`tdo check 2` to add a 'check mark' for the entry at line 2
`tdo uncheck 2` to remove the 'check mark' from the entry at line 2
`tdo help` to show information on how to use tdo.