# @halostatue/fish-chezmoi/conf.d/halostatue_fish_chezmoi.fish:v2.0.0

function _halostatue_fish_chezmoi_setup
    status --is-interactive
    or return

    test $halostatue_fish_chezmoi_completion_mode = never
    and return

    set chezmoi (command --search chezmoi)
    or return

    if test $halostatue_fish_chezmoi_completion_mode = source
        $chezmoi completion fish | source
        return
    end

    set --function local_completions $HOME/.local/share

    set --query XDG_DATA_HOME
    and set local_completions $XDG_DATA_HOME

    set local_completions $local_completions/fish/vendor_completions.d

    if test $chezmoi -nt $local_completions/chezmoi.fish
        rm -f $local_completions/chezmoi.fish
    end

    set --function completion (path filter --type file $fish_complete_path/chezmoi.fish)

    if not set --query completion[1] || test $chezmoi -nt $completion[1]
        set --function refresh 1
    end

    switch $halostatue_fish_chezmoi_completion_mode
        case save
            set --query refresh
            and mkdir -p $local_completions
            and $chezmoi completion fish >$local_completions/chezmoi.fish

        case default '' '*'
            set --query refresh
            and $chezmoi completion fish | source
    end
end

_halostatue_fish_chezmoi_setup
functions --erase _halostatue_fish_chezmoi_setup

function _halostatue_fish_chezmoi_uninstall --on-event halostatue_fish_chezmoi_uninstall
end
