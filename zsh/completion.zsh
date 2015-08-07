# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Nosecomplete plugin with run_tests
autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

_nosetests()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=(`nosecomplete -s python ${cur} 2>/dev/null`)
}
complete -o nospace -F _nosetests nosetests

# Pstat completion
source $POLICY_STAT_DIR/scripts/fix_site_status_autocomplete.sh
complete -F _fix_site_status fix_site_status.sh

_nosetests_pstat()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=(`cd $POLICY_STAT_DIR/pstat && nosecomplete -s python ${cur} 2>/dev/null`)
}
complete -o nospace -F _nosetests_pstat vtest
