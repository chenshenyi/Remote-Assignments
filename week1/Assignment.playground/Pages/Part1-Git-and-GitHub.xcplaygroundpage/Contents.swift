/*:# Part1: Git & GitHub

----

## Q1

Create a public GitHub repository named `Remote-Assignments`

- 連結：[chenshenyi/Remote-Assignments](https://github.com/chenshenyi/Remote-Assignments)

----

## Q2

Explain the following commands

### `git status`

確認當前 branch 的狀態，包含哪些檔案被修改、新增、刪除等。

### `git add`

將檔案從 working directory 加到 staging area。

- `git add .`: 將當前目錄下所有檔案加到 staging area。
- `git add -i`: 進入互動模式，可以選擇要加入 staging area 的檔案或片段（hunk）。

### `git reset`

將檔案從 staging area 移除。

- `git reset HEAD`: 將 staging area 清空。
- `git reset --hard`: 將 working directory 的檔案還原到最後一次 commit 的狀態。

### `git commit`

將 staging area 的檔案加到 local repository。

### `git log`

查看 commit 的紀錄。

### `git branch`

查看當前 branch 的狀態。

- `git branch -a`: 查看所有 branch 的狀態。
- `git branch <branch-name>`: 新增 branch。
- `git branch -d <branch-name>`: 刪除 branch。
- `git branch -v`: 查看所有 branch 的狀態，包含最後一次 commit 的 hash。
- `git branch -vv`: 查看所有 branch 的狀態，包含最後一次 commit 的 hash 和 upstream。

### `git push`

將 commit 推到 remote repository。

- `git push -u <remote-name> <branch-name>`: 將當前 branch 的 commit 推到 remote repository，並設定 upstream。
- `git push <remote-name> <branch-name>`: 將當前 branch 的 commit 推到 `<remote-name>` 的`<branch-name>`。

### `git remote`

查看 remote repository 的狀態。

- `git remote -v`: 查看 remote repository 的狀態，包含 URL。
- `git remote add <remote-name> <remote-url>`: 新增 remote repository 並在本地端命名為 `<remote-name>`。
- `git remote show <remote-name>`: 查看 remote repository 的狀態，包含 URL 和 branch 的狀態。

### `fork`

將別人的 repository 複製到自己的 GitHub 帳號下。

### `git rebase` (Advanced)

將 commit 的歷史記錄重新排序。

- `git rebase -i`: 進入互動模式，可以選擇要重新排序的 commit。

### `git cherry-pick <commit-hash>` (Advanced)

將指定的 commit 加到當前 branch。

### `git reflog` (Advanced)

這個指令會列出所有的 commit，包含已經被 reset 的 commit。

### `git tag` (Advanced)

將 commit 加上 tag，通常用來標記 release 的版本或某些重要的 commit。

----

## Q3

Describe how to establish a **GitHub repo** and how to **push** code to GitHub

1. 在 GitHub 上建立一個 repository
2. `git init` 在本地端建立一個 repository
3. `git add -A` 將所有檔案加到 staging area
4. `git remote add <remote-name> <remote-url>` 在本地端新增 remote repository
5. `git push -uf <remote-name> <branch-name>` 將當前 branch 的 commit 強制推到 remote repository，並設定 upstream

- 更為便捷的做法是直接打開 **VSCode** 點擊 `publish to GitHub` 功能。
*/
