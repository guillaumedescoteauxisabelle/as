# Usage:
#   docker_alias_completion_wrapper <completion function> <alias/function name>
#
# Example:
#   dock-ip() { docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@ ;}
#   docker_alias_completion_wrapper __docker_complete_containers_running dock-ip
function docker_alias_completion_wrapper {
  local completion_function="$1"
  local alias_name="$2"

local func=$(cat <<EOT
    # Generate a new completion function name
    function _$alias_name() {
        # Start off like _docker()
        local previous_extglob_setting=\$(shopt -p extglob)
        shopt -s extglob

        # Populate \$cur, \$prev, \$words, \$cword
        _get_comp_words_by_ref -n : cur prev words cword;

        # Declare and execute
        declare -F $completion_function >/dev/null && $completion_function

        eval "\$previous_extglob_setting"
        return 0
    }
EOT
  )
  eval "$func"

  # Register the alias completion function
  complete -F _$alias_name $alias_name
}
export -f docker_alias_completion_wrapper
