### How To Run this script?

You need to run next command from the Unix terminal:

`bash backupper.sh max_days host "db1 db2 db3" "login" "pwd"`

After You run this - backups will be created in the path of Home directory of Yours : `~/backups/mongo/`

### Variables
`max_days` - Last 20/50/10/2 backups for the same days

`host` - Host to which script must connect to the `MongoDB`

`db1 db2 db3` - Database names separated with `' '` to make dumps/backups from

`login` - Login to `MongoDB host`

`pwd` - Password to `MongoDB login's host`