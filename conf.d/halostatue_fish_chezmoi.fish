function _halostatue_fish_chezmoi_setup
    status --is-interactive
    or return

    set chezmoi (command --search chezmoi)
    or return


    if set --query XDG_DATA_HOME
        set --function local_completions $XDG_DATA_HOME
    else
        set --function local_completions $HOME/.local/share
    end

    set local_completions $local_completions/fish/vendor_completions.d

    switch $halostatue_fish_chezmoi_completion_mode
        case save
        case '*'
            $chezmoi completion fish | source
            return
    end

    set --function completion (path filter --type f $fish_complete_path/chezmoi.fish)

    if set --query completion[1]
        if test $chezmoi -nt $completion[1]
            set --function save 1
        end
    else
        set --function save 1
    end

    set --query save
    and mkdir -p $local_completions
    and $chezmoi completion fish >$local_completions/chezmoi.fish
    or $chezmoi completion fish | source
end

_halostatue_fish_chezmoi_setup
functions --erase _halostatue_fish_chezmoi_setup

function _halostatue_fish_chezmoi_uninstall --on-event halostatue_fish_chezmoi_uninstall
end
