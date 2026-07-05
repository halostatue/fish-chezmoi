# halostatue/fish-chezmoi Changelog

## 2.0.0 / 2026-07-05

- Improved the chezmoi wrapper function for `cd` mode. `cdsh` _never worked_,
  but now there are two explicit commands (`cd-sub` and `cd-sh`) and the
  behaviour of `cd` changes based on the value of `$halostatue_fish_chezmoi_cd`.

- Improved the logic of the completions handling during plugin setup.

## 1.1.0 / 2025-02-13

- Fix the chezmoi wrapper function by reducing its cleverness.
- Added `cdsh` as an argument to call the original `chezmoi cd`.
- Fixed chezmoi completions handling.
- Added security checking for workflows and updated workflow security.
- Added FUNDING.

## 1.0.0 / 2025-02-09

- Created halostatue/fish-chezmoi
