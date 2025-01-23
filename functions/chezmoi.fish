function chezmoi --wraps chezmoi
    set --function flags
    set --function args
    set --function cmd

    while set --query argv[1]
        switch $argv[1]
            case --cache --color --config -c --config-format -D --destination
                set --append flags $argv[1] $argv[2]
                set --erase argv[2]
            case --mode -o --output --persistent-state --progress
                set --append flags $argv[1] $argv[2]
                set --erase argv[2]
            case -R --refresh-externals -S --source
                set --append flags $argv[1] $argv[2]
                set --erase argv[2]
            case --use-builtin-age --use-builtin-git -W --working-tree
                set --append flags $argv[1] $argv[2]
                set --erase argv[2]
            case --debug -n --dry-run --force -h --help --interactive
                set --append flags $argv[1]
            case -k --keep-going --no-pager --no-tty --source-path
                set --append flags $argv[1]
            case --use-builtin-diff -v --verbose --version
                set --append flags $argv[1]
            case add age apply archive cat cat-config cd chattr
                if test -z "$cmd"
                    set cmd $argv[1]
                else
                    set --append args $argv[1]
                end
            case completion data decrypt destroy diff doctor dump dump-config
                if test -z "$cmd"
                    set cmd $argv[1]
                else
                    set --append args $argv[1]
                end
            case edit edit-config edit-config-template encrypt execute-template
                if test -z "$cmd"
                    set cmd $argv[1]
                else
                    set --append args $argv[1]
                end
            case forget generate git help ignored import init license
                if test -z "$cmd"
                    set cmd $argv[1]
                else
                    set --append args $argv[1]
                end
            case managed merge merge-all purge re-add secret source-path state
                if test -z "$cmd"
                    set cmd $argv[1]
                else
                    set --append args $argv[1]
                end
            case status target-path unmanaged update upgrade verify
                if test -z "$cmd"
                    set cmd $argv[1]
                else
                    set --append args $argv[1]
                end
            case '*'
                set --append args $argv[1]
        end

        set --erase argv[1]
    end

    switch $cmd
        case cd
            set --local target (command chezmoi source-path $flags $args)
            or return

            if test -f $target
                cd (path dirname $target)
            else
                cd $target
            end
        case '*'
            command chezmoi $flags $args
    end
end
