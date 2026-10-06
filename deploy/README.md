# CT134 deployment

Run the bootstrap script as root on CT134:

```bash
cd /opt
git clone https://github.com/ditdoank007/Project-HRIS-Informasi.git
cd Project-HRIS-Informasi
bash deploy/bootstrap.sh
```

The production environment file belongs at:

`/etc/hris-informasi/hris-informasi.env`

It must not be committed to Git.
