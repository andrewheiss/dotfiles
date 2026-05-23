# My dotfiles

These are all managed with [chezmoi](https://www.chezmoi.io/).

## How to use in general

It's generally best to make edits to dotfiles here and then run:

``` sh
chezmoi apply name_of_file
```

↑ That will copy the file from here to its proper on-disk location.

I often forget, though, and make edits to the real file.

Check the synchronization status of files here and there with:

``` sh
chezmoi status
```

See the actual diffs of what `chezmoi apply` would do with:

``` sh
chezmoi diff
```

To pull on-disk changes into chezmoi (like a reverse `chezmoi apply`), use `add`:

``` sh
chezmoi add name_of_file
```


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

[1Password UUIDs aren't considered sensitive information](https://1password.community/discussion/comment/692527/#Comment_692527) and can be committed to git just fine.

To apply the changes and rebuild the actual file (like `~/.Renviron`), run:

``` sh
chezmoi apply --verbose ~/.Renviron
```
