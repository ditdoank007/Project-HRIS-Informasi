# CT134 Setup

## Target

- CTID: 134
- Hostname: HRIS-INFORMASI
- FQDN: HRIS-INFORMASI.sarsurabaya.id
- Application domain: informasi.sarsurabaya.id
- IP: 192.168.100.134/24
- Gateway: 192.168.100.1
- DNS: 192.168.100.100
- OS: Debian 13.7
- Resources: 2 vCPU / 2 GB RAM / 512 MB swap / 16 GB rootfs
- Proxmox startup: onboot=1, order=20

## Deployment rule

Production source is always pulled from GitHub. Do not edit tracked application source directly on CT134.

Recommended application path:

`/opt/hris-informasi`

Production secrets/configuration live outside Git tracking.

## Next infrastructure tasks

1. Install Git and required runtime after the application stack is finalized.
2. Clone the repository into /opt/hris-informasi.
3. Create production environment configuration outside Git.
4. Configure service supervision and reverse proxy.
5. Point informasi.sarsurabaya.id to CT134.
