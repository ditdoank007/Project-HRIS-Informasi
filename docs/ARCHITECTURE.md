# HRIS INFORMASI Architecture

## Deployment

- Proxmox LXC: CT134
- Hostname: HRIS-INFORMASI.sarsurabaya.id
- IP: 192.168.100.134/24
- DNS: 192.168.100.100
- Gateway: 192.168.100.1

## Principles

1. GitHub is the source of truth.
2. CT134 is a deployment target, not the source repository.
3. Server-to-server communication uses DNS/domain names rather than hard-coded IPs.
4. HRIS INFORMASI consumes HRIS Reborn through internal APIs; it does not connect directly to the HRIS database.
5. Production changes are pulled from GitHub deliberately.

## Planned runtime

The exact application framework/runtime will be selected from the implementation scaffold before production deployment.
