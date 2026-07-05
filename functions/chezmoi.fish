# @halostatue/fish-chezmoi/functions/chezmoi.fish:v2.0.0

function chezmoi --wraps chezmoi
    if set --function pos (contains -i -- cd $argv)
        if test "$halostatue_fish_chezmoi_cd" = subshell
            command chezmoi $argv
        else
            chezmoi::cd-sh cd $pos $argv
        end
    else if set --function pos (contains -i -- cd-sh $argv)
        chezmoi::cd-sh cd-sh $pos $argv
    else if set --function pos (contains -i -- cd-sub $argv)
        set argv[$pos] cd
        command chezmoi $argv
    else
        command chezmoi $argv
    end
end

function chezmoi::cd-sh
    set cmd $argv[1]
    set pos $argv[2]
    set -e argv[2] argv[1]

    set argv[$pos] source-path
    command chezmoi $argv | read --function target
    or return $pipestatus[1]

    if test -d $target
        cd $target
    else
        cd (path dirname $target)
    end
end
