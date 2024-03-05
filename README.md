# My dotfiles

These are all managed with [chezmoi](https://www.chezmoi.io/).


## Using 1Password credentials in templates

> [!NOTE]
> [chezmoi and 1Password documentation](https://www.chezmoi.io/user-guide/password-managers/1password/)

Convert an existing .dotfile that has sensitive information in it to a template:

``` sh
chezmoi add --template ~/.super-secret-stuff
```

Then edit it in `~/.local/share/chezmoi/dot_super-secret-stuff.tmpl`.

Find the UUID for a 1Password entry by right-clicking on it in 1Password and choosing "Copy Private Link". It's the `i` parameter in the URL:

``` default
https://start.1password.com/open/i?a=XXXXX&v=YYYYY&i=⭐ITEM_UUID_HERE⭐&h=ZZZZZ
```

See the available fields for a 1Password entry with:

``` sh
op item get $UUID --format json
```

