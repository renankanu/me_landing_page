```bash
[core]
	editor = code --wait
[user]
	name = seu user
	email = seu email
[alias]
	c = !git add --all && git commit -m
	s = !git status -s
	l = !git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr'
	t = "!f() { git tag -am $1 $1; }; f"
	amend = !git add --all && git commit --amend --no-edit
	save = !git add --all && git commit -m 'SAVEPOINT'
	wip = !git add --all && git commit -m "WIP"
[push]
	followTags = true
[merge "ours"]
	driver = true
```