# Neogit Keyboard Cheatsheet

## Open / Close

| Key       | Action                  |
| --------- | ----------------------- |
| `:Neogit` | Open status             |
| `q`       | Close window            |
| `<tab>`   | Toggle section          |
| `<cr>`    | Open thing under cursor |
| `R`       | Refresh                 |

---

## Staging / Unstaging

| Key | Action              |
| --- | ------------------- |
| `s` | Stage file / hunk   |
| `S` | Stage all           |
| `u` | Unstage file / hunk |
| `U` | Unstage all         |
| `x` | Discard change      |
| `X` | Discard all changes |

---

## Navigation

| Key       | Action           |
| --------- | ---------------- |
| `j` / `k` | Move down/up     |
| `gg`      | Top              |
| `G`       | Bottom           |
| `{`       | Previous section |
| `}`       | Next section     |

---

## Commit

| Key   | Action             |
| ----- | ------------------ |
| `c c` | Commit             |
| `c a` | Commit all         |
| `c e` | Extend last commit |
| `c A` | Amend commit       |
| `c f` | Fixup commit       |
| `c s` | Squash commit      |
| `c w` | Reword commit      |

Inside commit buffer:

| Key   | Action |
| ----- | ------ |
| `:wq` | Commit |
| `:q!` | Abort  |

---

## Branch

| Key   | Action          |
| ----- | --------------- |
| `b b` | Checkout branch |
| `b c` | Create branch   |
| `b d` | Delete branch   |
| `b r` | Rename branch   |

---

## Merge / Rebase

| Key   | Action             |
| ----- | ------------------ |
| `m m` | Merge              |
| `m s` | Squash merge       |
| `r r` | Rebase             |
| `r i` | Interactive rebase |
| `r a` | Abort rebase       |
| `r c` | Continue rebase    |

---

## Push / Pull / Fetch

| Key   | Action        |
| ----- | ------------- |
| `p p` | Push          |
| `p f` | Force push    |
| `p u` | Push upstream |
| `F f` | Fetch         |
| `F p` | Pull          |
| `F u` | Pull rebase   |

---

## Diff

| Key   | Action             |
| ----- | ------------------ |
| `d d` | Diff               |
| `d c` | Diff cached        |
| `d r` | Diff range         |
| `D`   | Popup diff options |

---

## Log

| Key   | Action      |
| ----- | ----------- |
| `l l` | Log current |
| `l b` | Log branch  |
| `l a` | Log all     |
| `l f` | Log file    |

---

## Stash

| Key   | Action      |
| ----- | ----------- |
| `z z` | Stash       |
| `z p` | Pop stash   |
| `z a` | Apply stash |
| `z d` | Drop stash  |

---

## Cherry Pick

| Key | Action       |
| --- | ------------ |
| `A` | Cherry pick  |
| `a` | Apply commit |

---

## Help

| Key  | Action      |
| ---- | ----------- |
| `?`  | Help popup  |
| `g?` | Keybindings |

---

## Most Important (Minimal Memory Set)

If you only remember a few:

```
s      stage
u      unstage
c c    commit
p p    push
F p    pull
b b    checkout branch
l l    log
q      quit
?      help
```

# Misc

## Switch Tabs

gt      → next tab
gT      → previous tab
1gt     → go to tab 1
2gt     → go to tab 2

Workflow:

Open Neogit (new tab)
Copy lines from diff
Press gT → go back to your file
Paste
gt → return to Neogit

