# @halostatue/fish-chezmoi/conf.d/halostatue_fish_chezmoi.fish:v1.1.0

function _halostatue_fish_chezmoi_setup
    status --is-interactive
    or return

    switch $halostatue_fish_chezmoi_completion_mode
        case never
            return
    end

    set chezmoi (command --search chezmoi)
    or return

    if set --query XDG_DATA_HOME
        set --function local_completions $XDG_DATA_HOME
    else
        set --function local_completions $HOME/.local/share
    end

    set local_completions $local_completions/fish/vendor_completions.d

    if test $chezmoi -nt $local_completions/chezmoi.fish
        rm -f $local_completions/chezmoi.fish
    end

    set --function completion (
      path filter --type file $fish_complete_path/chezmoi.fish
    )[1]

    if not set --query completion[1] || test $chezmoi -nt $completion
        set --function refresh 1
    end

    switch $halostatue_fish_chezmoi_completion_mode
        case source
            $chezmoi completion fish | source
        case save
            if set --query refresh
                mkdir -p $local_completions
                and $chezmoi completion fish >$local_completions/chezmoi.fish
            end

        case default '' '*'
            if set --query refresh
                $chezmoi completion fish | source
            end
    end
end

_halostatue_fish_chezmoi_setup
functions --erase _halostatue_fish_chezmoi_setup

function _halostatue_fish_chezmoi_uninstall --on-event halostatue_fish_chezmoi_uninstall
end
