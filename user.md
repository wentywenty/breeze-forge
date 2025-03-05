PS D:\github\Mainscoop> git checkout -b add-dtc-1.7.2-1 master
fatal: a branch named 'add-dtc-1.7.2-1' already exists
PS D:\github\Mainscoop> cp ..\breeze-forge\bucket\dtc.json .\bucket\
PS D:\github\Mainscoop> git add bucket\dtc.json
PS D:\github\Mainscoop> git commit -m "dtc: Add version 1.7.2-1"
[master d3329bce0] dtc: Add version 1.7.2-1
 1 file changed, 36 insertions(+)
 create mode 100644 bucket/dtc.json
PS D:\github\Mainscoop> git pull origin master
From https://github.com/wentywenty/Mainscoop
 * branch                master     -> FETCH_HEAD
Already up to date.
PS D:\github\Mainscoop> git reset --soft HEAD^
PS D:\github\Mainscoop> git checkout -b add-dtc-1.7.2-1 master
fatal: a branch named 'add-dtc-1.7.2-1' already exists
PS D:\github\Mainscoop> git push origin add-dtc-1.7.2-1^C
PS D:\github\Mainscoop> git branch -D add-dtc-1.7.2-1
error: cannot delete branch 'add-dtc-1.7.2-1' used by worktree at 'D:/github/Mainscoop'
PS D:\github\Mainscoop> git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
PS D:\github\Mainscoop> git branch -D add-dtc-1.7.2-1
Deleted branch add-dtc-1.7.2-1 (was 16740e45d).
PS D:\github\Mainscoop> git checkout -b add-dtc-1.7.2-1 master
Switched to a new branch 'add-dtc-1.7.2-1'
PS D:\github\Mainscoop> cp ..\breeze-forge\bucket\dtc.json .\bucket\
PS D:\github\Mainscoop> git add bucket\dtc.json
PS D:\github\Mainscoop> git commit -m "dtc: Add version 1.7.2-1"
>>
[add-dtc-1.7.2-1 8b0c56537] dtc: Add version 1.7.2-1
 1 file changed, 36 insertions(+)
 create mode 100644 bucket/dtc.json
PS D:\github\Mainscoop> git commit -m "dtc: Add version 1.7.2-1"^C
PS D:\github\Mainscoop> git push origin add-dtc-1.7.2-1
remote: Permission to wentywenty/Mainscoop.git denied to yjb2321901849.
fatal: unable to access 'https://github.com/wentywenty/Mainscoop.git/': The requested URL returned error: 403
PS D:\github\Mainscoop> git branch -D add-dtc-1.7.2-1
error: cannot delete branch 'add-dtc-1.7.2-1' used by worktree at 'D:/github/Mainscoop'
PS D:\github\Mainscoop> git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
PS D:\github\Mainscoop> git branch -D add-dtc-1.7.2-1
Deleted branch add-dtc-1.7.2-1 (was 8b0c56537).
PS D:\github\Mainscoop> git checkout -b add-dtc-1.7.2-1 master
Switched to a new branch 'add-dtc-1.7.2-1'
PS D:\github\Mainscoop> cp ..\breeze-forge\bucket\dtc.json .\bucket\
PS D:\github\Mainscoop> git add bucket\dtc.json
PS D:\github\Mainscoop> git commit -m "dtc: Add version 1.7.2-1"
[add-dtc-1.7.2-1 973bc30d8] dtc: Add version 1.7.2-1
 1 file changed, 24 insertions(+)
 create mode 100644 bucket/dtc.json
PS D:\github\Mainscoop> git push origin add-dtc-1.7.2-1
remote: Permission to wentywenty/Mainscoop.git denied to yjb2321901849.
fatal: unable to access 'https://github.com/wentywenty/Mainscoop.git/': The requested URL returned error: 403
PS D:\github\Mainscoop> gperf
(standard input): The input file is empty!
PS D:\github\Mainscoop> gperf -v
GNU gperf 3.1
Copyright (C) 1989-2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Written by Douglas C. Schmidt and Bruno Haible.
PS D:\github\Mainscoop> git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
PS D:\github\Mainscoop> git checkout -b add-gperf-3.1 master
Switched to a new branch 'add-gperf-3.1'
PS D:\github\Mainscoop> cp ..\breeze-forge\bucket\gperf.json .\bucket\
PS D:\github\Mainscoop> git add bucket\gperf.json
PS D:\github\Mainscoop> git commit -m "gperf: Add version 3.1"
[add-gperf-3.1 0a68ec7dd] gperf: Add version 3.1
 1 file changed, 17 insertions(+)
 create mode 100644 bucket/gperf.json
PS D:\github\Mainscoop> 
